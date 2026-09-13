; Pocket Monsters Ao / Pokemon Blue ROM0 sprite decompression engine.
; 937 bytes / 501 SM83 instruction boundaries in every release.
; Opcode skeleton is identical across JP/EN/DE/FR/IT/ES.
; Inline lookup tables are separated from executable code below.

MACRO UNC_DEFV16
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

UNC_DEFV16 UNC_V16_0025, $3740, $36e0, $36fa, $36fd, $36f8, $36ff
UNC_DEFV16 UNC_V16_002A, $d083, $d0a6, $d0ab, $d0ab, $d0ab, $d0ab
UNC_DEFV16 UNC_V16_002F, $d084, $d0a7, $d0ac, $d0ac, $d0ac, $d0ac
UNC_DEFV16 UNC_V16_0033, $d07e, $d0a1, $d0a6, $d0a6, $d0a6, $d0a6
UNC_DEFV16 UNC_V16_0036, $d07f, $d0a2, $d0a7, $d0a7, $d0a7, $d0a7
UNC_DEFV16 UNC_V16_0039, $d085, $d0a8, $d0ad, $d0ad, $d0ad, $d0ad
UNC_DEFV16 UNC_V16_0045, $d081, $d0a4, $d0a9, $d0a9, $d0a9, $d0a9
UNC_DEFV16 UNC_V16_0050, $d080, $d0a3, $d0a8, $d0a8, $d0a8, $d0a8
UNC_DEFV16 UNC_V16_0056, $d085, $d0a8, $d0ad, $d0ad, $d0ad, $d0ad
UNC_DEFV16 UNC_V16_005C, $d085, $d0a8, $d0ad, $d0ad, $d0ad, $d0ad
UNC_DEFV16 UNC_V16_0069, $d085, $d0a8, $d0ad, $d0ad, $d0ad, $d0ad
UNC_DEFV16 UNC_V16_007A, $d086, $d0a9, $d0ae, $d0ae, $d0ae, $d0ae
UNC_DEFV16 UNC_V16_00DB, $d081, $d0a4, $d0a9, $d0a9, $d0a9, $d0a9
UNC_DEFV16 UNC_V16_00DF, $d07f, $d0a2, $d0a7, $d0a7, $d0a7, $d0a7
UNC_DEFV16 UNC_V16_00E6, $d07f, $d0a2, $d0a7, $d0a7, $d0a7, $d0a7
UNC_DEFV16 UNC_V16_00E9, $d08a, $d0ad, $d0b2, $d0b2, $d0b2, $d0b2
UNC_DEFV16 UNC_V16_00ED, $d08a, $d0ad, $d0b2, $d0b2, $d0b2, $d0b2
UNC_DEFV16 UNC_V16_00F1, $d08b, $d0ae, $d0b3, $d0b3, $d0b3, $d0b3
UNC_DEFV16 UNC_V16_00F5, $d08b, $d0ae, $d0b3, $d0b3, $d0b3, $d0b3
UNC_DEFV16 UNC_V16_00FA, $d07f, $d0a2, $d0a7, $d0a7, $d0a7, $d0a7
UNC_DEFV16 UNC_V16_00FD, $d084, $d0a7, $d0ac, $d0ac, $d0ac, $d0ac
UNC_DEFV16 UNC_V16_0104, $d084, $d0a7, $d0ac, $d0ac, $d0ac, $d0ac
UNC_DEFV16 UNC_V16_0107, $d08c, $d0af, $d0b4, $d0b4, $d0b4, $d0b4
UNC_DEFV16 UNC_V16_010B, $d08a, $d0ad, $d0b2, $d0b2, $d0b2, $d0b2
UNC_DEFV16 UNC_V16_010F, $d08b, $d0ae, $d0b3, $d0b3, $d0b3, $d0b3
UNC_DEFV16 UNC_V16_0115, $d084, $d0a7, $d0ac, $d0ac, $d0ac, $d0ac
UNC_DEFV16 UNC_V16_0118, $d07e, $d0a1, $d0a6, $d0a6, $d0a6, $d0a6
UNC_DEFV16 UNC_V16_011D, $d07e, $d0a1, $d0a6, $d0a6, $d0a6, $d0a6
UNC_DEFV16 UNC_V16_0121, $d080, $d0a3, $d0a8, $d0a8, $d0a8, $d0a8
UNC_DEFV16 UNC_V16_0127, $d08a, $d0ad, $d0b2, $d0b2, $d0b2, $d0b2
UNC_DEFV16 UNC_V16_012B, $d08b, $d0ae, $d0b3, $d0b3, $d0b3, $d0b3
UNC_DEFV16 UNC_V16_0135, $d07e, $d0a1, $d0a6, $d0a6, $d0a6, $d0a6
UNC_DEFV16 UNC_V16_0138, $d085, $d0a8, $d0ad, $d0ad, $d0ad, $d0ad
UNC_DEFV16 UNC_V16_0143, $d085, $d0a8, $d0ad, $d0ad, $d0ad, $d0ad
UNC_DEFV16 UNC_V16_014D, $d084, $d0a7, $d0ac, $d0ac, $d0ac, $d0ac
UNC_DEFV16 UNC_V16_0167, $d08a, $d0ad, $d0b2, $d0b2, $d0b2, $d0b2
UNC_DEFV16 UNC_V16_016B, $d08b, $d0ae, $d0b3, $d0b3, $d0b3, $d0b3
UNC_DEFV16 UNC_V16_0173, $d083, $d0a6, $d0ab, $d0ab, $d0ab, $d0ab
UNC_DEFV16 UNC_V16_017C, $d082, $d0a5, $d0aa, $d0aa, $d0aa, $d0aa
UNC_DEFV16 UNC_V16_0181, $d083, $d0a6, $d0ab, $d0ab, $d0ab, $d0ab
UNC_DEFV16 UNC_V16_0184, $d082, $d0a5, $d0aa, $d0aa, $d0aa, $d0aa
UNC_DEFV16 UNC_V16_0188, $d082, $d0a5, $d0aa, $d0aa, $d0aa, $d0aa
UNC_DEFV16 UNC_V16_018E, $d088, $d0ab, $d0b0, $d0b0, $d0b0, $d0b0
UNC_DEFV16 UNC_V16_0192, $d089, $d0ac, $d0b1, $d0b1, $d0b1, $d0b1
UNC_DEFV16 UNC_V16_0199, $d088, $d0ab, $d0b0, $d0b0, $d0b0, $d0b0
UNC_DEFV16 UNC_V16_019D, $d089, $d0ac, $d0b1, $d0b1, $d0b1, $d0b1
UNC_DEFV16 UNC_V16_01C2, $d086, $d0a9, $d0ae, $d0ae, $d0ae, $d0ae
UNC_DEFV16 UNC_V16_01D8, $d07e, $d0a1, $d0a6, $d0a6, $d0a6, $d0a6
UNC_DEFV16 UNC_V16_01DB, $d07f, $d0a2, $d0a7, $d0a7, $d0a7, $d0a7
UNC_DEFV16 UNC_V16_01E1, $d087, $d0aa, $d0af, $d0af, $d0af, $d0af
UNC_DEFV16 UNC_V16_01F6, $d08e, $d0b1, $d0b6, $d0b6, $d0b6, $d0b6
UNC_DEFV16 UNC_V16_01FA, $d08f, $d0b2, $d0b7, $d0b7, $d0b7, $d0b7
UNC_DEFV16 UNC_V16_01FE, $d090, $d0b3, $d0b8, $d0b8, $d0b8, $d0b8
UNC_DEFV16 UNC_V16_0202, $d091, $d0b4, $d0b9, $d0b9, $d0b9, $d0b9
UNC_DEFV16 UNC_V16_0207, $d08a, $d0ad, $d0b2, $d0b2, $d0b2, $d0b2
UNC_DEFV16 UNC_V16_020B, $d08b, $d0ae, $d0b3, $d0b3, $d0b3, $d0b3
UNC_DEFV16 UNC_V16_0223, $d08a, $d0ad, $d0b2, $d0b2, $d0b2, $d0b2
UNC_DEFV16 UNC_V16_0227, $d08b, $d0ae, $d0b3, $d0b3, $d0b3, $d0b3
UNC_DEFV16 UNC_V16_022D, $d081, $d0a4, $d0a9, $d0a9, $d0a9, $d0a9
UNC_DEFV16 UNC_V16_0234, $d08a, $d0ad, $d0b2, $d0b2, $d0b2, $d0b2
UNC_DEFV16 UNC_V16_0238, $d08b, $d0ae, $d0b3, $d0b3, $d0b3, $d0b3
UNC_DEFV16 UNC_V16_023B, $d07e, $d0a1, $d0a6, $d0a6, $d0a6, $d0a6
UNC_DEFV16 UNC_V16_0240, $d07e, $d0a1, $d0a6, $d0a6, $d0a6, $d0a6
UNC_DEFV16 UNC_V16_0244, $d080, $d0a3, $d0a8, $d0a8, $d0a8, $d0a8
UNC_DEFV16 UNC_V16_024C, $d07e, $d0a1, $d0a6, $d0a6, $d0a6, $d0a6
UNC_DEFV16 UNC_V16_024F, $d07f, $d0a2, $d0a7, $d0a7, $d0a7, $d0a7
UNC_DEFV16 UNC_V16_0253, $d07f, $d0a2, $d0a7, $d0a7, $d0a7, $d0a7
UNC_DEFV16 UNC_V16_0257, $d081, $d0a4, $d0a9, $d0a9, $d0a9, $d0a9
UNC_DEFV16 UNC_V16_025D, $d08c, $d0af, $d0b4, $d0b4, $d0b4, $d0b4
UNC_DEFV16 UNC_V16_0261, $d08d, $d0b0, $d0b5, $d0b5, $d0b5, $d0b5
UNC_DEFV16 UNC_V16_026C, $d07f, $d0a2, $d0a7, $d0a7, $d0a7, $d0a7
UNC_DEFV16 UNC_V16_0279, $d087, $d0aa, $d0af, $d0af, $d0af, $d0af
UNC_DEFV16 UNC_V16_0288, $d08e, $d0b1, $d0b6, $d0b6, $d0b6, $d0b6
UNC_DEFV16 UNC_V16_028C, $d08f, $d0b2, $d0b7, $d0b7, $d0b7, $d0b7
UNC_DEFV16 UNC_V16_0291, $d090, $d0b3, $d0b8, $d0b8, $d0b8, $d0b8
UNC_DEFV16 UNC_V16_0295, $d091, $d0b4, $d0b9, $d0b9, $d0b9, $d0b9
UNC_DEFV16 UNC_V16_02CB, $d07e, $d0a1, $d0a6, $d0a6, $d0a6, $d0a6
UNC_DEFV16 UNC_V16_02CE, $d07f, $d0a2, $d0a7, $d0a7, $d0a7, $d0a7
UNC_DEFV16 UNC_V16_02D4, $d08a, $d0ad, $d0b2, $d0b2, $d0b2, $d0b2
UNC_DEFV16 UNC_V16_02D8, $d08b, $d0ae, $d0b3, $d0b3, $d0b3, $d0b3
UNC_DEFV16 UNC_V16_02E2, $d08a, $d0ad, $d0b2, $d0b2, $d0b2, $d0b2
UNC_DEFV16 UNC_V16_02E6, $d08b, $d0ae, $d0b3, $d0b3, $d0b3, $d0b3
UNC_DEFV16 UNC_V16_02EA, $d08c, $d0af, $d0b4, $d0b4, $d0b4, $d0b4
UNC_DEFV16 UNC_V16_02EE, $d08d, $d0b0, $d0b5, $d0b5, $d0b5, $d0b5
UNC_DEFV16 UNC_V16_02F2, $d087, $d0aa, $d0af, $d0af, $d0af, $d0af
UNC_DEFV16 UNC_V16_0314, $d07f, $d0a2, $d0a7, $d0a7, $d0a7, $d0a7
UNC_DEFV16 UNC_V16_0318, $d07f, $d0a2, $d0a7, $d0a7, $d0a7, $d0a7
UNC_DEFV16 UNC_V16_031C, $d081, $d0a4, $d0a9, $d0a9, $d0a9, $d0a9
UNC_DEFV16 UNC_V16_0323, $d07f, $d0a2, $d0a7, $d0a7, $d0a7, $d0a7
UNC_DEFV16 UNC_V16_0326, $d07e, $d0a1, $d0a6, $d0a6, $d0a6, $d0a6
UNC_DEFV16 UNC_V16_032B, $d07e, $d0a1, $d0a6, $d0a6, $d0a6, $d0a6
UNC_DEFV16 UNC_V16_032F, $d080, $d0a3, $d0a8, $d0a8, $d0a8, $d0a8
UNC_DEFV16 UNC_V16_0336, $d07e, $d0a1, $d0a6, $d0a6, $d0a6, $d0a6
UNC_DEFV16 UNC_V16_0344, $d085, $d0a8, $d0ad, $d0ad, $d0ad, $d0ad
UNC_DEFV16 UNC_V16_035A, $d08a, $d0ad, $d0b2, $d0b2, $d0b2, $d0b2
UNC_DEFV16 UNC_V16_035E, $d08b, $d0ae, $d0b3, $d0b3, $d0b3, $d0b3
UNC_DEFV16 UNC_V16_0362, $d08c, $d0af, $d0b4, $d0b4, $d0b4, $d0b4
UNC_DEFV16 UNC_V16_0366, $d08d, $d0b0, $d0b5, $d0b5, $d0b5, $d0b5
UNC_DEFV16 UNC_V16_037D, $d087, $d0aa, $d0af, $d0af, $d0af, $d0af
UNC_DEFV16 UNC_V16_0382, $d087, $d0aa, $d0af, $d0af, $d0af, $d0af
UNC_DEFV16 UNC_V16_0385, $d08c, $d0af, $d0b4, $d0b4, $d0b4, $d0b4
UNC_DEFV16 UNC_V16_0389, $d08d, $d0b0, $d0b5, $d0b5, $d0b5, $d0b5
UNC_DEFV16 UNC_V16_0394, $d087, $d0aa, $d0af, $d0af, $d0af, $d0af
UNC_DEFV16 UNC_V16_039B, $d08a, $d0ad, $d0b2, $d0b2, $d0b2, $d0b2
UNC_DEFV16 UNC_V16_039E, $d08c, $d0af, $d0b4, $d0b4, $d0b4, $d0b4
UNC_DEFV16 UNC_V16_03A2, $d08b, $d0ae, $d0b3, $d0b3, $d0b3, $d0b3
UNC_DEFV16 UNC_V16_03A5, $d08d, $d0b0, $d0b5, $d0b5, $d0b5, $d0b5

PURGE UNC_DEFV16

IF DEF(_JP)
SECTION "ROM0 sprite decompression", ROM0[$251b]
ELIF DEF(_FR)
SECTION "ROM0 sprite decompression", ROM0[$24f9]
ELIF DEF(_ES)
SECTION "ROM0 sprite decompression", ROM0[$24fc]
ELSE
SECTION "ROM0 sprite decompression", ROM0[$24fd]
ENDC

UncompressSpriteData::
    ld b, a
    ldh a, [$ffb8]
    push af
    ld a, b
    ldh [$ffb8], a
    ld [$2000], a
    ld a, $0a
    ld [$0000], a
    xor a
    ld [$4000], a
    call _UncompressSpriteData
    pop af
    ldh [$ffb8], a
    ld [$2000], a
    ret
_UncompressSpriteData::
    ld hl, $a188
    ld c, $10
    ld b, $03
    xor a
    call UNC_V16_0025
    ld a, $01
    ld [UNC_V16_002A], a
    ld a, $03
    ld [UNC_V16_002F], a
    xor a
    ld [UNC_V16_0033], a
    ld [UNC_V16_0036], a
    ld [UNC_V16_0039], a
    call ReadNextInputByte
    ld b, a
    and $0f
    add a, a
    add a, a
    add a, a
    ld [UNC_V16_0045], a
    ld a, b
    swap a
    and $0f
    add a, a
    add a, a
    add a, a
    ld [UNC_V16_0050], a
    call ReadNextInputBit
    ld [UNC_V16_0056], a
UncompressSpriteDataLoop::
    ld hl, $a188
    ld a, [UNC_V16_005C]
    bit 0, a
    jr z, UncL_0066
    ld hl, $a310
UncL_0066::
    call StoreSpriteOutputPointer
    ld a, [UNC_V16_0069]
    bit 1, a
    jr z, UncL_007D
    call ReadNextInputBit
    and a
    jr z, UncL_007A
    call ReadNextInputBit
    inc a
UncL_007A::
    ld [UNC_V16_007A], a
UncL_007D::
    call ReadNextInputBit
    and a
    jr z, UncL_0098
UncL_0083::
    call ReadNextInputBit
    ld c, a
    call ReadNextInputBit
    sla c
    or c
    and a
    jr z, UncL_0098
    call WriteSpriteBitsToBuffer
    call MoveToNextBufferPosition
    jr UncL_0083
UncL_0098::
    ld c, $00
UncL_009A::
    call ReadNextInputBit
    and a
    jr z, UncL_00A3
    inc c
    jr UncL_009A
UncL_00A3::
    ld a, c
    add a, a
    ld hl, LengthEncodingOffsetList
    add a, l
    ld l, a
    jr nc, UncL_00AD
    inc h
UncL_00AD::
    ld a, [hli]
    ld e, a
    ld d, [hl]
    push de
    inc c
    ld e, $00
    ld d, e
UncL_00B5::
    call ReadNextInputBit
    or e
    ld e, a
    dec c
    jr z, UncL_00C3
    sla e
    rl d
    jr UncL_00B5
UncL_00C3::
    pop hl
    add hl, de
    ld e, l
    ld d, h
UncL_00C7::
    ld b, e
    xor a
    call WriteSpriteBitsToBuffer
    ld e, b
    call MoveToNextBufferPosition
    dec de
    ld a, d
    and a
    jr nz, UncL_00D7
    ld a, e
    and a
UncL_00D7::
    jr nz, UncL_00C7
    jr UncL_0083
MoveToNextBufferPosition::
    ld a, [UNC_V16_00DB]
    ld b, a
    ld a, [UNC_V16_00DF]
    inc a
    cp b
    jr z, UncL_00F9
    ld [UNC_V16_00E6], a
    ld a, [UNC_V16_00E9]
    inc a
    ld [UNC_V16_00ED], a
    ret nz
    ld a, [UNC_V16_00F1]
    inc a
    ld [UNC_V16_00F5], a
    ret
UncL_00F9::
    xor a
    ld [UNC_V16_00FA], a
    ld a, [UNC_V16_00FD]
    and a
    jr z, UncL_0113
    dec a
    ld [UNC_V16_0104], a
    ld hl, UNC_V16_0107
    ld a, [hli]
    ld [UNC_V16_010B], a
    ld a, [hl]
    ld [UNC_V16_010F], a
    ret
UncL_0113::
    ld a, $03
    ld [UNC_V16_0115], a
    ld a, [UNC_V16_0118]
    add a, $08
    ld [UNC_V16_011D], a
    ld b, a
    ld a, [UNC_V16_0121]
    cp b
    jr z, UncL_0133
    ld a, [UNC_V16_0127]
    ld l, a
    ld a, [UNC_V16_012B]
    ld h, a
    inc hl
    jp StoreSpriteOutputPointer
UncL_0133::
    pop hl
    xor a
    ld [UNC_V16_0135], a
    ld a, [UNC_V16_0138]
    bit 1, a
    jr nz, UncL_0149
    xor $01
    set 1, a
    ld [UNC_V16_0143], a
    jp UncompressSpriteDataLoop
UncL_0149::
    jp UnpackSprite
WriteSpriteBitsToBuffer::
    ld e, a
    ld a, [UNC_V16_014D]
    and a
    jr z, UncL_0167
    cp $02
    jr c, UncL_015F
    jr z, UncL_0165
    rrc e
    rrc e
    jr UncL_0167
UncL_015F::
    sla e
    sla e
    jr UncL_0167
UncL_0165::
    swap e
UncL_0167::
    ld a, [UNC_V16_0167]
    ld l, a
    ld a, [UNC_V16_016B]
    ld h, a
    ld a, [hl]
    or e
    ld [hl], a
    ret
ReadNextInputBit::
    ld a, [UNC_V16_0173]
    dec a
    jr nz, UncL_0181
    call ReadNextInputByte
    ld [UNC_V16_017C], a
    ld a, $08
UncL_0181::
    ld [UNC_V16_0181], a
    ld a, [UNC_V16_0184]
    rlca
    ld [UNC_V16_0188], a
    and $01
    ret
ReadNextInputByte::
    ld a, [UNC_V16_018E]
    ld l, a
    ld a, [UNC_V16_0192]
    ld h, a
    ld a, [hli]
    ld b, a
    ld a, l
    ld [UNC_V16_0199], a
    ld a, h
    ld [UNC_V16_019D], a
    ld a, b
    ret
LengthEncodingOffsetList::
    dw $0001
    dw $0003
    dw $0007
    dw $000f
    dw $001f
    dw $003f
    dw $007f
    dw $00ff
    dw $01ff
    dw $03ff
    dw $07ff
    dw $0fff
    dw $1fff
    dw $3fff
    dw $7fff
    dw $ffff
UnpackSprite::
    ld a, [UNC_V16_01C2]
    cp $02
    jp z, UnpackSpriteMode2
    and a
    jp nz, XorSpriteChunks
    ld hl, $a188
    call SpriteDifferentialDecode
    ld hl, $a310
SpriteDifferentialDecode::
    xor a
    ld [UNC_V16_01D8], a
    ld [UNC_V16_01DB], a
    call StoreSpriteOutputPointer
    ld a, [UNC_V16_01E1]
    and a
    jr z, UncL_01EF
    ld hl, DecodeNybble0TableFlipped
    ld de, DecodeNybble1TableFlipped
    jr UncL_01F5
UncL_01EF::
    ld hl, DecodeNybble0Table
    ld de, DecodeNybble1Table
UncL_01F5::
    ld a, l
    ld [UNC_V16_01F6], a
    ld a, h
    ld [UNC_V16_01FA], a
    ld a, e
    ld [UNC_V16_01FE], a
    ld a, d
    ld [UNC_V16_0202], a
    ld e, $00
UncL_0207::
    ld a, [UNC_V16_0207]
    ld l, a
    ld a, [UNC_V16_020B]
    ld h, a
    ld a, [hl]
    ld b, a
    swap a
    and $0f
    call DifferentialDecodeNybble
    swap a
    ld d, a
    ld a, b
    and $0f
    call DifferentialDecodeNybble
    or d
    ld b, a
    ld a, [UNC_V16_0223]
    ld l, a
    ld a, [UNC_V16_0227]
    ld h, a
    ld a, b
    ld [hl], a
    ld a, [UNC_V16_022D]
    add a, l
    jr nc, UncL_0234
    inc h
UncL_0234::
    ld [UNC_V16_0234], a
    ld a, h
    ld [UNC_V16_0238], a
    ld a, [UNC_V16_023B]
    add a, $08
    ld [UNC_V16_0240], a
    ld b, a
    ld a, [UNC_V16_0244]
    cp b
    jr nz, UncL_0207
    xor a
    ld e, a
    ld [UNC_V16_024C], a
    ld a, [UNC_V16_024F]
    inc a
    ld [UNC_V16_0253], a
    ld b, a
    ld a, [UNC_V16_0257]
    cp b
    jr z, UncL_026B
    ld a, [UNC_V16_025D]
    ld l, a
    ld a, [UNC_V16_0261]
    ld h, a
    inc hl
    call StoreSpriteOutputPointer
    jr UncL_0207
UncL_026B::
    xor a
    ld [UNC_V16_026C], a
    ret
DifferentialDecodeNybble::
    srl a
    ld c, $00
    jr nc, UncL_0278
    ld c, $01
UncL_0278::
    ld l, a
    ld a, [UNC_V16_0279]
    and a
    jr z, UncL_0283
    bit 3, e
    jr UncL_0285
UncL_0283::
    bit 0, e
UncL_0285::
    ld e, l
    jr nz, UncL_0291
    ld a, [UNC_V16_0288]
    ld l, a
    ld a, [UNC_V16_028C]
    jr UncL_0298
UncL_0291::
    ld a, [UNC_V16_0291]
    ld l, a
    ld a, [UNC_V16_0295]
UncL_0298::
    ld h, a
    ld a, e
    add a, l
    ld l, a
    jr nc, UncL_029F
    inc h
UncL_029F::
    ld a, [hl]
    bit 0, c
    jr nz, UncL_02A6
    swap a
UncL_02A6::
    and $0f
    ld e, a
    ret
DecodeNybble0Table::
    db $01, $32, $76, $45, $fe, $cd, $89, $ba
DecodeNybble1Table::
    db $fe, $cd, $89, $ba, $01, $32, $76, $45
DecodeNybble0TableFlipped::
    db $08, $c4, $e6, $2a, $f7, $3b, $19, $d5
DecodeNybble1TableFlipped::
    db $f7, $3b, $19, $d5, $08, $c4, $e6, $2a
XorSpriteChunks::
    xor a
    ld [UNC_V16_02CB], a
    ld [UNC_V16_02CE], a
    call ResetSpriteBufferPointers
    ld a, [UNC_V16_02D4]
    ld l, a
    ld a, [UNC_V16_02D8]
    ld h, a
    call SpriteDifferentialDecode
    call ResetSpriteBufferPointers
    ld a, [UNC_V16_02E2]
    ld l, a
    ld a, [UNC_V16_02E6]
    ld h, a
    ld a, [UNC_V16_02EA]
    ld e, a
    ld a, [UNC_V16_02EE]
    ld d, a
UncL_02F2::
    ld a, [UNC_V16_02F2]
    and a
    jr z, UncL_030E
    push de
    ld a, [de]
    ld b, a
    swap a
    and $0f
    call ReverseNybble
    swap a
    ld c, a
    ld a, b
    and $0f
    call ReverseNybble
    or c
    pop de
    ld [de], a
UncL_030E::
    ld a, [hli]
    ld b, a
    ld a, [de]
    xor b
    ld [de], a
    inc de
    ld a, [UNC_V16_0314]
    inc a
    ld [UNC_V16_0318], a
    ld b, a
    ld a, [UNC_V16_031C]
    cp b
    jr nz, UncL_02F2
    xor a
    ld [UNC_V16_0323], a
    ld a, [UNC_V16_0326]
    add a, $08
    ld [UNC_V16_032B], a
    ld b, a
    ld a, [UNC_V16_032F]
    cp b
    jr nz, UncL_02F2
    xor a
    ld [UNC_V16_0336], a
    ret
ReverseNybble::
    ld de, NybbleReverseTable
    add a, e
    ld e, a
    jr nc, UncL_0342
    inc d
UncL_0342::
    ld a, [de]
    ret
ResetSpriteBufferPointers::
    ld a, [UNC_V16_0344]
    bit 0, a
    jr nz, UncL_0353
    ld de, $a188
    ld hl, $a310
    jr UncL_0359
UncL_0353::
    ld de, $a310
    ld hl, $a188
UncL_0359::
    ld a, l
    ld [UNC_V16_035A], a
    ld a, h
    ld [UNC_V16_035E], a
    ld a, e
    ld [UNC_V16_0362], a
    ld a, d
    ld [UNC_V16_0366], a
    ret
NybbleReverseTable::
    db $00, $08, $04, $0c, $02, $0a, $06, $0e, $01, $09, $05, $0d, $03, $0b, $07, $0f
UnpackSpriteMode2::
    call ResetSpriteBufferPointers
    ld a, [UNC_V16_037D]
    push af
    xor a
    ld [UNC_V16_0382], a
    ld a, [UNC_V16_0385]
    ld l, a
    ld a, [UNC_V16_0389]
    ld h, a
    call SpriteDifferentialDecode
    call ResetSpriteBufferPointers
    pop af
    ld [UNC_V16_0394], a
    jp XorSpriteChunks
StoreSpriteOutputPointer::
    ld a, l
    ld [UNC_V16_039B], a
    ld [UNC_V16_039E], a
    ld a, h
    ld [UNC_V16_03A2], a
    ld [UNC_V16_03A5], a
    ret

PURGE UNC_V16_0025
PURGE UNC_V16_002A
PURGE UNC_V16_002F
PURGE UNC_V16_0033
PURGE UNC_V16_0036
PURGE UNC_V16_0039
PURGE UNC_V16_0045
PURGE UNC_V16_0050
PURGE UNC_V16_0056
PURGE UNC_V16_005C
PURGE UNC_V16_0069
PURGE UNC_V16_007A
PURGE UNC_V16_00DB
PURGE UNC_V16_00DF
PURGE UNC_V16_00E6
PURGE UNC_V16_00E9
PURGE UNC_V16_00ED
PURGE UNC_V16_00F1
PURGE UNC_V16_00F5
PURGE UNC_V16_00FA
PURGE UNC_V16_00FD
PURGE UNC_V16_0104
PURGE UNC_V16_0107
PURGE UNC_V16_010B
PURGE UNC_V16_010F
PURGE UNC_V16_0115
PURGE UNC_V16_0118
PURGE UNC_V16_011D
PURGE UNC_V16_0121
PURGE UNC_V16_0127
PURGE UNC_V16_012B
PURGE UNC_V16_0135
PURGE UNC_V16_0138
PURGE UNC_V16_0143
PURGE UNC_V16_014D
PURGE UNC_V16_0167
PURGE UNC_V16_016B
PURGE UNC_V16_0173
PURGE UNC_V16_017C
PURGE UNC_V16_0181
PURGE UNC_V16_0184
PURGE UNC_V16_0188
PURGE UNC_V16_018E
PURGE UNC_V16_0192
PURGE UNC_V16_0199
PURGE UNC_V16_019D
PURGE UNC_V16_01C2
PURGE UNC_V16_01D8
PURGE UNC_V16_01DB
PURGE UNC_V16_01E1
PURGE UNC_V16_01F6
PURGE UNC_V16_01FA
PURGE UNC_V16_01FE
PURGE UNC_V16_0202
PURGE UNC_V16_0207
PURGE UNC_V16_020B
PURGE UNC_V16_0223
PURGE UNC_V16_0227
PURGE UNC_V16_022D
PURGE UNC_V16_0234
PURGE UNC_V16_0238
PURGE UNC_V16_023B
PURGE UNC_V16_0240
PURGE UNC_V16_0244
PURGE UNC_V16_024C
PURGE UNC_V16_024F
PURGE UNC_V16_0253
PURGE UNC_V16_0257
PURGE UNC_V16_025D
PURGE UNC_V16_0261
PURGE UNC_V16_026C
PURGE UNC_V16_0279
PURGE UNC_V16_0288
PURGE UNC_V16_028C
PURGE UNC_V16_0291
PURGE UNC_V16_0295
PURGE UNC_V16_02CB
PURGE UNC_V16_02CE
PURGE UNC_V16_02D4
PURGE UNC_V16_02D8
PURGE UNC_V16_02E2
PURGE UNC_V16_02E6
PURGE UNC_V16_02EA
PURGE UNC_V16_02EE
PURGE UNC_V16_02F2
PURGE UNC_V16_0314
PURGE UNC_V16_0318
PURGE UNC_V16_031C
PURGE UNC_V16_0323
PURGE UNC_V16_0326
PURGE UNC_V16_032B
PURGE UNC_V16_032F
PURGE UNC_V16_0336
PURGE UNC_V16_0344
PURGE UNC_V16_035A
PURGE UNC_V16_035E
PURGE UNC_V16_0362
PURGE UNC_V16_0366
PURGE UNC_V16_037D
PURGE UNC_V16_0382
PURGE UNC_V16_0385
PURGE UNC_V16_0389
PURGE UNC_V16_0394
PURGE UNC_V16_039B
PURGE UNC_V16_039E
PURGE UNC_V16_03A2
PURGE UNC_V16_03A5
