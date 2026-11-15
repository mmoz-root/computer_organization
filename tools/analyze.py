"""Run the preserved M2 programs and generate the November 16 practice evidence."""

import csv
import json
from collections import Counter
from pathlib import Path

from cache_sim import simulate
from simulate import Machine, STACK_BOTTOM

ROOT = Path(__file__).resolve().parent.parent
EVIDENCE = ROOT / 'evidence'
CPI = {'ALU': 1, 'multiply': 3, 'load': 1, 'store': 1, 'control': 2}
CLASSES = tuple(CPI)


def hx(value):
    return f'0x{value:08x}'


def write_csv(path, headings, rows):
    with path.open('w', encoding='utf-8', newline='') as stream:
        writer = csv.writer(stream)
        writer.writerow(headings)
        writer.writerows(rows)


def expected_results():
    seed = 1230020
    grades = []
    for _ in range(44):
        seed = (1664525 * seed + 1013904223) % 2**32
        grades.append((seed >> 16) % 101)
    mean = sum(grades) // len(grades)
    bucket = [sum(low <= grade < high for grade in grades)
              for low, high in zip((0, 50, 65, 75, 85), (50, 65, 75, 85, 101))]
    globals_ = dict(bucket=bucket, mean=mean, below_count=sum(grade < mean for grade in grades),
                    pass_count=sum(grade >= 50 for grade in grades))
    return grades, [grade | 256 if grade < mean else grade for grade in grades], globals_


def load_run(label):
    if label == 'v2':
        listing, elf = EVIDENCE / 'objdump_v2.txt', EVIDENCE / 'main_v2.elf'
    else:
        listing, elf = ROOT / f'objdump_{label}.txt', EVIDENCE / f'main_{label}.elf'
    machine = Machine(listing, elf)
    steps = machine.run()
    records = [(i, step.access.rw, step.access.address, step.access.value, step)
               for i, step in enumerate(steps) if step.access]
    return machine, steps, records


def write_run_trace(path, records, source_name='main.c'):
    write_csv(path, ('sira', 'RW', 'adres_hex', 'boyut', 'c_satiri', 'stack_mi', 'pc_hex',
                     'deger_hex', 'bolge', 'instruction_sira'),
              ((n, rw, hx(address), 4, step.source, int(address >= STACK_BOTTOM), hx(step.pc),
                hx(value), source_name if step.pc >= 0x8000004C else 'startup', i + 1)
               for n, (i, rw, address, value, step) in enumerate(records, 1)))


def data_projection(records):
    return [(rw, address, value) for _, rw, address, value, _ in records]


def verify_memory(machine, memory_get, label):
    if label == 'O1':
        # The optimized compiler groups the globals in an anchor with a different order.
        offsets = dict(grades=0, bucket=176, pass_count=196, mean=200, below_count=204)
    else:
        offsets = dict(grades=0, bucket=176, mean=196, below_count=200, pass_count=204)
    base = machine.sections['.bss'][0]
    _, grades, globals_ = expected_results()
    for name, values in dict(grades=grades, **globals_).items():
        values = values if isinstance(values, list) else [values]
        address = base + offsets[name]
        actual = [memory_get(address + 4 * i) for i in range(len(values))]
        if actual != values:
            raise ValueError(f'{label}: {name} at {hx(address)}: {actual} != {values}')


def verify_cache(machine, label, data, ways=1, line_size=16):
    stats, events, coherent = simulate(data, line_size=line_size, ways=ways)
    verify_memory(machine, lambda address: coherent.get(address, 0), label)
    stats['miss_types'] = dict(Counter(event['miss'] for event in events if not event['hit']))
    return stats, events


def model(steps, stats):
    counts = Counter(step.kind for step in steps)
    ic = len(steps)
    cycles = sum(counts[kind] * CPI[kind] for kind in CLASSES)
    refs = stats['references']
    base = dict(counts={kind: counts[kind] for kind in CLASSES}, ic=ic, core_cycles=cycles,
                cpi=cycles / ic, mips=1000 * ic / cycles, m=refs / ic)
    return dict(base, without_cache=cycles + 20 * refs,
                with_cache=cycles + stats['average_cycles'] * refs)


def main():
    results = {}
    for label in ('O0', 'O1', 'v2'):
        machine, steps, records = load_run(label)
        verify_memory(machine, machine.read, label)
        trace_name = {'O0': 'trace.csv', 'O1': 'trace_O1.csv', 'v2': 'trace_v2.csv'}[label]
        write_run_trace(ROOT / trace_name if label == 'O0' else EVIDENCE / trace_name,
                        records, 'main_v2.c' if label == 'v2' else 'main.c')
        data = data_projection(records)
        baseline, events = verify_cache(machine, label, data)
        result = dict(cache=baseline, timing=model(steps, baseline),
                      stack=sum(address >= STACK_BOTTOM for _, address, _ in data),
                      array=sum(machine.sections['.bss'][0] <= address < machine.sections['.bss'][0] + 176
                                for _, address, _ in data),
                      source_ic=sum(step.pc >= 0x8000004C for step in steps),
                      source_refs=sum(step.pc >= 0x8000004C for _, _, _, _, step in records),
                      sections=machine.sections)
        results[label] = result
        if label != 'O0':
            continue

        first_stats, first_events, _ = simulate(data[:30])
        result['first30'] = first_stats
        result['mapping'] = {ways: verify_cache(machine, label, data, ways=ways)[0] for ways in (1, 2, 4, 8)}
        result['line_sizes'] = {size: verify_cache(machine, label, data, line_size=size)[0]
                                for size in (8, 16, 32, 64)}
        cache_columns = tuple(events[0])
        write_csv(EVIDENCE / 'cache_O0.csv', ('sira', *cache_columns),
                  ((n, *(hx(e[k]) if k in ('address', 'victim') and e[k] is not None else e[k]
                         for k in cache_columns)) for n, e in enumerate(events, 1)))
        assert first_events == events[:30]
        kernel_start = next(i for i, step in enumerate(steps) if step.pc == 0x80000064)
        kernel = steps[kernel_start:kernel_start + 19]
        event_by_step = {row[0]: event for row, event in zip(records, events)}
        assert kernel[-1].pc == 0x80000340 and kernel[-1].next_pc == 0x800002C8
        write_csv(EVIDENCE / 'kernel_O0.csv',
                  ('sira', 'pc', 'sonraki_pc', 'ir', 'assembly', 'degisen_register', 'eski_deger',
                   'yeni_deger', 'RW', 'veri_adresi', 'veri', 'cache'),
                  ((n + 1, hx(step.pc), hx(step.next_pc), hx(step.word), ' '.join(step.assembly.split()),
                    *(('x' + str(step.changed[0]), hx(step.changed[1]), hx(step.changed[2])) if step.changed
                      else ('', '', '')), *((step.access.rw, hx(step.access.address), hx(step.access.value),
                                             'H' if event_by_step[kernel_start + n]['hit'] else 'M')
                                            if step.access else ('', '', '', '')))
                   for n, step in enumerate(kernel)))

        mark_start = next(i for i, step in enumerate(steps) if step.pc == 0x800002C8)
        mark_end = next(i for i in range(mark_start, len(steps)) if steps[i].pc == 0x80000344)
        marking = steps[mark_start:mark_end]
        mark_misses = sum(not event_by_step[i]['hit'] for i in range(mark_start, mark_end) if i in event_by_step)
        mark_refs = sum(step.access is not None for step in marking)
        mark_core = sum(CPI[step.kind] for step in marking)
        mark_time = mark_core + mark_refs + 20 * mark_misses
        fraction = mark_time / result['timing']['with_cache']
        result['amdahl'] = dict(ic=len(marking), references=mark_refs, misses=mark_misses,
                                core_cycles=mark_core, time=mark_time, fraction=fraction,
                                speedup_8=1 / (1 - fraction + fraction / 8), infinite=1 / (1 - fraction))

    raw, grades, globals_ = expected_results()
    results['expected'] = dict(raw=raw, grades=grades, **globals_)
    (EVIDENCE / 'measurements.json').write_text(json.dumps(results, indent=2) + '\n', encoding='utf-8')
    for label in ('O0', 'O1', 'v2'):
        t, c = results[label]['timing'], results[label]['cache']
        print(f'{label}: Ic={t["ic"]}, {c["references"]} refs, {c["hits"]} hits, '
              f'{c["misses"]} misses, {c["writes"]} writebacks, T_s={c["average_cycles"]:.6f} cycles')
    print(f'Verified all 44 final grades and eight Y7 outputs: {globals_}')


if __name__ == '__main__':
    main()
