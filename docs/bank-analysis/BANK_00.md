# Bank 00 Baseline and Reconstruction Status

Bank `00` is the fixed `ROM0` region (`0x0000–0x3FFF`). Work proceeds strictly in address order and preserves every byte as source/data without a `baserom`/`INCBIN` dependency.

## Bank hashes

- JP: SHA-1 `3f3c27f7b8960211fc903af906610c34d98e7a84`
- EN: SHA-1 `cf785a689639826f7a9ae2eda88e8d6cdeebc54e`
- DE: SHA-1 `bf5661ca44cdee2e1827016ef556aa36e17108cc`
- FR: SHA-1 `351387bf9ad2c98f0545109c032d7a93f675f306`
- IT: SHA-1 `35646dd4fa4ca99c3e4f0ea567fcbe4d19d7390a`
- ES: SHA-1 `3fd427297d15e9f0b13a2e83fb233d8946623bf4`

## Cartridge / release observations

All six releases begin with `00 C3 50 01` at `$0100`: `nop` followed by a jump to `$0150`.

- JP: MBC1+RAM+BATTERY (`0x03`), ROM size code `0x04`
- EN: MBC3+RAM+BATTERY (`0x13`), ROM size code `0x05`
- DE/FR/IT/ES: MBC5+RAM+BATTERY (`0x1B`), ROM size code `0x05`

## Reconstructed source committed

### Reset, interrupt and startup area

- `$0000–$0060`: reset/interrupt vectors — `home/header.asm`
- `$0061–$00FF`: localized high-home routines and exact JP representation — `home/high_home.asm`
- `$0100–$014F`: cartridge entry/header reservation — `home/header.asm`
- `$0150` onward: startup and joypad wrappers — `home/start.asm`

The JP release stores `DisableLCD`, `EnableLCD`, `ClearSprites`, `HideSprites`, `FarCopyData`, and `CopyData` later in ROM0; those relocated routines are identified in `home/pics.asm`.

### Map-header pointer table

`data/maps/map_header_pointers.asm` contains 248 pointers per release:

- JP: `$0167–$0356`
- EN/DE/FR/IT/ES: `$01AE–$039D`

`tools/verify_map_header_pointers.py` verifies all six 496-byte tables.

### Overworld engine — complete span

`home/overworld.asm` and `home/overworld_stage2.asm` through `home/overworld_stage14.asm` cover:

- JP: `$0357–$12EE`
- EN/DE/FR/IT/ES: `$039E–$1335`
- 3,992 bytes per release
- 2,044 SM83 instructions per release

The opcode skeleton is identical across all six releases; version differences in this span are isolated to operands/data. See `docs/bank-analysis/OVERWORLD_STRUCTURE.md`.

### Pokemon / party ROM0 routines

`home/pokemon.asm` reconstructs `DrawHPBar` through `GetPartyMonName`.

- JP: `$12EF–$1585` — 663 bytes / 348 instructions
- EN/DE/IT/ES: `$1336–$15CC` — 663 bytes / 348 instructions
- FR: `$1336–$15C9` — 660 bytes / 346 instructions

The French release's shorter fainted-status sequence is represented explicitly rather than being forced into the common skeleton.

### BCD number printer

`home/print_bcd.asm` reconstructs `PrintBCDNumber` and `PrintBCDDigit`.

- JP: `$1586–$15BE` — 57 bytes
- EN/DE/IT/ES: `$15CD–$1626` — 90 bytes
- FR: `$15CA–$1623` — 90 bytes

### Pokemon sprite processing

`home/pics.asm` reconstructs sprite decompression-bank selection, centering, sprite-buffer clearing and interlacing.

- JP common sprite span: `$15BF–$16C6`
- EN/DE/IT/ES: `$1627–$172E`
- FR: `$1624–$172B`

JP additionally contains relocated LCD/sprite/copy helpers at `$16C7–$1723`.

### Tileset collision data

`data/tilesets/collision_tile_ids.asm` contains the complete 200-byte collision-list block. It is byte-identical in all six releases with SHA-1 `af69e30d0ddd85bf0f2be3fe6182073a5acc8099`.

- JP: `$1724–$17EB`
- EN/DE/IT/ES: `$172F–$17F6`
- FR: `$172C–$17F3`

### Far-copy / VRAM / screen helpers

`home/copy2.asm` reconstructs `FarCopyData2`, `FarCopyData3`, `FarCopyDataDouble`, `CopyVideoData`, `CopyVideoDataDouble`, `ClearScreenArea`, `CopyScreenTileBufferToVRAM`, and `ClearScreen`.

All six releases share a 299-byte / 167-instruction opcode skeleton.

- JP: `$17EC–$1916`
- EN/DE/IT/ES: `$17F7–$1921`
- FR: `$17F4–$191E`

### ROM0 text engine — complete lossless span

The text-engine range is now represented by `home/text_stage1.asm` and `home/text_stage2.asm` and connected from `home.asm`.

`TextBoxBorder` is already symbolic source. The localization-heavy `PlaceString`/command-character area and `TextCommandProcessor` command-handler area are currently preserved as exact per-release `db` source because JP and the European localizations have genuine code/data-length differences. These blocks will be progressively replaced by symbolic routines without changing layout or bytes.

Full text-engine spans and source-ROM fingerprints:

| Release | Range | Length | SHA-1 |
|---|---:|---:|---|
| JP | `$1917–$1CC2` | 940 | `e1c6dd87e81236a52392ec2c48ad0e5b6c617303` |
| EN | `$1922–$1CDC` | 955 | `7c2ff36a8b57061090ebe15faee47ecfb2fdf692` |
| DE | `$1922–$1CDC` | 955 | `deb20a492b78799d7ceb4874339d4c5d973a5294` |
| FR | `$191F–$1CD8` | 954 | `8169c209847a405c7d8f85b9823864dd9e1c37a6` |
| IT | `$1922–$1CDC` | 955 | `3e589186768f6558f67efbfad8eaa8cf69aff835` |
| ES | `$1922–$1CDB` | 954 | `82c610fcd6a85c0ef9c5b161eded916165e56fc0` |

`tools/verify_text_engine.py` verifies these spans against user-supplied source ROMs.

## Current next boundary

Bank 00 reconstruction now continues at `GetRowColAddressBgMap`, the start of the ROM0 `vcopy` block:

- JP: `$1CC3`
- EN/DE/IT: `$1CDD`
- FR: `$1CD9`
- ES: `$1CDC`

The `vcopy` block is exactly 620 bytes in every release and ends immediately before `SoftReset` / `Init`:

- JP next boundary: `$1F2F`
- EN/DE/IT next boundary: `$1F49`
- FR next boundary: `$1F45`
- ES next boundary: `$1F48`

This block mixes executable VRAM-copy/redraw helpers with small inline data tables, so code and data are being separated rather than linearly mis-disassembled.

## Final Bank 00 acceptance criterion

Bank 00 is **not complete yet**. Work continues in address order until `$3FFF`.

When all of `$0000–$3FFF` is represented as source/data, each release must assemble/link/fix to the Bank 00 SHA-1 listed above. The complete ROM will then be verified against the whole-ROM SHA-1/SHA-256 manifest.
