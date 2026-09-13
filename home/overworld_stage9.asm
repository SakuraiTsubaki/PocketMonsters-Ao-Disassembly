; ROM0 overworld reconstruction — stage 9.
; Relative range $0989-$0AC6; common instruction skeleton across JP/EN/DE/FR/IT/ES.

MACRO OVR9_DEFV16
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

OVR9_DEFV16 OVR9_0991, $cfac, $cfc5, $cfca, $cfca, $cfca, $cfca
OVR9_DEFV16 OVR9_0997, $d2e0, $d361, $d366, $d366, $d366, $d366
OVR9_DEFV16 OVR9_099B, $d2e0, $d361, $d366, $d366, $d366, $d366
OVR9_DEFV16 OVR9_099E, $d2e1, $d362, $d367, $d367, $d367, $d367
OVR9_DEFV16 OVR9_09A2, $d2e1, $d362, $d367, $d367, $d367, $d367
OVR9_DEFV16 OVR9_09A5, $cfac, $cfc5, $cfca, $cfca, $cfca, $cfca
OVR9_DEFV16 OVR9_09B2, $d4a5, $d526, $d52b, $d52b, $d52b, $d52b
OVR9_DEFV16 OVR9_09BF, $d4a5, $d526, $d52b, $d52b, $d52b, $d52b
OVR9_DEFV16 OVR9_09C8, $d4a5, $d526, $d52b, $d52b, $d52b, $d52b
OVR9_DEFV16 OVR9_09D5, $d4a5, $d526, $d52b, $d52b, $d52b, $d52b
OVR9_DEFV16 OVR9_09DF, $d4a5, $d526, $d52b, $d52b, $d52b, $d52b
OVR9_DEFV16 OVR9_09E4, $d4a5, $d526, $d52b, $d52b, $d52b, $d52b
OVR9_DEFV16 OVR9_09E9, $d4a6, $d527, $d52c, $d52c, $d52c, $d52c
OVR9_DEFV16 OVR9_09F1, $d4a6, $d527, $d52c, $d52c, $d52c, $d52c
OVR9_DEFV16 OVR9_09FA, $d4a5, $d526, $d52b, $d52b, $d52b, $d52b
OVR9_DEFV16 OVR9_09FF, $d4a5, $d526, $d52b, $d52b, $d52b, $d52b
OVR9_DEFV16 OVR9_0A04, $d4a6, $d527, $d52c, $d52c, $d52c, $d52c
OVR9_DEFV16 OVR9_0A0C, $d4a6, $d527, $d52c, $d52c, $d52c, $d52c
OVR9_DEFV16 OVR9_0A13, $d2e3, $d364, $d369, $d369, $d369, $d369
OVR9_DEFV16 OVR9_0A1F, $d462, $d4e3, $d4e8, $d4e8, $d4e8, $d4e8
OVR9_DEFV16 OVR9_0A23, $d2de, $d35f, $d364, $d364, $d364, $d364
OVR9_DEFV16 OVR9_0A32, $d462, $d4e3, $d4e8, $d4e8, $d4e8, $d4e8
OVR9_DEFV16 OVR9_0A36, $d2de, $d35f, $d364, $d364, $d364, $d364
OVR9_DEFV16 OVR9_0A3E, $d2e2, $d363, $d368, $d368, $d368, $d368
OVR9_DEFV16 OVR9_0A4A, $d461, $d4e2, $d4e7, $d4e7, $d4e7, $d4e7
OVR9_DEFV16 OVR9_0A4E, $d2de, $d35f, $d364, $d364, $d364, $d364
OVR9_DEFV16 OVR9_0A51, $d2e8, $d369, $d36e, $d36e, $d36e, $d36e
OVR9_DEFV16 OVR9_0A60, $d461, $d4e2, $d4e7, $d4e7, $d4e7, $d4e7
OVR9_DEFV16 OVR9_0A64, $d2de, $d35f, $d364, $d364, $d364, $d364
OVR9_DEFV16 OVR9_0A67, $d2e8, $d369, $d36e, $d36e, $d36e, $d36e
OVR9_DEFV16 OVR9_0AB1, $d460, $d4e1, $d4e6, $d4e6, $d4e6, $d4e6

PURGE OVR9_DEFV16

IF DEF(_JP)
SECTION "Overworld stage 9", ROM0[$0ce0]
ELSE
SECTION "Overworld stage 9", ROM0[$0d27]
ENDC
AdvancePlayerSprite::
	ld a, [$c103]
	ld b, a
	ld a, [$c105]
	ld c, a
	ld hl, OVR9_0991
	dec [hl]
	jr nz, OVR9_L_09A5
	ld a, [OVR9_0997]
	add a b
	ld [OVR9_099B], a
	ld a, [OVR9_099E]
	add a c
	ld [OVR9_09A2], a
OVR9_L_09A5::
	ld a, [OVR9_09A5]
	cp $07
	jp nz, OVR9_L_0A98
	ld a, c
	cp $01
	jr nz, OVR9_L_09C4
	ld a, [OVR9_09B2]
	ld e, a
	and $e0
	ld d, a
	ld a, e
	add a $02
	and $1f
	or d
	ld [OVR9_09BF], a
	jr OVR9_L_0A0F
OVR9_L_09C4::
	cp $ff
	jr nz, OVR9_L_09DA
	ld a, [OVR9_09C8]
	ld e, a
	and $e0
	ld d, a
	ld a, e
	sub $02
	and $1f
	or d
	ld [OVR9_09D5], a
	jr OVR9_L_0A0F
OVR9_L_09DA::
	ld a, b
	cp $01
	jr nz, OVR9_L_09F6
	ld a, [OVR9_09DF]
	add a $40
	ld [OVR9_09E4], a
	jr nc, OVR9_L_0A0F
	ld a, [OVR9_09E9]
	inc a
	and $03
	or $98
	ld [OVR9_09F1], a
	jr OVR9_L_0A0F
OVR9_L_09F6::
	cp $ff
	jr nz, OVR9_L_0A0F
	ld a, [OVR9_09FA]
	sub $40
	ld [OVR9_09FF], a
	jr nc, OVR9_L_0A0F
	ld a, [OVR9_0A04]
	dec a
	and $03
	or $98
	ld [OVR9_0A0C], a
OVR9_L_0A0F::
	ld a, c
	and a
	jr z, OVR9_L_0A13
OVR9_L_0A13::
	ld hl, OVR9_0A13
	ld a, [hl]
	add a c
	ld [hl], a
	cp $02
	jr nz, OVR9_L_0A2B
	xor a
	ld [hl], a
	ld hl, OVR9_0A1F
	inc [hl]
	ld de, OVR9_0A23
	call MoveTileBlockMapPointerEast
	jr OVR9_L_0A6D
OVR9_L_0A2B::
	cp $ff
	jr nz, OVR9_L_0A3E
	ld a, $01
	ld [hl], a
	ld hl, OVR9_0A32
	dec [hl]
	ld de, OVR9_0A36
	call MoveTileBlockMapPointerWest
	jr OVR9_L_0A6D
OVR9_L_0A3E::
	ld hl, OVR9_0A3E
	ld a, [hl]
	add a b
	ld [hl], a
	cp $02
	jr nz, OVR9_L_0A59
	xor a
	ld [hl], a
	ld hl, OVR9_0A4A
	inc [hl]
	ld de, OVR9_0A4E
	ld a, [OVR9_0A51]
	call MoveTileBlockMapPointerSouth
	jr OVR9_L_0A6D
OVR9_L_0A59::
	cp $ff
	jr nz, OVR9_L_0A6D
	ld a, $01
	ld [hl], a
	ld hl, OVR9_0A60
	dec [hl]
	ld de, OVR9_0A64
	ld a, [OVR9_0A67]
	call MoveTileBlockMapPointerNorth
OVR9_L_0A6D::
	call LoadCurrentMapView
	ld a, [$c103]
	cp $01
	jr nz, OVR9_L_0A7C
	call ScheduleSouthRowRedraw
	jr OVR9_L_0A98
OVR9_L_0A7C::
	cp $ff
	jr nz, OVR9_L_0A85
	call ScheduleNorthRowRedraw
	jr OVR9_L_0A98
OVR9_L_0A85::
	ld a, [$c105]
	cp $01
	jr nz, OVR9_L_0A91
	call ScheduleEastColumnRedraw
	jr OVR9_L_0A98
OVR9_L_0A91::
	cp $ff
	jr nz, OVR9_L_0A98
	call ScheduleWestColumnRedraw
OVR9_L_0A98::
	ld a, [$c103]
	ld b, a
	ld a, [$c105]
	ld c, a
	sla b
	sla c
	ldh a, [$ffaf]
	add a b
	ldh [$ffaf], a
	ldh a, [$ffae]
	add a c
	ldh [$ffae], a
	ld hl, $c114
	ld a, [OVR9_0AB1]
	and a
	jr z, OVR9_L_0AC6
	ld e, a
OVR9_L_0AB8::
	ld a, [hl]
	sub b
	ld [hli], a
	inc l
	ld a, [hl]
	sub c
	ld [hl], a
	ld a, $0e
	add a l
	ld l, a
	dec e
	jr nz, OVR9_L_0AB8
OVR9_L_0AC6::
	ret
