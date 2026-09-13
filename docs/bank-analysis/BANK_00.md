# Bank 00 Baseline Survey

Bank `00` is the fixed `ROM0` region (`0x0000–0x3FFF`). This report establishes byte-level baselines before symbolic disassembly.

## Bank hashes

- JP: SHA-1 `3f3c27f7b8960211fc903af906610c34d98e7a84`
- EN: SHA-1 `cf785a689639826f7a9ae2eda88e8d6cdeebc54e`
- DE: SHA-1 `bf5661ca44cdee2e1827016ef556aa36e17108cc`
- FR: SHA-1 `351387bf9ad2c98f0545109c032d7a93f675f306`
- IT: SHA-1 `35646dd4fa4ca99c3e4f0ea567fcbe4d19d7390a`
- ES: SHA-1 `3fd427297d15e9f0b13a2e83fb233d8946623bf4`

## Pairwise byte similarity

| Pair | Equal bytes | Different bytes | Similarity |
|---|---:|---:|---:|
| JP vs EN | 508 | 15,876 | 3.10% |
| JP vs DE | 514 | 15,870 | 3.14% |
| JP vs FR | 462 | 15,922 | 2.82% |
| JP vs IT | 514 | 15,870 | 3.14% |
| JP vs ES | 559 | 15,825 | 3.41% |
| EN vs DE | 10,246 | 6,138 | 62.54% |
| EN vs FR | 5,204 | 11,180 | 31.76% |
| EN vs IT | 10,223 | 6,161 | 62.40% |
| EN vs ES | 6,283 | 10,101 | 38.35% |
| DE vs FR | 5,605 | 10,779 | 34.21% |
| DE vs IT | 12,007 | 4,377 | 73.28% |
| DE vs ES | 6,765 | 9,619 | 41.29% |
| FR vs IT | 5,607 | 10,777 | 34.22% |
| FR vs ES | 5,531 | 10,853 | 33.76% |
| IT vs ES | 6,728 | 9,656 | 41.06% |

## Longest all-version identical ranges

- `0x0100–0x0146` (71 bytes)
- `0x0000–0x0037` (56 bytes)

## Header / entry observations

- JP: entry `00 c3 50 01`, cart type `0x03`, ROM size code `0x04`, version `0x00`
- EN: entry `00 c3 50 01`, cart type `0x13`, ROM size code `0x05`, version `0x00`
- DE: entry `00 c3 50 01`, cart type `0x1B`, ROM size code `0x05`, version `0x00`
- FR: entry `00 c3 50 01`, cart type `0x1B`, ROM size code `0x05`, version `0x00`
- IT: entry `00 c3 50 01`, cart type `0x1B`, ROM size code `0x05`, version `0x00`
- ES: entry `00 c3 50 01`, cart type `0x1B`, ROM size code `0x05`, version `0x00`

## Next reconstruction work

1. Split reset/interrupt vectors and entry point into labeled `ROM0` source.
2. Reconstruct the cartridge header as declarative source, with per-version controller/ROM-size differences.
3. Identify executable routines and data tables in `0x0150–0x3FFF`.
4. Replace anonymous byte regions with labels and macros while preserving exact layout.
5. Verify each build target against the Bank 00 SHA-1 listed above.
