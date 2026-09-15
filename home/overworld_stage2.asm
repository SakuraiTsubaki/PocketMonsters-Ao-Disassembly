; ROM0 overworld reconstruction — stage 2.
; NewBattle through the byte immediately before CheckMapConnections.
; JP: $063C-$0772; localized: $0683-$07B9.
; 311 bytes / 151 instructions; opcode skeleton identical across all 6 releases.

MACRO OVR2_DEFV16
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

OVR2_DEFV16 OVR2_0000, $d6ac, $d72d, $d732, $d732, $d732, $d732
OVR2_DEFV16 OVR2_0007, $315b, $30fd, $3117, $311a, $3115, $311c
OVR2_DEFV16 OVR2_000C, $d6ad, $d72e, $d733, $d733, $d733, $d733
OVR2_DEFV16 OVR2_0015, $7206, $6f12, $6f20, $6f27, $6f15, $6f21
OVR2_DEFV16 OVR2_0018, $3636, $35d6, $35f0, $35f3, $35ee, $35f5
OVR2_DEFV16 OVR2_0022, $d2dd, $d35e, $d363, $d363, $d363, $d363
OVR2_DEFV16 OVR2_002E, $0ce0, $0d27, $0d27, $0d27, $0d27, $0d27
OVR2_DEFV16 OVR2_0031, $d32d, $d3ae, $d3b3, $d3b3, $d3b3, $d3b3
OVR2_DEFV16 OVR2_0035, $0773, $07ba, $07ba, $07ba, $07ba, $07ba
OVR2_DEFV16 OVR2_0038, $d32d, $d3ae, $d3b3, $d3b3, $d3b3, $d3b3
OVR2_DEFV16 OVR2_003E, $d2e0, $d361, $d366, $d366, $d366, $d366
OVR2_DEFV16 OVR2_0042, $d2e1, $d362, $d367, $d367, $d367, $d367
OVR2_DEFV16 OVR2_0046, $d32e, $d3af, $d3b4, $d3b4, $d3b4, $d3b4
OVR2_DEFV16 OVR2_0053, $d6b5, $d736, $d73b, $d73b, $d73b, $d73b
OVR2_DEFV16 OVR2_005A, $44d5, $449d, $449d, $449d, $449d, $449d
OVR2_DEFV16 OVR2_005D, $3636, $35d6, $35f0, $35f3, $35ee, $35f5
OVR2_DEFV16 OVR2_0066, $08a2, $08e9, $08e9, $08e9, $08e9, $08e9
OVR2_DEFV16 OVR2_006D, $d6b2, $d733, $d738, $d738, $d738, $d738
OVR2_DEFV16 OVR2_0076, $0153, $019a, $019a, $019a, $019a, $019a
OVR2_DEFV16 OVR2_0083, $d32d, $d3ae, $d3b3, $d3b3, $d3b3, $d3b3
OVR2_DEFV16 OVR2_0087, $d32e, $d3af, $d3b4, $d3b4, $d3b4, $d3b4
OVR2_DEFV16 OVR2_008C, $d2e0, $d361, $d366, $d366, $d366, $d366
OVR2_DEFV16 OVR2_0094, $d2e1, $d362, $d367, $d367, $d367, $d367
OVR2_DEFV16 OVR2_009B, $d3ae, $d42f, $d434, $d434, $d434, $d434
OVR2_DEFV16 OVR2_00A9, $03b8, $03ff, $03ff, $03ff, $03ff, $03ff
OVR2_DEFV16 OVR2_00B3, $d3ae, $d42f, $d434, $d434, $d434, $d434
OVR2_DEFV16 OVR2_00B9, $d32d, $d3ae, $d3b3, $d3b3, $d3b3, $d3b3
OVR2_DEFV16 OVR2_00BD, $d6ba, $d73b, $d740, $d740, $d740, $d740
OVR2_DEFV16 OVR2_00C0, $d2dd, $d35e, $d363, $d363, $d363, $d363
OVR2_DEFV16 OVR2_00C3, $d6bb, $d73c, $d741, $d741, $d741, $d741
OVR2_DEFV16 OVR2_00C6, $089a, $08e1, $08e1, $08e1, $08e1, $08e1
OVR2_DEFV16 OVR2_00CB, $d2dd, $d35e, $d363, $d363, $d363, $d363
OVR2_DEFV16 OVR2_00CE, $d2e4, $d365, $d36a, $d36a, $d36a, $d36a
OVR2_DEFV16 OVR2_00D1, $d2e8, $d369, $d36e, $d36e, $d36e, $d36e
OVR2_DEFV16 OVR2_00D4, $d2e5, $d366, $d36b, $d36b, $d36b, $d36b
OVR2_DEFV16 OVR2_00D9, $d2dd, $d35e, $d363, $d363, $d363, $d363
OVR2_DEFV16 OVR2_00E2, $d2dc, $d35d, $d362, $d362, $d362, $d362
OVR2_DEFV16 OVR2_00E5, $20cf, $20ef, $20ef, $20eb, $20ef, $20ee
OVR2_DEFV16 OVR2_00E8, $0882, $08c9, $08c9, $08c9, $08c9, $08c9
OVR2_DEFV16 OVR2_00F3, $d2dd, $d35e, $d363, $d363, $d363, $d363
OVR2_DEFV16 OVR2_00F8, $4cc9, $4787, $4783, $4788, $4785, $4788
OVR2_DEFV16 OVR2_00FB, $3636, $35d6, $35f0, $35f3, $35ee, $35f5
OVR2_DEFV16 OVR2_00FE, $cd51, $cd5b, $cd5b, $cd5b, $cd5b, $cd5b
OVR2_DEFV16 OVR2_0104, $d6b1, $d732, $d737, $d737, $d737, $d737
OVR2_DEFV16 OVR2_0109, $0948, $098f, $098f, $098f, $098f, $098f
OVR2_DEFV16 OVR2_010E, $0882, $08c9, $08c9, $08c9, $08c9, $08c9
OVR2_DEFV16 OVR2_0111, $d6b5, $d736, $d73b, $d73b, $d73b, $d73b
OVR2_DEFV16 OVR2_011A, $d2e4, $d365, $d36a, $d36a, $d36a, $d36a
OVR2_DEFV16 OVR2_011D, $d2dd, $d35e, $d363, $d363, $d363, $d363
OVR2_DEFV16 OVR2_0120, $0882, $08c9, $08c9, $08c9, $08c9, $08c9
OVR2_DEFV16 OVR2_0124, $d2dc, $d35d, $d362, $d362, $d362, $d362
OVR2_DEFV16 OVR2_0127, $d6b5, $d736, $d73b, $d73b, $d73b, $d73b
OVR2_DEFV16 OVR2_012C, $1293, $12da, $12da, $12da, $12da, $12da
OVR2_DEFV16 OVR2_012F, $035f, $03a6, $03a6, $03a6, $03a6, $03a6

PURGE OVR2_DEFV16

IF DEF(_JP)
SECTION "Overworld stage 2", ROM0[$063c]
ELSE
SECTION "Overworld stage 2", ROM0[$0683]
ENDC

NewBattle::
	ld a, [OVR2_0000]
	bit 4, a
	jr nz, OWR2_L_001B
	call OVR2_0007
	jr nz, OWR2_L_001B
	ld a, [OVR2_000C]
	bit 4, a
	jr nz, OWR2_L_001B
	ld b, $0f
	ld hl, OVR2_0015
	jp OVR2_0018
OWR2_L_001B::
	and a
	ret
DoBikeSpeedup::
	ld a, [$cc57]
	and a
	ret nz
	ld a, [OVR2_0022]
	cp $1c
	jr nz, OWR2_L_002E
	ldh a, [$ffb4]
	and $70
	ret nz
OWR2_L_002E::
	jp OVR2_002E
CheckWarpsNoCollision::
	ld a, [OVR2_0031]
	and a
	jp z, OVR2_0035
	ld a, [OVR2_0038]
	ld b, $00
	ld c, a
	ld a, [OVR2_003E]
	ld d, a
	ld a, [OVR2_0042]
	ld e, a
	ld hl, OVR2_0046
OWR2_L_0049::
	ld a, [hli]
	cp d
	jr nz, OVR2_L_00AC
	ld a, [hli]
	cp e
	jr nz, OWR2_L_00AD
	push hl
	push bc
	ld hl, OVR2_0053
	set 2, [hl]
	ld b, $03
	ld hl, OVR2_005A
	call OVR2_005D
	pop bc
	pop hl
	jr c, OWR2_L_00B2
	push hl
	push bc
	call OVR2_0066
	pop bc
	pop hl
	jr nc, OWR2_L_00AD
	ld a, [OVR2_006D]
	bit 2, a
	jr nz, OWR2_L_00B2
	push de
	push bc
	call OVR2_0076
	pop bc
	pop de
	ldh a, [$ffb4]
	and $f0
	jr z, OWR2_L_00AD
	jr OWR2_L_00B2
CheckWarpsCollision::
	ld a, [OVR2_0083]
	ld c, a
	ld hl, OVR2_0087
OWR2_L_008A::
	ld a, [hli]
	ld b, a
	ld a, [OVR2_008C]
	cp b
	jr nz, OWR2_L_00A3
	ld a, [hli]
	ld b, a
	ld a, [OVR2_0094]
	cp b
	jr nz, OWR2_L_00A4
	ld a, [hli]
	ld [OVR2_009B], a
	ld a, [hl]
	ldh [$ff8b], a
	jr OWR2_L_00B9
OWR2_L_00A3::
	inc hl
OWR2_L_00A4::
	inc hl
	inc hl
	dec c
	jr nz, OWR2_L_008A
	jp OVR2_00A9
OWR2_L_00AC::
	inc hl
OWR2_L_00AD::
	inc hl
	inc hl
	jp OWR2_L_0132
OWR2_L_00B2::
	ld a, [hli]
	ld [OVR2_00B3], a
	ld a, [hli]
	ldh [$ff8b], a
OWR2_L_00B9::
	ld a, [OVR2_00B9]
	sub c
	ld [OVR2_00BD], a
	ld a, [OVR2_00C0]
	ld [OVR2_00C3], a
	call OVR2_00C6
	jr nz, OWR2_L_00ED
	ld a, [OVR2_00CB]
	ld [OVR2_00CE], a
	ld a, [OVR2_00D1]
	ld [OVR2_00D4], a
	ldh a, [$ff8b]
	ld [OVR2_00D9], a
	cp $52
	jr nz, OWR2_L_00E8
	ld a, $06
	ld [OVR2_00E2], a
	call OVR2_00E5
OWR2_L_00E8::
	call OVR2_00E8
	jr OWR2_L_0127
OWR2_L_00ED::
	ldh a, [$ff8b]
	cp $ff
	jr z, OWR2_L_011A
	ld [OVR2_00F3], a
	ld b, $1c
	ld hl, OVR2_00F8
	call OVR2_00FB
	ld a, [OVR2_00FE]
	dec a
	jr nz, OWR2_L_010E
	ld hl, OVR2_0104
	set 3, [hl]
	call OVR2_0109
	jr OWR2_L_0111
OWR2_L_010E::
	call OVR2_010E
OWR2_L_0111::
	ld hl, OVR2_0111
	res 0, [hl]
	res 1, [hl]
	jr OWR2_L_0127
OWR2_L_011A::
	ld a, [OVR2_011A]
	ld [OVR2_011D], a
	call OVR2_0120
	xor a
	ld [OVR2_0124], a
OWR2_L_0127::
	ld hl, OVR2_0127
	set 0, [hl]
	call OVR2_012C
	jp OVR2_012F
OWR2_L_0132::
	inc b
	dec c
	jp nz, OWR2_L_0049
