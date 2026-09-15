#!/usr/bin/env python3
"""Extract BLUE sprite batch 005 from all six source ROMs.

Verifies ROM SHA-1 values, checks that each selected 384-byte 2bpp sprite is
byte-identical across releases, writes one deduplicated shared .2bpp + PNG,
and emits a manifest with source locations and hashes.
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
    "monster":       {"offset": 0x14780, "length": 384, "sha1": "053ce7f68ebd63589b89be5f17fff7604ed014c5"},
    "cooltrainer_f": {"offset": 0x14900, "length": 384, "sha1": "df58b9b8206c2576d627c76369e10cea75649306"},
    "cooltrainer_m": {"offset": 0x14A80, "length": 384, "sha1": "edcc5c8da17c937c0d08ebf8b37cd9a01b746155"},
    "little_girl":   {"offset": 0x14C00, "length": 384, "sha1": "188efd0702177782f7e2d67755a051386b69309e"},
    "bird":          {"offset": 0x14D80, "length": 384, "sha1": "9113f568663ddc829723072d3c31f2cb62db75bc"},
}

def sha1(data: bytes) -> str:
    return hashlib.sha1(data).hexdigest()

def bank_addr(offset: int) -> tuple[int, int]:
    bank = offset // 0x4000
    return bank, (offset if bank == 0 else 0x4000 + offset % 0x4000)

def bpp_pixels(data: bytes, width_tiles: int = 2) -> tuple[list[int], int, int]:
    tiles = len(data) // 16
    height_tiles = tiles // width_tiles
    w, h = width_tiles * 8, height_tiles * 8
    pixels = [255] * (w * h)
    for t in range(tiles):
        tx, ty = t % width_tiles, t // width_tiles
        base = t * 16
        for y in range(8):
            lo, hi = data[base + y * 2], data[base + y * 2 + 1]
            for x in range(8):
                bit = 7 - x
                idx = (((hi >> bit) & 1) << 1) | ((lo >> bit) & 1)
                pixels[(ty * 8 + y) * w + tx * 8 + x] = 255 - idx * 85
    return pixels, w, h

def chunk(kind: bytes, payload: bytes) -> bytes:
    return struct.pack(">I", len(payload)) + kind + payload + struct.pack(">I", zlib.crc32(kind + payload) & 0xffffffff)

def write_png(path: Path, pixels: list[int], w: int, h: int) -> None:
    raw = bytearray()
    for y in range(h):
        raw.append(0)
        raw.extend(pixels[y*w:(y+1)*w])
    png = b"\x89PNG\r\n\x1a\n"
    png += chunk(b"IHDR", struct.pack(">IIBBBBB", w, h, 8, 0, 0, 0, 0))
    png += chunk(b"IDAT", zlib.compress(bytes(raw), 9))
    png += chunk(b"IEND", b"")
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
        if ROM_SHA1.get(region) != digest:
            raise SystemExit(f"{region}: unexpected ROM SHA-1 {digest}")
        roms[region] = data
    if set(roms) != set(ROM_SHA1):
        raise SystemExit(f"need regions {sorted(ROM_SHA1)}")

    args.out.mkdir(parents=True, exist_ok=True)
    report = {
        "batch": "005",
        "category": "NPC overworld graphics",
        "storage": "native uncompressed 2bpp",
        "deduplication": "one shared asset; all six releases map to it",
        "assets": {},
    }
    for name, spec in ASSETS.items():
        chunks = {region: rom[spec["offset"]:spec["offset"] + spec["length"]] for region, rom in roms.items()}
        unique = {bytes(v) for v in chunks.values()}
        if len(unique) != 1:
            raise SystemExit(f"{name}: release data are not byte-identical")
        data = next(iter(unique))
        if sha1(data) != spec["sha1"]:
            raise SystemExit(f"{name}: SHA-1 mismatch")
        (args.out / f"{name}.2bpp").write_bytes(data)
        pixels, w, h = bpp_pixels(data)
        write_png(args.out / f"{name}.png", pixels, w, h)
        bank, addr = bank_addr(spec["offset"])
        report["assets"][name] = {
            "dimensions": f"{w}x{h}",
            "bytes": len(data),
            "bpp_sha1": sha1(data),
            "locations": {
                region: {
                    "offset": f"0x{spec['offset']:05X}",
                    "bank": f"0x{bank:02X}",
                    "address": f"0x{addr:04X}",
                } for region in ROM_SHA1
            },
        }
    (args.out / "manifest_batch005.json").write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")

if __name__ == "__main__":
    main()
