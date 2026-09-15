; ROM0 far-copy, VRAM copy and screen-clear helpers.
; All six releases share the same 299-byte opcode skeleton.

MACRO CPY_DEFV16
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

CPY_DEFV16 CPY_V16_00, $171b, $00b5, $00b5, $00b5, $00b5, $00b5
CPY_DEFV16 CPY_V16_01, $208f, $20af, $20af, $20ab, $20af, $20ae
CPY_DEFV16 CPY_V16_02, $1cc3, $1cdd, $1cdd, $1cd9, $1cdd, $1cdc
CPY_DEFV16 CPY_V16_03, $3e1b, $3dd7, $3df1, $3df4, $3def, $3df6

PURGE CPY_DEFV16

IF DEF(_JP)
SECTION "Copy helpers", ROM0[$17ec]
ELIF DEF(_FR)
SECTION "Copy helpers", ROM0[$17f4]
ELSE
SECTION "Copy helpers", ROM0[$17f7]
ENDC

FarCopyData2::
	ldh [$8b], a
	ldh a, [$b8]
	push af
	ldh a, [$8b]
	ldh [$b8], a
	ld [$2000], a
	call CPY_V16_00
	pop af
	ldh [$b8], a
	ld [$2000], a
	ret
FarCopyData3::
	ldh [$8b], a
	ldh a, [$b8]
	push af
	ldh a, [$8b]
	ldh [$b8], a
	ld [$2000], a
	push hl
	push de
	push de
	ld d, h
	ld e, l
	pop hl
	call CPY_V16_00
	pop de
	pop hl
	pop af
	ldh [$b8], a
	ld [$2000], a
	ret
FarCopyDataDouble::
	ldh [$8b], a
	ldh a, [$b8]
	push af
	ldh a, [$8b]
	ldh [$b8], a
	ld [$2000], a
CopyL_0040::
	ld a, [hli]
	ld [de], a
	inc de
	ld [de], a
	inc de
	dec bc
	ld a, c
	or b
	jr nz, CopyL_0040
	pop af
	ldh [$b8], a
	ld [$2000], a
	ret
CopyVideoData::
	ldh a, [$ba]
	push af
	xor a
	ldh [$ba], a
	ldh a, [$b8]
	ldh [$8b], a
	ld a, b
	ldh [$b8], a
	ld [$2000], a
	ld a, e
	ldh [$c7], a
	ld a, d
	ldh [$c8], a
	ld a, l
	ldh [$c9], a
	ld a, h
	ldh [$ca], a
CopyL_006D::
	ld a, c
	cp $08
	jr nc, CopyL_0082
	ldh [$c6], a
	call CPY_V16_01
	ldh a, [$8b]
	ldh [$b8], a
	ld [$2000], a
	pop af
	ldh [$ba], a
	ret
CopyL_0082::
	ld a, $08
	ldh [$c6], a
	call CPY_V16_01
	ld a, c
	sub $08
	ld c, a
	jr CopyL_006D
CopyVideoDataDouble::
	ldh a, [$ba]
	push af
	xor a
	ldh [$ba], a
	ldh a, [$b8]
	ldh [$8b], a
	ld a, b
	ldh [$b8], a
	ld [$2000], a
	ld a, e
	ldh [$cc], a
	ld a, d
	ldh [$cd], a
	ld a, l
	ldh [$ce], a
	ld a, h
	ldh [$cf], a
CopyL_00AB::
	ld a, c
	cp $08
	jr nc, CopyL_00C0
	ldh [$cb], a
	call CPY_V16_01
	ldh a, [$8b]
	ldh [$b8], a
	ld [$2000], a
	pop af
	ldh [$ba], a
	ret
CopyL_00C0::
	ld a, $08
	ldh [$cb], a
	call CPY_V16_01
	ld a, c
	sub $08
	ld c, a
	jr CopyL_00AB
ClearScreenArea::
	ld a, $7f
	ld de, $0014
CopyL_00D2::
	push hl
	push bc
CopyL_00D4::
	ld [hli], a
	dec c
	jr nz, CopyL_00D4
	pop bc
	pop hl
	add hl, de
	dec b
	jr nz, CopyL_00D2
	ret
CopyScreenTileBufferToVRAM::
	ld c, $06
	ld hl, $0000
	ld de, $c3a0
	call CopyScreenTileBufferToVRAM_Setup
	call CPY_V16_01
	ld hl, $0600
	ld de, $c418
	call CopyScreenTileBufferToVRAM_Setup
	call CPY_V16_01
	ld hl, $0c00
	ld de, $c490
	call CopyScreenTileBufferToVRAM_Setup
	jp CPY_V16_01
CopyScreenTileBufferToVRAM_Setup::
	ld a, d
	ldh [$c2], a
	call CPY_V16_02
	ld a, l
	ldh [$c3], a
	ld a, h
	ldh [$c4], a
	ld a, c
	ldh [$c5], a
	ld a, e
	ldh [$c1], a
	ret
ClearScreen::
	ld bc, $0168
	inc b
	ld hl, $c3a0
	ld a, $7f
CopyL_0121::
	ld [hli], a
	dec c
	jr nz, CopyL_0121
	dec b
	jr nz, CopyL_0121
	jp CPY_V16_03
