# Bank 00 Baseline and Reconstruction Status

Bank `00` is the fixed `ROM0` region (`0x0000–0x3FFF`). This document records both the source baseline and current reconstruction progress.

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

## Reconstructed source committed

### Reset, interrupt and startup area

- `$0000–$0060`: reset/interrupt vectors — `home/header.asm`
- `$0061–$00FF`: localized high-home routines and exact JP inline representation — `home/high_home.asm`
- `$0100–$014F`: cartridge entry/header reservation — `home/header.asm`
- `$0150` onward: startup and joypad wrappers — `home/start.asm`

The JP release stores `DisableLCD`, `EnableLCD`, `ClearSprites`, `HideSprites`, `FarCopyData`, and `CopyData` later in ROM0 rather than at the localized high-home addresses; those relocated routines are now symbolically identified in `home/pics.asm`.

### Map-header pointer table

`data/maps/map_header_pointers.asm` contains 248 pointers per release:

- JP: `$0167–$0356`
- EN/DE/FR/IT/ES: `$01AE–$039D`

`tools/verify_map_header_pointers.py` verifies all six 496-byte tables.

### Overworld engine — complete source span

`home/overworld.asm` and `home/overworld_stage2.asm` through `home/overworld_stage14.asm` cover the complete verified overworld span:

- JP: `$0357–$12EE`
- EN/DE/FR/IT/ES: `$039E–$1335`
- 3,992 bytes per release
- 2,044 SM83 instructions per release

See `docs/bank-analysis/OVERWORLD_STRUCTURE.md`.

### Pokemon / party ROM0 routines

`home/pokemon.asm` reconstructs `DrawHPBar` through `GetPartyMonName`.

- JP: `$12EF–$1585` — 663 bytes / 348 instructions
- EN/DE/IT/ES: `$1336–$15CC` — 663 bytes / 348 instructions
- FR: `$1336–$15C9` — 660 bytes / 346 instructions

The French release uses a shorter fainted-status rendering sequence; this is represented explicitly with a release conditional rather than hidden as raw bytes.

### BCD number printer

`home/print_bcd.asm` reconstructs `PrintBCDNumber` and `PrintBCDDigit`.

- JP: `$1586–$15BE` — 57 bytes; the Japanese routine omits the localized currency-symbol path.
- EN/DE/IT/ES: `$15CD–$1626` — 90 bytes
- FR: `$15CA–$1623` — 90 bytes

### Pokemon sprite processing

`home/pics.asm` reconstructs sprite decompression-bank selection, sprite centering, sprite-buffer clearing and interlacing.

- JP common sprite span: `$15BF–$16C6`
- EN/DE/IT/ES: `$1627–$172E`
- FR: `$1624–$172B`

The shared sprite span is 264 bytes / 155 instructions with an identical opcode skeleton in all six releases. JP additionally contains its relocated LCD/sprite/copy helpers at `$16C7–$1723`.

### Tileset collision data

`data/tilesets/collision_tile_ids.asm` contains the complete 200-byte collision list block. It is byte-identical in all six releases with SHA-1 `af69e30d0ddd85bf0f2be3fe6182073a5acc8099`.

- JP: `$1724–$17EB`
- EN/DE/IT/ES: `$172F–$17F6`
- FR: `$172C–$17F3`

### Far-copy / VRAM / screen helpers

`home/copy2.asm` reconstructs `FarCopyData2`, `FarCopyData3`, `FarCopyDataDouble`, `CopyVideoData`, `CopyVideoDataDouble`, `ClearScreenArea`, `CopyScreenTileBufferToVRAM`, and `ClearScreen`.

All six releases share a 299-byte / 167-instruction opcode skeleton.

- JP: `$17EC–$1916`
- EN/DE/IT/ES: `$17F7–$1921`
- FR: `$17F4–$191E`

## Current next boundary

Bank 00 reconstruction now continues at `TextBoxBorder`:

- JP: `$1917`
- EN/DE/IT: `$1922`
- FR: `$191F`
- ES: `$1922`

The following text-engine span has genuine localization-driven control-flow differences, so it will be reconstructed with explicit release variants rather than forced into one false common opcode skeleton.

## Final Bank 00 acceptance criterion

Bank 00 is **not complete yet**. Work continues in address order until `$3FFF`.

When all of `$0000–$3FFF` is represented as source/data, each release must assemble/link/fix to the Bank 00 SHA-1 listed above. The complete ROM will then be verified against the whole-ROM SHA-1/SHA-256 manifest.