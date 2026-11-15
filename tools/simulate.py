"""Execute the RV32IM instructions used by the CMPE3209 binaries and log data accesses."""

import re
import struct
from dataclasses import dataclass
from pathlib import Path

RAM_BASE = 0x80000000
RAM_END = RAM_BASE + 65536
STACK_BOTTOM = RAM_END - 4096
MASK = 0xFFFFFFFF
SECTION = re.compile(r'^\s*\d+\s+(\.\S+)\s+(\w+)\s+(\w+)')
WORD = re.compile(r'^\s*([0-9a-f]+):\s+([0-9a-f]{8})\s+(.+)$')
SOURCE = re.compile(r'\.[csS]:(\d+)(?:\s|$)')


def signed(value, bits=32):
    sign_bit = 1 << (bits - 1)
    return (value ^ sign_bit) - sign_bit


def image_from_listing(path):
    """Read linked .text words and source annotations from GNU objdump -h -dl."""
    instructions = {}
    sections = {}
    source = ''
    for line in Path(path).read_text(encoding='utf-8-sig').splitlines():
        if match := SECTION.match(line):
            name, size, start = match.groups()
            sections[name] = (int(start, 16), int(size, 16))
        elif match := SOURCE.search(line):
            source = match[1]
        elif match := WORD.match(line):
            pc, word, assembly = match.groups()
            pc = int(pc, 16)
            if pc >= 0x8000004C and not source:
                raise ValueError(f'Missing source annotation: {line}')
            instructions[pc] = (int(word, 16), assembly.split('#', 1)[0].strip(), source)
    start, size = sections['.text']
    if sorted(instructions) != list(range(start, start + size, 4)):
        raise ValueError('Listing does not cover the complete .text section')
    return instructions, sections


def elf_memory(path):
    data = Path(path).read_bytes()
    if data[:7] != b'\x7fELF\x01\x01\x01' or struct.unpack_from('<H', data, 18)[0] != 243:
        raise ValueError('Expected an ELF32 little-endian RISC-V executable')
    entry, offset = struct.unpack_from('<II', data, 24)
    stride, count = struct.unpack_from('<HH', data, 42)
    memory = bytearray(RAM_END - RAM_BASE)
    for index in range(count):
        kind, start, address, _, file_size, mem_size, _, _ = struct.unpack_from(
            '<8I', data, offset + index * stride)
        if kind != 1:
            continue
        if not RAM_BASE <= address <= address + mem_size <= RAM_END:
            raise ValueError('Load segment is outside simulation RAM')
        memory[address - RAM_BASE:address - RAM_BASE + file_size] = data[start:start + file_size]
    return entry, memory


@dataclass(frozen=True)
class Access:
    rw: str
    address: int
    value: int


@dataclass(frozen=True)
class Step:
    pc: int
    word: int
    assembly: str
    source: str
    next_pc: int
    kind: str
    changed: tuple
    access: Access | None


class Machine:
    def __init__(self, listing, elf):
        self.instructions, self.sections = image_from_listing(listing)
        self.pc, self.memory = elf_memory(elf)
        for pc, (word, _, _) in self.instructions.items():
            if self.read(pc) != word:
                raise ValueError(f'ELF differs from its listing at {pc:#x}')
        self.registers = [0] * 32

    @staticmethod
    def memory_offset(address):
        if address % 4 or not RAM_BASE <= address <= RAM_END - 4:
            raise ValueError(f'Unaligned or unmapped word address: {address:#x}')
        return address - RAM_BASE

    def read(self, address):
        return struct.unpack_from('<I', self.memory, self.memory_offset(address))[0]

    def write(self, address, value):
        struct.pack_into('<I', self.memory, self.memory_offset(address), value & MASK)

    def step(self):
        pc = self.pc
        word = self.read(pc)
        expected, assembly, source = self.instructions[pc]
        if word != expected:
            raise ValueError(f'Instruction bytes changed at {pc:#x}')
        op, rd, f3 = word & 127, word >> 7 & 31, word >> 12 & 7
        rs1, rs2, f7 = word >> 15 & 31, word >> 20 & 31, word >> 25
        x, y = self.registers[rs1], self.registers[rs2]
        imm = signed(word >> 20, 12)
        value, access, kind, next_pc = None, None, 'ALU', pc + 4
        if op == 0x37:  # LUI
            value = word & 0xFFFFF000
        elif op == 0x17:  # AUIPC
            value = pc + (word & 0xFFFFF000)
        elif op == 0x13:  # I-type ALU
            shifts = {1: x << rs2, 5: (signed(x) if f7 == 0x20 else x) >> rs2}
            value = {0: x + imm, 2: int(signed(x) < imm), 3: int(x < (imm & MASK)),
                     4: x ^ imm, 6: x | imm, 7: x & imm, **shifts}[f3]
        elif op == 0x33 and f7 == 1 and f3 <= 3:  # RV32M multiply family
            kind = 'multiply'
            products = (x * y, signed(x) * signed(y), signed(x) * y, x * y)
            value = products[f3] >> (32 if f3 else 0)
        elif op == 0x33 and f7 in (0, 0x20):
            shift = y & 31
            value = {0: x - y if f7 else x + y, 1: x << shift,
                     2: int(signed(x) < signed(y)), 3: int(x < y), 4: x ^ y,
                     5: (signed(x) if f7 else x) >> shift, 6: x | y, 7: x & y}[f3]
        elif op == 0x03 and f3 == 2:  # LW
            kind, address = 'load', (x + imm) & MASK
            value = self.read(address)
            access = Access('R', address, value)
        elif op == 0x23 and f3 == 2:  # SW
            kind = 'store'
            address = (x + signed((f7 << 5) | rd, 12)) & MASK
            self.write(address, y)
            access = Access('W', address, y)
        elif op == 0x63:  # Conditional branch
            kind = 'control'
            condition = {0: x == y, 1: x != y, 4: signed(x) < signed(y),
                         5: signed(x) >= signed(y), 6: x < y, 7: x >= y}[f3]
            displacement = ((word >> 31) << 12) | ((rd & 1) << 11) | ((f7 & 63) << 5) | (rd & 30)
            if condition:
                next_pc = pc + signed(displacement, 13)
        elif op == 0x6F:  # JAL
            kind, value = 'control', pc + 4
            displacement = ((word >> 31) << 20) | (word & 0xFF000) | ((word >> 9) & 0x800) | ((word >> 20) & 0x7FE)
            next_pc = pc + signed(displacement, 21)
        elif op == 0x67 and f3 == 0:  # JALR
            kind, value = 'control', pc + 4
            next_pc = (x + imm) & ~1
        else:
            raise ValueError(f'Unsupported instruction {word:#010x} at {pc:#010x}')

        changed = ()
        if value is not None and rd:
            value &= MASK
            if self.registers[rd] != value:
                changed = (rd, self.registers[rd], value)
            self.registers[rd] = value
        self.pc = next_pc & MASK
        return Step(pc, word, assembly, source, self.pc, kind, changed, access)

    def run(self):
        steps = []
        tohost = self.sections['.data'][0]
        while len(steps) < 100000:
            step = self.step()
            steps.append(step)
            if step.access == Access('W', tohost, 1):
                return steps
        raise RuntimeError('Program failed to reach its success handshake')
