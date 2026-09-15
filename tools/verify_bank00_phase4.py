#!/usr/bin/env python3
"""Verify Bank 00 list-menu through money spans.

Source ROMs are user-supplied and are never stored in this repository.
"""

from __future__ import annotations

import argparse
import hashlib
from pathlib import Path

SPECS = {
    "jp": [
        ("list_menu", 0x2C43, 953, "e8b3368e0b5f7db205f81162d4cffeffca6c42c7"),
        ("names", 0x2FFC, 211, "80f719029a95c029265b750419b738a8f9a1d261"),
        ("reload_tiles", 0x30CF, 75, "f6bf0b4db8325a712a113aa42f5b7b19e4eb3b9f"),
        ("item", 0x311A, 44, "1c6c7cfc66edec778bab0f581795626bf7a11feb"),
        ("textbox", 0x3146, 21, "5b0785d13817660d3cf7c2d597606fb7c974f860"),
        ("npc_movement", 0x315B, 90, "90bb106c065226cd3be1080ccc6d9ddca07138b5"),
        ("trainers", 0x31B5, 749, "9bcf73a091d233805b30561dfdaeac182519e7e4"),
        ("map_objects", 0x34A2, 292, "07b788fde21d3483c415db3a990aa07add48d372"),
        ("trainers2", 0x35C6, 64, "d7c2b5002d5ff2b6e5a18b5dcbe896936b8fbb48"),
        ("money", 0x3606, 22, "6972860b92ece05b8eb298087f8e333b611b9327"),
    ],
    "en": [
        ("list_menu", 0x2BE6, 952, "24602967989a090f807b4b3f8a2ff6cf4702acd5"),
        ("names", 0x2F9E, 211, "454284f6e5533a86ef5641a422e8201f60635601"),
        ("reload_tiles", 0x3071, 75, "e456b864695b1944eb9648825e78aaf45d319dec"),
        ("item", 0x30BC, 44, "1b04cc7f91939cba1aa3303ba0213035ae2017ee"),
        ("textbox", 0x30E8, 21, "d6a4455e7151b2edce0b2fda673ecb0a432ed441"),
        ("npc_movement", 0x30FD, 90, "151dc1cf7a03696fc097722128b8c90507aa5d87"),
        ("trainers", 0x3157, 747, "8c635b2f43a5c749532864aca4dcbb6fbdabcd28"),
        ("map_objects", 0x3442, 292, "00d16c8316e1bbf1bfa412116f46c14f42c41f66"),
        ("trainers2", 0x3566, 64, "939ef8489bc3981d6141988096a9d35747ddbedb"),
        ("money", 0x35A6, 22, "b91ea35738c59953b374d3c2bbae94e47d949b54"),
    ],
    "de": [
        ("list_menu", 0x2C00, 952, "80d590150cd1d545d51d2c80aad380a20988a7e8"),
        ("names", 0x2FB8, 211, "c37b78b8a1a5515f5db44345a32ec2cd05372c43"),
        ("reload_tiles", 0x308B, 75, "4602cd69e9995d9176779a3abb30e5e5cbdda643"),
        ("item", 0x30D6, 44, "10651b629ac4fc73c57187b405341505adb7f4c3"),
        ("textbox", 0x3102, 21, "b9e3d21edfa0d2d8fc7580326c05478f81044e1b"),
        ("npc_movement", 0x3117, 90, "eda13e1bf96d04a445e48d59af98b61bc9bb51dd"),
        ("trainers", 0x3171, 747, "6ff264b6fea7a8429bf29fd20a029d392bd48dab"),
        ("map_objects", 0x345C, 292, "1e8add37e48bdf65a339121e44087d2f8c1d3220"),
        ("trainers2", 0x3580, 64, "3560d383a913de2317e9bc23f8708aa1d752f2de"),
        ("money", 0x35C0, 22, "94ead8b58ea7654ab352db6cbfa294ee5fbe5eda"),
    ],
    "fr": [
        ("list_menu", 0x2BFC, 959, "ed54c069eae7cee297b0ca6820c5ce97bb1f8a05"),
        ("names", 0x2FBB, 211, "cb86fdd2b72d57568722b6aa80b2b76e8eb597c8"),
        ("reload_tiles", 0x308E, 75, "2623e2dc2b40ff4b12f8ccad75cf99183d55d1fe"),
        ("item", 0x30D9, 44, "177cd2bb779c8c3ea76d1e23be1e21662ff8d3b8"),
        ("textbox", 0x3105, 21, "1711aba62622c7dbb09b7ec1e1e24e4d7142a2bb"),
        ("npc_movement", 0x311A, 90, "7e53d87863a6cd04ca7db3b37e9101d1d930a19b"),
        ("trainers", 0x3174, 747, "1aa4cc0df871f3431afa729eb6c66c2e31860dcf"),
        ("map_objects", 0x345F, 292, "ce1be4dd95185df2b7d04e5f1c99efd8dfe9e3cd"),
        ("trainers2", 0x3583, 64, "8151ea488493d0619c2036bd9b0073202e88b283"),
        ("money", 0x35C3, 22, "c7e7212ace4b8f3dde945798c3972789d417ed82"),
    ],
    "it": [
        ("list_menu", 0x2C00, 950, "b6d6580eac1430e321ba8e599f09f1a650862ec2"),
        ("names", 0x2FB6, 211, "6de1fc32e8cea148e3ea8100640e46a9649ef46a"),
        ("reload_tiles", 0x3089, 75, "75dbe2786d5507951830e1b82e8f4d2b65f691a4"),
        ("item", 0x30D4, 44, "77f62ee3779984f56c1dfb3be80c100e24a9c4a0"),
        ("textbox", 0x3100, 21, "b80e5b58648adbb5d2bf93883c37164a3d8c570c"),
        ("npc_movement", 0x3115, 90, "ca775e1f10bd3eb6c2a57ac8a1a7bc6911fffb72"),
        ("trainers", 0x316F, 747, "6f4dccd243fde3cfaeec1a4bad68dd47518f6b4a"),
        ("map_objects", 0x345A, 292, "80945b2c5ca0c5b6d968089df81125cc3d2fba0f"),
        ("trainers2", 0x357E, 64, "393ca411fc399916990ab557cb47bf1f250c1c84"),
        ("money", 0x35BE, 22, "312c5a06f6d9ad72117d6d61b0043ad008846f2f"),
    ],
    "es": [
        ("list_menu", 0x2BFF, 958, "833c01878847ea68f82c6a7eab38b382b0af2d73"),
        ("names", 0x2FBD, 211, "5646bbca9854ba18f25d0c7c9edee498c02c88cf"),
        ("reload_tiles", 0x3090, 75, "548efa7ba8b85f4be360b3b866fc5c901a723976"),
        ("item", 0x30DB, 44, "6e4c308a7395257c0b81f0b55e82b31328870aad"),
        ("textbox", 0x3107, 21, "646eb533bcffcb913e10fe14bd073ad36eb26f66"),
        ("npc_movement", 0x311C, 90, "7f8c187df68a2e08d32248f12e4aa7c387e1354f"),
        ("trainers", 0x3176, 747, "3d6c64c7bf9474540bf9d9dc55c67bc867086fa9"),
        ("map_objects", 0x3461, 292, "d9636a5878e257db8d8e89268367c3bcdc9fd94a"),
        ("trainers2", 0x3585, 64, "f53d425ece245bf4ad5f48a4dd1c83a517e29fb6"),
        ("money", 0x35C5, 22, "a4e0ea605b31f4a2c3d7d3890811bb1f19f0c2f1"),
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
