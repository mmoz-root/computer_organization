"""Optional independent audit: pip install unicorn==2.1.4, then run this file.

Unicorn supplies a separate RISC-V execution engine. Every instruction's PC,
all 32 GPRs, ordered memory events, and final RAM are compared, not only Y7.
The second cache implementation uses simple timestamped slots rather than
the production simulator's OrderedDict representation.
"""
import json
from pathlib import Path

import unicorn as uc
from unicorn import riscv_const as rv

from analyze import ROOT, load_run, data_projection
from cache_sim import simulate
from simulate import Machine, RAM_BASE, RAM_END


def check_cpu(label):
    listing = ROOT / (f'objdump_{label}.txt' if label != 'v2' else 'evidence/objdump_v2.txt')
    machine = Machine(listing, ROOT / f'evidence/main_{label}.elf')
    other = uc.Uc(uc.UC_ARCH_RISCV, uc.UC_MODE_RISCV32)
    other.mem_map(RAM_BASE, RAM_END - RAM_BASE)
    other.mem_write(RAM_BASE, bytes(machine.memory))
    registers = [getattr(rv, f'UC_RISCV_REG_X{i}') for i in range(32)]
    for reg in registers:
        other.reg_write(reg, 0)
    observed = []

    def memory_hook(engine, access, address, size, value, _):
        assert size == 4
        rw = 'W' if access == uc.UC_MEM_WRITE else 'R'
        if rw == 'R':
            value = int.from_bytes(engine.mem_read(address, size), 'little')
        observed.append((rw, address, value))

    other.hook_add(uc.UC_HOOK_MEM_READ | uc.UC_HOOK_MEM_WRITE, memory_hook)
    count = references = 0
    while count < 100000:
        observed.clear()
        pc = machine.pc
        step = machine.step()
        other.emu_start(pc, RAM_END, count=1)
        assert other.reg_read(rv.UC_RISCV_REG_PC) == machine.pc, (label, hex(pc), 'PC')
        assert [other.reg_read(reg) for reg in registers] == machine.registers, (label, hex(pc), 'GPR')
        expected = [] if step.access is None else [(step.access.rw, step.access.address, step.access.value)]
        assert observed == expected, (label, hex(pc), observed, expected)
        count += 1
        references += len(observed)
        if expected == [('W', machine.sections['.data'][0], 1)]:
            break
    else:
        raise AssertionError('No completion handshake')
    assert bytes(other.mem_read(RAM_BASE, RAM_END - RAM_BASE)) == machine.memory
    return dict(instructions=count, data_references=references, all_registers_and_ram_match=True)


def reference_cache(data, size, ways):
    sets = 128 // size // ways
    slots = [[None] * ways for _ in range(sets)]
    hits = writes = 0
    decisions = []
    for tick, (rw, address, _) in enumerate(data):
        block = address // size
        line = slots[block % sets]
        slot = next((i for i, item in enumerate(line) if item and item[0] == block), None)
        hit = slot is not None
        if hit:
            hits += 1
        else:
            slot = next((i for i, item in enumerate(line) if item is None), None)
            if slot is None:
                slot = min(range(ways), key=lambda i: line[i][1])
                writes += int(line[slot][2])
            line[slot] = [block, tick, False]
        line[slot][1] = tick
        line[slot][2] |= rw == 'W'
        decisions.append(hit)
    return hits, writes, decisions


def main():
    result = {'engine': f'Unicorn {uc.__version__}', 'cpu': {}, 'cache': {}}
    for label in ('O0', 'O1', 'v2'):
        result['cpu'][label] = check_cpu(label)
        _, _, records = load_run(label)
        data = data_projection(records)
        configurations = [(16, w) for w in (1, 2, 4, 8)] + [(s, 1) for s in (8, 32, 64)]
        for size, ways in configurations:
            stats, events, _ = simulate(data, line_size=size, ways=ways)
            h, w, decisions = reference_cache(data, size, ways)
            assert (h, w, decisions) == (stats['hits'], stats['writes'], [e['hit'] for e in events])
        result['cache'][label] = {'configurations_checked': len(configurations), 'every_hit_and_writeback_matches': True}
    path = ROOT / 'evidence/independent_verification.json'
    path.write_text(json.dumps(result, indent=2) + '\n', encoding='utf-8')
    print(json.dumps(result, indent=2))


if __name__ == '__main__':
    main()
