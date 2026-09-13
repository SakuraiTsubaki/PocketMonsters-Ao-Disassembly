# PocketMonsters-Ao-Disassembly

Multi-region disassembly and source reconstruction of **Pocket Monsters Ao / Pokémon Blue** for Game Boy.

The goal of this repository is to reconstruct the supported retail ROMs into editable disassembly-source form and eventually produce **byte-exact reproducible builds without requiring a local base ROM**.

## Supported release families

- **JP** — Pocket Monsters Ao
- **EN** — Pokémon Blue Version (USA/Europe)
- **DE** — Pokémon Blaue Edition
- **FR** — Pokémon Version Bleue
- **IT** — Pokémon Versione Blu
- **ES** — Pokémon Edición Azul

Each release is treated as an independent reproducible build target while sharing common source wherever the original data is byte-identical or structurally equivalent.

## Reconstruction scope

The repository is intended to contain every non-ROM component required to reproduce the original games, including:

- LR35902 assembly code
- engine logic and home-bank routines
- constants, macros, symbols, pointer maps, and bank layouts
- Pokémon, move, item, trainer, encounter, and other game data
- maps, blocksets, object data, connections, and event scripts
- all game text and character-table definitions
- Pokémon, trainer, overworld, UI, font, tileset, intro, and SGB graphics
- music, sound effects, cries, wave data, audio headers, and audio engine data
- extracted intermediate assets when a structure has not yet been fully understood
- extraction, reconstruction, comparison, build, and verification tooling
- reverse-engineering notes, manifests, cross-version comparisons, and regression results

The target is not a raw ROM dump. Data should be progressively converted into meaningful, editable disassembly-source formats such as `.asm`, `.inc`, `.png`, `.2bpp`, `.tilemap`, structured tables, and other reproducible source assets.

## Build philosophy

A completed target should follow this model:

```text
git clone <repository>
        ↓
install the required build toolchain
        ↓
make <version>
        ↓
generated ROM
        ↓
hash and byte-for-byte comparison
        ↓
MATCH with the corresponding retail ROM
```

No `baserom.gb`, `baserom.gbc`, or other local ROM dependency is intended for the final reconstruction.

During reverse engineering, unknown regions may temporarily remain as explicitly documented binary/source data so that reconstruction stays lossless. Those regions should be replaced with structured source as their purpose becomes understood.

## Planned source layout

```text
constants/      symbolic constants and identifiers
macros/         reusable RGBDS macros
home/           fixed-bank and common routines
engine/         game engine code
data/           structured game data
maps/           map layouts and map metadata
scripts/        event and map scripts
text/           game text
gfx/            graphics and visual assets
audio/          music, SFX, cries, wave data, audio engine
versions/       release-specific source and build differences
layout/         ROM bank/section/pointer layout documentation
tools/          extraction, reconstruction, comparison, verification
checksums/      expected hashes and reproducibility records
docs/           reverse-engineering and project documentation
tests/          regression and byte-exact verification tests
```

The exact structure may evolve as the ROMs are fully mapped.

## Verification standard

For every supported release, the long-term verification requirement is:

1. Assemble and link entirely from repository source.
2. Generate the target ROM without reading bytes from a retail ROM.
3. Verify file size, cartridge header, ROM layout, and expected hashes.
4. Perform a byte-for-byte comparison against the corresponding read-only reference ROM.
5. Record any mismatch with bank, offset, expected byte, actual byte, and cause.

A target is considered fully reconstructed only when the generated image matches its verified reference exactly.

## ROM policy

**ROM binaries are not stored in this repository.**

This includes original retail ROMs, modified ROMs, reconstructed ROM outputs, and local base-ROM files. Build products such as `*.gb` and `*.gbc` are excluded from version control.

Everything else produced for the project—source code, scripts, documentation, structured data, extracted/reconstructed assets, manifests, logs, tests, patches, and reproducibility metadata—is intended to be version-controlled where appropriate.

## Current status

The repository is in the initial reconstruction phase. The first milestones are:

1. inventory and hash all six reference releases;
2. map ROM headers, banks, sections, and cross-version differences;
3. reconstruct Bank 00 and continue bank-by-bank;
4. extract and restore graphics, text, maps, scripts, audio, and structured data into editable source form;
5. replace temporary opaque regions as their formats are understood;
6. reach independent byte-exact builds for every supported release.

## Toolchain

The project is intended to use an RGBDS-based Game Boy assembly workflow together with project-specific extraction and verification tools. Exact supported tool versions will be pinned once the initial build system is established.

## Project principle

**Preserve the retail ROMs as read-only references; reconstruct everything else as reproducible source.**
