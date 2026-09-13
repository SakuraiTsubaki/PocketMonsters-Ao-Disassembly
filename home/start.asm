; Bank 00 entry and early joypad routines.

SECTION "Start", ROM0[$0150]

IF DEF(_JP)

_Start::
    jp $1f3a

Joypad::
; Call the bank-3 joypad core at $4000, preserving the current ROM bank.
    ldh a, [hLoadedROMBank]
    push af
    ld a, $03
    ldh [hLoadedROMBank], a
    ld [rROMB], a
    call $4000
    pop af
    ldh [hLoadedROMBank], a
    ld [rROMB], a
    ret

ELSE

_Start::
; Localized releases record whether startup came from CGB mode before Init.
    cp $11
    jr z, .cgb
    xor a
    jr .store
.cgb
    ld a, 0
.store
IF DEF(_EN)
    ld [$cf1a], a
ELSE
    ld [$cf1f], a
ENDC
IF DEF(_FR)
    jp $1f50
ELIF DEF(_ES)
    jp $1f53
ELSE
    jp $1f54
ENDC

ReadJoypad::
; Poll the joypad. Returned bits are inverted so pressed buttons are set.
    ld a, 1 << 5
    ld c, 0
    ldh [rJOYP], a
REPT 6
    ldh a, [rJOYP]
ENDR
    cpl
    and $0f
    swap a
    ld b, a

    ld a, 1 << 4
    ldh [rJOYP], a
REPT 10
    ldh a, [rJOYP]
ENDR
    cpl
    and $0f
    or b
    ldh [$fff8], a

    ld a, (1 << 4) | (1 << 5)
    ldh [rJOYP], a
    ret

Joypad::
; Call the bank-3 joypad core at $4000, preserving the current ROM bank.
    ldh a, [hLoadedROMBank]
    push af
    ld a, $03
    ldh [hLoadedROMBank], a
    ld [rROMB], a
    call $4000
    pop af
    ldh [hLoadedROMBank], a
    ld [rROMB], a
    ret

ENDC
