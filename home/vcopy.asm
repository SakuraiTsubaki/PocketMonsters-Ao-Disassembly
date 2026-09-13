; Pocket Monsters Ao / Pokemon Blue ROM0 VRAM-copy and BG-update routines.
; Reconstructed directly from all six source ROMs.
; The executable opcode skeleton is common across JP/EN/DE/FR/IT/ES.
; Only wMovingBGTilesCounter2 relocates between releases; internal labels
; and flower-tile pointers resolve automatically from each section origin.

MACRO VCOPY_DEF_COUNTER2
IF DEF(_JP)
    DEF VCOPY_W_MOVING_BG_COUNTER2 EQU $d028
ELIF DEF(_EN)
    DEF VCOPY_W_MOVING_BG_COUNTER2 EQU $d085
ELSE
    DEF VCOPY_W_MOVING_BG_COUNTER2 EQU $d08a
ENDC
ENDM

VCOPY_DEF_COUNTER2
PURGE VCOPY_DEF_COUNTER2

IF DEF(_JP)
SECTION "ROM0 vcopy", ROM0[$1cc3]
ELIF DEF(_FR)
SECTION "ROM0 vcopy", ROM0[$1cd9]
ELIF DEF(_ES)
SECTION "ROM0 vcopy", ROM0[$1cdc]
ELSE
SECTION "ROM0 vcopy", ROM0[$1cdd]
ENDC

GetRowColAddressBgMap::
    xor a
    srl h
    rr a
    srl h
    rr a
    srl h
    rr a
    or l
    ld l, a
    ld a, b
    or h
    ld h, a
    ret
ClearBgMap::
    ld a, $7f
    jr FillBgMapCommon
FillBgMap::
    ld a, l
FillBgMapCommon::
    ld de, $0400
    ld l, e
Vcopy_L_001C::
    ld [hli], a
    dec e
    jr nz, Vcopy_L_001C
    dec d
    jr nz, Vcopy_L_001C
    ret
RedrawRowOrColumn::
    ldh a, [$ffd0]
    and a
    ret z
    ld b, a
    xor a
    ldh [$ffd0], a
    dec b
    jr nz, Vcopy_L_0053
    ld hl, $cbfc
    ldh a, [$ffd1]
    ld e, a
    ldh a, [$ffd2]
    ld d, a
    ld c, $12
Vcopy_L_003A::
    ld a, [hli]
    ld [de], a
    inc de
    ld a, [hli]
    ld [de], a
    ld a, $1f
    add a, e
    ld e, a
    jr nc, Vcopy_L_0046
    inc d
Vcopy_L_0046::
    ld a, d
    and $03
    or $98
    ld d, a
    dec c
    jr nz, Vcopy_L_003A
    xor a
    ldh [$ffd0], a
    ret
Vcopy_L_0053::
    ld hl, $cbfc
    ldh a, [$ffd1]
    ld e, a
    ldh a, [$ffd2]
    ld d, a
    push de
    call RedrawRowOrColumn_DrawHalf
    pop de
    ld a, $20
    add a, e
    ld e, a
RedrawRowOrColumn_DrawHalf::
    ld c, $0a
Vcopy_L_0067::
    ld a, [hli]
    ld [de], a
    inc de
    ld a, [hli]
    ld [de], a
    ld a, e
    inc a
    and $1f
    ld b, a
    ld a, e
    and $e0
    or b
    ld e, a
    dec c
    jr nz, Vcopy_L_0067
    ret
AutoBgMapTransfer::
    ldh a, [$ffba]
    and a
    ret z
    ld hl, sp+0
    ld a, h
    ldh [$ffbf], a
    ld a, l
    ldh [$ffc0], a
    ldh a, [$ffbb]
    and a
    jr z, Vcopy_L_009F
    dec a
    jr z, Vcopy_L_00AD
    ld hl, $c490
    ld sp, hl
    ldh a, [$ffbd]
    ld h, a
    ldh a, [$ffbc]
    ld l, a
    ld de, $0180
    add hl, de
    xor a
    jr Vcopy_L_00BD
Vcopy_L_009F::
    ld hl, $c3a0
    ld sp, hl
    ldh a, [$ffbd]
    ld h, a
    ldh a, [$ffbc]
    ld l, a
    ld a, $01
    jr Vcopy_L_00BD
Vcopy_L_00AD::
    ld hl, $c418
    ld sp, hl
    ldh a, [$ffbd]
    ld h, a
    ldh a, [$ffbc]
    ld l, a
    ld de, $00c0
    add hl, de
    ld a, $02
Vcopy_L_00BD::
    ldh [$ffbb], a
    ld b, $06
TransferBgRows::
    pop de
    ld [hl], e
    inc l
    ld [hl], d
    inc l
    pop de
    ld [hl], e
    inc l
    ld [hl], d
    inc l
    pop de
    ld [hl], e
    inc l
    ld [hl], d
    inc l
    pop de
    ld [hl], e
    inc l
    ld [hl], d
    inc l
    pop de
    ld [hl], e
    inc l
    ld [hl], d
    inc l
    pop de
    ld [hl], e
    inc l
    ld [hl], d
    inc l
    pop de
    ld [hl], e
    inc l
    ld [hl], d
    inc l
    pop de
    ld [hl], e
    inc l
    ld [hl], d
    inc l
    pop de
    ld [hl], e
    inc l
    ld [hl], d
    inc l
    pop de
    ld [hl], e
    inc l
    ld [hl], d
    ld a, $0d
    add a, l
    ld l, a
    jr nc, Vcopy_L_00F9
    inc h
Vcopy_L_00F9::
    dec b
    jr nz, TransferBgRows
    ldh a, [$ffbf]
    ld h, a
    ldh a, [$ffc0]
    ld l, a
    ld sp, hl
    ret
VBlankCopyBgMap::
    ldh a, [$ffc1]
    and a
    ret z
    ld hl, sp+0
    ld a, h
    ldh [$ffbf], a
    ld a, l
    ldh [$ffc0], a
    ldh a, [$ffc1]
    ld l, a
    ldh a, [$ffc2]
    ld h, a
    ld sp, hl
    ldh a, [$ffc3]
    ld l, a
    ldh a, [$ffc4]
    ld h, a
    ldh a, [$ffc5]
    ld b, a
    xor a
    ldh [$ffc1], a
    jr TransferBgRows
VBlankCopyDouble::
    ldh a, [$ffcb]
    and a
    ret z
    ld hl, sp+0
    ld a, h
    ldh [$ffbf], a
    ld a, l
    ldh [$ffc0], a
    ldh a, [$ffcc]
    ld l, a
    ldh a, [$ffcd]
    ld h, a
    ld sp, hl
    ldh a, [$ffce]
    ld l, a
    ldh a, [$ffcf]
    ld h, a
    ldh a, [$ffcb]
    ld b, a
    xor a
    ldh [$ffcb], a
Vcopy_L_0144::
    pop de
    ld [hl], e
    inc l
    ld [hl], e
    inc l
    ld [hl], d
    inc l
    ld [hl], d
    inc l
    pop de
    ld [hl], e
    inc l
    ld [hl], e
    inc l
    ld [hl], d
    inc l
    ld [hl], d
    inc l
    pop de
    ld [hl], e
    inc l
    ld [hl], e
    inc l
    ld [hl], d
    inc l
    ld [hl], d
    inc l
    pop de
    ld [hl], e
    inc l
    ld [hl], e
    inc l
    ld [hl], d
    inc l
    ld [hl], d
    inc hl
    dec b
    jr nz, Vcopy_L_0144
    ld a, l
    ldh [$ffce], a
    ld a, h
    ldh [$ffcf], a
    ld hl, sp+0
    ld a, l
    ldh [$ffcc], a
    ld a, h
    ldh [$ffcd], a
    ldh a, [$ffbf]
    ld h, a
    ldh a, [$ffc0]
    ld l, a
    ld sp, hl
    ret
VBlankCopy::
    ldh a, [$ffc6]
    and a
    ret z
    ld hl, sp+0
    ld a, h
    ldh [$ffbf], a
    ld a, l
    ldh [$ffc0], a
    ldh a, [$ffc7]
    ld l, a
    ldh a, [$ffc8]
    ld h, a
    ld sp, hl
    ldh a, [$ffc9]
    ld l, a
    ldh a, [$ffca]
    ld h, a
    ldh a, [$ffc6]
    ld b, a
    xor a
    ldh [$ffc6], a
Vcopy_L_01A0::
    pop de
    ld [hl], e
    inc l
    ld [hl], d
    inc l
    pop de
    ld [hl], e
    inc l
    ld [hl], d
    inc l
    pop de
    ld [hl], e
    inc l
    ld [hl], d
    inc l
    pop de
    ld [hl], e
    inc l
    ld [hl], d
    inc l
    pop de
    ld [hl], e
    inc l
    ld [hl], d
    inc l
    pop de
    ld [hl], e
    inc l
    ld [hl], d
    inc l
    pop de
    ld [hl], e
    inc l
    ld [hl], d
    inc l
    pop de
    ld [hl], e
    inc l
    ld [hl], d
    inc hl
    dec b
    jr nz, Vcopy_L_01A0
    ld a, l
    ldh [$ffc9], a
    ld a, h
    ldh [$ffca], a
    ld hl, sp+0
    ld a, l
    ldh [$ffc7], a
    ld a, h
    ldh [$ffc8], a
    ldh a, [$ffbf]
    ld h, a
    ldh a, [$ffc0]
    ld l, a
    ld sp, hl
    ret
UpdateMovingBgTiles::
    ldh a, [$ffd7]
    and a
    ret z
    ldh a, [$ffd8]
    inc a
    ldh [$ffd8], a
    cp $14
    ret c
    cp $15
    jr z, Vcopy_L_0219
    ld hl, $9140
    ld c, $10
    ld a, [VCOPY_W_MOVING_BG_COUNTER2]
    inc a
    and $07
    ld [VCOPY_W_MOVING_BG_COUNTER2], a
    and $04
    jr nz, Vcopy_L_020B
Vcopy_L_0203::
    ld a, [hl]
    rrca
    ld [hli], a
    dec c
    jr nz, Vcopy_L_0203
    jr Vcopy_L_0211
Vcopy_L_020B::
    ld a, [hl]
    rlca
    ld [hli], a
    dec c
    jr nz, Vcopy_L_020B
Vcopy_L_0211::
    ldh a, [$ffd7]
    rrca
    ret nc
    xor a
    ldh [$ffd8], a
    ret
Vcopy_L_0219::
    xor a
    ldh [$ffd8], a
    ld a, [VCOPY_W_MOVING_BG_COUNTER2]
    and $03
    cp $02
    ld hl, FlowerTile1
    jr c, Vcopy_L_0230
    ld hl, FlowerTile2
    jr z, Vcopy_L_0230
    ld hl, FlowerTile3
Vcopy_L_0230::
    ld de, $9030
    ld c, $10
Vcopy_L_0235::
    ld a, [hli]
    ld [de], a
    inc de
    dec c
    jr nz, Vcopy_L_0235
    ret

FlowerTile1::
    db $81, $00, $00, $18, $00, $24, $85, $5a, $1c, $42, $18, $a5, $00, $7e, $81, $18
FlowerTile2::
    db $81, $00, $00, $0c, $00, $12, $82, $2d, $0e, $e1, $0c, $73, $00, $3e, $81, $18
FlowerTile3::
    db $81, $18, $00, $24, $04, $5a, $9d, $42, $18, $24, $00, $db, $00, $7e, $81, $18
