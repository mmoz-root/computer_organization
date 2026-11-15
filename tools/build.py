"""Rebuild the M2 binaries and the loop-fusion variant with GNU RISC-V GCC."""

import argparse
import os
import shutil
import subprocess
from pathlib import Path

from simulate import image_from_listing

ROOT = Path(__file__).resolve().parent.parent
EVIDENCE = ROOT / 'evidence'
FLAGS = ['-march=rv32im', '-mabi=ilp32']
CFLAGS = [*FLAGS, '-std=c99', '-Wall', '-Wextra', '-Werror', '-pedantic', '-fno-pic', '-msmall-data-limit=0', '-g']


def run(*args):
    return subprocess.run(args, cwd=ROOT, check=True, stdout=subprocess.PIPE).stdout


def build(gcc, objdump, label, source, opt):
    elf = f'evidence/main_{label}.elf'
    run(gcc, *CFLAGS, opt, '-nostdlib', '-T', 'tools/link.ld', 'tools/start.S', source, '-o', elf)
    listing = EVIDENCE / f'objdump_{label}_rebuilt.txt'
    listing.write_bytes(run(objdump, '-d', '-l', '-h', elf))
    if label == 'v2':
        listing.replace(EVIDENCE / 'objdump_v2.txt')
        return
    original, original_sections = image_from_listing(ROOT / f'objdump_{label}.txt')
    actual, actual_sections = image_from_listing(listing)
    original_words = {pc: entry[0] for pc, entry in original.items()}
    actual_words = {pc: entry[0] for pc, entry in actual.items()}
    if original_words != actual_words:
        differences = [f'{pc:#x}: {original_words.get(pc)} != {actual_words.get(pc)}'
                       for pc in sorted(original.keys() | actual.keys()) if original_words.get(pc) != actual_words.get(pc)]
        raise ValueError('Rebuilt .text differs from M2: ' + ', '.join(differences[:6]))
    for section in ('.text', '.rodata', '.data', '.bss'):
        if actual_sections[section] != original_sections[section]:
            raise ValueError(f'Section differs from M2: {section}')
    print(f'{label}: all {len(actual_words)} machine words and four linked section ranges match M2')
    listing.unlink()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--bin', type=Path, help='directory with riscv-none-elf-gcc and objdump')
    args = parser.parse_args()
    suffix = '.exe' if os.name == 'nt' else ''
    if args.bin:
        gcc = str(args.bin.resolve() / f'riscv-none-elf-gcc{suffix}')
        objdump = str(args.bin.resolve() / f'riscv-none-elf-objdump{suffix}')
    else:
        gcc = shutil.which('riscv-none-elf-gcc')
        objdump = shutil.which('riscv-none-elf-objdump')
        if not gcc or not objdump:
            parser.error('supply --bin or put the xPack tools on PATH')
    print(run(gcc, '--version').decode().splitlines()[0])
    print(run(objdump, '--version').decode().splitlines()[0])
    for label in ('O0', 'O1'):
        build(gcc, objdump, label, 'main.c', '-' + label)
    build(gcc, objdump, 'v2', 'main_v2.c', '-O0')


if __name__ == '__main__':
    main()
