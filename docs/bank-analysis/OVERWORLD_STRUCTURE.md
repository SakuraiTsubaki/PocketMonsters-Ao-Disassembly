# ROM0 Overworld Cross-Release Structure

The ROM0 overworld engine was compared instruction-by-instruction across all six project source ROMs.

## Verified range

| Release | Start | End inclusive | Length | SHA-1 |
|---|---:|---:|---:|---|
| JP | `0x0357` | `0x12EE` | 3,992 | `96004e1006d38ea672194c3bf7a4b167637661b3` |
| EN | `0x039E` | `0x1335` | 3,992 | `5b83c3990eeb8bd368421d70cdc591de17585fc8` |
| DE | `0x039E` | `0x1335` | 3,992 | `e9fc5dce28d15d94292af685257a7769bed2978e` |
| FR | `0x039E` | `0x1335` | 3,992 | `3bf0ba335f8dbb0ee3eece11455c6ab57c16c262` |
| IT | `0x039E` | `0x1335` | 3,992 | `215f146871ce861338d8a2dbca0576cdee2dd30a` |
| ES | `0x039E` | `0x1335` | 3,992 | `e47fadb0496ca8aa4cba44a9ad2e11097d12f4a0` |

The next routine after this range is `DrawHPBar`, beginning at `0x12EF` in JP and `0x1336` in the localized releases.

## Structural result

- 2,044 decoded SM83 instructions in every release.
- Opcode byte is identical at every corresponding instruction boundary across JP/EN/DE/FR/IT/ES.
- 567 instructions contain version differences.
- Every one of those 567 differences occurs in a three-byte instruction and is confined to its 16-bit operand.
- No opcode divergence was found in the verified range.

This means the six releases share one overworld code skeleton. Release-specific addresses can be isolated as operands while the executable source remains common.

## Source reconstruction progress

### Stage 1

- JP: `0x0357–0x063B`
- EN/DE/FR/IT/ES: `0x039E–0x0682`
- 741 bytes / 310 instructions
- `HandleMidJump` through the instruction immediately before `NewBattle`
- Source: `home/overworld.asm`

### Stage 2

- JP: `0x063C–0x0772`
- EN/DE/FR/IT/ES: `0x0683–0x07B9`
- 311 bytes / 151 instructions
- `NewBattle`, `DoBikeSpeedup`, and warp handling through the instruction immediately before `CheckMapConnections`
- Source: `home/overworld_stage2.asm`

### Stage 3

- JP: `0x0773–0x0881`
- EN/DE/FR/IT/ES: `0x07BA–0x08C8`
- 271 bytes / 125 instructions
- Full `CheckMapConnections` implementation
- Source: `home/overworld_stage3.asm`

### Stage 4

- JP: `0x0882–0x08D7`
- EN/DE/FR/IT/ES: `0x08C9–0x091E`
- 86 bytes / 41 instructions
- `PlayMapChangeSound`, `CheckIfInOutsideMap`, and `ExtraWarpCheck`
- Source: `home/overworld_stage4.asm`

### Stage 5

- JP: `0x08D8–0x09B4`
- EN/DE/FR/IT/ES: `0x091F–0x09FB`
- 221 bytes, including the 6-byte `BikeRidingTilesets` table
- `MapEntryAfterBattle`, blackout/warp handling, player-sprite selection, bike-riding checks, and `LoadTilesetTilePatternData`
- Source: `home/overworld_stage5.asm`

### Current reconstructed span

The continuously reconstructed overworld span now runs from:

- JP: `0x0357–0x09B4` — 1,630 bytes
- EN/DE/FR/IT/ES: `0x039E–0x09FB` — 1,630 bytes

### Next boundary

Reconstruction continues at:

- JP: `0x09B5`
- EN/DE/FR/IT/ES: `0x09FC`

This is the start of `LoadTileBlockMap`.

## Verification

`tools/verify_overworld_structure.py` verifies the known complete-overworld hashes and the cross-release opcode invariant against user-supplied source ROMs. ROM binaries are not stored in this repository.
