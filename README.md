# CMPE3209 November 16 practice packet

The final practice copy continues the M2 Tutanak with Adım 3–5. It uses the preserved G2 source and the previously recorded M2 machine code. The manual tables are worked study examples. The existing declaration and milestone records are student-owned.

## Reproduce the results

Run these commands from this folder with Python 3.10 or newer. The verified binaries are in `evidence/`.

```powershell
python tools/analyze.py
python tools/cache_sim.py trace.csv --limit 30 --summary
```

The simulator executes instructions from the ELF load segments. `trace.csv` includes every data load/store from `_start` through the `tohost = 1` store. Blank C source lines correspond to startup assembly. Instruction fetches are outside the data cache trace. Section 4d of the Tutanak cites the original capture at `screenshots/Final_cache_terminal.png`.

To rebuild, run `python tools/build.py --bin "C:\path\to\xpack\bin"` with xPack GNU RISC-V Embedded GCC 15.2.0 and GNU objdump 2.45. The build checks the archived M2 instruction addresses and words and the linked text, read-only data, data, and BSS ranges.

`evidence/measurements.json` contains the model results. `evidence/kernel_O0.csv` records instruction, register, and memory events for the 19-instruction M2 kernel. `evidence/cache_O0.csv` contains the cache decision for every load/store. The cache replay checks each load against the value from the instruction simulator and verifies the 44 final grades and eight result words under every tested configuration. The first 30 references can also be checked by hand from their eight block boundaries.

`tools/evidence_images.py` regenerates the section 4e cache plot from measured values using Pillow and Windows Arial. The M1, M2 and terminal images are original screenshots.

The interrupt, bus, PCIe, CPI and Amdahl sections are analytical models. The modeled cache does not flush at exit. Timing follows the assignment formula and omits an extra dirty write-back penalty.

## Independent verification

The optional verifier requires Unicorn 2.1.4 (`python -m pip install unicorn==2.1.4`). Run `python tools/verify_independent.py`. It compares every executed instruction's PC, all 32 registers, ordered memory events and final RAM against Unicorn's separate RISC-V engine for O0, O1 and v2. A second timestamp-based cache implementation checks every hit/miss decision and write-back count for seven configurations on each binary. The passing results are saved in `evidence/independent_verification.json`.

## Publication

See `AUDIT.md` for the verification results and the remaining steps before publication. Preserve the original M1/M2 history when committing and tagging the final milestone. The report discloses AI assistance. The unsigned student declaration and teacher-only records require their owners' review.

M1 RARS uses 0x0040… code and 0x1001… data; M2/final GCC ELF uses 0x8000… addresses. These are separate layouts, not interchangeable traces. Kernel counts also differ from whole-program dynamic instruction counts.
