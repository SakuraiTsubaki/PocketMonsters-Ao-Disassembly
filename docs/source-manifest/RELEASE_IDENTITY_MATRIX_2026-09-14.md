# Release identity matrix — Pocket Monsters Ao / Pokémon Blue

Verification date: **2026-09-14**

This matrix is rebuilt from public evidence only. No local retail ROM is currently available. Hashes and source status are recorded separately so an identified retail binary is not mistaken for a completed public reconstruction.

## Japanese Ao origin target

| ID | Release | SHA-1 | Public exact-source evidence | Status |
|---|---|---|---|---|
| `ao-jp` | Pocket Monsters Blue (Japan) | `0da501e3e5c51ab8fef55b092dcdd7e6b050e424` | `Narishma-gb/pokeblue` | verified build target |

Reference: https://github.com/Narishma-gb/pokeblue

The dedicated Japanese Blue official page records the initial release on **1996-10-15** and general retail-store sales from **1999-10-10**. Those are separate distribution milestones for the same title lineage.

## International Blue family

| ID | Release | SHA-1 | Public evidence | Exact-source status |
|---|---|---|---|---|
| `blue-en-ue` | Pokémon Blue Version (USA, Europe) | `d7037c83e1ae5b39bde3c30787637ba1d4c48ce2` | `pret/pokered` | verified build target |
| `blue-de` | Pokémon Blaue Edition (Germany) | `20e72dc6f41493eee1fdd0cef54214e6c3389688` | BizHawk game DB; `einstein95/pokered-de` builds German Blue by MD5 | verified source family; SHA-1 externally cross-checked |
| `blue-fr` | Pokémon Version Bleue (France) | `47faa910d0e073c600665bf9c83b6bd17babdf8a` | `einstein95/pokered-fr` | verified build target |
| `blue-it` | Pokémon Versione Blu (Italy) | `f69ed1a1332f04c24c7db899a09019bb045fa8b3` | BizHawk game DB | release hash verified; exact public source **HOLD** |
| `blue-es` | Pokémon Edición Azul (Spain) | `7715e7b133e8634df48918b9138374110212a108` | `einstein95/pokered-es` | verified build target |

### Public-source references

- EN: https://github.com/pret/pokered
- DE: https://github.com/einstein95/pokered-de
- FR: https://github.com/einstein95/pokered-fr
- ES: https://github.com/einstein95/pokered-es
- independent SHA-1 cross-check database: https://github.com/TASEmulators/BizHawk/blob/master/Assets/gamedb/gamedb_gb.txt

## Italian-source warning

The currently observed `einstein95/pokered-it` default branch does not provide trustworthy Italian identity evidence: its README/hash material points to German Red/Blue. Keep Italian Blue source reconstruction unresolved until repository history, forks, or an alternate source is verified.

## Debug/development evidence

`pret/pokered` builds `BLUEMONS.GB`, and the French disassembly also exposes a Blue debug build. These are valuable development/debug research targets but are **not retail Blue rows** and must remain in a separate development-build census.

## Official re-release lineage

Japanese Ao has a public VC patch template in `Narishma-gb/pokeblue`. International Red/Blue source also exposes VC patch outputs in `pret/pokered`. VC identities are separate official derivative builds.

## Matrix rules

- Japanese Ao is not treated as the same binary/layout as western Blue merely because the color/version name matches.
- one row means one verified byte identity;
- hashes can be accepted before source reconstruction exists, but source status must remain explicit;
- debug builds, prototypes, VC patches, and retail cartridges are separate categories;
- language/revision assumptions never fill missing rows.

## Next verification work

- trace Italian Blue reconstruction candidates and repository history;
- determine whether any localized Blue language has multiple retail revisions;
- attach header/mapper/SGB metadata to every row;
- inventory VC patch/output hashes by language;
- build a Japanese-Ao-vs-localized-Blue semantic difference map: graphics, Pokédex text, encounters, code, scripts, maps, UI, and localization structures.
