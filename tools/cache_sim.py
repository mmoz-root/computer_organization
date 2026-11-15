"""Replay ordered, aligned 4-byte data accesses with write-back and write-allocate."""

import argparse
import csv
import json
from collections import OrderedDict
from dataclasses import dataclass
from pathlib import Path


@dataclass
class Line:
    words: list[int]
    dirty: bool = False


def simulate(accesses, capacity=128, line_size=16, ways=1):
    set_count, remainder = divmod(capacity, line_size * ways)
    if remainder or not set_count or line_size < 4 or line_size % 4:
        raise ValueError('Cache needs an integral number of nonempty sets and whole words')

    sets = [OrderedDict() for _ in range(set_count)]
    backing = {}
    seen = set()
    shadow = OrderedDict()  # Fully associative LRU of equal capacity for 3C classification.
    events = []
    hits = writes = 0
    for rw, address, observed in accesses:
        if rw not in ('R', 'W') or address % 4:
            raise ValueError('Expected an aligned read or write')
        block, offset = divmod(address, line_size)
        tag, index = divmod(block, set_count)
        resident = sets[index]
        hit = block in resident
        seen_before = block in seen
        miss = '' if hit else ('compulsory' if not seen_before else
                               'conflict' if block in shadow else 'capacity')
        victim = None
        writeback = False
        if hit:
            hits += 1
            resident.move_to_end(block)
        else:
            if len(resident) == ways:
                victim, old = resident.popitem(last=False)
                if old.dirty:
                    writes += 1
                    writeback = True
                    for word, value in enumerate(old.words):
                        backing[victim * line_size + 4 * word] = value
            base = address - offset
            resident[block] = Line([backing.get(base + i, 0) for i in range(0, line_size, 4)])
        line = resident[block]
        if rw == 'W':
            line.words[offset // 4] = observed
            line.dirty = True
        elif observed is not None and line.words[offset // 4] != observed:
            raise ValueError(f'Load value differs from execution at {address:#010x}')
        seen.add(block)
        shadow[block] = None
        shadow.move_to_end(block)
        if len(shadow) > capacity // line_size:
            shadow.popitem(last=False)
        events.append(dict(rw=rw, address=address, tag=tag, index=index, offset=offset,
                           hit=hit, victim=None if victim is None else victim * line_size,
                           seen_before=seen_before, miss=miss, writeback=writeback))

    coherent = backing.copy()
    snapshot = []
    for index, resident in enumerate(sets):
        for rank, (block, line) in enumerate(resident.items(), start=1):
            base = block * line_size
            snapshot.append(dict(index=index, tag=block // set_count, block=base,
                                 dirty=line.dirty, lru=rank))
            for word, value in enumerate(line.words):
                coherent[base + 4 * word] = value

    total = len(events)
    ratio = hits / total if total else 0.0
    stats = dict(references=total, hits=hits, misses=total - hits, ratio=ratio,
                 writes=writes, average_cycles=1 + 20 * (1 - ratio), lines=snapshot)
    return stats, events, coherent


def read_trace(path):
    with Path(path).open(newline='', encoding='utf-8-sig') as stream:
        rows = csv.DictReader(stream)
        for row in rows:
            if row['boyut'] != '4':
                raise ValueError('Expected 4-byte accesses')
            yield row['RW'], int(row['adres_hex'], 16), int(row['deger_hex'], 16)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('trace', type=Path)
    parser.add_argument('--capacity', default=128, type=int)
    parser.add_argument('--line-size', default=16, type=int)
    parser.add_argument('--ways', default=1, type=int)
    parser.add_argument('--limit', type=int)
    parser.add_argument('--summary', action='store_true',
                        help='print a compact terminal summary instead of event JSON')
    args = parser.parse_args()
    if min(args.capacity, args.line_size, args.ways) <= 0:
        parser.error('cache dimensions must be positive')
    if args.limit is not None and args.limit < 0:
        parser.error('limit must be nonnegative')
    rows = list(read_trace(args.trace))[:args.limit]
    stats, events, _ = simulate(rows, args.capacity, args.line_size, args.ways)
    if args.summary:
        print(f'Cache replay: {args.trace} ({stats["references"]} references)')
        print(f'{args.capacity} B / {args.line_size} B lines / {args.ways} way(s) / '
              'write-back / write-allocate / no exit flush')
        print('Set  Valid  Tag         Dirty  Block')
        for line in stats['lines']:
            print(f'{line["index"]:3}      1  0x{line["tag"]:08x}      '
                  f'{int(line["dirty"])}  0x{line["block"]:08x}')
        print(f'Hits: {stats["hits"]} / Misses: {stats["misses"]} / '
              f'Write-backs: {stats["writes"]}')
    else:
        print(json.dumps(dict(summary=stats, events=events), indent=2))


if __name__ == '__main__':
    main()
