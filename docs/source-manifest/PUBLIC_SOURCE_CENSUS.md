# Public source census — research restart

Date started: 2026-09-14

## Governing rule

This census restarts Pocket Monsters Ao / Pokémon Blue research from public evidence. No local retail ROM is assumed to be available. Existing repository material is retained as evidence but is revalidated rather than treated as unquestioned truth.

The governing scope is **Japanese releases as the historical origin point, followed by an exhaustive survey of every publicly documented regional, language, revision, and official re-release branch**.

Ao must be studied as its own Japanese release and as a major ancestor of the international Red/Blue localization family. JP, EN, DE, FR, IT and ES are never flattened into one binary layout.

This is a living census. It does not claim completeness. Search proceeds recursively through repositories, forks, mirrors, branches, tags, commits, issues, pull requests, symbol branches, wikis, archives, manuals, official pages, technical databases, asset archives, research posts, glitch documentation, and citations until new source families cease materially changing the evidence map.

## Evidence classes

- **A1** — byte-exact/public reconstruction or first-party official source.
- **A2** — independent technical documentation/database corroborated by A1 evidence.
- **B** — specialist secondary research useful for differences, glitches, unused content, or historical context.
- **C** — derivative, old, modified, translation, hack, or uncertain source; lead only until independently verified.
- **Rejected/hold** — misleading, contradictory, ROM-distribution-focused, or insufficiently attributable.

## A1 — Japanese Ao

- Narishma-gb/pokeblue — https://github.com/Narishma-gb/pokeblue
  - Public Japanese Pocket Monsters Ao disassembly.
  - Retail SHA-1: `0da501e3e5c51ab8fef55b092dcdd7e6b050e424`
  - Primary public reconstruction anchor for Japanese Ao.

## A1 — international Red/Blue reconstruction family

- pret/pokered — https://github.com/pret/pokered
  - English USA/Europe Red and Blue byte-exact disassembly family.
  - Blue SHA-1 `d7037c83e1ae5b39bde3c30787637ba1d4c48ce2`
  - Red SHA-1 `ea9bcae617fdf159b045185467ae58b2e4a48b9a`
  - Also exposes debug/Virtual Console-related build artifacts that must remain separately labeled.
- einstein95/pokered-de — https://github.com/einstein95/pokered-de
  - German Red/Blue reconstruction family; independently verify hashes and history before importing data.
- einstein95/pokered-fr — https://github.com/einstein95/pokered-fr
  - French Red/Blue reconstruction.
  - Blue SHA-1 `47faa910d0e073c600665bf9c83b6bd17babdf8a`
  - Red SHA-1 `47a7622fa30e6402a3891fe65b3a930bf9bd7aec`
- einstein95/pokered-es — https://github.com/einstein95/pokered-es
  - Spanish Red/Blue reconstruction.
  - Blue SHA-1 `7715e7b133e8634df48918b9138374110212a108`
  - Red SHA-1 `fc17c5b904d551b1b908054ccd1c493f755f832a`
- einstein95/pokered-it — https://github.com/einstein95/pokered-it
  - **HOLD / identity mismatch on current default branch.** The inspected README and `roms.md5` describe German Rote/Blaue outputs rather than Italian Rossa/Blu. Do not use as proof of an Italian byte-exact disassembly until repository history is audited.

## A1 — first-party Nintendo material

- Pocket Monsters Red/Green — https://www.nintendo.co.jp/n02/dmg/apajapbj/index.html
- Pocket Monsters Blue — https://www.nintendo.co.jp/n02/dmg/apej/index.html
  - Officially describes Blue-specific Pokémon artwork and Pokédex-text changes and provides contemporary release context.
- Pocket Monsters Pikachu — https://www.nintendo.co.jp/n02/dmg/apsj/index.html
- Nintendo 3DS Generation I feature page — https://www.nintendo.co.jp/kids/sp/160224/pokemon/index.html

Official pages establish public first-party chronology/features; implementation claims still require code/data verification where possible.

## A2 — identity and technical structure

- Data Crystal: Pokémon Red and Blue — https://datacrystal.tcrf.net/wiki/Pok%C3%A9mon_Red_and_Blue
- ROM map — https://datacrystal.tcrf.net/wiki/Pok%C3%A9mon_Red_and_Blue/ROM_map
- RAM map — https://datacrystal.tcrf.net/wiki/Pok%C3%A9mon_Red_and_Blue/RAM_map
- Notes / map-object formats — https://datacrystal.tcrf.net/wiki/Pok%C3%A9mon_Red_and_Blue%3ANotes
  - International/Japanese addresses can differ and must be version-verified.
- BizHawk Game Boy game database — independent SHA-1/release-identity corroboration.
- No-Intro metadata mirrors — metadata cross-check only; ROM distribution is outside project scope.

Known identity lead for Italian Blue: SHA-1 `f69ed1a1332f04c24c7db899a09019bb045fa8b3`. This identifies the target but does **not** prove an available byte-exact disassembly.

## B — specialist secondary research

- Bulbapedia release/revision pages — useful index, but technical details must be checked against code/data.
- Glitch City Wiki: natural Generation I glitches — https://glitchcity.wiki/List_of_natural_glitches_in_Generation_I
- Glitch City Laboratories archive: unused-content research — https://archives.glitchcity.info/forums/board-107/thread-6347/page-0.html
- Helix Chamber / Capsule Monsters source index — https://helixchamber.com/media/capsule-monsters/
  - Follow cited primary material individually.

## C — derivative / historical leads

- luckytyphlosion/pokered-jp — https://github.com/luckytyphlosion/pokered-jp
- digita-LUNA/pokejp — https://github.com/digita-LUNA/pokejp
- Masaru2/pokejp — https://github.com/Masaru2/pokejp

Useful for source archaeology and Japanese/international comparison leads, not retail baselines without independent verification.

## First-pass findings

1. Japanese Ao has a dedicated public reconstruction anchor and must be treated separately from international Blue.
2. International EN/DE/FR/ES reconstruction families are publicly visible and need independent branch/history audits.
3. Italian Blue's retail identity is publicly documented, but a reliable public Italian byte-exact disassembly has not yet been established in this restart.
4. Repository naming is not enough to establish target identity; `pokered-it` currently demonstrates why content/hash/history checks are mandatory.
5. International Red/Blue must be investigated as descendants of the Japanese lineage rather than assumed to be simple translations of Japanese Red/Green or Blue.

## Mandatory next waves

- Exhaustively audit forks, mirrors, branches, tags, commits, issues, PRs, releases and symbol branches of every A1 repository.
- Resolve the Italian Red/Blue reconstruction question through repository history and broader searches.
- Inventory original manuals, packaging, guide material, magazines, official archived pages, interviews, and development-history sources.
- Inventory every public sprite, trainer, overworld, UI, font, tile, tileset, blockset, map, SGB and title-screen resource with provenance.
- Inventory text dumps, charmaps, control codes, localization notes, name limits, dialogue/menu differences and translator-side technical research for JP/EN/DE/FR/IT/ES.
- Inventory audio sequence, music/SFX/cry and audio-engine research.
- Inventory SRAM/save, link-cable, battle, field, RNG, encounter, trainer-AI and hardware behavior documentation.
- Inventory glitches, unused/debug/garbage/padding data, unreachable maps/data and revision/localization fixes.
- Survey official Virtual Console patches/behavior as separate later releases.

Every source must ultimately record URL, target release(s), region, language, revision, evidence class, coverage, conflicts, and verification state.
