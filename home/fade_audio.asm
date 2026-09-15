; ROM0 audio fade-out state machine.
; 85 bytes in every release; code skeleton is identical.

IF DEF(_JP)
    DEF FA_W_CTRL EQU $cfae
    DEF FA_W_STATUS2 EQU $d6ab
    DEF FA_W_COUNTER EQU $cfb0
    DEF FA_W_RELOAD EQU $cfaf
    DEF FA_PLAY_SOUND EQU $2391
    SECTION "ROM0 fade audio", ROM0[$28e9]
ELIF DEF(_EN)
    DEF FA_W_CTRL EQU $cfc7
    DEF FA_W_STATUS2 EQU $d72c
    DEF FA_W_COUNTER EQU $cfc9
    DEF FA_W_RELOAD EQU $cfc8
    DEF FA_PLAY_SOUND EQU $23b1
    SECTION "ROM0 fade audio", ROM0[$28cb]
ELIF DEF(_DE)
    DEF FA_W_CTRL EQU $cfcc
    DEF FA_W_STATUS2 EQU $d731
    DEF FA_W_COUNTER EQU $cfce
    DEF FA_W_RELOAD EQU $cfcd
    DEF FA_PLAY_SOUND EQU $23b1
    SECTION "ROM0 fade audio", ROM0[$28cb]
ELIF DEF(_FR)
    DEF FA_W_CTRL EQU $cfcc
    DEF FA_W_STATUS2 EQU $d731
    DEF FA_W_COUNTER EQU $cfce
    DEF FA_W_RELOAD EQU $cfcd
    DEF FA_PLAY_SOUND EQU $23ad
    SECTION "ROM0 fade audio", ROM0[$28c7]
ELIF DEF(_IT)
    DEF FA_W_CTRL EQU $cfcc
    DEF FA_W_STATUS2 EQU $d731
    DEF FA_W_COUNTER EQU $cfce
    DEF FA_W_RELOAD EQU $cfcd
    DEF FA_PLAY_SOUND EQU $23b1
    SECTION "ROM0 fade audio", ROM0[$28cb]
ELIF DEF(_ES)
    DEF FA_W_CTRL EQU $cfcc
    DEF FA_W_STATUS2 EQU $d731
    DEF FA_W_COUNTER EQU $cfce
    DEF FA_W_RELOAD EQU $cfcd
    DEF FA_PLAY_SOUND EQU $23b0
    SECTION "ROM0 fade audio", ROM0[$28ca]
ELSE
    FAIL "Define exactly one release symbol"
ENDC

FadeOutAudio::
    ld a, [FA_W_CTRL]
    and a
    jr nz, .fadingOut
    ld a, [FA_W_STATUS2]
    bit 1, a
    ret nz
    ld a, $77
    ldh [$ff24], a
    ret
.fadingOut
    ld a, [FA_W_COUNTER]
    and a
    jr z, .counterReachedZero
    dec a
    ld [FA_W_COUNTER], a
    ret
.counterReachedZero
    ld a, [FA_W_RELOAD]
    ld [FA_W_COUNTER], a
    ldh a, [$ff24]
    and a
    jr z, .fadeOutComplete
    ld b, a
    and $0f
    dec a
    ld c, a
    ld a, b
    and $f0
    swap a
    dec a
    swap a
    or c
    ldh [$ff24], a
    ret
.fadeOutComplete
    ld a, [FA_W_CTRL]
    ld b, a
    xor a
    ld [FA_W_CTRL], a
    ld a, $ff
    ld [$c0ee], a
    call FA_PLAY_SOUND
    ld a, [$c0f0]
    ld [$c0ef], a
    ld a, b
    ld [$c0ee], a
    jp FA_PLAY_SOUND

PURGE FA_W_CTRL
PURGE FA_W_STATUS2
PURGE FA_W_COUNTER
PURGE FA_W_RELOAD
PURGE FA_PLAY_SOUND
