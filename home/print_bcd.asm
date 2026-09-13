; ROM0 BCD-number printer reconstructed from all six source ROMs.
; JP omits the money-sign path present in the localized releases.

IF DEF(_JP)
    DEF BCD_PRINT_LETTER_DELAY EQU $3931
ELIF DEF(_EN)
    DEF BCD_PRINT_LETTER_DELAY EQU $38d3
ELIF DEF(_DE)
    DEF BCD_PRINT_LETTER_DELAY EQU $38ed
ELIF DEF(_FR)
    DEF BCD_PRINT_LETTER_DELAY EQU $38f0
ELIF DEF(_IT)
    DEF BCD_PRINT_LETTER_DELAY EQU $38eb
ELIF DEF(_ES)
    DEF BCD_PRINT_LETTER_DELAY EQU $38f2
ELSE
    FAIL "Define exactly one release symbol"
ENDC

IF DEF(_JP)
SECTION "Print BCD", ROM0[$1586]

PrintBCDNumber::
    ld b, c
    res 7, c
    res 6, c
.loop
    ld a, [de]
    swap a
    call PrintBCDDigit
    ld a, [de]
    call PrintBCDDigit
    inc de
    dec c
    jr nz, .loop
    bit 7, b
    jr z, .done
    bit 6, b
    jr nz, .skipRightAlignmentAdjustment
    dec hl
.skipRightAlignmentAdjustment
    ld [hl], $f6
    call BCD_PRINT_LETTER_DELAY
    inc hl
.done
    ret

PrintBCDDigit::
    and $0f
    and a
    jr z, .zeroDigit
    res 7, b
.outputDigit
    add a, $f6
    ld [hli], a
    jp BCD_PRINT_LETTER_DELAY
.zeroDigit
    bit 7, b
    jr z, .outputDigit
    bit 6, b
    ret nz
    inc hl
    ret

ELSE
IF DEF(_FR)
SECTION "Print BCD", ROM0[$15ca]
ELSE
SECTION "Print BCD", ROM0[$15cd]
ENDC

PrintBCDNumber::
    ld b, c
    res 7, c
    res 6, c
    res 5, c
    bit 5, b
    jr z, .loop
    bit 7, b
    jr nz, .loop
    ld [hl], $f0
    inc hl
.loop
    ld a, [de]
    swap a
    call PrintBCDDigit
    ld a, [de]
    call PrintBCDDigit
    inc de
    dec c
    jr nz, .loop
    bit 7, b
    jr z, .done
    bit 6, b
    jr nz, .skipRightAlignmentAdjustment
    dec hl
.skipRightAlignmentAdjustment
    bit 5, b
    jr z, .skipCurrencySymbol
    ld [hl], $f0
    inc hl
.skipCurrencySymbol
    ld [hl], $f6
    call BCD_PRINT_LETTER_DELAY
    inc hl
.done
    ret

PrintBCDDigit::
    and $0f
    and a
    jr z, .zeroDigit
    bit 7, b
    jr z, .outputDigit
    bit 5, b
    jr z, .skipCurrencySymbol
    ld [hl], $f0
    inc hl
    res 5, b
.skipCurrencySymbol
    res 7, b
.outputDigit
    add a, $f6
    ld [hli], a
    jp BCD_PRINT_LETTER_DELAY
.zeroDigit
    bit 7, b
    jr z, .outputDigit
    bit 6, b
    ret nz
    inc hl
    ret
ENDC
