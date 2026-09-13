; Count set bits in a byte string.
; The routine is 23 bytes in every release; only wNumSetBits moves.

IF DEF(_JP)
    DEF CSB_W_NUM_SET_BITS EQU $d0e3
    SECTION "ROM0 count set bits", ROM0[$2bdc]
ELIF DEF(_EN)
    DEF CSB_W_NUM_SET_BITS EQU $d11e
    SECTION "ROM0 count set bits", ROM0[$2b7f]
ELIF DEF(_DE)
    DEF CSB_W_NUM_SET_BITS EQU $d123
    SECTION "ROM0 count set bits", ROM0[$2b99]
ELIF DEF(_FR)
    DEF CSB_W_NUM_SET_BITS EQU $d123
    SECTION "ROM0 count set bits", ROM0[$2b95]
ELIF DEF(_IT)
    DEF CSB_W_NUM_SET_BITS EQU $d123
    SECTION "ROM0 count set bits", ROM0[$2b99]
ELIF DEF(_ES)
    DEF CSB_W_NUM_SET_BITS EQU $d123
    SECTION "ROM0 count set bits", ROM0[$2b98]
ELSE
    FAIL "Define exactly one release symbol"
ENDC

CountSetBits::
    ld c, 0
.loop
    ld a, [hli]
    ld e, a
    ld d, 8
.innerLoop
    srl e
    ld a, 0
    adc c
    ld c, a
    dec d
    jr nz, .innerLoop
    dec b
    jr nz, .loop
    ld a, c
    ld [CSB_W_NUM_SET_BITS], a
    ret

PURGE CSB_W_NUM_SET_BITS
