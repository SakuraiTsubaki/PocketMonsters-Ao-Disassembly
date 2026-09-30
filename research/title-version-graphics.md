# Title version graphics

The verified Japanese origin and English releases contain the same eight-tile `Blue Version` graphic at ROM offset `0x6802f`. German `Blaue Edition`, French `Version Bleue`, Spanish `Edición Azul`, and Italian `Versione Blu` use localized pixel data at the same offset. German, French, and Italian occupy ten tiles; Japanese, English, and Spanish occupy eight.

The symbols and layouts are anchored to `Version_GFX` and `gfx/title/blue_version.1bpp` in `pret/pokered` plus the German, French, and Spanish disassemblies maintained by `einstein95`. The Italian range is supported by the shared bank-relative location and decoded `VERSIONE BLU` result.

All committed PNGs were deterministically rendered from ROMs whose full SHA-256 identity is recorded in `manifests/title-version-graphics.json`. Reports contain offsets and hashes, not ROM bytes.
