; ROM0 overworld reconstruction — stage 6.
; Relative range $065E-$0832; common instruction skeleton across JP/EN/DE/FR/IT/ES.

MACRO OVR6_DEFV16
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

OVR6_DEFV16 OVR6_0661, $d32c, $d3ad, $d3b2, $d3b2, $d3b2, $d3b2
OVR6_DEFV16 OVR6_0672, $d2e8, $d369, $d36e, $d36e, $d36e, $d36e
OVR6_DEFV16 OVR6_0684, $d2e9, $d36a, $d36f, $d36f, $d36f, $d36f
OVR6_DEFV16 OVR6_0688, $d2ea, $d36b, $d370, $d370, $d370, $d370
OVR6_DEFV16 OVR6_068C, $d2e7, $d368, $d36d, $d36d, $d36d, $d36d
OVR6_DEFV16 OVR6_06A5, $d2f0, $d371, $d376, $d376, $d376, $d376
OVR6_DEFV16 OVR6_06AF, $d2f1, $d372, $d377, $d377, $d377, $d377
OVR6_DEFV16 OVR6_06B3, $d2f2, $d373, $d378, $d378, $d378, $d378
OVR6_DEFV16 OVR6_06B7, $d2f3, $d374, $d379, $d379, $d379, $d379
OVR6_DEFV16 OVR6_06BB, $d2f4, $d375, $d37a, $d37a, $d37a, $d37a
OVR6_DEFV16 OVR6_06BF, $d2f5, $d376, $d37b, $d37b, $d37b, $d37b
OVR6_DEFV16 OVR6_06C4, $d2f6, $d377, $d37c, $d37c, $d37c, $d37c
OVR6_DEFV16 OVR6_06CC, $d2fb, $d37c, $d381, $d381, $d381, $d381
OVR6_DEFV16 OVR6_06D6, $d2fc, $d37d, $d382, $d382, $d382, $d382
OVR6_DEFV16 OVR6_06DA, $d2fd, $d37e, $d383, $d383, $d383, $d383
OVR6_DEFV16 OVR6_06DE, $d2fe, $d37f, $d384, $d384, $d384, $d384
OVR6_DEFV16 OVR6_06E2, $d2ff, $d380, $d385, $d385, $d385, $d385
OVR6_DEFV16 OVR6_06E6, $d300, $d381, $d386, $d386, $d386, $d386
OVR6_DEFV16 OVR6_06EB, $d301, $d382, $d387, $d387, $d387, $d387
OVR6_DEFV16 OVR6_06F3, $d306, $d387, $d38c, $d38c, $d38c, $d38c
OVR6_DEFV16 OVR6_06FD, $d307, $d388, $d38d, $d38d, $d38d, $d38d
OVR6_DEFV16 OVR6_0701, $d308, $d389, $d38e, $d38e, $d38e, $d38e
OVR6_DEFV16 OVR6_0705, $d309, $d38a, $d38f, $d38f, $d38f, $d38f
OVR6_DEFV16 OVR6_0709, $d30a, $d38b, $d390, $d390, $d390, $d390
OVR6_DEFV16 OVR6_070D, $d30b, $d38c, $d391, $d391, $d391, $d391
OVR6_DEFV16 OVR6_0711, $d30c, $d38d, $d392, $d392, $d392, $d392
OVR6_DEFV16 OVR6_0719, $d311, $d392, $d397, $d397, $d397, $d397
OVR6_DEFV16 OVR6_0723, $d312, $d393, $d398, $d398, $d398, $d398
OVR6_DEFV16 OVR6_0727, $d313, $d394, $d399, $d399, $d399, $d399
OVR6_DEFV16 OVR6_072B, $d314, $d395, $d39a, $d39a, $d39a, $d39a
OVR6_DEFV16 OVR6_072F, $d315, $d396, $d39b, $d39b, $d39b, $d39b
OVR6_DEFV16 OVR6_0733, $d316, $d397, $d39c, $d39c, $d39c, $d39c
OVR6_DEFV16 OVR6_0737, $d317, $d398, $d39d, $d39d, $d39d, $d39d
OVR6_DEFV16 OVR6_0756, $d2e8, $d369, $d36e, $d36e, $d36e, $d36e
OVR6_DEFV16 OVR6_0777, $d2e8, $d369, $d36e, $d36e, $d36e, $d36e
OVR6_DEFV16 OVR6_0788, $d42f, $d4b0, $d4b5, $d4b5, $d4b5, $d4b5
OVR6_DEFV16 OVR6_0790, $3eb1, $3e6d, $3e87, $3e8a, $3e85, $3e8c
OVR6_DEFV16 OVR6_0793, $d430, $d4b1, $d4b6, $d4b6, $d4b6, $d4b6
OVR6_DEFV16 OVR6_0796, $d42f, $d4b0, $d4b5, $d4b5, $d4b5, $d4b5
OVR6_DEFV16 OVR6_07AA, $d450, $d4d1, $d4d6, $d4d6, $d4d6, $d4d6
OVR6_DEFV16 OVR6_07BC, $3eb1, $3e6d, $3e87, $3e8a, $3e85, $3e8c
OVR6_DEFV16 OVR6_07BF, $d4b1, $d532, $d537, $d537, $d537, $d537
OVR6_DEFV16 OVR6_07FB, $d4a9, $d52a, $d52f, $d52f, $d52f, $d52f
OVR6_DEFV16 OVR6_07FE, $d460, $d4e1, $d4e6, $d4e6, $d4e6, $d4e6
OVR6_DEFV16 OVR6_SwitchToMapRomBank, $1275, $12bc, $12bc, $12bc, $12bc, $12bc

PURGE OVR6_DEFV16

IF DEF(_JP)
SECTION "Overworld stage 6", ROM0[$09b5]
ELSE
SECTION "Overworld stage 6", ROM0[$09fc]
ENDC
LoadTileBlockMap::
	ld hl, $c6e8
	ld a, [OVR6_0661]
	ld d, a
	ld bc, $0514
OVR6_L_0668::
	ld a, d
	ld [hli], a
	dec bc
	ld a, c
	or b
	jr nz, OVR6_L_0668
	ld hl, $c6e8
	ld a, [OVR6_0672]
	ldh [$ff8c], a
	add a $06
	ldh [$ff8b], a
	ld b, $00
	ld c, a
	add hl, bc
	add hl, bc
	add hl, bc
	ld c, $03
	add hl, bc
	ld a, [OVR6_0684]
	ld e, a
	ld a, [OVR6_0688]
	ld d, a
	ld a, [OVR6_068C]
	ld b, a
OVR6_L_0690::
	push hl
	ldh a, [$ff8c]
	ld c, a
OVR6_L_0694::
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, OVR6_L_0694
	pop hl
	ldh a, [$ff8b]
	add a l
	ld l, a
	jr nc, OVR6_L_06A2
	inc h
OVR6_L_06A2::
	dec b
	jr nz, OVR6_L_0690
	ld a, [OVR6_06A5]
	cp $ff
	jr z, OVR6_L_06CC
	call OVR6_SwitchToMapRomBank
	ld a, [OVR6_06AF]
	ld l, a
	ld a, [OVR6_06B3]
	ld h, a
	ld a, [OVR6_06B7]
	ld e, a
	ld a, [OVR6_06BB]
	ld d, a
	ld a, [OVR6_06BF]
	ldh [$ff8b], a
	ld a, [OVR6_06C4]
	ldh [$ff8c], a
	call LoadNorthSouthConnectionsTileMap
OVR6_L_06CC::
	ld a, [OVR6_06CC]
	cp $ff
	jr z, OVR6_L_06F3
	call OVR6_SwitchToMapRomBank
	ld a, [OVR6_06D6]
	ld l, a
	ld a, [OVR6_06DA]
	ld h, a
	ld a, [OVR6_06DE]
	ld e, a
	ld a, [OVR6_06E2]
	ld d, a
	ld a, [OVR6_06E6]
	ldh [$ff8b], a
	ld a, [OVR6_06EB]
	ldh [$ff8c], a
	call LoadNorthSouthConnectionsTileMap
OVR6_L_06F3::
	ld a, [OVR6_06F3]
	cp $ff
	jr z, OVR6_L_0719
	call OVR6_SwitchToMapRomBank
	ld a, [OVR6_06FD]
	ld l, a
	ld a, [OVR6_0701]
	ld h, a
	ld a, [OVR6_0705]
	ld e, a
	ld a, [OVR6_0709]
	ld d, a
	ld a, [OVR6_070D]
	ld b, a
	ld a, [OVR6_0711]
	ldh [$ff8b], a
	call LoadEastWestConnectionsTileMap
OVR6_L_0719::
	ld a, [OVR6_0719]
	cp $ff
	jr z, OVR6_L_073F
	call OVR6_SwitchToMapRomBank
	ld a, [OVR6_0723]
	ld l, a
	ld a, [OVR6_0727]
	ld h, a
	ld a, [OVR6_072B]
	ld e, a
	ld a, [OVR6_072F]
	ld d, a
	ld a, [OVR6_0733]
	ld b, a
	ld a, [OVR6_0737]
	ldh [$ff8b], a
	call LoadEastWestConnectionsTileMap
OVR6_L_073F::
	ret
LoadNorthSouthConnectionsTileMap::
	ld c, $03
OVR6_L_0742::
	push de
	push hl
	ldh a, [$ff8b]
	ld b, a
OVR6_L_0747::
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, OVR6_L_0747
	pop hl
	pop de
	ldh a, [$ff8c]
	add a l
	ld l, a
	jr nc, OVR6_L_0756
	inc h
OVR6_L_0756::
	ld a, [OVR6_0756]
	add a $06
	add a e
	ld e, a
	jr nc, OVR6_L_0760
	inc d
OVR6_L_0760::
	dec c
	jr nz, OVR6_L_0742
	ret
LoadEastWestConnectionsTileMap::
	push hl
	push de
	ld c, $03
OVR6_L_0768::
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, OVR6_L_0768
	pop de
	pop hl
	ldh a, [$ff8b]
	add a l
	ld l, a
	jr nc, OVR6_L_0777
	inc h
OVR6_L_0777::
	ld a, [OVR6_0777]
	add a $06
	add a e
	ld e, a
	jr nc, OVR6_L_0781
	inc d
OVR6_L_0781::
	dec b
	jr nz, LoadEastWestConnectionsTileMap
	ret
IsSpriteOrSignInFrontOfPlayer::
	xor a
	ldh [$ff8c], a
	ld a, [OVR6_0788]
	and a
	jr z, OVR6_L_07BA
	ld a, $35
	call OVR6_0790
	ld hl, OVR6_0793
	ld a, [OVR6_0796]
	ld b, a
	ld c, $00
OVR6_L_079C::
	inc c
	ld a, [hli]
	cp d
	jr z, OVR6_L_07A4
	inc hl
	jr OVR6_L_07B7
OVR6_L_07A4::
	ld a, [hli]
	cp e
	jr nz, OVR6_L_07B7
	push hl
	push bc
	ld hl, OVR6_07AA
	ld b, $00
	dec c
	add hl, bc
	ld a, [hl]
	ldh [$ff8c], a
	pop bc
	pop hl
	ret
OVR6_L_07B7::
	dec b
	jr nz, OVR6_L_079C
OVR6_L_07BA::
	ld a, $35
	call OVR6_07BC
	ld hl, OVR6_07BF
	ld b, $03
	ld d, $20
OVR6_L_07C6::
	ld a, [hli]
	cp c
	jr z, IsSpriteInFrontOfPlayer2
	dec b
	jr nz, OVR6_L_07C6
IsSpriteInFrontOfPlayer::
	ld d, $10
IsSpriteInFrontOfPlayer2::
	ld bc, $3c40
	ld a, [$c109]
	cp $04
	jr nz, OVR6_L_07E0
	ld a, b
	sub d
	ld b, a
	ld a, $08
	jr OVR6_L_07FB
OVR6_L_07E0::
	cp $00
	jr nz, OVR6_L_07EB
	ld a, b
	add a d
	ld b, a
	ld a, $04
	jr OVR6_L_07FB
OVR6_L_07EB::
	cp $0c
	jr nz, OVR6_L_07F6
	ld a, c
	add a d
	ld c, a
	ld a, $01
	jr OVR6_L_07FB
OVR6_L_07F6::
	ld a, c
	sub d
	ld c, a
	ld a, $02
OVR6_L_07FB::
	ld [OVR6_07FB], a
	ld a, [OVR6_07FE]
	and a
	ret z
	ld hl, $c110
	ld d, a
	ld e, $01
OVR6_L_0809::
	push hl
	ld a, [hli]
	and a
	jr z, OVR6_L_081D
	inc l
	ld a, [hli]
	inc a
	jr z, OVR6_L_081D
	inc l
	ld a, [hli]
	cp b
	jr nz, OVR6_L_081D
	inc l
	ld a, [hl]
	cp c
	jr z, OVR6_L_0827
OVR6_L_081D::
	pop hl
	ld a, l
	add a $10
	ld l, a
	inc e
	dec d
	jr nz, OVR6_L_0809
	ret
OVR6_L_0827::
	pop hl
	ld a, l
	and $f0
	inc a
	ld l, a
	set 7, [hl]
	ld a, e
	ldh [$ff8c], a
	ret
