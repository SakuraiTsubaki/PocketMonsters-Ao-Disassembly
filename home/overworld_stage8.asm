; ROM0 overworld reconstruction — stage 8.
; Relative range $090C-$0988; common instruction skeleton across JP/EN/DE/FR/IT/ES.

MACRO OVR8_DEFV16
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

OVR8_DEFV16 OVR8_090F, $d4aa, $d52b, $d530, $d530, $d530, $d530
OVR8_DEFV16 OVR8_0917, $d2de, $d35f, $d364, $d364, $d364, $d364
OVR8_DEFV16 OVR8_091B, $d2df, $d360, $d365, $d365, $d365, $d365
OVR8_DEFV16 OVR8_093C, $d2e8, $d369, $d36e, $d36e, $d36e, $d36e
OVR8_DEFV16 OVR8_0957, $d2e2, $d363, $d368, $d368, $d368, $d368
OVR8_DEFV16 OVR8_0961, $d2e3, $d364, $d369, $d369, $d369, $d369

PURGE OVR8_DEFV16

IF DEF(_JP)
SECTION "Overworld stage 8", ROM0[$0c63]
ELSE
SECTION "Overworld stage 8", ROM0[$0caa]
ENDC
LoadCurrentMapView::
	ldh a, [$ffb8]
	push af
	ld a, [OVR8_090F]
	ldh [$ffb8], a
	ld [$2000], a
OVR8_L_0917::
	ld a, [OVR8_0917]
	ld e, a
	ld a, [OVR8_091B]
	ld d, a
	ld hl, $c508
	ld b, $05
OVR8_L_0924::
	push hl
	push de
	ld c, $06
OVR8_L_0928::
	push bc
OVR8_L_0929::
	push de
	push hl
	ld a, [de]
	ld c, a
	call DrawTileBlock
	pop hl
	pop de
	pop bc
	inc hl
	inc hl
	inc hl
	inc hl
	inc de
	dec c
	jr nz, OVR8_L_0928
	pop de
	ld a, [OVR8_093C]
	add a $06
	add a e
	ld e, a
	jr nc, OVR8_L_0946
	inc d
OVR8_L_0946::
	pop hl
	ld a, $60
	add a l
	ld l, a
	jr nc, OVR8_L_094E
	inc h
OVR8_L_094E::
	dec b
	jr nz, OVR8_L_0924
	ld hl, $c508
	ld bc, $0000
	ld a, [OVR8_0957]
	and a
	jr z, OVR8_L_0961
	ld bc, $0030
	add hl, bc
OVR8_L_0961::
	ld a, [OVR8_0961]
	and a
	jr z, OVR8_L_096B
	ld bc, $0002
	add hl, bc
OVR8_L_096B::
	ld de, $c3a0
	ld b, $12
OVR8_L_0970::
	ld c, $14
OVR8_L_0972::
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, OVR8_L_0972
	ld a, $04
	add a l
	ld l, a
	jr nc, OVR8_L_097F
	inc h
OVR8_L_097F::
	dec b
	jr nz, OVR8_L_0970
	pop af
	ldh [$ffb8], a
	ld [$2000], a
	ret
