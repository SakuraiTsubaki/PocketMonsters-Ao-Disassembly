# Study: establish Pocket Monsters Blue release candidates

- Status: draft
- Release ID: ao-jp-rev0, blue-en-rev0, blue-de-rev0, blue-es-rev0, blue-fr-rev0, blue-it-rev0
- Input SHA-256: recorded per release in `research/releases.csv`
- Last updated: 2026-09-18

## Question

Which locally available Japanese and localized Pokémon Blue ROM images can be recorded as hash-identified candidates without distributing ROM content?

## Environment and tool versions

- Host: Windows
- Inspector: `SakuraiTsubaki/Disassembly tools/inspect_gb_rom.py` version 1.0.0
- Repository baseline: `4ccb8fec9a9fecb2a639f64ef4250d544bf58ca2`

## Address convention

Game Boy cartridge header offsets are file offsets. Title is `0x0134..0x0143`, revision `0x014C`, header checksum `0x014D`, and global checksum `0x014E..0x014F` big-endian.

## Exact procedure

Compute complete-file SHA-1/SHA-256, parse the header, and validate the Nintendo logo plus both checksums. Preserve only hashes, metadata, derived observations, and validation results.

## Observations

| Release ID | Size | Revision | Header checksum | Global checksum |
| --- | ---: | ---: | --- | --- |
| ao-jp-rev0 | 524288 | 0 | 0xe5 | 0xdc36 |
| blue-en-rev0 | 1048576 | 0 | 0xd3 | 0x9d0a |
| blue-de-rev0 | 1048576 | 0 | 0xcb | 0x2ebc |
| blue-es-rev0 | 1048576 | 0 | 0xcb | 0x14d7 |
| blue-fr-rev0 | 1048576 | 0 | 0xcb | 0x56a4 |
| blue-it-rev0 | 1048576 | 0 | 0xcb | 0x5e9c |

All six expose `POKEMON BLUE`, SGB support, and valid Nintendo logo and checksums. The Japanese image is 512 KiB with cartridge type 0x03; localized images are 1 MiB, with English type 0x13 and the other four type 0x1b.

## Derived results

The local set identifies one Japanese original and five official localized release candidates. Their regional relationships are recorded as observations, not assumed equivalence.

## Interpretation and confidence

Hashes and header fields are directly observed. Region/language labeling remains candidate metadata pending independent confirmation.

## Reproduction

Run the shared inspector with `--require-valid` and compare results to `analysis/ao-release-header-report.json`; verify its SHA-256 with the manifest.

## Limitations and next questions

- Independent confirmation is required before `verified`.
- Bank-layout and content relationships must be measured after baseline confirmation.
