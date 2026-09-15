; Pocket Monsters Ao / Pokemon Blue ROM0 Pokemon/party home routines.
; Reconstructed from all six source ROMs. Common code is shared;
; release-specific addresses and localized status tiles are isolated below.

MACRO PKM_DEFV16
IF DEF(_JP)
    DEF \\1 EQU \\2
ELIF DEF(_EN)
    DEF \\1 EQU \\3
ELIF DEF(_DE)
    DEF \\1 EQU \\4
ELIF DEF(_FR)
    DEF \\1 EQU \\5
ELIF DEF(_IT)
    DEF \\1 EQU \\6
ELIF DEF(_ES)
    DEF \\1 EQU \\7
ELSE
    FAIL "Define exactly one release symbol"
ENDC
ENDM

PKM_DEFV16 PKM_V16_00, $cf7b, $cf94, $cf99, $cf99, $cf99, $cf99
PKM_DEFV16 PKM_V16_01, $45be, $45b6, $45b8, $45b8, $45b7, $45b6
PKM_DEFV16 PKM_V16_02, $3636, $35d6, $35f0, $35f3, $35ee, $35f5
PKM_DEFV16 PKM_V16_03, $d0b9, $d0dc, $d0e1, $d0e1, $d0e1, $d0e1
PKM_DEFV16 PKM_V16_04, $d087, $d0aa, $d0af, $d0af, $d0af, $d0af
PKM_DEFV16 PKM_V16_05, $d0e3, $d11e, $d123, $d123, $d123, $d123
PKM_DEFV16 PKM_V16_06, $cf78, $cf91, $cf96, $cf96, $cf96, $cf96
PKM_DEFV16 PKM_V16_07, $3eb1, $3e6d, $3e87, $3e8a, $3e85, $3e8c
PKM_DEFV16 PKM_V16_08, $15fd, $1665, $1665, $1662, $1665, $1665
PKM_DEFV16 PKM_V16_09, $73c1, $70d0, $70de, $70eb, $70d9, $70df
PKM_DEFV16 PKM_V16_0A, $2391, $23b1, $23b1, $23ad, $23b1, $23b0
PKM_DEFV16 PKM_V16_0B, $37a6, $3748, $3762, $3765, $3760, $3767
PKM_DEFV16 PKM_V16_0C, $57fc, $5446, $5446, $5446, $5446, $5446
PKM_DEFV16 PKM_V16_0D, $361c, $35bc, $35d6, $35d9, $35d4, $35db
PKM_DEFV16 PKM_V16_0E, $362d, $35cd, $35e7, $35ea, $35e5, $35ec
PKM_DEFV16 PKM_V16_0F, $3e18, $3dd4, $3dee, $3df1, $3dec, $3df3
PKM_DEFV16 PKM_V16_10, $16e8, $0082, $0082, $0082, $0082, $0082
PKM_DEFV16 PKM_V16_11, $3720, $36c0, $36da, $36dd, $36d8, $36df
PKM_DEFV16 PKM_V16_12, $d6af, $d730, $d735, $d735, $d735, $d735
PKM_DEFV16 PKM_V16_13, $d123, $d163, $d168, $d168, $d168, $d168
PKM_DEFV16 PKM_V16_14, $d0e4, $d11f, $d124, $d124, $d124, $d124
PKM_DEFV16 PKM_V16_15, $d078, $d09b, $d0a0, $d0a0, $d0a0, $d0a0
PKM_DEFV16 PKM_V16_16, $3b20, $3ac2, $3adc, $3adf, $3ada, $3ae1
PKM_DEFV16 PKM_V16_17, $3c30, $3bec, $3c06, $3c09, $3c04, $3c0b
PKM_DEFV16 PKM_V16_18, $cf79, $cf92, $cf97, $cf97, $cf97, $cf97
PKM_DEFV16 PKM_V16_19, $d124, $d164, $d169, $d169, $d169, $d169
PKM_DEFV16 PKM_V16_1A, $cfc0, $cfd9, $cfde, $cfde, $cfde, $cfde
PKM_DEFV16 PKM_V16_1B, $77ee, $72ed, $72f0, $72fb, $730f, $730d
PKM_DEFV16 PKM_V16_1C, $d05a, $d07d, $d082, $d082, $d082, $d082
PKM_DEFV16 PKM_V16_1D, $7b33, $7613, $7614, $7622, $7638, $7638
PKM_DEFV16 PKM_V16_1E, $70b0, $6cd2, $6ce1, $6ce0, $6cf0, $6cf0
PKM_DEFV16 PKM_V16_1F, $70c1, $6ce3, $6cf2, $6cf1, $6d01, $6d01
PKM_DEFV16 PKM_V16_20, $41d2, $47df, $4835, $482b, $4857, $486b
PKM_DEFV16 PKM_V16_21, $cfa0, $cfb9, $cfbe, $cfbe, $cfbe, $cfbe
PKM_DEFV16 PKM_V16_22, $3ca3, $3c5f, $3c79, $3c7c, $3c77, $3c7e
PKM_DEFV16 PKM_V16_23, $d092, $d0b5, $d0ba, $d0ba, $d0ba, $d0ba
PKM_DEFV16 PKM_V16_24, $3ae5, $3a87, $3aa1, $3aa4, $3a9f, $3aa6
PKM_DEFV16 PKM_V16_25, $d095, $d0b8, $d0bd, $d0bd, $d0bd, $d0bd
PKM_DEFV16 PKM_V16_26, $171b, $00b5, $00b5, $00b5, $00b5, $00b5
PKM_DEFV16 PKM_V16_27, $d09f, $d0c2, $d0c7, $d0c7, $d0c7, $d0c7
PKM_DEFV16 PKM_V16_28, $1703, $009d, $009d, $009d, $009d, $009d
PKM_DEFV16 PKM_V16_29, $d257, $d2b5, $d2ba, $d2ba, $d2ba, $d2ba
PKM_DEFV16 PKM_V16_2A, $3adb, $3a7d, $3a97, $3a9a, $3a95, $3a9c
PKM_DEFV16 PKM_V16_2B, $cd68, $cd6d, $cd6d, $cd6d, $cd6d, $cd6d
PKM_DEFV16 PKM_V16_2C, $0006, $000b, $000b, $000b, $000b, $000b

IF DEF(_JP)
    DEF PKM_STATUS_AILMENT_BANK EQU $1e
    DEF PKM_FAINT_0 EQU $cb
    DEF PKM_FAINT_1 EQU $de
    DEF PKM_FAINT_2 EQU $bc
ELIF DEF(_DE)
    DEF PKM_STATUS_AILMENT_BANK EQU $1d
    DEF PKM_FAINT_0 EQU $81
    DEF PKM_FAINT_1 EQU $92
    DEF PKM_FAINT_2 EQU $86
ELIF DEF(_IT)
    DEF PKM_STATUS_AILMENT_BANK EQU $1d
    DEF PKM_FAINT_0 EQU $84
    DEF PKM_FAINT_1 EQU $92
    DEF PKM_FAINT_2 EQU $93
ELIF DEF(_ES)
    DEF PKM_STATUS_AILMENT_BANK EQU $1d
    DEF PKM_FAINT_0 EQU $83
    DEF PKM_FAINT_1 EQU $84
    DEF PKM_FAINT_2 EQU $81
ELSE ; EN/FR
    DEF PKM_STATUS_AILMENT_BANK EQU $1d
    DEF PKM_FAINT_0 EQU $85
    DEF PKM_FAINT_1 EQU $8d
    DEF PKM_FAINT_2 EQU $93
ENDC

PURGE PKM_DEFV16

IF DEF(_JP)
SECTION "Pokemon home", ROM0[$12ef]
ELSE
SECTION "Pokemon home", ROM0[$1336]
ENDC

DrawHPBar::
	push hl
	push de
	push bc
	ld a, $71
	ld [hli], a
	ld a, $62
	ld [hli], a
	push hl
	ld a, $63
PkmL_000C::
	ld [hli], a
	dec d
	jr nz, PkmL_000C
	ld a, [PKM_V16_00]
	dec a
	ld a, $6d
	jr z, PkmL_0019
	dec a
PkmL_0019::
	ld [hl], a
	pop hl
	ld a, e
	and a
	jr nz, PkmL_0025
	ld a, c
	and a
	jr z, PkmL_0038
	ld e, $01
PkmL_0025::
	ld a, e
	sub $08
	jr c, PkmL_0034
	ld e, a
	ld a, $6b
	ld [hli], a
	ld a, e
	and a
	jr z, PkmL_0038
	jr PkmL_0025
PkmL_0034::
	ld a, $63
	add a, e
	ld [hl], a
PkmL_0038::
	pop bc
	pop de
	pop hl
	ret
LoadMonData::
	ld hl, PKM_V16_01
	ld b, $01
	jp PKM_V16_02
OverwritewMoves::
	ld hl, PKM_V16_03
	ld e, b
	ld d, $00
	add hl, de
	ld a, c
	ld [hl], a
	ret
LoadFlippedFrontSpriteByMonIndex::
	ld a, $01
	ld [PKM_V16_04], a
LoadFrontSpriteByMonIndex::
	push hl
	ld a, [PKM_V16_05]
	push af
	ld a, [PKM_V16_06]
	ld [PKM_V16_05], a
	ld a, $3a
	call PKM_V16_07
	ld hl, PKM_V16_05
	ld a, [hl]
	pop bc
	ld [hl], b
	and a
	pop hl
	jr z, PkmL_0071
	cp $98
	jr c, PkmL_0077
PkmL_0071::
	ld a, $01
	ld [PKM_V16_06], a
	ret
PkmL_0077::
	push hl
	ld de, $9000
	call PKM_V16_08
	pop hl
	ldh a, [$b8]
	push af
	ld a, $0f
	ldh [$b8], a
	ld [$2000], a
	xor a
	ldh [$e1], a
	call PKM_V16_09
	xor a
	ld [PKM_V16_04], a
	pop af
	ldh [$b8], a
	ld [$2000], a
	ret
PlayCry::
	call GetCryData
	call PKM_V16_0A
	jp PKM_V16_0B
GetCryData::
	dec a
	ld c, a
	ld b, $00
	ld hl, PKM_V16_0C
	add hl, bc
	add hl, bc
	add hl, bc
	ld a, $0e
	call PKM_V16_0D
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld [$c0f1], a
	ld a, [hl]
	ld [$c0f2], a
	call PKM_V16_0E
	ld a, b
	ld c, $14
	rlca
	add a, b
	add a, c
	ret
DisplayPartyMenu::
	ldh a, [$d7]
	push af
	xor a
	ldh [$d7], a
	call PKM_V16_0F
	call PKM_V16_10
	call PartyMenuInit
	call DrawPartyMenu
	jp HandlePartyMenuInput
GoBackToPartyMenu::
	ldh a, [$d7]
	push af
	xor a
	ldh [$d7], a
	call PartyMenuInit
	call RedrawPartyMenu
	jp HandlePartyMenuInput
PartyMenuInit::
	ld a, $01
	call PKM_V16_0D
	call PKM_V16_11
	ld hl, PKM_V16_12
	set 6, [hl]
	xor a
	ld [$cc49], a
	ld [$cc37], a
	ld hl, $cc24
	inc a
	ld [hli], a
	xor a
	ld [hli], a
	ld a, [$cc2b]
	push af
	ld [hli], a
	inc hl
	ld a, [PKM_V16_13]
	and a
	jr z, PkmL_0112
	dec a
PkmL_0112::
	ld [hli], a
	ld a, [PKM_V16_14]
	and a
	ld a, $03
	jr z, PkmL_0120
	xor a
	ld [PKM_V16_14], a
	inc a
PkmL_0120::
	ld [hli], a
	pop af
	ld [hl], a
	ret
HandlePartyMenuInput::
	ld a, $01
	ld [$cc4a], a
	ld a, $40
	ld [PKM_V16_15], a
	call PKM_V16_16
	call PKM_V16_17
	ld b, a
	xor a
	ld [PKM_V16_15], a
	ld a, [$cc26]
	ld [$cc2b], a
	ld hl, PKM_V16_12
	res 6, [hl]
	ld a, [$cc35]
	and a
	jp nz, PkmL_0176
	pop af
	ldh [$d7], a
	bit 1, b
	jr nz, PkmL_0171
	ld a, [PKM_V16_13]
	and a
	jr z, PkmL_0171
	ld a, [$cc26]
	ld [PKM_V16_18], a
	ld hl, PKM_V16_19
	ld b, $00
	ld c, a
	add hl, bc
	ld a, [hl]
	ld [PKM_V16_06], a
	ld [PKM_V16_1A], a
	call PKM_V16_0E
	and a
	ret
PkmL_0171::
	call PKM_V16_0E
	scf
	ret
PkmL_0176::
	bit 1, b
	jr z, PkmL_018E
	ld b, $04
	ld hl, PKM_V16_1B
	call PKM_V16_02
	xor a
	ld [$cc35], a
	ld [PKM_V16_1C], a
	call RedrawPartyMenu
	jr HandlePartyMenuInput
PkmL_018E::
	ld a, [$cc26]
	ld [PKM_V16_18], a
	ld b, $04
	ld hl, PKM_V16_1D
	call PKM_V16_02
	jr HandlePartyMenuInput
DrawPartyMenu::
	ld hl, PKM_V16_1E
	jr DrawPartyMenuCommon
RedrawPartyMenu::
	ld hl, PKM_V16_1F
DrawPartyMenuCommon::
	ld b, $04
	jp PKM_V16_02
PrintStatusCondition::
	push de
	dec de
	dec de
	ld a, [de]
	ld b, a
	dec de
	ld a, [de]
	or b
	pop de
	jr nz, PrintStatusConditionNotFainted
IF DEF(_FR)
	ld a, $8a
	ld [hli], a
	ld [hl], $8e
ELSE
	ld a, PKM_FAINT_0
	ld [hli], a
	ld a, PKM_FAINT_1
	ld [hli], a
	ld [hl], PKM_FAINT_2
ENDC
	and a
	ret
PrintStatusConditionNotFainted::
	ldh a, [$b8]
	push af
	ld a, PKM_STATUS_AILMENT_BANK
	ldh [$b8], a
	ld [$2000], a
	call PKM_V16_20
	pop bc
	ld a, b
	ldh [$b8], a
	ld [$2000], a
	ret
PrintLevel::
	ld a, $6e
	ld [hli], a
	ld c, $02
	ld a, [PKM_V16_21]
	cp $64
	jr c, PrintLevelCommon
	dec hl
	inc c
	jr PrintLevelCommon
PrintLevelFull::
	ld a, $6e
	ld [hli], a
	ld c, $03
	ld a, [PKM_V16_21]
PrintLevelCommon::
	ld [PKM_V16_05], a
	ld de, PKM_V16_05
	ld b, $41
	jp PKM_V16_22
GetwMoves::
	ld hl, PKM_V16_03
	ld c, a
	ld b, $00
	add hl, bc
	ld a, [hl]
	ret
GetMonHeader::
	ldh a, [$b8]
	push af
	ld a, $0e
	ldh [$b8], a
	ld [$2000], a
	push bc
	push de
	push hl
	ld a, [PKM_V16_05]
	push af
	ld a, [PKM_V16_23]
	ld [PKM_V16_05], a
	ld de, $79e8
	ld b, $66
	cp $b6
	jr z, PkmL_0252
	ld de, $66b5
	cp $b8
	jr z, PkmL_0252
	ld de, $6536
	ld b, $77
	cp $b7
	jr z, PkmL_0252
	cp $15
	jr z, PkmL_025C
	ld a, $3a
	call PKM_V16_07
	ld a, [PKM_V16_05]
	dec a
	ld bc, $001c
	ld hl, $43de
	call PKM_V16_24
	ld de, PKM_V16_25
	ld bc, $001c
	call PKM_V16_26
	jr PkmL_026A
PkmL_0252::
	ld hl, PKM_V16_27
	ld [hl], b
	inc hl
	ld [hl], e
	inc hl
	ld [hl], d
	jr PkmL_026A
PkmL_025C::
	ld hl, $425b
	ld de, PKM_V16_25
	ld bc, $001c
	ld a, $01
	call PKM_V16_28
PkmL_026A::
	ld a, [PKM_V16_23]
	ld [PKM_V16_25], a
	pop af
	ld [PKM_V16_05], a
	pop hl
	pop de
	pop bc
	pop af
	ldh [$b8], a
	ld [$2000], a
	ret
GetPartyMonName2::
	ld a, [PKM_V16_18]
	ld hl, PKM_V16_29
GetPartyMonName::
	push hl
	push bc
	call PKM_V16_2A
	ld de, PKM_V16_2B
	push de
	ld bc, PKM_V16_2C
	call PKM_V16_26
	pop de
	pop bc
	pop hl
	ret
