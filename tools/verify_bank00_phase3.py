#!/usr/bin/env python3
"""Verify Bank 00 start-menu, CountSetBits, and inventory spans.

Source ROMs are user-supplied and are never stored in this repository.
"""

from __future__ import annotations

import argparse
import hashlib
from pathlib import Path

SPECS = {
    "jp": [
        ("start_menu", 0x2B2A, 178, "6ad8f760d3173600a167b4ed93a147143d79a2b0"),
        ("count_set_bits", 0x2BDC, 23, "d35127402ee6098bf3c35edab9342bd78f877e22"),
        ("inventory", 0x2BF3, 80, "1b82b18701fdbb15965bc757e827e1b41ddd1dff"),
    ],
    "en": [
        ("start_menu", 0x2ACD, 178, "0cbcb0227ba2c4e14ba63f9c996be38599b1c53e"),
        ("count_set_bits", 0x2B7F, 23, "b24fff9c7d8ebbc818b84949c9ea9dee6b23aaeb"),
        ("inventory", 0x2B96, 80, "55a6457b54998d6e72827c014345176f47257acb"),
    ],
    "de": [
        ("start_menu", 0x2AE7, 178, "31b0265d03fc553b6b52ed2aaaee9e9a69de4da3"),
        ("count_set_bits", 0x2B99, 23, "2df85e81afa48706d74bb7b737830ddeb4479346"),
        ("inventory", 0x2BB0, 80, "a944dc5a2217127bb6807efc54dbfd9038390915"),
    ],
    "fr": [
        ("start_menu", 0x2AE3, 178, "bf269c18567f1046eb7fdfebdf68ce60d607dcd7"),
        ("count_set_bits", 0x2B95, 23, "2df85e81afa48706d74bb7b737830ddeb4479346"),
        ("inventory", 0x2BAC, 80, "1a685546af06e220b18c10b676b5a3711f327c58"),
    ],
    "it": [
        ("start_menu", 0x2AE7, 178, "e4a528e89ed46f8695da31d7142af075e6b2846c"),
        ("count_set_bits", 0x2B99, 23, "2df85e81afa48706d74bb7b737830ddeb4479346"),
        ("inventory", 0x2BB0, 80, "cb42366d9afdc51e179e4e56cb56a891105e255f"),
    ],
    "es": [
        ("start_menu", 0x2AE6, 178, "23308d28680d46d6b74443943aa924dcfb2fd4ad"),
        ("count_set_bits", 0x2B98, 23, "2df85e81afa48706d74bb7b737830ddeb4479346"),
        ("inventory", 0x2BAF, 80, "4f897b46e5a42307ce4cb106999eaa2436f32cb0"),
    ],
}


def main() -> int:
    parser = argparse.ArgumentParser()
    for release in SPECS:
        parser.add_argument(f"--{release}", type=Path)
    args = parser.parse_args()
    supplied = False
    all_ok = True
    for release, specs in SPECS.items():
        path = getattr(args, release)
        if path is None:
            continue
        supplied = True
        rom = path.read_bytes()
        for name, offset, length, expected in specs:
            blob = rom[offset:offset + length]
            actual = hashlib.sha1(blob).hexdigest()
            passed = len(blob) == length and actual == expected
            print(
                f"{release.upper():2} {name:14} {'PASS' if passed else 'FAIL'} "
                f"offset=0x{offset:04X} length={len(blob)} sha1={actual}"
            )
            all_ok &= passed
    if not supplied:
        parser.error("supply at least one source ROM")
    return 0 if all_ok else 1


if __name__ == "__main__":
    raise SystemExit(main())
