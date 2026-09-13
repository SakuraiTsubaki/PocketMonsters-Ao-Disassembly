; Pocket Monsters Ao / Pokemon Blue ROM0 reset and initialization routines.
; Reconstructed directly from all six source ROMs.
; The 219-byte opcode skeleton is identical across all releases.
; Release-specific external routine/WRAM addresses are isolated below.

IF DEF(_JP)
    DEF INIT_GB_PAL_WHITE_OUT EQU $3e29
    DEF INIT_DELAY_FRAMES EQU $3797
    DEF INIT_FILL_MEMORY EQU $3740
    DEF INIT_WRITE_DMA_CODE_TO_HRAM EQU $4b44
    DEF INIT_PREDEF EQU $3eb1
    DEF INIT_GB_PAL_NORMAL EQU $3e20
    DEF INIT_PREPARE_TITLE_SCREEN EQU $42d6
    DEF INIT_PLAY_SOUND EQU $2391
    DEF INIT_W_UPDATE_SPRITES_ENABLED EQU $cfb2
    DEF INIT_W_AUDIO_FADE_OUT_CONTROL EQU $cfae
    DEF INIT_W_LAST_MUSIC_SOUND_ID EQU $cfb1
ELIF DEF(_EN)
    DEF INIT_GB_PAL_WHITE_OUT EQU $3de5
    DEF INIT_DELAY_FRAMES EQU $3739
    DEF INIT_FILL_MEMORY EQU $36e0
    DEF INIT_WRITE_DMA_CODE_TO_HRAM EQU $4bed
    DEF INIT_PREDEF EQU $3e6d
    DEF INIT_GB_PAL_NORMAL EQU $3ddc
    DEF INIT_PREPARE_TITLE_SCREEN EQU $42b7
    DEF INIT_PLAY_SOUND EQU $23b1
    DEF INIT_W_UPDATE_SPRITES_ENABLED EQU $cfcb
    DEF INIT_W_AUDIO_FADE_OUT_CONTROL EQU $cfc7
    DEF INIT_W_LAST_MUSIC_SOUND_ID EQU $cfca
ELIF DEF(_DE)
    DEF INIT_GB_PAL_WHITE_OUT EQU $3dff
    DEF INIT_DELAY_FRAMES EQU $3753
    DEF INIT_FILL_MEMORY EQU $36fa
    DEF INIT_WRITE_DMA_CODE_TO_HRAM EQU $4be9
    DEF INIT_PREDEF EQU $3e87
    DEF INIT_GB_PAL_NORMAL EQU $3df6
    DEF INIT_PREPARE_TITLE_SCREEN EQU $42b7
    DEF INIT_PLAY_SOUND EQU $23b1
    DEF INIT_W_UPDATE_SPRITES_ENABLED EQU $cfd0
    DEF INIT_W_AUDIO_FADE_OUT_CONTROL EQU $cfcc
    DEF INIT_W_LAST_MUSIC_SOUND_ID EQU $cfcf
ELIF DEF(_FR)
    DEF INIT_GB_PAL_WHITE_OUT EQU $3e02
    DEF INIT_DELAY_FRAMES EQU $3756
    DEF INIT_FILL_MEMORY EQU $36fd
    DEF INIT_WRITE_DMA_CODE_TO_HRAM EQU $4c6a
    DEF INIT_PREDEF EQU $3e8a
    DEF INIT_GB_PAL_NORMAL EQU $3df9
    DEF INIT_PREPARE_TITLE_SCREEN EQU $42b7
    DEF INIT_PLAY_SOUND EQU $23ad
    DEF INIT_W_UPDATE_SPRITES_ENABLED EQU $cfd0
    DEF INIT_W_AUDIO_FADE_OUT_CONTROL EQU $cfcc
    DEF INIT_W_LAST_MUSIC_SOUND_ID EQU $cfcf
ELIF DEF(_IT)
    DEF INIT_GB_PAL_WHITE_OUT EQU $3dfd
    DEF INIT_DELAY_FRAMES EQU $3751
    DEF INIT_FILL_MEMORY EQU $36f8
    DEF INIT_WRITE_DMA_CODE_TO_HRAM EQU $4c3d
    DEF INIT_PREDEF EQU $3e85
    DEF INIT_GB_PAL_NORMAL EQU $3df4
    DEF INIT_PREPARE_TITLE_SCREEN EQU $42b7
    DEF INIT_PLAY_SOUND EQU $23b1
    DEF INIT_W_UPDATE_SPRITES_ENABLED EQU $cfd0
    DEF INIT_W_AUDIO_FADE_OUT_CONTROL EQU $cfcc
    DEF INIT_W_LAST_MUSIC_SOUND_ID EQU $cfcf
ELIF DEF(_ES)
    DEF INIT_GB_PAL_WHITE_OUT EQU $3e04
    DEF INIT_DELAY_FRAMES EQU $3758
    DEF INIT_FILL_MEMORY EQU $36ff
    DEF INIT_WRITE_DMA_CODE_TO_HRAM EQU $4c25
    DEF INIT_PREDEF EQU $3e8c
    DEF INIT_GB_PAL_NORMAL EQU $3dfb
    DEF INIT_PREPARE_TITLE_SCREEN EQU $42b7
    DEF INIT_PLAY_SOUND EQU $23b0
    DEF INIT_W_UPDATE_SPRITES_ENABLED EQU $cfd0
    DEF INIT_W_AUDIO_FADE_OUT_CONTROL EQU $cfcc
    DEF INIT_W_LAST_MUSIC_SOUND_ID EQU $cfcf
ELSE
    FAIL "Define exactly one release symbol"
ENDC

IF DEF(_JP)
SECTION "ROM0 init", ROM0[$1f2f]
ELIF DEF(_FR)
SECTION "ROM0 init", ROM0[$1f45]
ELIF DEF(_ES)
SECTION "ROM0 init", ROM0[$1f48]
ELSE
SECTION "ROM0 init", ROM0[$1f49]
ENDC

SoftReset::
    call StopAllSounds
    call INIT_GB_PAL_WHITE_OUT
    ld c, $20
    call INIT_DELAY_FRAMES

Init::
    di
    xor a
    ldh [$ff0f], a
    ldh [$ffff], a
    ldh [$ff43], a
    ldh [$ff42], a
    ldh [$ff01], a
    ldh [$ff02], a
    ldh [$ff4b], a
    ldh [$ff4a], a
    ldh [$ff06], a
    ldh [$ff07], a
    ldh [$ff47], a
    ldh [$ff48], a
    ldh [$ff49], a
    ld a, $80
    ldh [$ff40], a
    call DisableLCD
    ld sp, $dfff
    ld hl, $c000
    ld bc, $2000
.initWramLoop
    ld [hl], $00
    inc hl
    dec bc
    ld a, b
    or c
    jr nz, .initWramLoop
    call ClearVram
    ld hl, $ff80
    ld bc, $007f
    call INIT_FILL_MEMORY
    call ClearSprites
    ld a, $01
    ldh [$ffb8], a
    ld [$2000], a
    call INIT_WRITE_DMA_CODE_TO_HRAM
    xor a
    ldh [$ffd7], a
    ldh [$ff41], a
    ldh [$ffae], a
    ldh [$ffaf], a
    ldh [$ff0f], a
    ld a, $0d
    ldh [$ffff], a
    ld a, $90
    ldh [$ffb0], a
    ldh [$ff4a], a
    ld a, $07
    ldh [$ff4b], a
    ld a, $ff
    ldh [$ffaa], a
    ld h, $98
    call ClearBgMap
    ld h, $9c
    call ClearBgMap
    ld a, $e3
    ldh [$ff40], a
    ld a, $10
    ldh [$ff8a], a
    call StopAllSounds
    ei
    ld a, $40
    call INIT_PREDEF
    ld a, $1f
    ld [$c0ef], a
    ld [$c0f0], a
    ld a, $9c
    ldh [$ffbd], a
    xor a
    ldh [$ffbc], a
    dec a
    ld [INIT_W_UPDATE_SPRITES_ENABLED], a
    ld a, $32
    call INIT_PREDEF
    call DisableLCD
    call ClearVram
    call INIT_GB_PAL_NORMAL
    call ClearSprites
    ld a, $e3
    ldh [$ff40], a
    jp INIT_PREPARE_TITLE_SCREEN

ClearVram::
    ld hl, $8000
    ld bc, $2000
    xor a
    jp INIT_FILL_MEMORY

StopAllSounds::
    ld a, $02
    ld [$c0ef], a
    ld [$c0f0], a
    xor a
    ld [INIT_W_AUDIO_FADE_OUT_CONTROL], a
    ld [$c0ee], a
    ld [INIT_W_LAST_MUSIC_SOUND_ID], a
    dec a
    jp INIT_PLAY_SOUND

PURGE INIT_GB_PAL_WHITE_OUT
PURGE INIT_DELAY_FRAMES
PURGE INIT_FILL_MEMORY
PURGE INIT_WRITE_DMA_CODE_TO_HRAM
PURGE INIT_PREDEF
PURGE INIT_GB_PAL_NORMAL
PURGE INIT_PREPARE_TITLE_SCREEN
PURGE INIT_PLAY_SOUND
PURGE INIT_W_UPDATE_SPRITES_ENABLED
PURGE INIT_W_AUDIO_FADE_OUT_CONTROL
PURGE INIT_W_LAST_MUSIC_SOUND_ID
