; ROM0 UpdateSprites wrapper.

IF DEF(_JP)
    DEF US_W_ENABLED EQU $cfb2
    DEF US_TARGET EQU $4b8b
    SECTION "ROM0 update sprites", ROM0[$2409]
ELIF DEF(_EN)
    DEF US_W_ENABLED EQU $cfcb
    DEF US_TARGET EQU $4c34
    SECTION "ROM0 update sprites", ROM0[$2429]
ELIF DEF(_DE)
    DEF US_W_ENABLED EQU $cfd0
    DEF US_TARGET EQU $4c32
    SECTION "ROM0 update sprites", ROM0[$2429]
ELIF DEF(_FR)
    DEF US_W_ENABLED EQU $cfd0
    DEF US_TARGET EQU $4cb0
    SECTION "ROM0 update sprites", ROM0[$2425]
ELIF DEF(_IT)
    DEF US_W_ENABLED EQU $cfd0
    DEF US_TARGET EQU $4c83
    SECTION "ROM0 update sprites", ROM0[$2429]
ELIF DEF(_ES)
    DEF US_W_ENABLED EQU $cfd0
    DEF US_TARGET EQU $4c6c
    SECTION "ROM0 update sprites", ROM0[$2428]
ELSE
    FAIL "Define exactly one release symbol"
ENDC

UpdateSprites::
    ld a, [US_W_ENABLED]
    dec a
    ret nz
    ldh a, [$ffb8]
    push af
    ld a, $01
    ldh [$ffb8], a
    ld [$2000], a
    call US_TARGET
    pop af
    ldh [$ffb8], a
    ld [$2000], a
    ret

PURGE US_W_ENABLED
PURGE US_TARGET
