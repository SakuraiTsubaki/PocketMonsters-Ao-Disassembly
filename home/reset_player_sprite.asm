; Reset the player sprite-state structures.
; 37 bytes in every release.

IF DEF(_JP)
    DEF RPS_FILL_MEMORY EQU $3740
    SECTION "ROM0 reset player sprite", ROM0[$28c4]
ELIF DEF(_FR)
    DEF RPS_FILL_MEMORY EQU $36fd
    SECTION "ROM0 reset player sprite", ROM0[$28a2]
ELIF DEF(_ES)
    DEF RPS_FILL_MEMORY EQU $36ff
    SECTION "ROM0 reset player sprite", ROM0[$28a5]
ELIF DEF(_DE)
    DEF RPS_FILL_MEMORY EQU $36fa
    SECTION "ROM0 reset player sprite", ROM0[$28a6]
ELIF DEF(_IT)
    DEF RPS_FILL_MEMORY EQU $36f8
    SECTION "ROM0 reset player sprite", ROM0[$28a6]
ELSE
    DEF RPS_FILL_MEMORY EQU $36e0
    SECTION "ROM0 reset player sprite", ROM0[$28a6]
ENDC

ResetPlayerSpriteData::
    ld hl, $c100
    call .clear
    ld hl, $c200
    call .clear
    ld a, $01
    ld [$c100], a
    ld [$c20e], a
    ld hl, $c104
    ld [hl], $3c
    inc hl
    inc hl
    ld [hl], $40
    ret
.clear
    ld bc, $0010
    xor a
    jp RPS_FILL_MEMORY

PURGE RPS_FILL_MEMORY
