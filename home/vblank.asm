; Pocket Monsters Ao / Pokemon Blue ROM0 VBlank handler and DelayFrame.
; Localized releases share one 150-byte opcode skeleton.
; JP is 6 bytes shorter because the localized ReadJoypad polling gate is absent.

IF DEF(_JP)
    DEF VB_W_SAVED_ROM_BANK EQU $d0e7
    DEF VB_W_DISABLE_WY_UPDATE EQU $d07d
    DEF VB_PREPARE_OAM_DATA EQU $4a66
    DEF VB_RANDOM EQU $3ea0
    DEF VB_FADE_OUT_AUDIO EQU $28e9
    DEF VB_AUDIO2_UPDATE EQU $5927
    DEF VB_BANKSWITCH EQU $3636
ELIF DEF(_EN)
    DEF VB_W_SAVED_ROM_BANK EQU $d122
    DEF VB_W_DISABLE_WY_UPDATE EQU $d0a0
    DEF VB_PREPARE_OAM_DATA EQU $4b0f
    DEF VB_RANDOM EQU $3e5c
    DEF VB_FADE_OUT_AUDIO EQU $28cb
    DEF VB_AUDIO2_UPDATE EQU $5879
    DEF VB_BANKSWITCH EQU $35d6
ELIF DEF(_DE)
    DEF VB_W_SAVED_ROM_BANK EQU $d127
    DEF VB_W_DISABLE_WY_UPDATE EQU $d0a5
    DEF VB_PREPARE_OAM_DATA EQU $4b0b
    DEF VB_RANDOM EQU $3e76
    DEF VB_FADE_OUT_AUDIO EQU $28cb
    DEF VB_AUDIO2_UPDATE EQU $5882
    DEF VB_BANKSWITCH EQU $35f0
ELIF DEF(_FR)
    DEF VB_W_SAVED_ROM_BANK EQU $d127
    DEF VB_W_DISABLE_WY_UPDATE EQU $d0a5
    DEF VB_PREPARE_OAM_DATA EQU $4b8c
    DEF VB_RANDOM EQU $3e79
    DEF VB_FADE_OUT_AUDIO EQU $28c7
    DEF VB_AUDIO2_UPDATE EQU $587b
    DEF VB_BANKSWITCH EQU $35f3
ELIF DEF(_IT)
    DEF VB_W_SAVED_ROM_BANK EQU $d127
    DEF VB_W_DISABLE_WY_UPDATE EQU $d0a5
    DEF VB_PREPARE_OAM_DATA EQU $4b5f
    DEF VB_RANDOM EQU $3e74
    DEF VB_FADE_OUT_AUDIO EQU $28cb
    DEF VB_AUDIO2_UPDATE EQU $5876
    DEF VB_BANKSWITCH EQU $35ee
ELIF DEF(_ES)
    DEF VB_W_SAVED_ROM_BANK EQU $d127
    DEF VB_W_DISABLE_WY_UPDATE EQU $d0a5
    DEF VB_PREPARE_OAM_DATA EQU $4b47
    DEF VB_RANDOM EQU $3e7b
    DEF VB_FADE_OUT_AUDIO EQU $28ca
    DEF VB_AUDIO2_UPDATE EQU $587c
    DEF VB_BANKSWITCH EQU $35f5
ELSE
    FAIL "Define exactly one release symbol"
ENDC

IF DEF(_JP)
SECTION "ROM0 VBlank", ROM0[$200a]
ELIF DEF(_FR)
SECTION "ROM0 VBlank", ROM0[$2020]
ELIF DEF(_ES)
SECTION "ROM0 VBlank", ROM0[$2023]
ELSE
SECTION "ROM0 VBlank", ROM0[$2024]
ENDC

VBlank::
    push af
    push bc
    push de
    push hl
    ldh a, [$ffb8]
    ld [VB_W_SAVED_ROM_BANK], a
    ldh a, [$ffae]
    ldh [$ff43], a
    ldh a, [$ffaf]
    ldh [$ff42], a
    ld a, [VB_W_DISABLE_WY_UPDATE]
    and a
    jr nz, .skipWY
    ldh a, [$ffb0]
    ldh [$ff4a], a
.skipWY
    call AutoBgMapTransfer
    call VBlankCopyBgMap
    call RedrawRowOrColumn
    call VBlankCopy
    call VBlankCopyDouble
    call UpdateMovingBgTiles
    call $ff80
    ld a, $01
    ldh [$ffb8], a
    ld [$2000], a
    call VB_PREPARE_OAM_DATA
    call VB_RANDOM
    ldh a, [$ffd6]
    and a
    jr z, .skipZeroing
    xor a
    ldh [$ffd6], a
.skipZeroing
    ldh a, [$ffd5]
    and a
    jr z, .skipFrameDec
    dec a
    ldh [$ffd5], a
.skipFrameDec
    call VB_FADE_OUT_AUDIO
    ld a, [$c0ef]
    ldh [$ffb8], a
    ld [$2000], a
    cp $02
    jr nz, .checkAudio2
    call $5103
    jr .afterMusic
.checkAudio2
    cp $08
    jr nz, .audio3
    call $536e
    call VB_AUDIO2_UPDATE
    jr .afterMusic
.audio3
    call $5177
.afterMusic
    ld b, $06
    ld hl, $4dee
    call VB_BANKSWITCH
IF !DEF(_JP)
    ldh a, [$fff9]
    and a
    call z, ReadJoypad
ENDC
    ld a, [VB_W_SAVED_ROM_BANK]
    ldh [$ffb8], a
    ld [$2000], a
    pop hl
    pop de
    pop bc
    pop af
    reti

DelayFrame::
    ld a, $01
    ldh [$ffd6], a
.wait
    halt
    ldh a, [$ffd6]
    and a
    jr nz, .wait
    ret

PURGE VB_W_SAVED_ROM_BANK
PURGE VB_W_DISABLE_WY_UPDATE
PURGE VB_PREPARE_OAM_DATA
PURGE VB_RANDOM
PURGE VB_FADE_OUT_AUDIO
PURGE VB_AUDIO2_UPDATE
PURGE VB_BANKSWITCH
