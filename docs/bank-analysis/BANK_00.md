# Bank 00 Baseline and Reconstruction Status

Bank `00` is the fixed `ROM0` region (`0x0000–0x3FFF`). This document records both the source baseline and current lossless reconstruction progress.

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

## Header / entry observations

All six releases begin with `00 C3 50 01` at `$0100`: `nop` followed by a jump to `$0150`.

- JP: MBC1+RAM+BATTERY (`0x03`), ROM size code `0x04`
- EN: MBC3+RAM+BATTERY (`0x13`), ROM size code `0x05`
- DE/FR/IT/ES: MBC5+RAM+BATTERY (`0x1B`), ROM size code `0x05`

## Reconstructed source now committed

### `$0000–$0060` — reset/interrupt vectors

Implemented in `home/header.asm` with per-version vector targets. The common entry/header reservation at `$0100–$014F` is also represented there.

### `$0061–$00FF` — high-home area

For EN/DE/FR/IT/ES, the following routines are byte-identical and are now symbolic source in `home/high_home.asm`:

- `DisableLCD`
- `EnableLCD`
- `ClearSprites`
- `HideSprites`
- `FarCopyData`
- `CopyData`

JP uses a different layout in this address range. Its exact bytes are preserved inline as a temporary lossless representation until semantics are classified; no `baserom`/`INCBIN` dependency is used.

### `$0150` onward — startup/joypad

Implemented in `home/start.asm`.

- JP: direct Init jump followed by the bank-3 `Joypad` call wrapper.
- EN/DE/FR/IT/ES: CGB-state setup, `ReadJoypad`, then the same bank-3 `Joypad` wrapper.

### Map-header pointer table

Implemented in `data/maps/map_header_pointers.asm` as 248 little-endian pointers per release:

- JP: `$0167–$0356`
- EN/DE/FR/IT/ES: `$01AE–$039D`

The values are intentionally numeric at this stage. They will be replaced by symbolic map-header labels as their target banks are reconstructed.

`tools/verify_map_header_pointers.py` verifies the committed table without a base ROM against source-derived SHA-256 fingerprints. All six targets currently pass (496 bytes each).

## Next reconstruction boundary

The next unconverted bytes begin immediately after the map-header pointer table:

- JP: `$0357`
- EN/DE/FR/IT/ES: `$039E`

The first routine at that boundary is the overworld `HandleMidJump` far-jump wrapper; reconstruction continues from there through the remaining ROM0 engine routines.

## Final Bank 00 acceptance criterion

When all of `$0000–$3FFF` is represented as source, each version must assemble/link/fix to the Bank 00 SHA-1 listed above, and later the complete ROM must match its whole-ROM SHA-1/SHA-256 manifest.
