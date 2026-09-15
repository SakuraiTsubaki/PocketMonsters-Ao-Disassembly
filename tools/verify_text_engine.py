#!/usr/bin/env python3
"""Verify the reconstructed Bank 00 text-engine span against source ROMs.

Usage example:
  python tools/verify_text_engine.py --jp ao.gb --en blue.gb --de blau.gb \
      --fr bleue.gb --it blu.gb --es azul.gb

ROM binaries are never stored in the repository.
"""

from __future__ import annotations

import argparse
import hashlib
from pathlib import Path

TARGETS = {
    "jp": (0x1917, 0x1CC3, "e1c6dd87e81236a52392ec2c48ad0e5b6c617303"),
    "en": (0x1922, 0x1CDD, "7c2ff36a8b57061090ebe15faee47ecfb2fdf692"),
    "de": (0x1922, 0x1CDD, "deb20a492b78799d7ceb4874339d4c5d973a5294"),
    "fr": (0x191F, 0x1CD9, "8169c209847a405c7d8f85b9823864dd9e1c37a6"),
    "it": (0x1922, 0x1CDD, "3e589186768f6558f67efbfad8eaa8cf69aff835"),
    "es": (0x1922, 0x1CDC, "82c610fcd6a85c0ef9c5b161eded916165e56fc0"),
}


def main() -> int:
    parser = argparse.ArgumentParser()
    for key in TARGETS:
        parser.add_argument(f"--{key}", type=Path)
    args = parser.parse_args()

    checked = 0
    failed = 0
    for key, (start, end, expected) in TARGETS.items():
        path = getattr(args, key)
        if path is None:
            continue
        blob = path.read_bytes()[start:end]
        actual = hashlib.sha1(blob).hexdigest()
        ok = actual == expected
        print(
            f"{key.upper()}: ${start:04X}-${end - 1:04X} "
            f"({len(blob)} bytes) SHA-1 {actual} {'PASS' if ok else 'FAIL'}"
        )
        checked += 1
        failed += not ok

    if checked == 0:
        parser.error("provide at least one ROM path")
    return 1 if failed else 0


if __name__ == "__main__":
    raise SystemExit(main())
