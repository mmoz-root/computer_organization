# November 16 final packet audit

Scope: both supplied PDFs, preserved M1/M2 C/assembly/disassembly and screenshot evidence, final source variant, ELF execution, cache data, report calculations and layout. This is an independent practice project.

## Verified

| Requirement | Check and evidence |
|---|---|
| Parameters | Full ID 5001230020 gives d=0, D2=20, S=13; C SID=1230020. N=44, k=9, I/O, 128 B/16 B/direct/WB/WA, f=1 GHz, T1=1, T2=20, Nc=8. Arithmetic appears in the original Adım 0 tables. |
| G2 and Y1–Y7 | Original 60-line C99 source preserved. Unsigned 32-bit LCG, three passes, conditionals, helper call, OR marking and global outputs. v2 fuses generation/statistics and preserves all outputs. |
| Address provenance | Historical RARS addresses explicitly separated from linked GCC ELF addresses. Report explains 20 RARS kernel instructions versus 19 final O0 instructions. |
| M2 code | Fresh Windows xPack GCC 15.2.0 and objdump 2.45 build matches the archived M2 instruction words and four linked section ranges. Ten reported machine words/byte orders match. R/I/S/B/U/J formats represented. |
| Execution | Unicorn 2.1.4 agrees instruction by instruction on PC, 32 GPRs, every memory event and final RAM for O0/O1/v2; independent_verification.json records the pass. |
| G2 output | Histogram [26,7,4,3,4]; mean=45; below_count=22; pass_count=18. All 44 marked grades checked against the LCG specification. |
| CPU/interrupt | 19-instruction trace, 19 fetches/5 loads/2 stores. Cache outcomes appear in the existing Kategori column. Interrupt after #9 resumes at 0x8000031c. Official privileged-spec section/page references checked. |
| Accumulator | Equivalent task corrected: O0 #10–13 writes ready value 282 through a calculated address (4 cycles); AC=282 writes a fixed address using STORE (1 cycle). Separate 3-cycle marking / 6-cycle I/O examples do additional work and are excluded from that comparison. |
| Bus/PCIe | 26 transfers on 32-bit bus, 52 on 16-bit, 4 GiB address space; 176-byte payload, 196/204 total octets and 128/130 encoding factor. Labeled models. |
| Trace/cache | O0 1703 references, including 1282 stack accesses. First 30: 22 hits/8 misses/0 write-backs. Full: 1533 hits/170 misses/108 dirty evictions; seven dirty lines remain, no flush. |
| Cache sweep | Every hit/miss and write-back total independently reproduced for seven configurations on all three binaries. Replay verifies values as well as counts. |
| v2 | 1525 references; H=85.9672%, Ts=3.8066 cycles. H drops; conflict misses 117→171, including 80 between blocks 0x8000ffd0 and 0x80000450. The assignment allows explaining a failed improvement. |
| Performance | O0 Ic=4606/core=5371 cycles/cache total=10474 ns. O1 Ic=1585/core=2282 cycles/cache total=3559 ns. Each uses its own trace/H. Cache-aware O1 speedup=2.943. |
| Amdahl | Marking phase 3626/10474 of model time; private counters/reduction needed. Eight-core speedup=1.4345, limit=1.5295; overhead neglected explicitly. |
| Architecture/organization | The ten original rows cover the required feature classifications and outcome reasoning. MAR/MBR and clock frequency are discussed in the last answer. Four functions are tied to actual kernel instructions. |
| Template and images | The final DOCX is the author's edited copy of the form based on GitHub main commit `24ef511`. The 60 code lines and embedded M2 screenshot match the earlier copy. The DOCX and PDF carry the author's column widths and arrow notation. The original PowerShell capture and measured chart are cited in the existing 4d and 4e fields. The capture agrees with all eight cache rows, the first 30 reference totals, the O0/O1/v2 totals and the Y7 outputs. |

The fresh build reproduced the loaded memory images, CSV traces, execution metrics, and cache results for all three binaries. The Windows compiler emits different sizes for two non-loaded debug sections in v2.

Execution includes startup BSS clearing and the success handshake. Durations use the assignment's timing model.

The next Git steps are to review the diff, commit the final files, tag the final milestone and push. Preserve M1/M2 history.

For formal course submission, the assignment specifies the student's own manual results and a complete AI disclosure. The parameter tables begin on page 2 of the chosen layout. The assignment requests them on page 1. Instructor fields and the student signature are blank.
