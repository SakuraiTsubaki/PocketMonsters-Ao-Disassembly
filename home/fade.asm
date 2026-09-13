; Pocket Monsters Ao / Pokemon Blue ROM0 palette fade routines.
; 107 bytes in every release: 83 bytes of code plus 24 bytes of palette data.

IF DEF(_JP)
    DEF FADE_W_MAP_PAL_OFFSET EQU $d2dc
    DEF FADE_DELAY_FRAMES EQU $3797
    SECTION "ROM0 fade", ROM0[$209a]
ELIF DEF(_EN)
    DEF FADE_W_MAP_PAL_OFFSET EQU $d35d
    DEF FADE_DELAY_FRAMES EQU $3739
    SECTION "ROM0 fade", ROM0[$20ba]
ELIF DEF(_DE)
    DEF FADE_W_MAP_PAL_OFFSET EQU $d362
    DEF FADE_DELAY_FRAMES EQU $3753
    SECTION "ROM0 fade", ROM0[$20ba]
ELIF DEF(_FR)
    DEF FADE_W_MAP_PAL_OFFSET EQU $d362
    DEF FADE_DELAY_FRAMES EQU $3756
    SECTION "ROM0 fade", ROM0[$20b6]
ELIF DEF(_IT)
    DEF FADE_W_MAP_PAL_OFFSET EQU $d362
    DEF FADE_DELAY_FRAMES EQU $3751
    SECTION "ROM0 fade", ROM0[$20ba]
ELIF DEF(_ES)
    DEF FADE_W_MAP_PAL_OFFSET EQU $d362
    DEF FADE_DELAY_FRAMES EQU $3758
    SECTION "ROM0 fade", ROM0[$20b9]
ELSE
    FAIL "Define exactly one release symbol"
ENDC

LoadGBPal::
    ld a, [FADE_W_MAP_PAL_OFFSET]
    ld b, a
    ld hl, FadePal4
    ld a, l
    sub b
    ld l, a
    jr nc, .noBorrow
    dec h
.noBorrow
    ld a, [hli]
    ldh [$ff47], a
    ld a, [hli]
    ldh [$ff48], a
    ld a, [hli]
    ldh [$ff49], a
    ret

GBFadeInFromBlack::
    ld hl, FadePal1
    ld b, $04
    jr GBFadeIncCommon

GBFadeOutToWhite::
    ld hl, FadePal6
    ld b, $03

GBFadeIncCommon::
    ld a, [hli]
    ldh [$ff47], a
    ld a, [hli]
    ldh [$ff48], a
    ld a, [hli]
    ldh [$ff49], a
    ld c, $08
    call FADE_DELAY_FRAMES
    dec b
    jr nz, GBFadeIncCommon
    ret

GBFadeOutToBlack::
    ld hl, FadePal4 + 2
    ld b, $04
    jr GBFadeDecCommon

GBFadeInFromWhite::
    ld hl, FadePal7 + 2
    ld b, $03

GBFadeDecCommon::
    ld a, [hld]
    ldh [$ff49], a
    ld a, [hld]
    ldh [$ff48], a
    ld a, [hld]
    ldh [$ff47], a
    ld c, $08
    call FADE_DELAY_FRAMES
    dec b
    jr nz, GBFadeDecCommon
    ret

FadePal1:: db $ff, $ff, $ff
FadePal2:: db $fe, $fe, $f8
FadePal3:: db $f9, $e4, $e4
FadePal4:: db $e4, $d0, $e0
FadePal5:: db $e4, $d0, $e0
FadePal6:: db $90, $80, $90
FadePal7:: db $40, $40, $40
FadePal8:: db $00, $00, $00

PURGE FADE_W_MAP_PAL_OFFSET
PURGE FADE_DELAY_FRAMES
