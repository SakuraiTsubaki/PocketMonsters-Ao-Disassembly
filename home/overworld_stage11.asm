; ROM0 overworld reconstruction — stage 11.
; Relative range $0BAF-$0C18; common instruction skeleton across JP/EN/DE/FR/IT/ES.

MACRO OVR11_DEFV16
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

OVR11_DEFV16 OVR11_0BB9, $0153, $019a, $019a, $019a, $019a, $019a
OVR11_DEFV16 OVR11_0BBC, $d6b2, $d733, $d738, $d738, $d738, $d738
OVR11_DEFV16 OVR11_0BC3, $d2dd, $d35e, $d363, $d363, $d363, $d363
OVR11_DEFV16 OVR11_0BD4, $d6af, $d730, $d735, $d735, $d735, $d735
OVR11_DEFV16 OVR11_0C07, $cd66, $cd6b, $cd6b, $cd6b, $cd6b, $cd6b
OVR11_DEFV16 OVR11_0C0C, $d6b5, $d736, $d73b, $d73b, $d73b, $d73b
OVR11_DEFV16 OVR11_0C13, $d6af, $d730, $d735, $d735, $d735, $d735

PURGE OVR11_DEFV16

IF DEF(_JP)
SECTION "Overworld stage 11", ROM0[$0f06]
ELSE
SECTION "Overworld stage 11", ROM0[$0f4d]
ENDC
JoypadOverworld::
	xor a
	ld [$c103], a
	ld [$c105], a
	call RunMapScript
	call OVR11_0BB9
	ld a, [OVR11_0BBC]
	bit 3, a
	jr nz, OVR11_L_0BD4
	ld a, [OVR11_0BC3]
	cp $1c
	jr nz, OVR11_L_0BD4
	ldh a, [$ffb4]
	and $f3
	jr nz, OVR11_L_0BD4
	ld a, $80
	ldh [$ffb4], a
OVR11_L_0BD4::
	ld a, [OVR11_0BD4]
	bit 7, a
	ret z
	ldh a, [$ffb4]
	ld b, a
	ld a, [$cd3b]
	and b
	ret nz
	ld hl, $cd38
	dec [hl]
	ld a, [hl]
	cp $ff
	jr z, OVR11_L_0BFD
	ld hl, $ccd3
	add a l
	ld l, a
	jr nc, OVR11_L_0BF3
	inc h
OVR11_L_0BF3::
	ld a, [hl]
	ldh [$ffb4], a
	and a
	ret nz
	ldh [$ffb3], a
	ldh [$ffb2], a
	ret
OVR11_L_0BFD::
	xor a
	ld [$cd3a], a
	ld [$cd38], a
	ld [$ccd3], a
	ld [OVR11_0C07], a
	ldh [$ffb4], a
	ld hl, OVR11_0C0C
	ld a, [hl]
	and $f8
	ld [hl], a
	ld hl, OVR11_0C13
	res 7, [hl]
	ret
