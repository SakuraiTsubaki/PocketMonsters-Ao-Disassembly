; ROM0 Pokemon sprite loading and postprocessing.
; First 264 bytes share one opcode skeleton in all six releases.

MACRO PIC_DEFV16
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

PIC_DEFV16 PIC_V16_00, $d095, $d0b8, $d0bd, $d0bd, $d0bd, $d0bd
PIC_DEFV16 PIC_V16_01, $d088, $d0ab, $d0b0, $d0b0, $d0b0, $d0b0
PIC_DEFV16 PIC_V16_02, $d089, $d0ac, $d0b1, $d0b1, $d0b1, $d0b1
PIC_DEFV16 PIC_V16_03, $cf78, $cf91, $cf96, $cf96, $cf96, $cf96
PIC_DEFV16 PIC_V16_04, $251b, $24fd, $24fd, $24f9, $24fd, $24fc
PIC_DEFV16 PIC_V16_05, $d09f, $d0c2, $d0c7, $d0c7, $d0c7, $d0c7
PIC_DEFV16 PIC_V16_06, $d087, $d0aa, $d0af, $d0af, $d0af, $d0af
PIC_DEFV16 PIC_V16_07, $183d, $1848, $1848, $1845, $1848, $1848

PURGE PIC_DEFV16

IF DEF(_JP)
SECTION "Pokemon pics home", ROM0[$15bf]
ELIF DEF(_FR)
SECTION "Pokemon pics home", ROM0[$1624]
ELSE
SECTION "Pokemon pics home", ROM0[$1627]
ENDC

UncompressMonSprite::
	ld bc, PIC_V16_00
	add hl, bc
	ld a, [hli]
	ld [PIC_V16_01], a
	ld a, [hl]
	ld [PIC_V16_02], a
	ld a, [PIC_V16_03]
	ld b, a
	cp $15
	ld a, $01
	jr z, PicL_003B
	ld a, b
	cp $b6
	ld a, $0b
	jr z, PicL_003B
	ld a, b
	cp $1f
	ld a, $09
	jr c, PicL_003B
	ld a, b
	cp $4a
	ld a, $0a
	jr c, PicL_003B
	ld a, b
	cp $74
	ld a, $0b
	jr c, PicL_003B
	ld a, b
	cp $99
	ld a, $0c
	jr c, PicL_003B
	ld a, $0d
PicL_003B::
	jp PIC_V16_04
LoadMonFrontSprite::
	push de
	ld hl, $000b
	call UncompressMonSprite
	ld hl, PIC_V16_05
	ld a, [hli]
	ld c, a
	pop de
LoadUncompressedSpriteData::
	push de
	and $0f
	ldh [$8b], a
	ld b, a
	ld a, $07
	sub b
	inc a
	srl a
	ld b, a
	add a, a
	add a, a
	add a, a
	sub b
	ldh [$8d], a
	ld a, c
	swap a
	and $0f
	ld b, a
	add a, a
	add a, a
	add a, a
	ldh [$8c], a
	ld a, $07
	sub b
	ld b, a
	ldh a, [$8d]
	add a, b
	add a, a
	add a, a
	add a, a
	ldh [$8d], a
	xor a
	ld [$4000], a
	ld hl, $a000
	call ZeroSpriteBuffer
	ld de, $a188
	ld hl, $a000
	call AlignSpriteDataCentered
	ld hl, $a188
	call ZeroSpriteBuffer
	ld de, $a310
	ld hl, $a188
	call AlignSpriteDataCentered
	pop de
	jp InterlaceMergeSpriteBuffers
AlignSpriteDataCentered::
	ldh a, [$8d]
	ld b, $00
	ld c, a
	add hl, bc
	ldh a, [$8b]
PicL_00A3::
	push af
	push hl
	ldh a, [$8c]
	ld c, a
PicL_00A8::
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, PicL_00A8
	pop hl
	ld bc, $0038
	add hl, bc
	pop af
	dec a
	jr nz, PicL_00A3
	ret
ZeroSpriteBuffer::
	ld bc, $0188
PicL_00BB::
	xor a
	ld [hli], a
	dec bc
	ld a, b
	or c
	jr nz, PicL_00BB
	ret
InterlaceMergeSpriteBuffers::
	xor a
	ld [$4000], a
	push de
	ld hl, $a497
	ld de, $a30f
	ld bc, $a187
	ld a, $c4
	ldh [$8b], a
PicL_00D5::
	ld a, [de]
	dec de
	ld [hld], a
	ld a, [bc]
	dec bc
	ld [hld], a
	ld a, [de]
	dec de
	ld [hld], a
	ld a, [bc]
	dec bc
	ld [hld], a
	ldh a, [$8b]
	dec a
	ldh [$8b], a
	jr nz, PicL_00D5
	ld a, [PIC_V16_06]
	and a
	jr z, PicL_00FC
	ld bc, $0310
	ld hl, $a188
PicL_00F4::
	swap [hl]
	inc hl
	dec bc
	ld a, b
	or c
	jr nz, PicL_00F4
PicL_00FC::
	pop hl
	ld de, $a188
	ld c, $31
	ldh a, [$b8]
	ld b, a
	jp PIC_V16_07

IF DEF(_JP)
SECTION "JP relocated high-home routines", ROM0[$16c7]
DisableLCD::
	xor a
	ldh [$0f], a
	ldh a, [$ff]
	ld b, a
	res 0, a
	ldh [$ff], a
.wait:
	ldh a, [$44]
	cp $91
	jr nz, .wait
	ldh a, [$40]
	and $7f
	ldh [$40], a
	ld a, b
	ldh [$ff], a
	ret
EnableLCD::
	ldh a, [$40]
	set 7, a
	ldh [$40], a
	ret
ClearSprites::
	xor a
	ld hl, $c300
	ld b, $a0
.loop:
	ld [hli], a
	dec b
	jr nz, .loop
	ret
HideSprites::
	ld a, $a0
	ld hl, $c300
	ld de, $0004
	ld b, $28
.loop:
	ld [hl], a
	add hl, de
	dec b
	jr nz, .loop
	ret
FarCopyData::
	ld [$cee4], a
	ldh a, [$b8]
	push af
	ld a, [$cee4]
	ldh [$b8], a
	ld [$2000], a
	call CopyData
	pop af
	ldh [$b8], a
	ld [$2000], a
	ret
CopyData::
	ld a, [hli]
	ld [de], a
	inc de
	dec bc
	ld a, c
	or b
	jr nz, CopyData
	ret
ENDC
