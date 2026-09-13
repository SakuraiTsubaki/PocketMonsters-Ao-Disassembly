#!/usr/bin/env python3
"""Verify the committed numeric map-header pointer source without a base ROM.

The expected hashes were derived once from the six read-only source ROMs. This
check protects the reconstructed source from accidental drift while symbolic
labels gradually replace numeric addresses.
"""
from __future__ import annotations

import hashlib
import re
from pathlib import Path

SOURCE = Path("data/maps/map_header_pointers.asm")

EXPECTED = {
    "_JP": (0x0167, "7cd2725d22f50fae5cfb1b68c3e20c09069af11ae67ea44e6c3f2b2b7bfbbc2c"),
    "_EN": (0x01AE, "71b39a6943ad48eab4a6c73ffac69609e4adcdb17b8db5b1e16d3bd99864e254"),
    "_DE": (0x01AE, "ab8a9028dd41bec5852355e989582e76f7e3a8cd05fcb2ef99b406585a7f5214"),
    "_FR": (0x01AE, "55b4fbad72602c9b68ba7218ca9d0a0c95f3714f93eb39ae2c43099c61a36cab"),
    "_IT": (0x01AE, "4b1c979c6fb8aede8417755ea958bcfba385f61d123b35d0a2361961fb86eaa7"),
    "_ES": (0x01AE, "53179299c7d6e4d1d52852c05bfbe02016eb35da01a4119002da958d823122bd"),
}


def branch_block(text: str, tag: str, next_tag: str | None) -> str:
    prefix = "IF" if tag == "_JP" else "ELIF"
    start_marker = f"{prefix} DEF({tag})"
    start = text.index(start_marker)
    if next_tag is None:
        end = text.index("\nELSE", start)
    else:
        end = text.index(f"\nELIF DEF({next_tag})", start)
    return text[start:end]


def decode_dw(block: str) -> bytes:
    values: list[int] = []
    for line in block.splitlines():
        body = line.split(";", 1)[0].strip()
        if not body.startswith("dw "):
            continue
        values.extend(int(token, 16) for token in re.findall(r"\$([0-9a-fA-F]{4})", body))
    if len(values) != 0xF8:
        raise SystemExit(f"expected 248 pointers, found {len(values)}")
    return b"".join(value.to_bytes(2, "little") for value in values)


def main() -> None:
    text = SOURCE.read_text(encoding="utf-8")
    tags = list(EXPECTED)
    failures = 0
    for i, tag in enumerate(tags):
        block = branch_block(text, tag, tags[i + 1] if i + 1 < len(tags) else None)
        raw = decode_dw(block)
        digest = hashlib.sha256(raw).hexdigest()
        address, expected = EXPECTED[tag]
        ok = digest == expected
        print(f"{tag[1:]}: {len(raw)} bytes @ 0x{address:04X} — {'PASS' if ok else 'FAIL'}")
        if not ok:
            print(f"  expected {expected}")
            print(f"  actual   {digest}")
            failures += 1
    if failures:
        raise SystemExit(1)


if __name__ == "__main__":
    main()
