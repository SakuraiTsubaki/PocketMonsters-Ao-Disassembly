; Bank 00 vectors and cartridge entry point.
; The Nintendo logo/header fields at $0104-$014f will eventually be finalized by rgbfix.

SECTION "RST 00", ROM0[$0000]
    rst $38
    ds $0008 - @, 0

SECTION "RST 08", ROM0[$0008]
    rst $38
    ds $0010 - @, 0

SECTION "RST 10", ROM0[$0010]
    rst $38
    ds $0018 - @, 0

SECTION "RST 18", ROM0[$0018]
    rst $38
    ds $0020 - @, 0

SECTION "RST 20", ROM0[$0020]
    rst $38
    ds $0028 - @, 0

SECTION "RST 28", ROM0[$0028]
    rst $38
    ds $0030 - @, 0

SECTION "RST 30", ROM0[$0030]
    rst $38
    ds $0038 - @, 0

SECTION "RST 38", ROM0[$0038]
IF DEF(_JP)
    jp $f080
ELSE
    rst $38
ENDC
    ds $0040 - @, 0

SECTION "VBlank vector", ROM0[$0040]
IF DEF(_JP)
    jp $200a
ELIF DEF(_FR)
    jp $2020
ELIF DEF(_ES)
    jp $2023
ELSE
    jp $2024
ENDC
    ds $0048 - @, 0

SECTION "LCD vector", ROM0[$0048]
    rst $38
    ds $0050 - @, 0

SECTION "Timer vector", ROM0[$0050]
IF DEF(_JP)
    jp $22e6
ELIF DEF(_FR)
    jp $2302
ELIF DEF(_ES)
    jp $2305
ELSE
    jp $2306
ENDC
    ds $0058 - @, 0

SECTION "Serial vector", ROM0[$0058]
IF DEF(_JP)
    jp $2105
ELIF DEF(_FR)
    jp $2121
ELIF DEF(_ES)
    jp $2124
ELSE
    jp $2125
ENDC
    ds $0060 - @, 0

SECTION "Joypad vector", ROM0[$0060]
    reti

SECTION "Cartridge entry", ROM0[$0100]
Start::
    nop
    jp $0150
    ds $0150 - @, 0
