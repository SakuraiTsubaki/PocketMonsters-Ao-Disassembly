; ROM0 overworld reconstruction — stage 5.
; MapEntryAfterBattle through LoadTilesetTilePatternData.
; JP: $08D8-$09B4; localized: $091F-$09FB.
; Includes the 6-byte BikeRidingTilesets data table.

MACRO OVR5_DEFV16
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
    FAIL "Define exactly one release symbol"
ENDC
ENDM

OVR5_DEFV16 OVR5_0002, $4397, $435f, $435f, $435f, $435f, $435f
OVR5_DEFV16 OVR5_0005, $3636, $35d6, $35f0, $35f3, $35ee, $35f5
OVR5_DEFV16 OVR5_0008, $d2dc, $d35d, $d362, $d362, $d362, $d362
OVR5_DEFV16 OVR5_000C, $20d6, $20f6, $20f6, $20f2, $20f6, $20f5
OVR5_DEFV16 OVR5_000F, $209a, $20ba, $20ba, $20b6, $20ba, $20b9
OVR5_DEFV16 OVR5_0012, $20cf, $20ef, $20ef, $20eb, $20ef, $20ee
OVR5_DEFV16 OVR5_001A, $d6ad, $d72e, $d733, $d733, $d733, $d733
OVR5_DEFV16 OVR5_0023, $2000, $2000, $2000, $2000, $2000, $2000
OVR5_DEFV16 OVR5_0026, $40b0, $40b0, $40b0, $40b0, $40b0, $40b0
OVR5_DEFV16 OVR5_0029, $6373, $62ce, $62f5, $6369, $632c, $632d
OVR5_DEFV16 OVR5_002C, $22f2, $2312, $2312, $230e, $2312, $2311
OVR5_DEFV16 OVR5_002F, $5cc9, $5d5f, $5d79, $5ded, $5db9, $5dac
OVR5_DEFV16 OVR5_0032, $cfae, $cfc7, $cfcc, $cfcc, $cfcc, $cfcc
OVR5_DEFV16 OVR5_0037, $c0ee, $c0ee, $c0ee, $c0ee, $c0ee, $c0ee
OVR5_DEFV16 OVR5_003A, $2391, $23b1, $23b1, $23ad, $23b1, $23b0
OVR5_DEFV16 OVR5_003D, $cfae, $cfc7, $cfcc, $cfcc, $cfcc, $cfcc
OVR5_DEFV16 OVR5_0043, $1ff4, $200e, $200e, $200a, $200e, $200d
OVR5_DEFV16 OVR5_0046, $2409, $2429, $2429, $2425, $2429, $2428
OVR5_DEFV16 OVR5_0049, $3e1b, $3dd7, $3df1, $3df4, $3def, $3df6
OVR5_DEFV16 OVR5_004D, $cf06, $cf0b, $cf10, $cf10, $cf10, $cf10
OVR5_DEFV16 OVR5_0050, $d67f, $d700, $d705, $d705, $d705, $d705
OVR5_DEFV16 OVR5_0053, $d034, $d057, $d05c, $d05c, $d05c, $d05c
OVR5_DEFV16 OVR5_0056, $d2dc, $d35d, $d362, $d362, $d362, $d362
OVR5_DEFV16 OVR5_0059, $d6b1, $d732, $d737, $d737, $d737, $d737
OVR5_DEFV16 OVR5_0067, $2000, $2000, $2000, $2000, $2000, $2000
OVR5_DEFV16 OVR5_006A, $6373, $62ce, $62f5, $6369, $632c, $632d
OVR5_DEFV16 OVR5_006D, $5cc9, $5d5f, $5d79, $5ded, $5db9, $5dac
OVR5_DEFV16 OVR5_0072, $4afc, $45ba, $45b6, $45bb, $45b8, $45bb
OVR5_DEFV16 OVR5_0075, $3636, $35d6, $35f0, $35f3, $35ee, $35f5
OVR5_DEFV16 OVR5_0078, $d67f, $d700, $d705, $d705, $d705, $d705
OVR5_DEFV16 OVR5_008B, $d67f, $d700, $d705, $d705, $d705, $d705
OVR5_DEFV16 OVR5_008E, $d0df, $d11a, $d11f, $d11f, $d11f, $d11f
OVR5_DEFV16 OVR5_0091, $1006, $104d, $104d, $104d, $104d, $104d
OVR5_DEFV16 OVR5_0094, $d67f, $d700, $d705, $d705, $d705, $d705
OVR5_DEFV16 OVR5_0098, $1006, $104d, $104d, $104d, $104d, $104d
OVR5_DEFV16 OVR5_009C, $1016, $105d, $105d, $105d, $105d, $105d
OVR5_DEFV16 OVR5_00A0, $100e, $1055, $1055, $1055, $1055, $1055
OVR5_DEFV16 OVR5_00A3, $1006, $104d, $104d, $104d, $104d, $104d
OVR5_DEFV16 OVR5_00A6, $d2dd, $d35e, $d363, $d363, $d363, $d363
OVR5_DEFV16 OVR5_00B1, $d2e6, $d367, $d36c, $d36c, $d36c, $d36c
OVR5_DEFV16 OVR5_00C9, $d4ad, $d52e, $d533, $d533, $d533, $d533
OVR5_DEFV16 OVR5_00CD, $d4ae, $d52f, $d534, $d534, $d534, $d534
OVR5_DEFV16 OVR5_00D1, $9000, $9000, $9000, $9000, $9000, $9000
OVR5_DEFV16 OVR5_00D4, $0600, $0600, $0600, $0600, $0600, $0600
OVR5_DEFV16 OVR5_00D7, $d4aa, $d52b, $d530, $d530, $d530, $d530
OVR5_DEFV16 OVR5_00DA, $17ec, $17f7, $17f7, $17f4, $17f7, $17f7

PURGE OVR5_DEFV16

IF DEF(_JP)
SECTION "Overworld stage 5", ROM0[$08d8]
ELSE
SECTION "Overworld stage 5", ROM0[$091f]
ENDC

MapEntryAfterBattle::
	ld b, $03
	ld hl, OVR5_0002
	call OVR5_0005
	ld a, [OVR5_0008]
	and a
	jp z, OVR5_000C
	jp OVR5_000F

HandleBlackOut::
	call OVR5_0012
	ld a, $08
	call StopMusic
	ld hl, OVR5_001A
	res 5, [hl]
	ld a, $01
	ldh [$ffb8], a
	ld [OVR5_0023], a
	call OVR5_0026
	call OVR5_0029
	call OVR5_002C
	jp OVR5_002F

StopMusic::
	ld [OVR5_0032], a
	ld a, $ff
	ld [OVR5_0037], a
	call OVR5_003A
.wait
	ld a, [OVR5_003D]
	and a
	jr nz, .wait
	jp OVR5_0043

HandleFlyWarpOrDungeonWarp::
	call OVR5_0046
	call OVR5_0049
	xor a
	ld [OVR5_004D], a
	ld [OVR5_0050], a
	ld [OVR5_0053], a
	ld [OVR5_0056], a
	ld hl, OVR5_0059
	set 2, [hl]
	res 5, [hl]
	call LeaveMapAnim
	ld a, $01
	ldh [$ffb8], a
	ld [OVR5_0067], a
	call OVR5_006A
	jp OVR5_006D

LeaveMapAnim::
	ld b, $1c
	ld hl, OVR5_0072
	jp OVR5_0075

LoadPlayerSpriteGraphics::
	ld a, [OVR5_0078]
	dec a
	jr z, .ridingBike
	ldh a, [$ffd7]
	and a
	jr nz, .determineGraphics
	jr .startWalking
.ridingBike
	call IsBikeRidingAllowed
	jr c, .determineGraphics
.startWalking
	xor a
	ld [OVR5_008B], a
	ld [OVR5_008E], a
	jp OVR5_0091
.determineGraphics
	ld a, [OVR5_0094]
	and a
	jp z, OVR5_0098
	dec a
	jp z, OVR5_009C
	dec a
	jp z, OVR5_00A0
	jp OVR5_00A3

IsBikeRidingAllowed::
	ld a, [OVR5_00A6]
	cp $22
	jr z, .allowed
	cp $09
	jr z, .allowed
	ld a, [OVR5_00B1]
	ld b, a
	ld hl, BikeRidingTilesets
.loop
	ld a, [hli]
	cp b
	jr z, .allowed
	inc a
	jr nz, .loop
	and a
	ret
.allowed
	scf
	ret

BikeRidingTilesets::
	db $00, $03, $0b, $0e, $11, $ff

LoadTilesetTilePatternData::
	ld a, [OVR5_00C9]
	ld l, a
	ld a, [OVR5_00CD]
	ld h, a
	ld de, OVR5_00D1
	ld bc, OVR5_00D4
	ld a, [OVR5_00D7]
	jp OVR5_00DA
