; Pocket Monsters Ao / Pokemon Blue ROM0 overworld text stubs.
; JP stores the five localized strings inline here (101-byte span total),
; while EN/DE/FR/IT/ES use five far-text references (39-byte span total).

IF DEF(_JP)
SECTION "ROM0 overworld text", ROM0[$24b6]
ELIF DEF(_FR)
SECTION "ROM0 overworld text", ROM0[$24d2]
ELIF DEF(_ES)
SECTION "ROM0 overworld text", ROM0[$24d5]
ELSE
SECTION "ROM0 overworld text", ROM0[$24d6]
ENDC

TextScriptEndingText::
    db $50

TextScriptEnd::
IF DEF(_JP)
    ld hl, $24b6
ELIF DEF(_FR)
    ld hl, $24d2
ELIF DEF(_ES)
    ld hl, $24d5
ELSE
    ld hl, $24d6
ENDC
    ret

IF DEF(_JP)
; JP keeps Exclamation/GroundRose/Boulder/MartSign/PokeCenterSign text inline.
; Preserve the exact encoded Japanese text while the JP charmap is promoted
; into shared symbolic text macros.
JPOverworldInlineText::
    db $00, $e7, $57, $00, $34, $ba, $b6, $33, $7f, $2c, $d2, $de, $26, $d3, $d8, $b1
    db $26, $df, $c0, $e7, $57, $00, $70, $b6, $b2, $d8, $b7, $71, $7f, $33, $7f, $b3
    db $2a, $b6, $be, $d9, $b6, $d3, $56, $57, $00, $54, $7f, $07, $ac, $0c, $26, $7f
    db $b2, $df, $44, $b2, $e7, $4f, $9b, $a7, $ab, $13, $d8, $b0, $8b, $af, $ac, $42
    db $57, $00, $54, $c9, $7f, $c0, $b2, $d8, $e2, $b8, $7f, $b6, $b2, $cc, $b8, $e7
    db $4f, $54, $8d, $ab, $8f, $e3, $57
ELSE
ExclamationText::
    db $17
IF DEF(_EN)
    dw $4093
ELIF DEF(_DE)
    dw $40d9
ELIF DEF(_FR)
    dw $409b
ELIF DEF(_IT)
    dw $40a4
ELSE
    dw $40a2
ENDC
    db $20, $50

GroundRoseText::
    db $17
IF DEF(_EN)
    dw $4096
ELIF DEF(_DE)
    dw $40dc
ELIF DEF(_FR)
    dw $409e
ELIF DEF(_IT)
    dw $40a7
ELSE
    dw $40a5
ENDC
    db $20, $50

BoulderText::
    db $17
IF DEF(_EN)
    dw $40b1
ELIF DEF(_DE)
    dw $4102
ELIF DEF(_FR)
    dw $40be
ELIF DEF(_IT)
    dw $40d4
ELSE
    dw $40c7
ENDC
    db $20, $50

MartSignText::
    db $17
IF DEF(_EN)
    dw $40d2
ELIF DEF(_DE)
    dw $4130
ELIF DEF(_FR)
    dw $40de
ELIF DEF(_IT)
    dw $4100
ELSE
    dw $40ea
ENDC
    db $20, $50

PokeCenterSignText::
    db $17
IF DEF(_EN)
    dw $40fc
ELIF DEF(_DE)
    dw $4161
ELIF DEF(_FR)
    dw $4106
ELIF DEF(_IT)
    dw $4131
ELSE
    dw $4114
ENDC
    db $20, $50
ENDC

PickUpItemText::
    db $08
    ld a, $5c
IF DEF(_JP)
    call $3eb1
ELIF DEF(_EN)
    call $3e6d
ELIF DEF(_DE)
    call $3e87
ELIF DEF(_FR)
    call $3e8a
ELIF DEF(_IT)
    call $3e85
ELIF DEF(_ES)
    call $3e8c
ENDC
    jp TextScriptEnd
