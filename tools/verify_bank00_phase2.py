#!/usr/bin/env python3
"""Verify Bank 00 spans from UpdateSprites through FadeOutAudio.

Source ROMs are user-supplied and are never stored in this repository.
"""

from __future__ import annotations

import argparse
import hashlib
from pathlib import Path

SPECS = {
    "jp": [
        ("update_sprites", 0x2409, 25, "d2e7a663ac3b5ec29ac098fde3326794842c26c8"),
        ("marts", 0x2422, 148, "35077a4714c080d76fca7e319de8413350d35c71"),
        ("overworld_text", 0x24B6, 101, "d79864f41a62f76438d5c4edbde03946c7bceb80"),
        ("uncompress", 0x251B, 937, "506880bc47fb382d74dc24980863f23ba11135b7"),
        ("reset_player", 0x28C4, 37, "ab402757f4759ea0fe1d1bbcedeada9cb1fee315"),
        ("fade_audio", 0x28E9, 85, "c6a29abbf09b0da80cd4248bb1b7cbc1f6291a74"),
    ],
    "en": [
        ("update_sprites", 0x2429, 25, "0db42c218c3ac2f70583a0576039804f730ba5da"),
        ("marts", 0x2442, 148, "35077a4714c080d76fca7e319de8413350d35c71"),
        ("overworld_text", 0x24D6, 39, "bba487fa25a8685056ce9120b2ce82e843756ba0"),
        ("uncompress", 0x24FD, 937, "d45679903a14c52a8ccccc41c3d8e6ffbc8bee7b"),
        ("reset_player", 0x28A6, 37, "7087927f4e3f0dc4e50747daee5d3cb5d4eb56de"),
        ("fade_audio", 0x28CB, 85, "69a2de9fd8ba4d1e006fd8bb96a180c7e04d49fe"),
    ],
    "de": [
        ("update_sprites", 0x2429, 25, "6a34a555e48c0d3a7122a788baa1ae2ef15e8340"),
        ("marts", 0x2442, 148, "35077a4714c080d76fca7e319de8413350d35c71"),
        ("overworld_text", 0x24D6, 39, "96cd6610c90795eb5627eee5f7f34797266f75bc"),
        ("uncompress", 0x24FD, 937, "85a4491459cdfd8c99fe3887215a59058101fe31"),
        ("reset_player", 0x28A6, 37, "606b98ed017be78d1079f82bcc4f3723d96b8abb"),
        ("fade_audio", 0x28CB, 85, "e4422c48522890da7ea1ac81e2108f874217f763"),
    ],
    "fr": [
        ("update_sprites", 0x2425, 25, "69ddbe4606f92afaed29012e6565d136efb53d3d"),
        ("marts", 0x243E, 148, "35077a4714c080d76fca7e319de8413350d35c71"),
        ("overworld_text", 0x24D2, 39, "d022a66fb00e538da5ccc9da4c353a7515d8cc0e"),
        ("uncompress", 0x24F9, 937, "094648d286d6a8f77c2060628a4800c3dd8f8ca6"),
        ("reset_player", 0x28A2, 37, "b7309390e98ecc20e335b1ae1a0a989ffcdc20c3"),
        ("fade_audio", 0x28C7, 85, "442802aca7646b6d246d99d66a590ed27be2d0fb"),
    ],
    "it": [
        ("update_sprites", 0x2429, 25, "8032bee9cedab9c651cce7815e9a787350487070"),
        ("marts", 0x2442, 148, "35077a4714c080d76fca7e319de8413350d35c71"),
        ("overworld_text", 0x24D6, 39, "7ee99989c7cb9d6ee09431fc1cfa194f7d45aa21"),
        ("uncompress", 0x24FD, 937, "9f0704a57d5ca7595ffe0b2dd52135502ba81915"),
        ("reset_player", 0x28A6, 37, "586d331d538c7e408f4345ac64c14169231e1f62"),
        ("fade_audio", 0x28CB, 85, "e4422c48522890da7ea1ac81e2108f874217f763"),
    ],
    "es": [
        ("update_sprites", 0x2428, 25, "c7456471663974873894b6ede544bdfb75045be6"),
        ("marts", 0x2441, 148, "35077a4714c080d76fca7e319de8413350d35c71"),
        ("overworld_text", 0x24D5, 39, "3b1ae7b02cc46490a462ffd34b6c8c0c7e52c8fb"),
        ("uncompress", 0x24FC, 937, "cba5e7b8e75e623d3946b4300be17b56aee519cf"),
        ("reset_player", 0x28A5, 37, "99e930400c2812bbcb3007de5c144a53db5971c0"),
        ("fade_audio", 0x28CA, 85, "67deaac3d0601872a773a0c0ab2c15c71546d110"),
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
            print(f"{release.upper():2} {name:16} {'PASS' if passed else 'FAIL'} offset=0x{offset:04X} length={length} sha1={actual}")
            all_ok &= passed
    if not supplied:
        parser.error("supply at least one source ROM")
    return 0 if all_ok else 1


if __name__ == "__main__":
    raise SystemExit(main())
