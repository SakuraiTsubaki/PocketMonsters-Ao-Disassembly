#!/usr/bin/env python3
"""Extract BLUE NPC overworld sprite batch 006 from the six source ROMs.

Outputs one deduplicated shared 2bpp + PNG pair for Middle Aged Man, Gambler,
Super Nerd, Girl, and Hiker. All six source ROMs are SHA-1 checked and every
mapped byte range must be identical before any shared asset is written.
ROM binaries are input-only and are never emitted.
"""
from __future__ import annotations
import argparse, hashlib, json, struct, zlib
from pathlib import Path

ROM_SHA1 = {
    "jp": "0da501e3e5c51ab8fef55b092dcdd7e6b050e424",
    "en": "d7037c83e1ae5b39bde3c30787637ba1d4c48ce2",
    "de": "20e72dc6f41493eee1fdd0cef54214e6c3389688",
    "fr": "47faa910d0e073c600665bf9c83b6bd17babdf8a",
    "it": "f69ed1a1332f04c24c7db899a09019bb045fa8b3",
    "es": "7715e7b133e8634df48918b9138374110212a108",
}

ASSETS = {
    "middle_aged_man": {
        "width": 16, "height": 96, "length": 384,
        "offsets": {r: 0x14F00 for r in ROM_SHA1},
        "bpp_sha1": "b4b80a88e00ce117777f8f20ce81c50b3fa42b33",
    },
    "gambler": {
        "width": 16, "height": 96, "length": 384,
        "offsets": {r: 0x15080 for r in ROM_SHA1},
        "bpp_sha1": "4f3598495adee416c653bd00f63150b537a4919e",
    },
    "super_nerd": {
        "width": 16, "height": 96, "length": 384,
        "offsets": {r: 0x15200 for r in ROM_SHA1},
        "bpp_sha1": "c94ee3f3372cd23296b1170f84a8017e616dc685",
    },
    "girl": {
        "width": 16, "height": 96, "length": 384,
        "offsets": {r: 0x15380 for r in ROM_SHA1},
        "bpp_sha1": "2ad7e166678774fd2b28c383b3f28828de0709d8",
    },
    "hiker": {
        "width": 16, "height": 96, "length": 384,
        "offsets": {r: 0x15500 for r in ROM_SHA1},
        "bpp_sha1": "171d0a5b76f5be8189cf75b05a68b76418279d94",
    },
}

def sha1(data: bytes) -> str:
    return hashlib.sha1(data).hexdigest()

def bank_addr(offset: int) -> tuple[int, int]:
    bank = offset // 0x4000
    addr = offset if bank == 0 else 0x4000 + (offset % 0x4000)
    return bank, addr

def bpp_to_pixels(data: bytes, width: int, height: int) -> list[int]:
    wt, ht = width // 8, height // 8
    if len(data) != wt * ht * 16:
        raise ValueError("2bpp length does not match dimensions")
    pixels = [255] * (width * height)
    tile = 0
    for ty in range(ht):
        for tx in range(wt):
            base = tile * 16
            for y in range(8):
                lo, hi = data[base + y * 2], data[base + y * 2 + 1]
                for x in range(8):
                    bit = 7 - x
                    idx = (((hi >> bit) & 1) << 1) | ((lo >> bit) & 1)
                    pixels[(ty * 8 + y) * width + tx * 8 + x] = 255 - idx * 85
            tile += 1
    return pixels

def png_chunk(kind: bytes, payload: bytes) -> bytes:
    return struct.pack(">I", len(payload)) + kind + payload + struct.pack(
        ">I", zlib.crc32(kind + payload) & 0xffffffff
    )

def write_gray_png(path: Path, pixels: list[int], width: int, height: int) -> None:
    rows = bytearray()
    for y in range(height):
        rows.append(0)
        rows.extend(pixels[y * width:(y + 1) * width])
    png = b"\x89PNG\r\n\x1a\n"
    png += png_chunk(b"IHDR", struct.pack(">IIBBBBB", width, height, 8, 0, 0, 0, 0))
    png += png_chunk(b"IDAT", zlib.compress(bytes(rows), 9))
    png += png_chunk(b"IEND", b"")
    path.write_bytes(png)

def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("--rom", action="append", nargs=2, metavar=("REGION", "PATH"), required=True)
    ap.add_argument("--out", type=Path, required=True)
    args = ap.parse_args()

    roms = {}
    for region, filename in args.rom:
        data = Path(filename).read_bytes()
        digest = sha1(data)
        if region not in ROM_SHA1 or digest != ROM_SHA1[region]:
            raise SystemExit(f"{region}: unexpected ROM SHA-1 {digest}")
        roms[region] = data
    if set(roms) != set(ROM_SHA1):
        raise SystemExit(f"need regions {sorted(ROM_SHA1)}")

    args.out.mkdir(parents=True, exist_ok=True)
    report = {
        "batch": "006",
        "category": "NPC overworld graphics",
        "storage": "native uncompressed 2bpp",
        "deduplication": "one shared asset; all six releases map to it",
        "assets": {},
    }

    for name, spec in ASSETS.items():
        chunks, locations = {}, {}
        for region, rom in roms.items():
            off = spec["offsets"][region]
            bpp = rom[off:off + spec["length"]]
            chunks[region] = bpp
            bank, addr = bank_addr(off)
            locations[region] = {
                "offset": f"0x{off:05X}",
                "bank": f"0x{bank:02X}",
                "address": f"0x{addr:04X}",
            }
        unique = {bytes(v) for v in chunks.values()}
        if len(unique) != 1:
            raise SystemExit(f"{name}: release data are not byte-identical")
        bpp = next(iter(unique))
        if sha1(bpp) != spec["bpp_sha1"]:
            raise SystemExit(f"{name}: 2bpp SHA-1 mismatch")
        (args.out / f"{name}.2bpp").write_bytes(bpp)
        write_gray_png(
            args.out / f"{name}.png",
            bpp_to_pixels(bpp, spec["width"], spec["height"]),
            spec["width"], spec["height"],
        )
        report["assets"][name] = {
            "dimensions": f"{spec['width']}x{spec['height']}",
            "bytes": len(bpp),
            "bpp_sha1": sha1(bpp),
            "locations": locations,
        }

    (args.out / "manifest.json").write_text(
        json.dumps(report, ensure_ascii=False, indent=2) + "\n", encoding="utf-8"
    )

if __name__ == "__main__":
    main()
