; ROM0 overworld reconstruction — stage 10.
; Relative range $0AC7-$0BAE; common instruction skeleton across JP/EN/DE/FR/IT/ES.

MACRO OVR10_DEFV16
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

OVR10_DEFV16 OVR10_0AF9, $d4a5, $d526, $d52b, $d52b, $d52b, $d52b
OVR10_DEFV16 OVR10_0AFE, $d4a6, $d527, $d52c, $d52c, $d52c, $d52c
OVR10_DEFV16 OVR10_0B1A, $d4a5, $d526, $d52b, $d52b, $d52b, $d52b
OVR10_DEFV16 OVR10_0B1E, $d4a6, $d527, $d52c, $d52c, $d52c, $d52c
OVR10_DEFV16 OVR10_0B3B, $d4a5, $d526, $d52b, $d52b, $d52b, $d52b
OVR10_DEFV16 OVR10_0B4A, $d4a6, $d527, $d52c, $d52c, $d52c, $d52c
OVR10_DEFV16 OVR10_0B70, $d4a5, $d526, $d52b, $d52b, $d52b, $d52b
OVR10_DEFV16 OVR10_0B75, $d4a6, $d527, $d52c, $d52c, $d52c, $d52c
OVR10_DEFV16 OVR10_0B80, $d4ab, $d52c, $d531, $d531, $d531, $d531
OVR10_DEFV16 OVR10_0B84, $d4ac, $d52d, $d532, $d532, $d532, $d532

PURGE OVR10_DEFV16

IF DEF(_JP)
SECTION "Overworld stage 10", ROM0[$0e1e]
ELSE
SECTION "Overworld stage 10", ROM0[$0e65]
ENDC
MoveTileBlockMapPointerEast::
	ld a, [de]
	add a $01
	ld [de], a
	ret nc
	inc de
	ld a, [de]
	inc a
	ld [de], a
	ret
MoveTileBlockMapPointerWest::
	ld a, [de]
	sub $01
	ld [de], a
	ret nc
	inc de
	ld a, [de]
	dec a
	ld [de], a
	ret
MoveTileBlockMapPointerSouth::
	add a $06
	ld b, a
	ld a, [de]
	add a b
	ld [de], a
	ret nc
	inc de
	ld a, [de]
	inc a
	ld [de], a
	ret
MoveTileBlockMapPointerNorth::
	add a $06
	ld b, a
	ld a, [de]
	sub b
	ld [de], a
	ret nc
	inc de
	ld a, [de]
	dec a
	ld [de], a
	ret
ScheduleNorthRowRedraw::
	ld hl, $c3a0
	call CopyToRedrawRowOrColumnSrcTiles
	ld a, [OVR10_0AF9]
	ldh [$ffd1], a
	ld a, [OVR10_0AFE]
	ldh [$ffd2], a
	ld a, $02
	ldh [$ffd0], a
	ret
CopyToRedrawRowOrColumnSrcTiles::
	ld de, $cbfc
	ld c, $28
OVR10_L_0B0D::
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, OVR10_L_0B0D
	ret
ScheduleSouthRowRedraw::
	ld hl, $c4e0
	call CopyToRedrawRowOrColumnSrcTiles
	ld a, [OVR10_0B1A]
	ld l, a
	ld a, [OVR10_0B1E]
	ld h, a
	ld bc, $0200
	add hl, bc
	ld a, h
	and $03
	or $98
	ldh [$ffd2], a
	ld a, l
	ldh [$ffd1], a
	ld a, $02
	ldh [$ffd0], a
	ret
ScheduleEastColumnRedraw::
	ld hl, $c3b2
	call ScheduleColumnRedrawHelper
	ld a, [OVR10_0B3B]
	ld c, a
	and $e0
	ld b, a
	ld a, c
	add a $12
	and $1f
	or b
	ldh [$ffd1], a
	ld a, [OVR10_0B4A]
	ldh [$ffd2], a
	ld a, $01
	ldh [$ffd0], a
	ret
ScheduleColumnRedrawHelper::
	ld de, $cbfc
	ld c, $12
OVR10_L_0B59::
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	inc de
	ld a, $13
	add a l
	ld l, a
	jr nc, OVR10_L_0B66
	inc h
OVR10_L_0B66::
	dec c
	jr nz, OVR10_L_0B59
	ret
ScheduleWestColumnRedraw::
	ld hl, $c3a0
	call ScheduleColumnRedrawHelper
	ld a, [OVR10_0B70]
	ldh [$ffd1], a
	ld a, [OVR10_0B75]
	ldh [$ffd2], a
	ld a, $01
	ldh [$ffd0], a
	ret
DrawTileBlock::
	push hl
	ld a, [OVR10_0B80]
	ld l, a
	ld a, [OVR10_0B84]
	ld h, a
	ld a, c
	swap a
	ld b, a
	and $f0
	ld c, a
	ld a, b
	and $0f
	ld b, a
	add hl, bc
	ld d, h
	ld e, l
	pop hl
	ld c, $04
OVR10_L_0B99::
	push bc
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hl], a
	inc de
	ld bc, $0015
	add hl, bc
	pop bc
	dec c
	jr nz, OVR10_L_0B99
	ret
