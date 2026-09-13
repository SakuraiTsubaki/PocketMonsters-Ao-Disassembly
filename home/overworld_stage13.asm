; ROM0 overworld reconstruction — stage 13.
; Relative range $0CDE-$0EA2; common instruction skeleton across JP/EN/DE/FR/IT/ES.

MACRO OVR13_DEFV16
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

OVR13_DEFV16 OVR13_0CE0, $7467, $7113, $710c, $7103, $710d, $7115
OVR13_DEFV16 OVR13_0CE3, $3636, $35d6, $35f0, $35f3, $35ee, $35f5
OVR13_DEFV16 OVR13_0CE6, $d2e6, $d367, $d36c, $d36c, $d36c, $d36c
OVR13_DEFV16 OVR13_0CE9, $d0de, $d119, $d11e, $d11e, $d11e, $d11e
OVR13_DEFV16 OVR13_0CEC, $d2dd, $d35e, $d363, $d363, $d363, $d363
OVR13_DEFV16 OVR13_0CF2, $d2e6, $d367, $d36c, $d36c, $d36c, $d36c
OVR13_DEFV16 OVR13_0CF8, $d2e6, $d367, $d36c, $d36c, $d36c, $d36c
OVR13_DEFV16 OVR13_0D00, $0167, $01ae, $01ae, $01ae, $01ae, $01ae
OVR13_DEFV16 OVR13_0D03, $d2dd, $d35e, $d363, $d363, $d363, $d363
OVR13_DEFV16 OVR13_0D13, $d2e6, $d367, $d36c, $d36c, $d36c, $d36c
OVR13_DEFV16 OVR13_0D20, $d2f0, $d371, $d376, $d376, $d376, $d376
OVR13_DEFV16 OVR13_0D23, $d2fb, $d37c, $d381, $d381, $d381, $d381
OVR13_DEFV16 OVR13_0D26, $d306, $d387, $d38c, $d38c, $d38c, $d38c
OVR13_DEFV16 OVR13_0D29, $d311, $d392, $d397, $d397, $d397, $d397
OVR13_DEFV16 OVR13_0D2C, $d2ef, $d370, $d375, $d375, $d375, $d375
OVR13_DEFV16 OVR13_0D34, $d2f0, $d371, $d376, $d376, $d376, $d376
OVR13_DEFV16 OVR13_0D3E, $d2fb, $d37c, $d381, $d381, $d381, $d381
OVR13_DEFV16 OVR13_0D48, $d306, $d387, $d38c, $d38c, $d38c, $d38c
OVR13_DEFV16 OVR13_0D52, $d311, $d392, $d397, $d397, $d397, $d397
OVR13_DEFV16 OVR13_0D59, $d328, $d3a9, $d3ae, $d3ae, $d3ae, $d3ae
OVR13_DEFV16 OVR13_0D5D, $d329, $d3aa, $d3af, $d3af, $d3af, $d3af
OVR13_DEFV16 OVR13_0D61, $d328, $d3a9, $d3ae, $d3ae, $d3ae, $d3ae
OVR13_DEFV16 OVR13_0D65, $d329, $d3aa, $d3af, $d3af, $d3af, $d3af
OVR13_DEFV16 OVR13_0D69, $d32c, $d3ad, $d3b2, $d3b2, $d3b2, $d3b2
OVR13_DEFV16 OVR13_0D6F, $d32d, $d3ae, $d3b3, $d3b3, $d3b3, $d3b3
OVR13_DEFV16 OVR13_0D76, $d32e, $d3af, $d3b4, $d3b4, $d3b4, $d3b4
OVR13_DEFV16 OVR13_0D85, $d42f, $d4b0, $d4b5, $d4b5, $d4b5, $d4b5
OVR13_DEFV16 OVR13_0D8C, $d450, $d4d1, $d4d6, $d4d6, $d4d6, $d4d6
OVR13_DEFV16 OVR13_0D95, $d430, $d4b1, $d4b6, $d4b6, $d4b6, $d4b6
OVR13_DEFV16 OVR13_0DB2, $d6ad, $d72e, $d733, $d733, $d733, $d733
OVR13_DEFV16 OVR13_0DBB, $d460, $d4e1, $d4e6, $d4e6, $d4e6, $d4e6
OVR13_DEFV16 OVR13_0DE0, $d460, $d4e1, $d4e6, $d4e6, $d4e6, $d4e6
OVR13_DEFV16 OVR13_0E03, $d463, $d4e4, $d4e9, $d4e9, $d4e9, $d4e9
OVR13_DEFV16 OVR13_0E28, $d483, $d504, $d509, $d509, $d509, $d509
OVR13_DEFV16 OVR13_0E39, $d483, $d504, $d509, $d509, $d509, $d509
OVR13_DEFV16 OVR13_0E46, $d483, $d504, $d509, $d509, $d509, $d509
OVR13_DEFV16 OVR13_0E5C, $3eb1, $3e6d, $3e87, $3e8a, $3e85, $3e8c
OVR13_DEFV16 OVR13_0E5F, $4f2e, $4eb8, $4eb8, $4eb8, $4eb8, $4eb8
OVR13_DEFV16 OVR13_0E64, $3636, $35d6, $35f0, $35f3, $35ee, $35f5
OVR13_DEFV16 OVR13_0E68, $d2e7, $d368, $d36d, $d36d, $d36d, $d36d
OVR13_DEFV16 OVR13_0E6C, $d4a3, $d524, $d529, $d529, $d529, $d529
OVR13_DEFV16 OVR13_0E6F, $d2e8, $d369, $d36e, $d36e, $d36e, $d36e
OVR13_DEFV16 OVR13_0E73, $d4a4, $d525, $d52a, $d52a, $d52a, $d52a
OVR13_DEFV16 OVR13_0E76, $d2dd, $d35e, $d363, $d363, $d363, $d363
OVR13_DEFV16 OVR13_0E86, $4085, $404d, $404d, $404d, $404d, $404d
OVR13_DEFV16 OVR13_0E8C, $d2da, $d35b, $d360, $d360, $d360, $d360
OVR13_DEFV16 OVR13_0E90, $d2db, $d35c, $d361, $d361, $d361, $d361

PURGE OVR13_DEFV16

IF DEF(_JP)
SECTION "Overworld stage 13", ROM0[$1035]
ELSE
SECTION "Overworld stage 13", ROM0[$107c]
ENDC
LoadMapHeader::
	ld b, $03
	ld hl, OVR13_0CE0
	call OVR13_0CE3
	ld a, [OVR13_0CE6]
	ld [OVR13_0CE9], a
	ld a, [OVR13_0CEC]
	call SwitchToMapRomBank
	ld a, [OVR13_0CF2]
	ld b, a
	res 7, a
	ld [OVR13_0CF8], a
	ldh [$ff8b], a
	bit 7, b
	ret nz
	ld hl, OVR13_0D00
	ld a, [OVR13_0D03]
	sla a
	jr nc, OVR13_L_0D0B
	inc h
OVR13_L_0D0B::
	add a l
	ld l, a
	jr nc, OVR13_L_0D10
	inc h
OVR13_L_0D10::
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, OVR13_0D13
	ld c, $0a
OVR13_L_0D18::
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, OVR13_L_0D18
	ld a, $ff
	ld [OVR13_0D20], a
	ld [OVR13_0D23], a
	ld [OVR13_0D26], a
	ld [OVR13_0D29], a
	ld a, [OVR13_0D2C]
	ld b, a
	bit 3, b
	jr z, OVR13_L_0D3A
	ld de, OVR13_0D34
	call CopyMapConnectionHeader
OVR13_L_0D3A::
	bit 2, b
	jr z, OVR13_L_0D44
	ld de, OVR13_0D3E
	call CopyMapConnectionHeader
OVR13_L_0D44::
	bit 1, b
	jr z, OVR13_L_0D4E
	ld de, OVR13_0D48
	call CopyMapConnectionHeader
OVR13_L_0D4E::
	bit 0, b
	jr z, OVR13_L_0D58
	ld de, OVR13_0D52
	call CopyMapConnectionHeader
OVR13_L_0D58::
	ld a, [hli]
	ld [OVR13_0D59], a
	ld a, [hli]
	ld [OVR13_0D5D], a
	push hl
	ld a, [OVR13_0D61]
	ld l, a
	ld a, [OVR13_0D65]
	ld h, a
	ld de, OVR13_0D69
	ld a, [hli]
	ld [de], a
	ld a, [hli]
	ld [OVR13_0D6F], a
	and a
	jr z, OVR13_L_0D84
	ld c, a
	ld de, OVR13_0D76
OVR13_L_0D79::
	ld b, $04
OVR13_L_0D7B::
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, OVR13_L_0D7B
	dec c
	jr nz, OVR13_L_0D79
OVR13_L_0D84::
	ld a, [hli]
	ld [OVR13_0D85], a
	and a
	jr z, OVR13_L_0DB2
	ld c, a
	ld de, OVR13_0D8C
	ld a, d
	ldh [$ff95], a
	ld a, e
	ldh [$ff96], a
	ld de, OVR13_0D95
OVR13_L_0D98::
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	push de
	ldh a, [$ff95]
	ld d, a
	ldh a, [$ff96]
	ld e, a
	ld a, [hli]
	ld [de], a
	inc de
	ld a, d
	ldh [$ff95], a
	ld a, e
	ldh [$ff96], a
	pop de
	dec c
	jr nz, OVR13_L_0D98
OVR13_L_0DB2::
	ld a, [OVR13_0DB2]
	bit 5, a
	jp nz, OVR13_L_0E5A
	ld a, [hli]
	ld [OVR13_0DBB], a
	push hl
	ld hl, $c110
	ld de, $c210
	xor a
	ld b, $f0
OVR13_L_0DC8::
	ld [hli], a
	ld [de], a
	inc e
	dec b
	jr nz, OVR13_L_0DC8
	ld hl, $c112
	ld de, $0010
	ld c, $0f
OVR13_L_0DD6::
	ld [hl], $ff
	add hl, de
	dec c
	jr nz, OVR13_L_0DD6
	pop hl
	ld de, $c110
	ld a, [OVR13_0DE0]
	and a
	jp z, OVR13_L_0E5A
	ld b, a
	ld c, $00
OVR13_L_0DEA::
	ld a, [hli]
	ld [de], a
	inc d
	ld a, $04
	add a e
	ld e, a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hli]
	ld [de], a
	ld a, [hli]
	ldh [$ff8d], a
	ld a, [hli]
	ldh [$ff8e], a
	push bc
	push hl
	ld b, $00
	ld hl, OVR13_0E03
	add hl, bc
	ldh a, [$ff8d]
	ld [hli], a
	ldh a, [$ff8e]
	ld [hl], a
	ldh a, [$ff8e]
	ldh [$ff8d], a
	and $3f
	ld [hl], a
	pop hl
	ldh a, [$ff8d]
	bit 6, a
	jr nz, OVR13_L_0E21
	bit 7, a
	jr nz, OVR13_L_0E35
	jr OVR13_L_0E45
OVR13_L_0E21::
	ld a, [hli]
	ldh [$ff8d], a
	ld a, [hli]
	ldh [$ff8e], a
	push hl
	ld hl, OVR13_0E28
	add hl, bc
	ldh a, [$ff8d]
	ld [hli], a
	ldh a, [$ff8e]
	ld [hl], a
	pop hl
	jr OVR13_L_0E4E
OVR13_L_0E35::
	ld a, [hli]
	ldh [$ff8d], a
	push hl
	ld hl, OVR13_0E39
	add hl, bc
	ldh a, [$ff8d]
	ld [hli], a
	xor a
	ld [hl], a
	pop hl
	jr OVR13_L_0E4E
OVR13_L_0E45::
	push hl
	ld hl, OVR13_0E46
	add hl, bc
	xor a
	ld [hli], a
	ld [hl], a
	pop hl
OVR13_L_0E4E::
	pop bc
	dec d
	ld a, $0a
	add a e
	ld e, a
	inc c
	inc c
	dec b
	jp nz, OVR13_L_0DEA
OVR13_L_0E5A::
	ld a, $19
	call OVR13_0E5C
	ld hl, OVR13_0E5F
	ld b, $03
	call OVR13_0E64
	pop hl
	ld a, [OVR13_0E68]
	add a a
	ld [OVR13_0E6C], a
	ld a, [OVR13_0E6F]
	add a a
	ld [OVR13_0E73], a
	ld a, [OVR13_0E76]
	ld c, a
	ld b, $00
	ldh a, [$ffb8]
	push af
	ld a, $03
	ldh [$ffb8], a
	ld [$2000], a
	ld hl, OVR13_0E86
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld [OVR13_0E8C], a
	ld a, [hl]
	ld [OVR13_0E90], a
	pop af
	ldh [$ffb8], a
	ld [$2000], a
	ret
CopyMapConnectionHeader::
	ld c, $0b
OVR13_L_0E9C::
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, OVR13_L_0E9C
	ret
