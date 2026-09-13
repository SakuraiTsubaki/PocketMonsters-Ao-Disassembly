# ROM Source Manifest

Generated from the six read-only source ROMs used by this project. ROM binaries themselves are not stored in GitHub.

| Release | Size | Banks | Header title | Cart | SGB | SHA-1 | SHA-256 | Header checksum | Global checksum |
|---|---:|---:|---|---|---|---|---|---|---|
| JP — Pocket Monsters Ao | 524,288 | 32 | `POKEMON BLUE` | MBC1+RAM+BATTERY | `0x03` | `0da501e3e5c51ab8fef55b092dcdd7e6b050e424` | `71a70e5f77c109177d21c998310ffe01a68e8cd2f41e72e7129093b890c7d3d1` | OK | OK |
| DE — Pokémon Blaue Edition | 1,048,576 | 64 | `POKEMON BLUE` | MBC5+RAM+BATTERY | `0x03` | `20e72dc6f41493eee1fdd0cef54214e6c3389688` | `2cfec2223090dc9f544aa36c99c48801be5018757a1366b88d8f40739541458e` | OK | OK |
| EN — Pokémon Blue Version | 1,048,576 | 64 | `POKEMON BLUE` | MBC3+RAM+BATTERY | `0x03` | `d7037c83e1ae5b39bde3c30787637ba1d4c48ce2` | `2a951313c2640e8c2cb21f25d1db019ae6245d9c7121f754fa61afd7bee6452d` | OK | OK |
| ES — Pokémon Edición Azul | 1,048,576 | 64 | `POKEMON BLUE` | MBC5+RAM+BATTERY | `0x03` | `7715e7b133e8634df48918b9138374110212a108` | `31317f74fed2935dfc5fbb6ada766cf8515949c85c6c6e8d32d0f752b85b8f9e` | OK | OK |
| FR — Pokémon Version Bleue | 1,048,576 | 64 | `POKEMON BLUE` | MBC5+RAM+BATTERY | `0x03` | `47faa910d0e073c600665bf9c83b6bd17babdf8a` | `73dee67befed0c39cd0a6ed53a98ff5b98b3bddc3e7a0dae1d982776a4d0889b` | OK | OK |
| IT — Pokémon Versione Blu | 1,048,576 | 64 | `POKEMON BLUE` | MBC5+RAM+BATTERY | `0x03` | `f69ed1a1332f04c24c7db899a09019bb045fa8b3` | `e197c7535135a516fe9bf92cf7821c9f72926bf90fce3a2a5742d1b0b6a0564b` | OK | OK |

## Notes

- A bank is treated as 16 KiB (`0x4000`) for bank-level inventory and reconstruction tracking.
- JP Ao is 512 KiB (32 banks); the five localized Blue releases are 1 MiB (64 banks).
- Hashes are verification metadata only; the ROM files are excluded from the repository.
- `bank_hashes.csv` records SHA-1/SHA-256 for every source bank and will be used to detect identical banks and verify reconstructed output.
