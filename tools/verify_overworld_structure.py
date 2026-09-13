#!/usr/bin/env python3
"""Verify the cross-release ROM0 overworld structure.

This tool does not ship or fetch ROMs. Pass six legally obtained source ROMs.
It verifies the known section boundaries, section SHA-1 values, instruction
count, and the invariant that every decoded opcode is identical across all
six releases while version differences are limited to 16-bit operands.
"""

from __future__ import annotations

import argparse
import hashlib
from pathlib import Path

RELEASES = {
    "jp": {"start": 0x0357, "end": 0x12EF, "sha1": "96004e1006d38ea672194c3bf7a4b167637661b3"},
    "en": {"start": 0x039E, "end": 0x1336, "sha1": "5b83c3990eeb8bd368421d70cdc591de17585fc8"},
    "de": {"start": 0x039E, "end": 0x1336, "sha1": "e9fc5dce28d15d94292af685257a7769bed2978e"},
    "fr": {"start": 0x039E, "end": 0x1336, "sha1": "3bf0ba335f8dbb0ee3eece11455c6ab57c16c262"},
    "it": {"start": 0x039E, "end": 0x1336, "sha1": "215f146871ce861338d8a2dbca0576cdee2dd30a"},
    "es": {"start": 0x039E, "end": 0x1336, "sha1": "e47fadb0496ca8aa4cba44a9ad2e11097d12f4a0"},
}


def op_len(op: int) -> int:
    x, y, z = op >> 6, (op >> 3) & 7, op & 7
    p, q = y >> 1, y & 1
    if x == 0:
        if z == 0:
            return 1 if y == 0 else (3 if y == 1 else 2)
        if z == 1:
            return 3 if q == 0 else 1
        if z == 6:
            return 2
        return 1
    if x in (1, 2):
        return 1
    if z == 0:
        return 1 if y < 4 else 2
    if z == 1:
        return 1
    if z == 2:
        return 3 if y < 4 or y in (5, 7) else 1
    if z == 3:
        return 3 if y == 0 else (2 if y == 1 else 1)
    if z == 4:
        return 3 if y < 4 else 1
    if z == 5:
        return 1 if q == 0 else (3 if p == 0 else 1)
    if z == 6:
        return 2
    return 1


def load_section(path: Path, release: str) -> bytes:
    spec = RELEASES[release]
    data = path.read_bytes()
    section = data[spec["start"]:spec["end"]]
    if len(section) != 3992:
        raise SystemExit(f"{release}: expected 3992 bytes, got {len(section)}")
    digest = hashlib.sha1(section).hexdigest()
    if digest != spec["sha1"]:
        raise SystemExit(f"{release}: section SHA-1 mismatch: {digest}")
    return section


def main() -> None:
    ap = argparse.ArgumentParser()
    for release in RELEASES:
        ap.add_argument(f"--{release}", required=True, type=Path)
    args = ap.parse_args()

    sections = {r: load_section(getattr(args, r), r) for r in RELEASES}
    ref = sections["en"]

    offsets = []
    pos = 0
    while pos < len(ref):
        length = op_len(ref[pos])
        if pos + length > len(ref):
            raise SystemExit(f"truncated instruction at +0x{pos:04x}")
        offsets.append((pos, length))
        pos += length

    if len(offsets) != 2044:
        raise SystemExit(f"expected 2044 instructions, got {len(offsets)}")

    differing = 0
    for off, length in offsets:
        opcodes = {sections[r][off] for r in RELEASES}
        if len(opcodes) != 1:
            raise SystemExit(f"opcode mismatch at relative +0x{off:04x}")
        chunks = {sections[r][off:off + length] for r in RELEASES}
        if len(chunks) > 1:
            differing += 1
            if length != 3:
                raise SystemExit(
                    f"non-16-bit-operand difference at relative +0x{off:04x}"
                )

    if differing != 567:
        raise SystemExit(f"expected 567 differing instructions, got {differing}")

    print("PASS: 6 releases, 3,992 bytes, 2,044 instructions")
    print("PASS: opcode skeleton identical at every instruction boundary")
    print("PASS: 567 differing instructions, all limited to 16-bit operands")


if __name__ == "__main__":
    main()
