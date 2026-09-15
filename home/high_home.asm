; Bank 00 high-home area ($0061-$00ff).
; Localized Blue releases share six byte-identical ROM0 routines here.
; Japanese Ao uses a different byte layout at the same addresses; until its
; semantics are classified, those bytes are kept inline so reconstruction
; remains lossless without relying on a base ROM.

IF DEF(_JP)

SECTION "JP ROM0 0061", ROM0[$0061]
    db $00, $00, $00, $00, $00, $00, $00, $ff, $1c, $df, $0d, $ff, $06, $e4, $ff, $ff
    db $34, $d6, $51, $fd, $b2, $f2, $48, $fb, $2c, $cf, $04, $ce, $20, $f2, $f3, $00
    db $7f, $08, $d5, $30, $de, $10, $87, $00, $9f, $0a, $d7, $d2, $4d, $3e, $9e, $ff
    db $49, $6a, $00, $f6, $00, $f6, $60, $f7, $34, $fa, $00, $fd, $31, $df, $df, $ff
    db $12, $19, $59, $ff, $90, $f7, $05, $fd, $04, $d8, $de, $f6, $1e, $df, $fb, $ff
    db $01, $ff, $90, $df, $44, $f7, $44, $fe, $70, $ff, $c0, $f7, $94, $fc, $7e, $df
    db $40, $dd, $40, $fe, $00, $9f, $22, $ff, $18, $ff, $34, $fd, $13, $9f, $7f, $ff
    db $56, $d4, $00, $ff, $63, $7f, $11, $ff, $05, $ef, $7a, $3a, $04, $ff, $ff, $ff
    db $d3, $ef, $68, $f5, $6a, $5d, $35, $df, $0a, $ef, $02, $7d, $21, $ff, $ff, $ff
    db $06, $fb, $1c, $7b, $00, $bf, $04, $f7, $5b, $ff, $18, $fc, $4d, $d7, $67

ELSE

SECTION "High Home", ROM0[$0061]

DisableLCD::
    xor a
    ldh [rIF], a
    ldh a, [rIE]
    ld b, a
    res IE_VBLANK_BIT, a
    ldh [rIE], a
.wait
    ldh a, [rLY]
    cp LY_VBLANK_PLUS_ONE
    jr nz, .wait
    ldh a, [rLCDC]
    and $7f
    ldh [rLCDC], a
    ld a, b
    ldh [rIE], a
    ret

EnableLCD::
    ldh a, [rLCDC]
    set LCDC_ENABLE_BIT, a
    ldh [rLCDC], a
    ret

ClearSprites::
    xor a
    ld hl, wShadowOAM
    ld b, wShadowOAMEnd - wShadowOAM
.loop
    ld [hli], a
    dec b
    jr nz, .loop
    ret

HideSprites::
    ld a, HIDDEN_SPRITE_Y
    ld hl, wShadowOAM
    ld de, OBJ_SIZE
    ld b, OAM_COUNT
.loop
    ld [hl], a
    add hl, de
    dec b
    jr nz, .loop
    ret

FarCopyData::
; Copy bc bytes from bank a:hl to de.
    ld [wBuffer], a
    ldh a, [hLoadedROMBank]
    push af
    ld a, [wBuffer]
    ldh [hLoadedROMBank], a
    ld [rROMB], a
    call CopyData
    pop af
    ldh [hLoadedROMBank], a
    ld [rROMB], a
    ret

CopyData::
; Copy bc bytes from hl to de.
.loop
    ld a, [hli]
    ld [de], a
    inc de
    dec bc
    ld a, c
    or b
    jr nz, .loop
    ret

    ds $0100 - @, 0

ENDC
