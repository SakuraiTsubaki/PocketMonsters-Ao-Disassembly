# Official-source census — Pocket Monsters Ao / Pokémon Blue

Research restart date: **2026-09-14**

This ledger records first-party/public-publisher evidence separately from disassemblies and community technical references. The current research environment has no local retail ROM, so official material establishes release identity, documented behavior, peripherals, and official re-release changes before technical claims are accepted.

## Evidence grades

- **A1** — Nintendo / The Pokémon Company first-party product page or official electronic manual.
- **A2** — other official Nintendo / Pokémon promotional or historical material.
- **B** — reproducible public disassembly/source reconstruction with release hashes.
- **C** — specialist technical reference/wiki; discovery/cross-check only when stronger evidence exists.

## Verified official sources

### Original Japanese Blue

**Source:** Pokémon official site, 「ポケットモンスター 青」  
https://www.pokemon.co.jp/game/other/gb-blue/

**Grade:** A1

Verified statements:

- Japanese `ポケットモンスター 青` initial release date: **1996-10-15**.
- The same official page separately states that general retail-store sales began **1999-10-10**.
- Publisher: Nintendo.
- The page describes Blue as a different version of Red/Green with renewed Pokémon graphics and Pokédex text.
- Encounter rates differ from Red/Green; the official page explicitly gives examples such as Tauros and Kangaskhan becoming easier to obtain.
- Supported peripherals listed by the official page include the Game Boy-series Link Cable and 64GB Pak.

### Historical wording nuance

**Source:** official 3DS VC overview  
https://www.pokemon.co.jp/ex/VCAMAP/game/

**Grade:** A2

The VC overview describes Blue as generally released in 1999. This is not a contradiction with the dedicated Blue product page: the dedicated page distinguishes the **1996 initial release** from **1999 general retail availability**. Both dates are preserved with their meanings.

### 3DS Virtual Console release family

**Sources:**

- Pokémon official VC site: https://www.pokemon.co.jp/ex/VCAMAP/
- Nintendo official electronic manual: https://www.nintendo.co.jp/data/software/manual/manual_CTRNRCPA.pdf

**Grade:** A1

Verified statements:

- Japanese VC distribution began **2016-02-27**.
- Red/Green/Blue/Yellow trade and battle through 3DS local wireless.
- Nintendo warns that behavior/expression may differ from the original cartridge software.
- The software family does not use the normal VC suspend-state or full-save-backup features.
- The electronic manual documents one save file and wireless Trade Center / Colosseum operation.

The public `Narishma-gb/pokeblue` source reconstruction also exposes a Japanese Blue VC patch template. That source is grade B and is tracked separately in `VC_SOURCE_CENSUS.md`.

## Research consequences

1. Never reduce Japanese Blue history to a single “1999 release” date.
2. The 1996 initial release and 1999 general retail release are separate distribution milestones.
3. Blue’s sprite/Pokédex rewrite and encounter changes are first-party documented and must be audited exhaustively against Red/Green.
4. 3DS VC is an official later revision family; its wireless hooks and other changes are not original-cartridge behavior.
5. 64GB Pak compatibility belongs in the peripheral/communication census rather than being ignored as a later side feature.

## Official-source search frontier

Still to locate and index where publicly accessible:

- 1996 Blue mail-order / special-distribution application material and original package/inserts.
- 1999 general-retail packaging and any identifiable content/manual revision differences.
- Japanese Blue cartridge manual and official strategy/guide material.
- Nintendo 64GB Pak / Stadium documentation that names Blue compatibility.
- 3DS Blue download-card special edition material.
- Official Pokémon Bank / Poké Transporter transfer documentation.
- Any first-party support or errata pages for Blue-specific communication behavior.

## Rule

Distribution history, promotional description, and byte-level implementation are separate evidence classes. Preserve all three and do not use one to erase the others.
