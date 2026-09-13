#!/usr/bin/env python3
"""Verify the reconstructed ROM0 vcopy, init, and VBlank spans.

ROM binaries are supplied by the user and are never stored in the repository.
"""

from __future__ import annotations

import argparse
import hashlib
from pathlib import Path

SPECS = {
    "jp": {
        "vcopy": (0x1CC3, 620, "483ddef10ca4001a7bcdf6e89b5c63323b673167"),
        "init": (0x1F2F, 219, "10a38fb4800658df4819fc8c98e1437c6a0285bc"),
        "vblank": (0x200A, 144, "9a8afb20df93ca40a1c6dcf5f6ef06e82cbd0dfe"),
    },
    "en": {
        "vcopy": (0x1CDD, 620, "4c101f461758d12755400552bf0a29756ae3584d"),
        "init": (0x1F49, 219, "d10ab33d8f3f06fb0ee747fba994ade4ae1dee53"),
        "vblank": (0x2024, 150, "de35660ae0f16869872a0bb4db512d3cff6573d7"),
    },
    "de": {
        "vcopy": (0x1CDD, 620, "d57f51929890bc3dd157ff444cd9c88a4a7df4d2"),
        "init": (0x1F49, 219, "0d7a3f883b404687c1c80cd756c049c1302514ed"),
        "vblank": (0x2024, 150, "bc46e1cfe7465be23655fa3a95c2bfa3b49da6e3"),
    },
    "fr": {
        "vcopy": (0x1CD9, 620, "3b59822e95a2e7370780c6b1640d97695b34448e"),
        "init": (0x1F45, 219, "372aada2edcb990d7382ce6fb29c2aac704058e7"),
        "vblank": (0x2020, 150, "829f95d7709778c8045bdee914127348957b42c1"),
    },
    "it": {
        "vcopy": (0x1CDD, 620, "d57f51929890bc3dd157ff444cd9c88a4a7df4d2"),
        "init": (0x1F49, 219, "4e932ea6c5b94b169339ff5bd4ebbb42658195b4"),
        "vblank": (0x2024, 150, "00b5624656698fea6bd39960b6d476484c7bc4ac"),
    },
    "es": {
        "vcopy": (0x1CDC, 620, "51fb44d3ecc4b8bc0d20821cc394070276aab892"),
        "init": (0x1F48, 219, "38dce9d039979896329c24f6e7fa3892ba5e15f6"),
        "vblank": (0x2023, 150, "48ac2149a70c2cc56fca5222c6daf008236152f8"),
    },
}


def sha1(blob: bytes) -> str:
    return hashlib.sha1(blob).hexdigest()


def verify_release(release: str, path: Path) -> bool:
    rom = path.read_bytes()
    ok = True
    for name, (offset, length, expected) in SPECS[release].items():
        chunk = rom[offset : offset + length]
        actual = sha1(chunk)
        passed = len(chunk) == length and actual == expected
        status = "PASS" if passed else "FAIL"
        print(
            f"{release.upper():2} {name:6} {status} "
            f"offset=0x{offset:04X} length={length} sha1={actual}"
        )
        ok &= passed
    return ok


def main() -> int:
    parser = argparse.ArgumentParser()
    for release in SPECS:
        parser.add_argument(f"--{release}", type=Path)
    args = parser.parse_args()

    supplied = False
    all_ok = True
    for release in SPECS:
        path = getattr(args, release)
        if path is None:
            continue
        supplied = True
        all_ok &= verify_release(release, path)

    if not supplied:
        parser.error("supply at least one release ROM, e.g. --jp path/to/ao.gb")
    return 0 if all_ok else 1


if __name__ == "__main__":
    raise SystemExit(main())
