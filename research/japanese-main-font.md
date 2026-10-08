# Japanese main font

The Japanese Blue retail ROM stores the main text font as 128 uncompressed 8×8 1bpp tiles. The exact 1024-byte sequence generated from `gfx/font/font_rg.png` at `SeafarersWind/pokeblue` commit `c40db538e00d76c32092b6e4a88c9c851d3c338f` occurs once in the verified retail ROM, at file offsets `0x11E99` through `0x12299` (bank 4 address `0x5E99`). The same source identifies this range as `FontGraphics` in `gfx/font.asm` and loads it as 1bpp data in `home/load_font.asm`.

The range SHA-256 is `11bfba65ad8f3b4a93f3c9b400afb611fb4072b26e2c40c77aab67bd08c9bf15`. This location is specific to the Japanese Blue layout and was established by exact unique-sequence matching rather than borrowing Red/Green offsets.

`graphics/font/main-font-jp.png` is a deterministic 4× nearest-neighbour rendering produced by the common `extract_gb_1bpp.py` tool. The repository stores the PNG and hashes, not the raw ROM range or a ROM image.
