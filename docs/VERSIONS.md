# Version Coverage

This repository targets the Japanese release of **ポケットモンスター 青**. Revision identity is tracked explicitly because code, data, text, pointers, layout, and build behavior may differ between releases or manufacturing revisions.

| Target ID | Region | Language | Revision / release | SHA-1 | Verification status |
| --- | --- | --- | --- | --- | --- |
| `jp-blue-retail` | Japan | Japanese | Retail reference build (no Vx.y label in current reference) | `0da501e3e5c51ab8fef55b092dcdd7e6b050e424` | External reproducible reference; local ROM match pending |

## Evidence

The SHA-1 identity above was cross-checked against the published `roms.sha1` from the Japanese Blue disassembly maintained at `Narishma-gb/pokeblue`.

The current reference does not label this target as V1.0/V1.1. This repository therefore avoids inventing a revision number. If additional Japanese Blue revisions are verified later, they will receive separate Target IDs.

When a local source ROM is available, record its independently computed hashes and promote the target's verification state only after a successful match.

## Address and data rule

Any ROM address, bank, pointer, checksum, or binary-layout claim added to this repository must identify the applicable Target ID.

ROM binaries are not stored in this repository.
