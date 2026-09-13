#!/usr/bin/env python3
"""Generate reproducible identification and bank-hash manifests for Ao/Blue source ROMs.

ROM binaries are read locally and are never written into the repository.
"""
from __future__ import annotations

import argparse
import csv
import hashlib
import json
from pathlib import Path

BANK_SIZE = 0x4000

CART_TYPES = {
    0x00: "ROM ONLY",
    0x01: "MBC1",
    0x02: "MBC1+RAM",
    0x03: "MBC1+RAM+BATTERY",
    0x05: "MBC2",
    0x06: "MBC2+BATTERY",
    0x08: "ROM+RAM",
    0x09: "ROM+RAM+BATTERY",
    0x0F: "MBC3+TIMER+BATTERY",
    0x10: "MBC3+TIMER+RAM+BATTERY",
    0x11: "MBC3",
    0x12: "MBC3+RAM",
    0x13: "MBC3+RAM+BATTERY",
    0x19: "MBC5",
    0x1A: "MBC5+RAM",
    0x1B: "MBC5+RAM+BATTERY",
}

ROM_SIZE_BYTES = {
    0x00: 32 * 1024,
    0x01: 64 * 1024,
    0x02: 128 * 1024,
    0x03: 256 * 1024,
    0x04: 512 * 1024,
    0x05: 1024 * 1024,
    0x06: 2 * 1024 * 1024,
    0x07: 4 * 1024 * 1024,
    0x08: 8 * 1024 * 1024,
}

RAM_SIZE_BYTES = {0x00: 0, 0x01: 2 * 1024, 0x02: 8 * 1024, 0x03: 32 * 1024, 0x04: 128 * 1024, 0x05: 64 * 1024}


def sha1(data: bytes) -> str:
    return hashlib.sha1(data).hexdigest()


def sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def analyze(path: Path) -> tuple[dict, list[dict]]:
    data = path.read_bytes()
    if len(data) % BANK_SIZE:
        raise ValueError(f"{path}: size is not a multiple of 16 KiB")

    cgb_flag = data[0x143]
    title_end = 0x143 if cgb_flag in (0x80, 0xC0) else 0x144
    title = data[0x134:title_end].split(b"\0", 1)[0].decode("ascii", "replace")

    header_sum = 0
    for value in data[0x134:0x14D]:
        header_sum = (header_sum - value - 1) & 0xFF

    stored_global = (data[0x14E] << 8) | data[0x14F]
    computed_global = (sum(data[:0x14E]) + sum(data[0x150:])) & 0xFFFF

    manifest = {
        "file": path.name,
        "size_bytes": len(data),
        "bank_count": len(data) // BANK_SIZE,
        "sha1": sha1(data),
        "sha256": sha256(data),
        "title": title,
        "cgb_flag": f"0x{cgb_flag:02X}",
        "sgb_flag": f"0x{data[0x146]:02X}",
        "cartridge_type_code": f"0x{data[0x147]:02X}",
        "cartridge_type": CART_TYPES.get(data[0x147], "UNKNOWN"),
        "rom_size_code": f"0x{data[0x148]:02X}",
        "declared_rom_size_bytes": ROM_SIZE_BYTES.get(data[0x148]),
        "ram_size_code": f"0x{data[0x149]:02X}",
        "declared_ram_size_bytes": RAM_SIZE_BYTES.get(data[0x149]),
        "destination_code": f"0x{data[0x14A]:02X}",
        "old_licensee_code": f"0x{data[0x14B]:02X}",
        "version": data[0x14C],
        "header_checksum_stored": f"0x{data[0x14D]:02X}",
        "header_checksum_computed": f"0x{header_sum:02X}",
        "header_checksum_ok": header_sum == data[0x14D],
        "global_checksum_stored": f"0x{stored_global:04X}",
        "global_checksum_computed": f"0x{computed_global:04X}",
        "global_checksum_ok": computed_global == stored_global,
    }

    banks = []
    for index in range(len(data) // BANK_SIZE):
        chunk = data[index * BANK_SIZE : (index + 1) * BANK_SIZE]
        banks.append(
            {
                "file": path.name,
                "bank": f"{index:02X}",
                "offset_start": f"0x{index * BANK_SIZE:06X}",
                "offset_end": f"0x{(index + 1) * BANK_SIZE - 1:06X}",
                "sha1": sha1(chunk),
                "sha256": sha256(chunk),
            }
        )
    return manifest, banks


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("roms", nargs="+", type=Path)
    parser.add_argument("--out", type=Path, default=Path("build/source-manifest"))
    args = parser.parse_args()

    manifests = []
    banks = []
    for rom in args.roms:
        manifest, bank_rows = analyze(rom)
        manifests.append(manifest)
        banks.extend(bank_rows)

    args.out.mkdir(parents=True, exist_ok=True)
    (args.out / "rom_manifest.json").write_text(json.dumps(manifests, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")
    with (args.out / "bank_hashes.csv").open("w", newline="", encoding="utf-8") as handle:
        writer = csv.DictWriter(handle, fieldnames=["file", "bank", "offset_start", "offset_end", "sha1", "sha256"])
        writer.writeheader()
        writer.writerows(banks)

    for item in manifests:
        print(f"{item['file']}: {item['bank_count']} banks, SHA-1 {item['sha1']}")


if __name__ == "__main__":
    main()
