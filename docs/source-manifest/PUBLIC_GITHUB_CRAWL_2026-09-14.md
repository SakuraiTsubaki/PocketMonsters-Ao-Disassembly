# Public GitHub crawl — 2026-09-14

Discovery ledger for the research restart. Search hits are retained for inspection; they are not trusted merely because the repository name matches a game.

## Query family: `pokeblue`

Primary upstream candidate:

- `Narishma-gb/pokeblue` — Japanese Pocket Monsters Ao reconstruction anchor.

Other repository-name hits retained for inspection:

- `JcFerggy/pokeblue`
- `Archenoth/pokeblue-oshawott`
- `GB-Recomp/pokeblue`
- `SeafarersWind/pokeblue`
- `ArieleM/pokeblue`
- `ArieleM/pokeblue-test`
- `whitgroves/pokeblue-remix`
- `Gatien-L/pokeblue-fr-151`
- `oshkoshbagoshh/pokeblue`
- `d3npa/pokeblue`
- `Rangi42/pokeblue`
- `nightfall07/pokebluerevamp`
- `b-price/pokebluecrab`

Most are expected to be forks, hacks, experiments, recompilation work or unrelated derivatives; each remains pending until its parentage and useful unique material are checked.

## International localized reconstruction families already identified

- `pret/pokered` — English USA/Europe Red/Blue primary public reconstruction family.
- `einstein95/pokered-de` — German family.
- `einstein95/pokered-fr` — French family.
- `einstein95/pokered-es` — Spanish family.
- `einstein95/pokered-it` — **HOLD**: default branch inspected on 2026-09-14 contains German Rote/Blaue README and hashes despite repository name. Commit history must be examined before any Italian claim.

The broader `pokered-de` repository-name crawl also surfaces multiple forks/derivatives including `Brianum/pokered-de`, `Ebernacher90/pokered-de`, `OldHarmony/pokered-de`, `pburggraf/pokered-de`, `SkyHawaii/pokered-de`, `tenry92/pokered-de`, `PapierDragon/pokered-de`, `Sanqui/pokered-de`, and `emergenz/pokered-de`. These are now crawl-queue entries, not separate confirmed retail targets.

## Direct technical anchors in `pret/pokered`

Files discovered and queued for version-by-version comparison:

- `constants/charmap.asm` — character map and control codes.
- `engine/menus/save.asm` — save routine / `SaveGameData`.
- `home/serial.asm` — low-level serial exchange.
- `engine/link/cable_club.asm` — battle/trade exchange data.
- `home/random.asm`, `engine/math/random.asm` — RNG paths.
- `data/wild/probabilities.asm` — encounter slot chances.
- `engine/battle/wild_encounters.asm` — encounter decision path.

These are strong source-level anchors for international Blue but must be diffed against Japanese Ao rather than assumed equivalent.

## External source families queued in wave 2

First-party:

- Nintendo original Red/Green page.
- Nintendo original Blue page.
- Pokémon official Red/Green page.
- Game Freak works archive, including Blue release history/artwork/Pokédex-change description.
- Nintendo/Pokémon 3DS VC pages.

Visual/map archives — secondary until source-checked:

- The Spriters Resource Red/Blue archive.
- VGMaps Game Boy/Game Boy Color map atlas.

Technical/research leads:

- Bulbapedia Generation I character encoding.
- `Phasip/PokemonLinkHack` — serial/link exploit research lead.
- Glitch City / archived Glitch City research.
- Helix Chamber historical/prototype coverage; primary citations must be followed separately.

## Rules

- Repository name does not establish target identity.
- Parent/fork history, target hashes and actual build outputs are checked before classification.
- Modified projects may contain useful commentary or recovered research, but modified data cannot be silently promoted to retail data.
- Each inspected item eventually receives `PRIMARY`, `CORROBORATING`, `DERIVATIVE`, `HISTORICAL`, `IRRELEVANT`, or `HOLD`.
- README links, forks, branches, commit history, issues, PRs and off-GitHub citations recursively enter the crawl queue.
