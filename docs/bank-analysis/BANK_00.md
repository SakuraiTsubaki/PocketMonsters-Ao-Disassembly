# Bank 00 Reconstruction Status

Bank `00` is fixed ROM0 (`0x0000–0x3FFF`). Work proceeds strictly in address order. ROM binaries are never committed; every covered byte is represented as ASM/data source, with release-specific differences isolated explicitly.

## Bank SHA-1 baselines

- JP: `3f3c27f7b8960211fc903af906610c34d98e7a84`
- EN: `cf785a689639826f7a9ae2eda88e8d6cdeebc54e`
- DE: `bf5661ca44cdee2e1827016ef556aa36e17108cc`
- FR: `351387bf9ad2c98f0545109c032d7a93f675f306`
- IT: `35646dd4fa4ca99c3e4f0ea567fcbe4d19d7390a`
- ES: `3fd427297d15e9f0b13a2e83fb233d8946623bf4`

## Continuous source coverage

Current lossless source/data coverage is continuous from `0x0000` through the end of the ROM0 inventory helper block:

| Release | Covered through | Next byte / routine |
|---|---:|---|
| JP | `0x2C42` | `0x2C43` — `DisplayListMenuID` |
| EN | `0x2BE5` | `0x2BE6` — `DisplayListMenuID` |
| DE | `0x2BFF` | `0x2C00` — `DisplayListMenuID` |
| FR | `0x2BFB` | `0x2BFC` — `DisplayListMenuID` |
| IT | `0x2BFF` | `0x2C00` — `DisplayListMenuID` |
| ES | `0x2BFE` | `0x2BFF` — `DisplayListMenuID` |

This is lossless source coverage, not a claim that every temporary numeric or exact-byte representation has already been semantically renamed. Those representations are progressively promoted to labels/macros while preserving layout and bytes.

## Reconstructed modules in address order

- `home/header.asm` — reset/interrupt vectors and cartridge entry
- `home/high_home.asm` — localized high-home helpers; exact JP high-home representation
- `home/start.asm` — startup/joypad wrapper
- `data/maps/map_header_pointers.asm` — 248 map-header pointers per release
- `home/overworld.asm` + `home/overworld_stage2.asm` … `home/overworld_stage14.asm` — complete 3,992-byte overworld core
- `home/pokemon.asm` — HP/party/Pokémon ROM0 routines
- `home/print_bcd.asm` — BCD number printer
- `home/pics.asm` — sprite load/centering/interlace helpers
- `data/tilesets/collision_tile_ids.asm` — 200-byte collision lists
- `home/copy2.asm` — far-copy/VRAM/screen helpers
- `home/text_stage1.asm`, `home/text_stage2.asm` — ROM0 text engine; localization-heavy parts remain exact per-release source pending deeper symbolic promotion
- `home/vcopy.asm` — 620-byte VRAM-copy/BG-update block including flower animation tile data
- `home/init.asm` — `SoftReset`, `Init`, `ClearVram`, `StopAllSounds`
- `home/vblank.asm` — `VBlank`, `DelayFrame`
- `home/fade.asm` — palette fade routines and 24-byte palette table
- `home/serial.asm` — complete 481-byte serial/link block
- `home/timer.asm` — one-byte timer interrupt handler
- `home/audio.asm` — 290-byte ROM0 audio dispatch block
- `home/update_sprites.asm` — 25-byte `UpdateSprites` wrapper
- `data/items/marts.asm` — 148-byte mart inventory table, byte-identical in all six releases
- `home/overworld_text.asm` — overworld text stubs; JP inline text vs localized far-text layout preserved
- `home/uncompress.asm` — complete 937-byte sprite decompression engine with code/data separation
- `home/reset_player_sprite.asm` — 37-byte player sprite-state reset block
- `home/fade_audio.asm` — 85-byte audio fade state machine
- `home/text_script.asm` — complete `DisplayTextID` text-script span for all six releases; exact per-release source pending deeper semantic promotion
- `home/start_menu.asm` — 178-byte start-menu dispatcher; opcode skeleton identical across all six releases, with release-specific operands isolated symbolically
- `home/count_set_bits.asm` — 23-byte `CountSetBits`; only the destination WRAM address differs by release
- `home/inventory.asm` — 80-byte money/inventory wrapper block; common control-flow reconstructed symbolically with release-specific targets isolated

## Newly verified spans

### Text script

| Release | Range | Length | SHA-1 |
|---|---:|---:|---|
| JP | `0x293E–0x2B29` | 492 | `d02dda498150c81489ce528f44bf3fd121808f2f` |
| EN | `0x2920–0x2ACC` | 429 | `59556a52a33a004e8062049d6c375fd0c5049b36` |
| DE | `0x2920–0x2AE6` | 455 | `c8ad3d558714cc64f7d73031a6a1c3531899c163` |
| FR | `0x291C–0x2AE2` | 455 | `646b6efd9307d5807facef2e7bfb9e04d86e1823` |
| IT | `0x2920–0x2AE6` | 455 | `c7c6c8e00fabb3f3c678d331aded1f156382c416` |
| ES | `0x291F–0x2AE5` | 455 | `1d37c1dccb3d81c2ae49aa3b11dadb48c8aff1a8` |

### Start menu / CountSetBits / inventory

The start-menu span is exactly 178 bytes in every release and has an identical SM83 opcode skeleton. `CountSetBits` is 23 bytes in every release. The inventory block is exactly 80 bytes in every release. All release-specific ROM/WRAM operands are isolated in the corresponding source files and all three spans pass source-ROM SHA-1 verification in every release.

## Important cross-release results

The complete overworld core is 3,992 bytes / 2,044 SM83 instructions in every release with no opcode divergence. The sprite decompression engine is 937 bytes / 501 instruction boundaries in every release, also with no opcode divergence; `LengthEncodingOffsetList`, four nybble decode tables, and `NybbleReverseTable` are represented as data rather than mis-disassembled code.

The 148-byte mart inventory block is byte-identical across all six releases. `overworld_text` differs structurally: JP stores the five localized messages inline, while EN/DE/FR/IT/ES use five far-text references.

## Verification tools

- `tools/verify_map_header_pointers.py`
- `tools/verify_overworld_structure.py`
- `tools/verify_text_engine.py`
- `tools/verify_vcopy_init_vblank.py`
- `tools/verify_bank00_phase2.py`
- `tools/verify_text_script.py`
- `tools/verify_bank00_phase3.py`

These verify known source-ROM offsets, lengths, and fingerprints without storing a ROM in the repository.

## Current next boundary

Continue from `DisplayListMenuID` / the ROM0 list-menu block:

- JP: `0x2C43`
- EN: `0x2BE6`
- DE/IT: `0x2C00`
- FR: `0x2BFC`
- ES: `0x2BFF`

Work continues in address order until `0x3FFF` is fully represented and the complete Bank 00 output matches the SHA-1 baseline above.

## Final acceptance

Bank 00 is **not complete yet**. Completion requires:

1. every byte `0x0000–0x3FFF` represented as source/data,
2. semantic promotion of temporary exact-byte regions where practical,
3. RGBDS assemble/link/fix validation, and
4. byte-for-byte Bank 00 SHA-1 match for all six releases.
