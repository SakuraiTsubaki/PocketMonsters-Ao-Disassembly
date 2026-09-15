; ROM0 overworld reconstruction — stage 12.
; Relative range $0C19-$0CDD; common instruction skeleton across JP/EN/DE/FR/IT/ES.

MACRO OVR12_DEFV16
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

OVR12_DEFV16 OVR12_0C19, $d6af, $d730, $d735, $d735, $d735, $d735
OVR12_DEFV16 OVR12_0C21, $d4a9, $d52a, $d52f, $d52f, $d52f, $d52f
OVR12_DEFV16 OVR12_0C2B, $0c59, $0ca0, $0ca0, $0ca0, $0ca0, $0ca0
OVR12_DEFV16 OVR12_0C35, $3eb1, $3e6d, $3e87, $3e8a, $3e85, $3e8c
OVR12_DEFV16 OVR12_0C38, $cfad, $cfc6, $cfcb, $cfcb, $cfcb, $cfcb
OVR12_DEFV16 OVR12_0C47, $d4af, $d530, $d535, $d535, $d535, $d535
OVR12_DEFV16 OVR12_0C60, $2391, $23b1, $23b1, $23ad, $23b1, $23b0
OVR12_DEFV16 OVR12_0C69, $d67f, $d700, $d705, $d705, $d705, $d705
OVR12_DEFV16 OVR12_0C6F, $22e7, $2307, $2307, $2303, $2307, $2306
OVR12_DEFV16 OVR12_0C74, $d2e6, $d367, $d36c, $d36c, $d36c, $d36c
OVR12_DEFV16 OVR12_0C82, $7579, $7225, $721e, $7215, $721f, $7227
OVR12_DEFV16 OVR12_0C85, $3636, $35d6, $35f0, $35f3, $35ee, $35f5
OVR12_DEFV16 OVR12_0C88, $cd5b, $cd60, $cd60, $cd60, $cd60, $cd60
OVR12_DEFV16 OVR12_0C91, $7609, $72b5, $72ae, $72a5, $72af, $72b7
OVR12_DEFV16 OVR12_0C94, $3636, $35d6, $35f0, $35f3, $35ee, $35f5
OVR12_DEFV16 OVR12_0C9A, $316c, $310e, $3128, $312b, $3126, $312d
OVR12_DEFV16 OVR12_0C9D, $d2dd, $d35e, $d363, $d363, $d363, $d363
OVR12_DEFV16 OVR12_0CA3, $d2ed, $d36e, $d373, $d373, $d373, $d373
OVR12_DEFV16 OVR12_0CA9, $1005, $104c, $104c, $104c, $104c, $104c
OVR12_DEFV16 OVR12_0CCA, $183d, $1848, $1848, $1845, $1848, $1848
OVR12_DEFV16 OVR12_0CDB, $183d, $1848, $1848, $1845, $1848, $1848
OVR12_DEFV16 OVR12_EXT_05F9, $0950, $0997, $0997, $0997, $0997, $0997
OVR12_DEFV16 OVR12_EXT_088C, $0be3, $0c2a, $0c2a, $0c2a, $0c2a, $0c2a

PURGE OVR12_DEFV16

IF DEF(_JP)
SECTION "Overworld stage 12", ROM0[$0f70]
ELSE
SECTION "Overworld stage 12", ROM0[$0fb7]
ENDC
CollisionCheckOnWater::
	ld a, [OVR12_0C19]
	bit 7, a
	jp nz, OVR12_L_0C66
	ld a, [OVR12_0C21]
	ld d, a
	ld a, [$c10c]
	and d
	jr nz, OVR12_L_0C47
	ld hl, OVR12_0C2B
	call OVR12_EXT_088C
	jr c, OVR12_L_0C57
	ld a, $35
	call OVR12_0C35
	ld a, [OVR12_0C38]
	cp $14
	jr z, OVR12_L_0C66
	cp $32
	jr z, OVR12_L_0C74
	cp $48
	jr z, OVR12_L_0C66
OVR12_L_0C47::
	ld hl, OVR12_0C47
	ld a, [hli]
	ld h, [hl]
	ld l, a
OVR12_L_0C4D::
	ld a, [hli]
	cp $ff
	jr z, OVR12_L_0C57
	cp c
	jr z, OVR12_L_0C68
	jr OVR12_L_0C4D
OVR12_L_0C57::
	ld a, [$c02a]
	cp $b4
	jr z, OVR12_L_0C63
	ld a, $b4
	call OVR12_0C60
OVR12_L_0C63::
	scf
	jr OVR12_L_0C67
OVR12_L_0C66::
	and a
OVR12_L_0C67::
	ret
OVR12_L_0C68::
	xor a
	ld [OVR12_0C69], a
	call OVR12_EXT_05F9
	call OVR12_0C6F
	jr OVR12_L_0C66
OVR12_L_0C74::
	ld a, [OVR12_0C74]
	cp $0e
	jr nz, OVR12_L_0C66
	jr OVR12_L_0C68
RunMapScript::
	push hl
	push de
	push bc
	ld b, $03
	ld hl, OVR12_0C82
	call OVR12_0C85
	ld a, [OVR12_0C88]
	bit 1, a
	jr z, OVR12_L_0C97
	ld b, $03
	ld hl, OVR12_0C91
	call OVR12_0C94
OVR12_L_0C97::
	pop bc
	pop de
	pop hl
	call OVR12_0C9A
	ld a, [OVR12_0C9D]
	call SwitchToMapRomBank
	ld hl, OVR12_0CA3
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, OVR12_0CA9
	push de
	jp hl
	ret
LoadWalkingPlayerSpriteGraphics::
	ld de, $4180
	ld hl, $8000
	jr LoadPlayerSpriteGraphicsCommon
LoadSurfingPlayerSpriteGraphics::
	ld de, $76c0
	ld hl, $8000
	jr LoadPlayerSpriteGraphicsCommon
LoadBikePlayerSpriteGraphics::
	ld de, $4000
	ld hl, $8000
LoadPlayerSpriteGraphicsCommon::
	push de
	push hl
	ld bc, $050c
	call OVR12_0CCA
	pop hl
	pop de
	ld a, $c0
	add a e
	ld e, a
	jr nc, OVR12_L_0CD6
	inc d
OVR12_L_0CD6::
	set 3, h
	ld bc, $050c
	jp OVR12_0CDB
