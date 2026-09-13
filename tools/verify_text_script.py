#!/usr/bin/env python3
"""Verify the ROM0 DisplayTextID/text-script span for all supported Blue releases.

Source ROMs are user-supplied and are never stored in this repository.
"""

from __future__ import annotations

import argparse
import hashlib
from pathlib import Path

SPECS = {
    "jp": (0x293E, 492, "d02dda498150c81489ce528f44bf3fd121808f2f"),
    "en": (0x2920, 429, "59556a52a33a004e8062049d6c375fd0c5049b36"),
    "de": (0x2920, 455, "c8ad3d558714cc64f7d73031a6a1c3531899c163"),
    "fr": (0x291C, 455, "646b6efd9307d5807facef2e7bfb9e04d86e1823"),
    "it": (0x2920, 455, "c7c6c8e00fabb3f3c678d331aded1f156382c416"),
    "es": (0x291F, 455, "1d37c1dccb3d81c2ae49aa3b11dadb48c8aff1a8"),
}


def main() -> int:
    parser = argparse.ArgumentParser()
    for release in SPECS:
        parser.add_argument(f"--{release}", type=Path)
    args = parser.parse_args()

    supplied = False
    all_ok = True
    for release, (offset, length, expected) in SPECS.items():
        path = getattr(args, release)
        if path is None:
            continue
        supplied = True
        rom = path.read_bytes()
        blob = rom[offset:offset + length]
        actual = hashlib.sha1(blob).hexdigest()
        passed = len(blob) == length and actual == expected
        end = offset + length - 1
        print(
            f"{release.upper():2} text_script {'PASS' if passed else 'FAIL'} "
            f"range=0x{offset:04X}-0x{end:04X} length={len(blob)} sha1={actual}"
        )
        all_ok &= passed

    if not supplied:
        parser.error("supply at least one source ROM")
    return 0 if all_ok else 1


if __name__ == "__main__":
    raise SystemExit(main())
