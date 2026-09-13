; ROM0 overworld reconstruction — stage 4.
; PlayMapChangeSound, CheckIfInOutsideMap, and ExtraWarpCheck.
; JP: $0882-$08D7; localized: $08C9-$091E.
; 86 bytes / 41 instructions; opcode skeleton identical across all 6 releases.

MACRO OVR4_DEFV16
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

OVR4_DEFV16 OVR4_0000, $c448, $c448, $c448, $c448, $c448, $c448
OVR4_DEFV16 OVR4_000D, $2391, $23b1, $23b1, $23ad, $23b1, $23b0
OVR4_DEFV16 OVR4_0010, $d2dc, $d35d, $d362, $d362, $d362, $d362
OVR4_DEFV16 OVR4_0015, $20cf, $20ef, $20ef, $20eb, $20ef, $20ee
OVR4_DEFV16 OVR4_0018, $d2e6, $d367, $d36c, $d36c, $d36c, $d36c
OVR4_DEFV16 OVR4_0020, $d2dd, $d35e, $d363, $d363, $d363, $d363
OVR4_DEFV16 OVR4_0037, $d2e6, $d367, $d36c, $d36c, $d36c, $d36c
OVR4_DEFV16 OVR4_0049, $4437, $43ff, $43ff, $43ff, $43ff, $43ff
OVR4_DEFV16 OVR4_004E, $4486, $444e, $444e, $444e, $444e, $444e
OVR4_DEFV16 OVR4_0053, $3636, $35d6, $35f0, $35f3, $35ee, $35f5

PURGE OVR4_DEFV16

IF DEF(_JP)
SECTION "Overworld stage 4", ROM0[$0882]
ELSE
SECTION "Overworld stage 4", ROM0[$08c9]
ENDC

PlayMapChangeSound::
	ld a, [OVR4_0000]
	cp $0b
	jr nz, .didNotGoThroughDoor
	ld a, $ad
	jr .playSound
.didNotGoThroughDoor
	ld a, $b5
.playSound
	call OVR4_000D
	ld a, [OVR4_0010]
	and a
	ret nz
	jp OVR4_0015

CheckIfInOutsideMap::
	ld a, [OVR4_0018]
	and a
	ret z
	cp $17
	ret

ExtraWarpCheck::
	ld a, [OVR4_0020]
	cp $61
	jr z, .useFunction1
	cp $c7
	jr z, .useFunction2
	cp $c8
	jr z, .useFunction2
	cp $ca
	jr z, .useFunction2
	cp $52
	jr z, .useFunction2
	ld a, [OVR4_0037]
	and a
	jr z, .useFunction2
	cp $0d
	jr z, .useFunction2
	cp $0e
	jr z, .useFunction2
	cp $17
	jr z, .useFunction2
.useFunction1
	ld hl, OVR4_0049
	jr .doBankswitch
.useFunction2
	ld hl, OVR4_004E
.doBankswitch
	ld b, $03
	jp OVR4_0053
