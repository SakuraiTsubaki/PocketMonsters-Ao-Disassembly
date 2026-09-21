# PocketMonsters-Ao-Disassembly

Evidence-driven disassembly research for **Pocket Monsters Ao / Pokémon Blue**.

## Target

| Field | Value |
| --- | --- |
| Platform | Game Boy |
| CPU | Sharp SM83 |
| Architecture profile | `gb-sm83` |
| Scope | Japanese and localized Blue releases; regional relationships must be demonstrated from verified inputs. |
| Current stage | Verified regional baseline; bank classification is next |

## Verified baseline

Six local inputs are now identity-verified in `research/releases.csv`: Japanese, English (USA/Europe), French, German, Italian, and Spanish. No ROM binaries are stored in this repository.

Initial direct comparison already shows distinct cartridge-layout profiles (Japanese MBC1/512 KiB, English MBC3/1 MiB, continental European MBC5/1 MiB), while bank 27 is byte-identical across all six inputs. See `research/notes/blue-regional-baseline-2026-09-21.md` and `analysis/rom_headers.csv`.

## Ready to use

- machine-readable verified release metadata;
- architecture-specific bank/section and symbol tables;
- documented scope, workflow, research method, and roadmap;
- local input hashing and repository validation tools;
- unit tests, GitHub Actions, issue forms, and pull-request checks.

## Verify a local input

```sh
python tools/hash_input.py path/to/legally-obtained-input
python tools/validate_repository.py .
python -m unittest discover -s tests -v
```

Add only metadata and hashes to `research/releases.csv`; never add the input.
Use `research/templates/note.md` for each bounded investigation.

Shared methods and reusable tools belong in
[`SakuraiTsubaki/Disassembly`](https://github.com/SakuraiTsubaki/Disassembly).

No earlier experimental work was migrated. Completeness and byte-exactness are
not claimed until automated evidence exists.

## Artifact preservation

ROM binaries are the only project artifacts excluded from GitHub. Preserve every
lawful, storable non-ROM result: research, reports, source, tools, configuration,
logs, manifests, structured data, patches, validation evidence, graphics,
sprites, palettes, fonts, icons, tiles, and converted data.

Graphics and sprite work must include actual reviewable PNG output alongside
encoded data and metadata. See [the artifact policy](docs/ARTIFACT_POLICY.md).
