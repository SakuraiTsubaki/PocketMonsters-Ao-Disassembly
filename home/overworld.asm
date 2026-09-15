; Pocket Monsters Ao / Pokemon Blue ROM0 overworld reconstruction — stage 1.
; Range: HandleMidJump through the instruction immediately before NewBattle.
; This source was reconstructed from the six project ROMs.
; The instruction/opcode skeleton is identical across JP/EN/DE/FR/IT/ES;
; only selected 16-bit operands differ. Transitional OVR_S1_* constants preserve
; those per-release operands until they are replaced by symbolic labels.

MACRO OVR_S1_DEFV16
IF DEF(_JP)
    DEF \1 EQU \2
ELIF DEF(_EN)
    DEF \1 EQU \3
ELIF DEF(_DE)
    DEF \1 EQU \4
ELIF DEF(_FR)
    DEF \1 EQU \5
ELIF DEF(_IT)
    DEF \1 EQU \6
ELIF DEF(_ES)
    DEF \1 EQU \7
ELSE
    FAIL "Define exactly one of _JP, _EN, _DE, _FR, _IT, or _ES"
ENDC
ENDM

OVR_S1_DEFV16 OVR_S1_0002, $4ddb, $487e, $487a, $487f, $487c, $487f
OVR_S1_DEFV16 OVR_S1_0005, $3636, $35d6, $35f0, $35f3, $35ee, $35f5
OVR_S1_DEFV16 OVR_S1_000A, $cd66, $cd6b, $cd6b, $cd6b, $cd6b, $cd6b
OVR_S1_DEFV16 OVR_S1_000D, $11fa, $1241, $1241, $1241, $1241, $1241
OVR_S1_DEFV16 OVR_S1_0012, $436d, $4335, $4335, $4335, $4335, $4335
OVR_S1_DEFV16 OVR_S1_0015, $3636, $35d6, $35f0, $35f3, $35ee, $35f5
OVR_S1_DEFV16 OVR_S1_0018, $d6ab, $d72c, $d731, $d731, $d731, $d731
OVR_S1_DEFV16 OVR_S1_0021, $d101, $d13c, $d141, $d141, $d141, $d141
OVR_S1_DEFV16 OVR_S1_0024, $d6ad, $d72e, $d733, $d733, $d733, $d733
OVR_S1_DEFV16 OVR_S1_002B, $12a0, $12e7, $12e7, $12e7, $12e7, $12e7
OVR_S1_DEFV16 OVR_S1_002E, $08d8, $091f, $091f, $091f, $091f, $091f
OVR_S1_DEFV16 OVR_S1_0031, $d6b1, $d732, $d737, $d737, $d737, $d737
OVR_S1_DEFV16 OVR_S1_003D, $4a52, $4510, $450c, $4511, $450e, $4511
OVR_S1_DEFV16 OVR_S1_0040, $3636, $35d6, $35f0, $35f3, $35ee, $35f5
OVR_S1_DEFV16 OVR_S1_0043, $2409, $2429, $2429, $2425, $2429, $2428
OVR_S1_DEFV16 OVR_S1_0048, $43c3, $438b, $438b, $438b, $438b, $438b
OVR_S1_DEFV16 OVR_S1_004B, $3636, $35d6, $35f0, $35f3, $35ee, $35f5
OVR_S1_DEFV16 OVR_S1_004E, $d6ac, $d72d, $d732, $d732, $d732, $d732
OVR_S1_DEFV16 OVR_S1_0053, $2409, $2429, $2429, $2425, $2429, $2428
OVR_S1_DEFV16 OVR_S1_0056, $d0eb, $d126, $d12b, $d12b, $d12b, $d12b
OVR_S1_DEFV16 OVR_S1_005E, $cd66, $cd6b, $cd6b, $cd6b, $cd6b, $cd6b
OVR_S1_DEFV16 OVR_S1_0061, $208f, $20af, $20af, $20ab, $20af, $20ae
OVR_S1_DEFV16 OVR_S1_0064, $208f, $20af, $20af, $20ab, $20af, $20ae
OVR_S1_DEFV16 OVR_S1_0067, $209a, $20ba, $20ba, $20b6, $20ba, $20b9
OVR_S1_DEFV16 OVR_S1_006A, $d6b5, $d736, $d73b, $d73b, $d73b, $d73b
OVR_S1_DEFV16 OVR_S1_0072, $cfac, $cfc5, $cfca, $cfca, $cfca, $cfca
OVR_S1_DEFV16 OVR_S1_0079, $0f06, $0f4d, $0f4d, $0f4d, $0f4d, $0f4d
OVR_S1_DEFV16 OVR_S1_007E, $7a35, $6988, $6988, $698b, $6989, $6989
OVR_S1_DEFV16 OVR_S1_0081, $3636, $35d6, $35f0, $35f3, $35ee, $35f5
OVR_S1_DEFV16 OVR_S1_0084, $d982, $da46, $da4b, $da4b, $da4b, $da4b
OVR_S1_DEFV16 OVR_S1_0088, $06f5, $073c, $073c, $073c, $073c, $073c
OVR_S1_DEFV16 OVR_S1_008B, $d6ac, $d72d, $d732, $d732, $d732, $d732
OVR_S1_DEFV16 OVR_S1_0092, $06f5, $073c, $073c, $073c, $073c, $073c
OVR_S1_DEFV16 OVR_S1_0095, $d6b1, $d732, $d737, $d737, $d737, $d737
OVR_S1_DEFV16 OVR_S1_009A, $091e, $0965, $0965, $0965, $0965, $0965
OVR_S1_DEFV16 OVR_S1_009D, $d036, $d059, $d05e, $d05e, $d05e, $d05e
OVR_S1_DEFV16 OVR_S1_00A4, $d6af, $d730, $d735, $d735, $d735, $d735
OVR_S1_DEFV16 OVR_S1_00C0, $d6af, $d730, $d735, $d735, $d735, $d735
OVR_S1_DEFV16 OVR_S1_00C8, $315b, $30fd, $3117, $311a, $3115, $311c
OVR_S1_DEFV16 OVR_S1_00CD, $3ef9, $3eb5, $3ecf, $3ed2, $3ecd, $3ed4
OVR_S1_DEFV16 OVR_S1_00D6, $0adc, $0b23, $0b23, $0b23, $0b23, $0b23
OVR_S1_DEFV16 OVR_S1_00E1, $3eb1, $3e6d, $3e87, $3e8a, $3e85, $3e8c
OVR_S1_DEFV16 OVR_S1_00E4, $2409, $2429, $2429, $2425, $2429, $2428
OVR_S1_DEFV16 OVR_S1_00E7, $cd5b, $cd60, $cd60, $cd60, $cd60, $cd60
OVR_S1_DEFV16 OVR_S1_00F5, $cf09, $cf0e, $cf13, $cf13, $cf13, $cf13
OVR_S1_DEFV16 OVR_S1_00F8, $293e, $2920, $2920, $291c, $2920, $291f
OVR_S1_DEFV16 OVR_S1_010B, $3eb1, $3e6d, $3e87, $3e8a, $3e85, $3e8c
OVR_S1_DEFV16 OVR_S1_010E, $d2dd, $d35e, $d363, $d363, $d363, $d363
OVR_S1_DEFV16 OVR_S1_0111, $d699, $d71a, $d71f, $d71f, $d71f, $d71f
OVR_S1_DEFV16 OVR_S1_0114, $6373, $62ce, $62f5, $6369, $632c, $632d
OVR_S1_DEFV16 OVR_S1_0117, $d2dd, $d35e, $d363, $d363, $d363, $d363
OVR_S1_DEFV16 OVR_S1_011A, $1275, $12bc, $12bc, $12bc, $12bc, $12bc
OVR_S1_DEFV16 OVR_S1_011D, $d2e6, $d367, $d36c, $d36c, $d36c, $d36c
OVR_S1_DEFV16 OVR_S1_0125, $d036, $d059, $d05e, $d05e, $d05e, $d05e
OVR_S1_DEFV16 OVR_S1_012F, $cd5b, $cd60, $cd60, $cd60, $cd60, $cd60
OVR_S1_DEFV16 OVR_S1_0134, $2409, $2429, $2429, $2425, $2429, $2428
OVR_S1_DEFV16 OVR_S1_013C, $d4a7, $d528, $d52d, $d52d, $d52d, $d52d
OVR_S1_DEFV16 OVR_S1_0143, $d4a8, $d529, $d52e, $d52e, $d52e, $d52e
OVR_S1_DEFV16 OVR_S1_0147, $d4a7, $d528, $d52d, $d52d, $d52d, $d52d
OVR_S1_DEFV16 OVR_S1_017F, $d4a9, $d52a, $d52f, $d52f, $d52f, $d52f
OVR_S1_DEFV16 OVR_S1_0182, $d6af, $d730, $d735, $d735, $d735, $d735
OVR_S1_DEFV16 OVR_S1_018F, $d4a9, $d52a, $d52f, $d52f, $d52f, $d52f
OVR_S1_DEFV16 OVR_S1_0193, $d4a8, $d529, $d52e, $d52e, $d52e, $d52e
OVR_S1_DEFV16 OVR_S1_01A2, $d4a7, $d528, $d52d, $d52d, $d52d, $d52d
OVR_S1_DEFV16 OVR_S1_01AD, $d4a7, $d528, $d52d, $d52d, $d52d, $d52d
OVR_S1_DEFV16 OVR_S1_01B8, $d4a7, $d528, $d52d, $d52d, $d52d, $d52d
OVR_S1_DEFV16 OVR_S1_01C3, $d4a7, $d528, $d52d, $d52d, $d52d, $d52d
OVR_S1_DEFV16 OVR_S1_01C6, $cd5b, $cd60, $cd60, $cd60, $cd60, $cd60
OVR_S1_DEFV16 OVR_S1_01D1, $d4a9, $d52a, $d52f, $d52f, $d52f, $d52f
OVR_S1_DEFV16 OVR_S1_01D4, $d4a7, $d528, $d52d, $d52d, $d52d, $d52d
OVR_S1_DEFV16 OVR_S1_01D7, $063c, $0683, $0683, $0683, $0683, $0683
OVR_S1_DEFV16 OVR_S1_01E0, $d4a9, $d52a, $d52f, $d52f, $d52f, $d52f
OVR_S1_DEFV16 OVR_S1_01E3, $d4a7, $d528, $d52d, $d52d, $d52d, $d52d
OVR_S1_DEFV16 OVR_S1_01E6, $2409, $2429, $2429, $2425, $2429, $2428
OVR_S1_DEFV16 OVR_S1_01E9, $d67f, $d700, $d705, $d705, $d705, $d705
OVR_S1_DEFV16 OVR_S1_01F0, $0b8a, $0bd1, $0bd1, $0bd1, $0bd1, $0bd1
OVR_S1_DEFV16 OVR_S1_01F6, $d6b5, $d736, $d73b, $d73b, $d73b, $d73b
OVR_S1_DEFV16 OVR_S1_0200, $08a2, $08e9, $08e9, $08e9, $08e9, $08e9
OVR_S1_DEFV16 OVR_S1_0204, $06bf, $0706, $0706, $0706, $0706, $0706
OVR_S1_DEFV16 OVR_S1_020A, $0f70, $0fb7, $0fb7, $0fb7, $0fb7, $0fb7
OVR_S1_DEFV16 OVR_S1_0212, $cfac, $cfc5, $cfca, $cfca, $cfca, $cfca
OVR_S1_DEFV16 OVR_S1_0217, $d6b5, $d736, $d73b, $d73b, $d73b, $d73b
OVR_S1_DEFV16 OVR_S1_0220, $57b0, $4fd7, $4fd7, $4fd7, $4fd7, $4fd7
OVR_S1_DEFV16 OVR_S1_0223, $3636, $35d6, $35f0, $35f3, $35ee, $35f5
OVR_S1_DEFV16 OVR_S1_0226, $2409, $2429, $2429, $2425, $2429, $2428
OVR_S1_DEFV16 OVR_S1_0229, $cd5b, $cd60, $cd60, $cd60, $cd60, $cd60
OVR_S1_DEFV16 OVR_S1_022E, $d67f, $d700, $d705, $d705, $d705, $d705
OVR_S1_DEFV16 OVR_S1_0234, $d6b5, $d736, $d73b, $d73b, $d73b, $d73b
OVR_S1_DEFV16 OVR_S1_023B, $0659, $06a0, $06a0, $06a0, $06a0, $06a0
OVR_S1_DEFV16 OVR_S1_023E, $0ce0, $0d27, $0d27, $0d27, $0d27, $0d27
OVR_S1_DEFV16 OVR_S1_0241, $cfac, $cfc5, $cfca, $cfca, $cfca, $cfca
OVR_S1_DEFV16 OVR_S1_0245, $0773, $07ba, $07ba, $07ba, $07ba, $07ba
OVR_S1_DEFV16 OVR_S1_0248, $d6af, $d730, $d735, $d735, $d735, $d735
OVR_S1_DEFV16 OVR_S1_024F, $d100, $d13b, $d140, $d140, $d140, $d140
OVR_S1_DEFV16 OVR_S1_0253, $d6ab, $d72c, $d731, $d731, $d731, $d731
OVR_S1_DEFV16 OVR_S1_025A, $d101, $d13c, $d141, $d141, $d141, $d141
OVR_S1_DEFV16 OVR_S1_0260, $d6ab, $d72c, $d731, $d731, $d731, $d731
OVR_S1_DEFV16 OVR_S1_0265, $d70f, $d790, $d795, $d795, $d795, $d795
OVR_S1_DEFV16 OVR_S1_026E, $7a44, $6997, $6997, $699a, $6998, $6998
OVR_S1_DEFV16 OVR_S1_0271, $3636, $35d6, $35f0, $35f3, $35ee, $35f5
OVR_S1_DEFV16 OVR_S1_0274, $d982, $da46, $da4b, $da4b, $da4b, $da4b
OVR_S1_DEFV16 OVR_S1_0278, $06f5, $073c, $073c, $073c, $073c, $073c
OVR_S1_DEFV16 OVR_S1_027B, $d034, $d057, $d05c, $d05c, $d05c, $d05c
OVR_S1_DEFV16 OVR_S1_027F, $066d, $06b4, $06b4, $06b4, $06b4, $06b4
OVR_S1_DEFV16 OVR_S1_0284, $3eb1, $3e6d, $3e87, $3e8a, $3e85, $3e8c
OVR_S1_DEFV16 OVR_S1_0287, $d0f2, $d12d, $d132, $d132, $d132, $d132
OVR_S1_DEFV16 OVR_S1_028B, $08ea, $0931, $0931, $0931, $0931, $0931
OVR_S1_DEFV16 OVR_S1_028E, $063c, $0683, $0683, $0683, $0683, $0683
OVR_S1_DEFV16 OVR_S1_0291, $d6b5, $d736, $d73b, $d73b, $d73b, $d73b
OVR_S1_DEFV16 OVR_S1_0296, $066d, $06b4, $06b4, $06b4, $06b4, $06b4
OVR_S1_DEFV16 OVR_S1_0299, $d6ac, $d72d, $d732, $d732, $d732, $d732
OVR_S1_DEFV16 OVR_S1_029E, $d6b2, $d733, $d738, $d738, $d738, $d738
OVR_S1_DEFV16 OVR_S1_02A3, $d0eb, $d126, $d12b, $d12b, $d12b, $d12b
OVR_S1_DEFV16 OVR_S1_02AD, $d2dd, $d35e, $d363, $d363, $d363, $d363
OVR_S1_DEFV16 OVR_S1_02B4, $d71a, $d79b, $d7a0, $d7a0, $d7a0, $d7a0
OVR_S1_DEFV16 OVR_S1_02B9, $d6ad, $d72e, $d733, $d733, $d733, $d733
OVR_S1_DEFV16 OVR_S1_02BE, $d2dd, $d35e, $d363, $d363, $d363, $d363
OVR_S1_DEFV16 OVR_S1_02C6, $4ba2, $4a83, $4a83, $4a83, $4a83, $4a83
OVR_S1_DEFV16 OVR_S1_02CB, $3636, $35d6, $35f0, $35f3, $35ee, $35f5
OVR_S1_DEFV16 OVR_S1_02D4, $3797, $3739, $3753, $3756, $3751, $3758
OVR_S1_DEFV16 OVR_S1_02DC, $d034, $d057, $d05c, $d05c, $d05c, $d05c
OVR_S1_DEFV16 OVR_S1_02DF, $0fd4, $101b, $101b, $101b, $101b, $101b
OVR_S1_DEFV16 OVR_S1_02E2, $08ea, $0931, $0931, $0931, $0931, $0931

PURGE OVR_S1_DEFV16

IF DEF(_JP)
SECTION "Overworld stage 1 JP", ROM0[$0357]
ELSE
SECTION "Overworld stage 1 localized", ROM0[$039e]
ENDC

HandleMidJump::
	ld b, $1c
	ld hl, OVR_S1_0002
	jp OVR_S1_0005
EnterMap::
	ld a, $ff
	ld [OVR_S1_000A], a
	call OVR_S1_000D
	ld b, $03
	ld hl, OVR_S1_0012
	call OVR_S1_0015
	ld hl, OVR_S1_0018
	bit 0, [hl]
	jr z, .L_0024
	ld a, $03
	ld [OVR_S1_0021], a
.L_0024:
	ld hl, OVR_S1_0024
	bit 5, [hl]
	res 5, [hl]
	call z, OVR_S1_002B
	call nz, OVR_S1_002E
	ld hl, OVR_S1_0031
	ld a, [hl]
	and $18
	jr z, .L_0046
	res 3, [hl]
	ld b, $1c
	ld hl, OVR_S1_003D
	call OVR_S1_0040
	call OVR_S1_0043
.L_0046:
	ld b, $03
	ld hl, OVR_S1_0048
	call OVR_S1_004B
	ld hl, OVR_S1_004E
	res 5, [hl]
	call OVR_S1_0053
	ld hl, OVR_S1_0056
	set 5, [hl]
	set 6, [hl]
	xor a
	ld [OVR_S1_005E], a
OverworldLoop::
	call OVR_S1_0061
OverworldLoopLessDelay::
	call OVR_S1_0064
	call OVR_S1_0067
	ld a, [OVR_S1_006A]
	bit 6, a
	call nz, HandleMidJump
	ld a, [OVR_S1_0072]
	and a
	jp nz, .L_0217
	call OVR_S1_0079
	ld b, $07
	ld hl, OVR_S1_007E
	call OVR_S1_0081
	ld a, [OVR_S1_0084]
	and a
	jp nz, OVR_S1_0088
	ld hl, OVR_S1_008B
	bit 3, [hl]
	res 3, [hl]
	jp nz, OVR_S1_0092
	ld a, [OVR_S1_0095]
	and $18
	jp nz, OVR_S1_009A
	ld a, [OVR_S1_009D]
	and a
	jp nz, .L_028E
	ld a, [OVR_S1_00A4]
	bit 7, a
	jr z, .L_00AF
	ldh a, [$ffb4]
	jr .L_00B1
.L_00AF:
	ldh a, [$ffb3]
.L_00B1:
	bit 3, a
	jr z, .L_00BB
	xor a
	ldh [$ff8c], a
	jp .L_00DF
.L_00BB:
	bit 0, a
	jp z, .L_014D
	ld a, [OVR_S1_00C0]
	bit 2, a
	jp nz, .L_012F
	call OVR_S1_00C8
	jr nz, .L_0125
	call OVR_S1_00CD
	ldh a, [$ffeb]
	and a
	jp z, OverworldLoop
	call OVR_S1_00D6
	ldh a, [$ff8c]
	and a
	jp z, OverworldLoop
.L_00DF:
	ld a, $35
	call OVR_S1_00E1
	call OVR_S1_00E4
	ld a, [OVR_S1_00E7]
	bit 2, a
	jr nz, .L_0125
	bit 0, a
	jr nz, .L_0125
	ld a, [$c45c]
	ld [OVR_S1_00F5], a
	call OVR_S1_00F8
	ld a, [$cc47]
	and a
	jr z, .L_0125
	dec a
	ld a, $00
	ld [$cc47], a
	jr z, .L_0122
	ld a, $52
	call OVR_S1_010B
	ld a, [OVR_S1_010E]
	ld [OVR_S1_0111], a
	call OVR_S1_0114
	ld a, [OVR_S1_0117]
	call OVR_S1_011A
	ld hl, OVR_S1_011D
	set 7, [hl]
.L_0122:
	jp EnterMap
.L_0125:
	ld a, [OVR_S1_0125]
	and a
	jp nz, .L_028E
	jp OverworldLoop
.L_012F:
	ld hl, OVR_S1_012F
	res 2, [hl]
	call OVR_S1_0134
	ld a, $01
	ld [$cc4b], a
	ld a, [OVR_S1_013C]
	and a
	jp z, OverworldLoop
	ld [OVR_S1_0143], a
	xor a
	ld [OVR_S1_0147], a
	jp OverworldLoop
.L_014D:
	ldh a, [$ffb4]
	bit 7, a
	jr z, .L_015C
	ld a, $01
	ld [$c103], a
	ld a, $04
	jr .L_017F
.L_015C:
	bit 6, a
	jr z, .L_0169
	ld a, $ff
	ld [$c103], a
	ld a, $08
	jr .L_017F
.L_0169:
	bit 5, a
	jr z, .L_0176
	ld a, $ff
	ld [$c105], a
	ld a, $02
	jr .L_017F
.L_0176:
	bit 4, a
	jr z, .L_012F
	ld a, $01
	ld [$c105], a
.L_017F:
	ld [OVR_S1_017F], a
	ld a, [OVR_S1_0182]
	bit 7, a
	jr nz, .L_01E0
	ld a, [$cc4b]
	and a
	jr z, .L_01E0
	ld a, [OVR_S1_018F]
	ld b, a
	ld a, [OVR_S1_0193]
	cp b
	jr z, .L_01E0
	swap a
	or b
	cp $48
	jr nz, .L_01A7
	ld a, $02
	ld [OVR_S1_01A2], a
	jr .L_01C6
.L_01A7:
	cp $84
	jr nz, .L_01B2
	ld a, $01
	ld [OVR_S1_01AD], a
	jr .L_01C6
.L_01B2:
	cp $12
	jr nz, .L_01BD
	ld a, $04
	ld [OVR_S1_01B8], a
	jr .L_01C6
.L_01BD:
	cp $21
	jr nz, .L_01C6
	ld a, $08
	ld [OVR_S1_01C3], a
.L_01C6:
	ld hl, OVR_S1_01C6
	set 2, [hl]
	ld hl, $cc4b
	dec [hl]
	jr nz, .L_01C6
	ld a, [OVR_S1_01D1]
	ld [OVR_S1_01D4], a
	call OVR_S1_01D7
	jp c, .L_0299
	jp OverworldLoop
.L_01E0:
	ld a, [OVR_S1_01E0]
	ld [OVR_S1_01E3], a
	call OVR_S1_01E6
	ld a, [OVR_S1_01E9]
	cp $02
	jr z, .L_020A
	call OVR_S1_01F0
	jr nc, .L_0210
	push hl
	ld hl, OVR_S1_01F6
	bit 2, [hl]
	pop hl
	jp z, OverworldLoop
	push hl
	call OVR_S1_0200
	pop hl
	jp c, OVR_S1_0204
	jp OverworldLoop
.L_020A:
	call OVR_S1_020A
	jp c, OverworldLoop
.L_0210:
	ld a, $08
	ld [OVR_S1_0212], a
	jr .L_0229
.L_0217:
	ld a, [OVR_S1_0217]
	bit 7, a
	jr z, .L_0226
	ld b, $11
	ld hl, OVR_S1_0220
	call OVR_S1_0223
.L_0226:
	call OVR_S1_0226
.L_0229:
	ld hl, OVR_S1_0229
	res 2, [hl]
	ld a, [OVR_S1_022E]
	dec a
	jr nz, .L_023E
	ld a, [OVR_S1_0234]
	bit 6, a
	jr nz, .L_023E
	call OVR_S1_023B
.L_023E:
	call OVR_S1_023E
	ld a, [OVR_S1_0241]
	and a
	jp nz, OVR_S1_0245
	ld a, [OVR_S1_0248]
	bit 7, a
	jr nz, .L_0265
	ld hl, OVR_S1_024F
	dec [hl]
	ld a, [OVR_S1_0253]
	bit 0, a
	jr z, .L_0265
	ld hl, OVR_S1_025A
	dec [hl]
	jr nz, .L_0265
	ld hl, OVR_S1_0260
	res 0, [hl]
.L_0265:
	ld a, [OVR_S1_0265]
	bit 7, a
	jr z, .L_027B
	ld b, $07
	ld hl, OVR_S1_026E
	call OVR_S1_0271
	ld a, [OVR_S1_0274]
	and a
	jp nz, OVR_S1_0278
.L_027B:
	ld a, [OVR_S1_027B]
	and a
	jp nz, OVR_S1_027F
	ld a, $13
	call OVR_S1_0284
	ld a, [OVR_S1_0287]
	and a
	jp nz, OVR_S1_028B
.L_028E:
	call OVR_S1_028E
	ld hl, OVR_S1_0291
	res 2, [hl]
	jp nc, OVR_S1_0296
.L_0299:
	ld hl, OVR_S1_0299
	res 6, [hl]
	ld hl, OVR_S1_029E
	res 3, [hl]
	ld hl, OVR_S1_02A3
	set 5, [hl]
	set 6, [hl]
	xor a
	ldh [$ffb4], a
	ld a, [OVR_S1_02AD]
	cp $a6
	jr nz, .L_02B9
	ld hl, OVR_S1_02B4
	set 7, [hl]
.L_02B9:
	ld hl, OVR_S1_02B9
	set 5, [hl]
	ld a, [OVR_S1_02BE]
	cp $28
	jp z, .L_02D2
	ld hl, OVR_S1_02C6
	ld b, $0f
	call OVR_S1_02CB
	ld a, d
	and a
	jr z, .L_02DA
.L_02D2:
	ld c, $0a
	call OVR_S1_02D4
	jp EnterMap
.L_02DA:
	ld a, $ff
	ld [OVR_S1_02DC], a
	call OVR_S1_02DF
	jp OVR_S1_02E2
