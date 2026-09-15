#!/usr/bin/env python3
"""Extract BLUE player battle sprite batch 001 from the six source ROMs.

Outputs one deduplicated shared copy of each native compressed .pic, decoded .2bpp,
and a human-viewable PNG.  Every source ROM location is verified against the same
compressed bytes before the shared asset is written.
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
    "red_front": {
        "length": 266,
        "offsets": {"jp": 0x13361, "en": 0x12EDE, "de": 0x12EE1, "fr": 0x12EEC, "it": 0x12F00, "es": 0x12EFE},
        "pic_sha1": "8e32e365fe4c62a4720cf1f17c56a10de4a5b3fe",
        "bpp_sha1": "c82348a2cdf3cf9222517577a12841f40087e9c0",
    },
    "shrink1": {
        "length": 90,
        "offsets": {"jp": 0x1346B, "en": 0x12FE8, "de": 0x12FEB, "fr": 0x12FF6, "it": 0x1300A, "es": 0x13008},
        "pic_sha1": "e2deb333905175224546f22a32c99bcc65720117",
        "bpp_sha1": "d988b85c5789a4f30aaf38e33c6b72e984d8362a",
    },
    "shrink2": {
        "length": 50,
        "offsets": {"jp": 0x134C5, "en": 0x13042, "de": 0x13045, "fr": 0x13050, "it": 0x13064, "es": 0x13062},
        "pic_sha1": "c40653a6521b192629e9f0969c75a0b75a8ce677",
        "bpp_sha1": "971b9f3b6a636e6f2afeba20b6c09bfd4a94ebcc",
    },
    "red_back": {
        "length": 144,
        "offsets": {"jp": 0x33E0A, "en": 0x33E0A, "de": 0x33E0A, "fr": 0x33E0A, "it": 0x33E0A, "es": 0x33E0A},
        "pic_sha1": "d35990657befe967bfad412f7ae03e1b02336e47",
        "bpp_sha1": "a36c401f5d5004d7f42fee96bc9f438e0c7115e3",
    },
}

class BitReader:
    def __init__(self, data: bytes):
        self.data = data
        self.cur_bit = 7
        self.cur_byte = 0
    def bit(self) -> int:
        if self.cur_bit == -1:
            self.cur_byte += 1
            self.cur_bit = 7
        value = (self.data[self.cur_byte] >> self.cur_bit) & 1
        self.cur_bit -= 1
        return value
    def integer(self, count: int) -> int:
        n = 0
        for _ in range(count):
            n = (n << 1) | self.bit()
        return n

def transpose_tiles(data: bytearray, width: int) -> None:
    size = width * width
    for i in range(size):
        j = (i * width + i // width) % size
        if i < j:
            p, q = i * 16, j * 16
            tmp = data[p:p+16]
            data[p:p+16] = data[q:q+16]
            data[q:q+16] = tmp

def fill_plane(br: BitReader, width: int) -> bytearray:
    table = [0x0001,0x0003,0x0007,0x000F,0x001F,0x003F,0x007F,0x00FF,
             0x01FF,0x03FF,0x07FF,0x0FFF,0x1FFF,0x3FFF,0x7FFF,0xFFFF]
    mode = br.bit()
    size = width * width * 0x20
    plane = bytearray(size)
    length = 0
    while length < size:
        if mode:
            while length < size:
                bit_group = br.integer(2)
                if bit_group == 0:
                    break
                plane[length] = bit_group
                length += 1
        else:
            w = 0
            while br.bit():
                w += 1
            if w >= len(table):
                raise ValueError("invalid compressed data")
            n = table[w] + br.integer(w + 1)
            while length < size and n:
                plane[length] = 0
                length += 1
                n -= 1
        mode ^= 1
    ram = bytearray(size)
    length = 0
    for y in range(width):
        for x in range(width * 8):
            for i in range(4):
                ram[length] = plane[(y * 4 + i) * width * 8 + x]
                length += 1
    for i in range(0, size - 3, 4):
        ram[i // 4] = (ram[i] << 6) | (ram[i+1] << 4) | (ram[i+2] << 2) | ram[i+3]
    return ram[: width * width * 8]

def uncompress_plane(plane: bytearray, width: int) -> None:
    codes = [
        [0x0,0x1,0x3,0x2,0x7,0x6,0x4,0x5,0xF,0xE,0xC,0xD,0x8,0x9,0xB,0xA],
        [0xF,0xE,0xC,0xD,0x8,0x9,0xB,0xA,0x0,0x1,0x3,0x2,0x7,0x6,0x4,0x5],
    ]
    for x in range(width * 8):
        bit = 0
        for y in range(width):
            i = y * width * 8 + x
            hi = codes[bit][(plane[i] >> 4) & 0xF]
            bit = hi & 1
            lo = codes[bit][plane[i] & 0xF]
            bit = lo & 1
            plane[i] = (hi << 4) | lo

def uncompress_pic(data: bytes) -> tuple[bytes, int]:
    br = BitReader(data)
    width = br.integer(4)
    if br.integer(4) != width:
        raise ValueError("image is not square")
    size = width * width * 8
    rams = [None, None]
    order = br.bit()
    rams[order] = fill_plane(br, width)
    mode = br.bit()
    if mode:
        mode += br.bit()
    rams[order ^ 1] = fill_plane(br, width)
    uncompress_plane(rams[order], width)
    if mode != 1:
        uncompress_plane(rams[order ^ 1], width)
    if mode != 0:
        for i in range(size):
            rams[order ^ 1][i] ^= rams[order][i]
    out = bytearray(size * 2)
    for i in range(size):
        out[i*2] = rams[0][i]
        out[i*2+1] = rams[1][i]
    transpose_tiles(out, width)
    return bytes(out), width

def bpp_to_pixels(data: bytes, width_tiles: int) -> list[int]:
    w = width_tiles * 8
    pixels = [255] * (w * w)
    tiles = width_tiles * width_tiles
    assert len(data) == tiles * 16
    for t in range(tiles):
        tx, ty = t % width_tiles, t // width_tiles
        base = t * 16
        for y in range(8):
            lo, hi = data[base + y*2], data[base + y*2 + 1]
            for x in range(8):
                bit = 7 - x
                idx = ((hi >> bit) & 1) * 2 + ((lo >> bit) & 1)
                pixels[(ty*8+y)*w + tx*8+x] = 255 - idx * 85
    return pixels

def png_chunk(kind: bytes, payload: bytes) -> bytes:
    return struct.pack(">I", len(payload)) + kind + payload + struct.pack(">I", zlib.crc32(kind + payload) & 0xffffffff)

def write_gray_png(path: Path, pixels: list[int], width: int) -> None:
    rows = bytearray()
    for y in range(width):
        rows.append(0)
        rows.extend(pixels[y*width:(y+1)*width])
    png = b"\x89PNG\r\n\x1a\n"
    png += png_chunk(b"IHDR", struct.pack(">IIBBBBB", width, width, 8, 0, 0, 0, 0))
    png += png_chunk(b"IDAT", zlib.compress(bytes(rows), 9))
    png += png_chunk(b"IEND", b"")
    path.write_bytes(png)

def sha1(data: bytes) -> str:
    return hashlib.sha1(data).hexdigest()

def bank_addr(offset: int) -> tuple[int, int]:
    bank = offset // 0x4000
    addr = offset if bank == 0 else 0x4000 + (offset % 0x4000)
    return bank, addr

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
    report = {"deduplication": "one shared asset; all six releases map to it", "assets": {}}
    for name, spec in ASSETS.items():
        chunks = {}
        locations = {}
        for region, rom in roms.items():
            off = spec["offsets"][region]
            chunk = rom[off:off+spec["length"]]
            chunks[region] = chunk
            bank, addr = bank_addr(off)
            locations[region] = {"offset": f"0x{off:05X}", "bank": f"0x{bank:02X}", "address": f"0x{addr:04X}"}
        unique = {bytes(v) for v in chunks.values()}
        if len(unique) != 1:
            raise SystemExit(f"{name}: release data are not byte-identical")
        pic = next(iter(unique))
        if sha1(pic) != spec["pic_sha1"]:
            raise SystemExit(f"{name}: compressed SHA-1 mismatch")
        bpp, width_tiles = uncompress_pic(pic)
        if sha1(bpp) != spec["bpp_sha1"]:
            raise SystemExit(f"{name}: decoded SHA-1 mismatch")
        (args.out / f"{name}.pic").write_bytes(pic)
        (args.out / f"{name}.2bpp").write_bytes(bpp)
        write_gray_png(args.out / f"{name}.png", bpp_to_pixels(bpp, width_tiles), width_tiles * 8)
        report["assets"][name] = {
            "dimensions": f"{width_tiles*8}x{width_tiles*8}",
            "compressed_bytes": len(pic),
            "decoded_2bpp_bytes": len(bpp),
            "pic_sha1": sha1(pic),
            "bpp_sha1": sha1(bpp),
            "locations": locations,
        }
    (args.out / "manifest.json").write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")

if __name__ == "__main__":
    main()
