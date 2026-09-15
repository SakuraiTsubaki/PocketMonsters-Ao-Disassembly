; ROM0 overworld reconstruction — stage 14.
; Relative range $0EA3-$0F97; common instruction skeleton across JP/EN/DE/FR/IT/ES.

MACRO OVR14_DEFV16
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

OVR14_DEFV16 OVR14_0EA6, $16c7, $0061, $0061, $0061, $0061, $0061
OVR14_DEFV16 OVR14_0EAB, $d4a6, $d527, $d52c, $d52c, $d52c, $d52c
OVR14_DEFV16 OVR14_0EAF, $d4a5, $d526, $d52b, $d52b, $d52b, $d52b
OVR14_DEFV16 OVR14_0EB6, $cfac, $cfc5, $cfca, $cfca, $cfca, $cfca
OVR14_DEFV16 OVR14_0EB9, $d0de, $d119, $d11e, $d11e, $d11e, $d11e
OVR14_DEFV16 OVR14_0EBC, $d0df, $d11a, $d11f, $d11f, $d11f, $d11f
OVR14_DEFV16 OVR14_0EBF, $d327, $d3a8, $d3ad, $d3ad, $d3ad, $d3ad
OVR14_DEFV16 OVR14_0EC2, $3700, $36a0, $36ba, $36bd, $36b8, $36bf
OVR14_DEFV16 OVR14_0ECD, $3636, $35d6, $35f0, $35f3, $35ee, $35f5
OVR14_DEFV16 OVR14_0EF5, $cfb2, $cfcb, $cfd0, $cfd0, $cfd0, $cfd0
OVR14_DEFV16 OVR14_0EF8, $16e1, $007b, $007b, $007b, $007b, $007b
OVR14_DEFV16 OVR14_0EFD, $3e33, $3def, $3e09, $3e0c, $3e07, $3e0e
OVR14_DEFV16 OVR14_0F03, $d6b1, $d732, $d737, $d737, $d737, $d737
OVR14_DEFV16 OVR14_0F0A, $d6b2, $d733, $d738, $d738, $d738, $d738
OVR14_DEFV16 OVR14_0F11, $233f, $235f, $235f, $235b, $235f, $235e
OVR14_DEFV16 OVR14_0F14, $22f2, $2312, $2312, $230e, $2312, $2311
OVR14_DEFV16 OVR14_0F25, $361c, $35bc, $35d6, $35d9, $35d4, $35db
OVR14_DEFV16 OVR14_0F28, $4275, $423d, $423d, $423d, $423d, $423d
OVR14_DEFV16 OVR14_0F2F, $362d, $35cd, $35e7, $35ea, $35e5, $35ec
OVR14_DEFV16 OVR14_0F3E, $d0ff, $d13a, $d13f, $d13f, $d13f, $d13f
OVR14_DEFV16 OVR14_0F41, $d6af, $d730, $d735, $d735, $d735, $d735
OVR14_DEFV16 OVR14_0F49, $d6a7, $d728, $d72d, $d72d, $d72d, $d72d
OVR14_DEFV16 OVR14_0F51, $0950, $0997, $0997, $0997, $0997, $0997
OVR14_DEFV16 OVR14_0F54, $3636, $35d6, $35f0, $35f3, $35ee, $35f5
OVR14_DEFV16 OVR14_0F57, $22e7, $2307, $2307, $2303, $2307, $2306
OVR14_DEFV16 OVR14_0F5A, $208f, $20af, $20af, $20ab, $20af, $20ae
OVR14_DEFV16 OVR14_0F5E, $388f, $3831, $384b, $384e, $3849, $3850
OVR14_DEFV16 OVR14_0F79, $cf0d, $cf12, $cf17, $cf17, $cf17, $cf17
OVR14_DEFV16 OVR14_0F8B, $d2de, $d35f, $d364, $d364, $d364, $d364
OVR14_DEFV16 OVR14_0F8E, $171b, $00b5, $00b5, $00b5, $00b5, $00b5
OVR14_DEFV16 OVR14_EXT_05F9, $0950, $0997, $0997, $0997, $0997, $0997
OVR14_DEFV16 OVR14_EXT_064A, $09a1, $09e8, $09e8, $09e8, $09e8, $09e8
OVR14_DEFV16 OVR14_EXT_065E, $09b5, $09fc, $09fc, $09fc, $09fc, $09fc

PURGE OVR14_DEFV16

IF DEF(_JP)
SECTION "Overworld stage 14", ROM0[$11fa]
ELSE
SECTION "Overworld stage 14", ROM0[$1241]
ENDC
LoadMapData::
	ldh a, [$ffb8]
	push af
	call OVR14_0EA6
	ld a, $98
	ld [OVR14_0EAB], a
	xor a
	ld [OVR14_0EAF], a
	ldh [$ffaf], a
	ldh [$ffae], a
	ld [OVR14_0EB6], a
	ld [OVR14_0EB9], a
	ld [OVR14_0EBC], a
	ld [OVR14_0EBF], a
	call OVR14_0EC2
	call LoadMapHeader
	ld b, $05
	ld hl, $785b
	call OVR14_0ECD
	call OVR14_EXT_065E
	call OVR14_EXT_064A
	call LoadCurrentMapView
	ld hl, $c3a0
	ld de, $9800
	ld b, $12
OVR14_L_0EE1::
	ld c, $14
OVR14_L_0EE3::
	ld a, [hli]
	ld [de], a
	inc e
	dec c
	jr nz, OVR14_L_0EE3
	ld a, $0c
	add a e
	ld e, a
	jr nc, OVR14_L_0EF0
	inc d
OVR14_L_0EF0::
	dec b
	jr nz, OVR14_L_0EE1
	ld a, $01
	ld [OVR14_0EF5], a
	call OVR14_0EF8
	ld b, $09
	call OVR14_0EFD
	call OVR14_EXT_05F9
	ld a, [OVR14_0F03]
	and $18
	jr nz, OVR14_L_0F17
	ld a, [OVR14_0F0A]
	bit 1, a
	jr nz, OVR14_L_0F17
	call OVR14_0F11
	call OVR14_0F14
OVR14_L_0F17::
	pop af
	ldh [$ffb8], a
	ld [$2000], a
	ret
SwitchToMapRomBank::
	push hl
	push bc
	ld c, a
	ld b, $00
	ld a, $03
	call OVR14_0F25
	ld hl, OVR14_0F28
	add hl, bc
	ld a, [hl]
	ldh [$ffe8], a
	call OVR14_0F2F
	ldh a, [$ffe8]
	ldh [$ffb8], a
	ld [$2000], a
	pop bc
	pop hl
	ret
IgnoreInputForHalfSecond::
	ld a, $1e
	ld [OVR14_0F3E], a
	ld hl, OVR14_0F41
	ld a, [hl]
	or $26
	ld [hl], a
	ret
ResetUsingStrengthOutOfBattleBit::
	ld hl, OVR14_0F49
	res 0, [hl]
	ret
ForceBikeOrSurf::
	ld b, $05
	ld hl, OVR14_0F51
	call OVR14_0F54
	jp OVR14_0F57
CheckForUserInterruption::
	call OVR14_0F5A
	push bc
	call OVR14_0F5E
	pop bc
	ldh a, [$ffb4]
	cp $46
	jr z, OVR14_L_0F73
	ldh a, [$ffb5]
	and $09
	jr nz, OVR14_L_0F73
	dec c
	jr nz, CheckForUserInterruption
	and a
	ret
OVR14_L_0F73::
	scf
	ret
LoadDestinationWarpPosition::
	ld b, a
	ldh a, [$ffb8]
	push af
	ld a, [OVR14_0F79]
	ldh [$ffb8], a
	ld [$2000], a
	ld a, b
	add a a
	add a a
	ld c, a
	ld b, $00
	add hl, bc
	ld bc, $0004
	ld de, OVR14_0F8B
	call OVR14_0F8E
	pop af
	ldh [$ffb8], a
	ld [$2000], a
	ret
