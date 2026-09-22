# Study: establish the Blue regional candidate baseline

- Status: candidate baseline
- Release ID: ao-jp, blue-us-eu, blue-fr, blue-de, blue-it, blue-es
- Input SHA-256: recorded in `research/releases.csv`
- Last updated: 2026-09-21

## Question

What can be established directly from the six locally available Pocket Monsters Ao / Pokémon Blue ROM inputs before source reconstruction begins?

## Environment and tool versions

- Direct byte-level analysis of the six local `.gb` inputs.
- Hashes: SHA-1 and SHA-256 via Python `hashlib`.
- Bank size: 16 KiB (`0x4000`).
- Header fields: Game Boy cartridge header at `0x0100–0x014F`.

## Address convention

File offsets are used for this study. A ROM bank is `bank = file_offset // 0x4000`. CPU banked addresses are not inferred here.

## Exact procedure

1. Hash each input and record file size.
2. Parse title, SGB flag, cartridge type, ROM/RAM size codes, destination code, version and checksums.
3. Recompute both header and global checksums.
4. Split each input into 16 KiB banks.
5. Detect fully zero-filled banks.
6. Compare same-index bytes for Japan vs English and for every pair of the five international releases.
7. Test exact same-index bank identity across all six releases.

## Observations

- Japanese `ao-jp` is 512 KiB / 32 banks and reports cartridge type `0x03` (MBC1+RAM+BATTERY).
- English `blue-us-eu` is 1 MiB / 64 banks and reports `0x13` (MBC3+RAM+BATTERY).
- French, German, Italian and Spanish are 1 MiB / 64 banks and report `0x1B` (MBC5+RAM+BATTERY).
- All six report SGB flag `0x03`, title `POKEMON BLUE`, header version 0, and valid header/global checksums.
- International banks 45–63 are all zero-filled in every candidate release, so non-zero content ends within bank 44.
- Bank 27 is byte-identical across all six candidate releases.
- Japan vs English same-index equality is extremely high for several banks: 2 (99.85%), 5 (95.51%), 9 (96.23%), 10 (98.42%), 11 (94.15%), 12 (99.01%), 19 (95.81%), 25 (99.63%), 27 (100%), 31 (99.95%).
- Other banks diverge heavily, showing that regional relationships cannot be modeled as a single text-only patch over one fixed 512 KiB layout.

## Derived results

The observed set contains at least three cartridge-layout profiles: Japanese MBC1/512 KiB, English MBC3/1 MiB, and continental-European MBC5/1 MiB. The international images reserve substantial zero-filled tail space, while several early banks remain structurally very close to the Japanese input. This is enough to begin evidence-backed bank classification without assuming a public disassembly tree.

## Interpretation and confidence

Confidence is high for identity, header, size, checksum and byte-equality claims because they are computed directly from the locally observed candidate inputs. Functional classifications of individual banks remain hypotheses until control flow, references and data formats are traced.

## Reproduction

- Re-run `python tools/hash_input.py <input>` and compare against `research/releases.csv`.
- Recompute header/global checksums and bank comparisons using the method above.
- The summarized header results are in `analysis/rom_headers.csv`.
- Same-index regional bank similarity is in `analysis/regional_bank_similarity.csv`.

## Limitations and next questions

- This set does not prove that no other official revision exists.
- Bank similarity alone does not identify code, text, graphics, maps, scripts or audio.
- Next: classify banks 0–44, starting with exact/high-similarity banks and then trace the divergent regionalized banks.
