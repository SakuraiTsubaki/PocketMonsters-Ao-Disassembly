# ROM0 Overworld Cross-Release Structure

The ROM0 overworld engine was compared instruction-by-instruction across all six project source ROMs and reconstructed as a continuous source span.

## Verified complete range

| Release | Start | End inclusive | Length | SHA-1 |
|---|---:|---:|---:|---|
| JP | `0x0357` | `0x12EE` | 3,992 | `96004e1006d38ea672194c3bf7a4b167637661b3` |
| EN | `0x039E` | `0x1335` | 3,992 | `5b83c3990eeb8bd368421d70cdc591de17585fc8` |
| DE | `0x039E` | `0x1335` | 3,992 | `e9fc5dce28d15d94292af685257a7769bed2978e` |
| FR | `0x039E` | `0x1335` | 3,992 | `3bf0ba335f8dbb0ee3eece11455c6ab57c16c262` |
| IT | `0x039E` | `0x1335` | 3,992 | `215f146871ce861338d8a2dbca0576cdee2dd30a` |
| ES | `0x039E` | `0x1335` | 3,992 | `e47fadb0496ca8aa4cba44a9ad2e11097d12f4a0` |

The next routine is `DrawHPBar`, beginning at `0x12EF` in JP and `0x1336` in the localized releases.

## Structural result

- 2,044 decoded SM83 instructions in every release.
- Opcode byte is identical at every corresponding instruction boundary across JP/EN/DE/FR/IT/ES.
- 567 instructions contain release differences.
- Every one of those differences is confined to a 16-bit operand in a three-byte instruction.
- No opcode divergence was found in the verified range.
- `BikeRidingTilesets` is represented as data, not code.
- The 44-byte land/water tile-pair collision tables are byte-identical in all six releases and are represented as data, not disassembled instructions.

This establishes one common overworld code skeleton with release-specific addresses isolated as transitional operands.

## Reconstruction stages

| Stage | JP range | Localized range | Main contents |
|---|---|---|---|
| 1 | `0357–063B` | `039E–0682` | HandleMidJump, EnterMap, main overworld loop |
| 2 | `063C–0772` | `0683–07B9` | NewBattle, bike speedup, warp handling |
| 3 | `0773–0881` | `07BA–08C8` | CheckMapConnections |
| 4 | `0882–08D7` | `08C9–091E` | map-change sound, outside-map and extra-warp checks |
| 5 | `08D8–09B4` | `091F–09FB` | blackout/warp handling, player graphics, bike checks, tileset graphics |
| 6 | `09B5–0B89` | `09FC–0BD0` | LoadTileBlockMap, connection-strip copies, sprite/sign detection |
| 7 | `0B8A–0C62` | `0BD1–0CA9` | land collision, tile passability, tile-pair collision data |
| 8 | `0C63–0CDF` | `0CAA–0D26` | LoadCurrentMapView |
| 9 | `0CE0–0E1D` | `0D27–0E64` | AdvancePlayerSprite |
| 10 | `0E1E–0F05` | `0E65–0F4C` | map-pointer helpers, redraw scheduling, DrawTileBlock |
| 11 | `0F06–0F6F` | `0F4D–0FB6` | JoypadOverworld |
| 12 | `0F70–1034` | `0FB7–107B` | water collision, RunMapScript, player sprite graphics |
| 13 | `1035–11F9` | `107C–1240` | LoadMapHeader and map connection/header/object loading |
| 14 | `11FA–12EE` | `1241–1335` | LoadMapData, SwitchToMapRomBank, input helpers, destination warp position |

## Current status

The entire verified overworld span is now continuously represented by source files included from `home.asm`:

- `home/overworld.asm`
- `home/overworld_stage2.asm` through `home/overworld_stage14.asm`

Total continuous reconstructed overworld size: **3,992 bytes per release**.

This does **not** mean Bank 00 is complete. Bank 00 reconstruction continues immediately with `DrawHPBar` and the subsequent ROM0 routines/data until the fixed bank ends at `0x3FFF`.

## Verification

`tools/verify_overworld_structure.py` verifies the complete-overworld hashes and the cross-release opcode invariant against user-supplied source ROMs. ROM binaries are not stored in this repository.
