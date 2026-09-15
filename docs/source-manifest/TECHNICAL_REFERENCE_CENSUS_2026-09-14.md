# External technical-reference census — Pocket Monsters Ao / Pokémon Blue

Research restart date: **2026-09-14**

This file records public technical references useful for reconstruction but lower-priority than exact per-release source reconstructions for byte-level claims.

## Hardware baseline — Pan Docs

- https://gbdev.io/pandocs/
- https://gbdev.io/pandocs/Memory_Map.html
- https://gbdev.io/pandocs/Serial_Data_Transfer_%28Link_Cable%29.html
- https://gbdev.io/pandocs/MBC1.html
- https://gbdev.io/pandocs/MBC3.html
- https://gbdev.io/pandocs/MBC5.html
- https://gbdev.io/pandocs/SGB_Unlocking.html

Use Pan Docs for Game Boy address-space, serial/link, mapper, and SGB hardware semantics. Exact Ao/international-Blue mapper/header identities still require per-release source/header evidence.

## Data Crystal — Red/Blue technical index

- Overview: https://datacrystal.tcrf.net/wiki/Pok%C3%A9mon_Red_and_Blue
- ROM map: https://datacrystal.tcrf.net/wiki/Pok%C3%A9mon_Red_and_Blue/ROM_map
- RAM map: https://datacrystal.tcrf.net/wiki/Pok%C3%A9mon_Red_and_Blue/RAM_map
- Notes/map structures: https://datacrystal.tcrf.net/wiki/Pok%C3%A9mon_Red_and_Blue%3ANotes
- Text table: https://datacrystal.tcrf.net/wiki/Pok%C3%A9mon_Red_and_Blue%3ATBL

**Classification:** C — specialist community reference.

Useful as a broad western-Red/Blue ROM/RAM/map/text index, but it is not a substitute for region-specific source. The RAM-map article explicitly says more Japanese-version differences still need to be added. Japanese Ao and localized Blue addresses therefore remain separate verification targets.

## Glitch City Wiki

- https://glitchcity.wiki/List_of_natural_glitches_in_Generation_I

**Classification:** C — specialist discovery index.

The list is explicitly incomplete, but it is valuable because entries often name affected language/version groups. Every applicability claim must still be checked against the corresponding Ao/EN/DE/FR/IT/ES source family.

## Bulbapedia

Use as comparative secondary evidence and bibliography lead, especially for VC/regional-difference discovery. Promote claims only after official or source-level confirmation.

## Ao-specific verification rule

This repository spans JP/EN/DE/FR/IT/ES Blue families. Consequently, a single address table is never assumed universal. For every technical claim, record:

- language/region;
- cartridge revision if known;
- source repository/commit or other exact evidence;
- whether the address is ROM, SRAM, WRAM, VRAM, or HRAM;
- whether the same structure is shared or merely semantically equivalent.

## Immediate follow-up queues

- Japanese Ao versus EN/DE/FR/IT/ES SRAM/save layouts.
- Map-header and connection/object structures across all six Blue families.
- Character encoding/control-code comparison by language.
- Link protocol and packet-layout comparison against Pan Docs serial semantics.
- Versioned natural-glitch matrix, including known language-specific encounter/map behaviors.
- Debug/unused-data and inaccessible-content audit by release.
- Community ROM-map addresses reconciled with exact public disassembly symbols.
