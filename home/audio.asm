; Pocket Monsters Ao / Pokemon Blue ROM0 audio dispatch routines.
; 290 bytes / 147 SM83 instructions in every release; opcode skeleton identical.

IF DEF(_JP)
    DEF AUD_WAIT_SOUND EQU $37a6
    DEF AUD_W_LAST_MUSIC EQU $cfb1
    DEF AUD_W_STATUS4 EQU $d6ad
    DEF AUD_W_WALK_BIKE_SURF EQU $d67f
    DEF AUD_W_MAP_MUSIC_ID EQU $d2da
    DEF AUD_W_MAP_MUSIC_BANK EQU $d2db
    DEF AUD_AUDIO2_UPDATE EQU $5927
    DEF AUD_BANKSWITCH EQU $3636
    DEF AUD_W_FADE_CTRL EQU $cfae
    DEF AUD_AUDIO2_PLAY EQU $60e3
    SECTION "ROM0 audio", ROM0[$22e7]
ELIF DEF(_EN)
    DEF AUD_WAIT_SOUND EQU $3748
    DEF AUD_W_LAST_MUSIC EQU $cfca
    DEF AUD_W_STATUS4 EQU $d72e
    DEF AUD_W_WALK_BIKE_SURF EQU $d700
    DEF AUD_W_MAP_MUSIC_ID EQU $d35b
    DEF AUD_W_MAP_MUSIC_BANK EQU $d35c
    DEF AUD_AUDIO2_UPDATE EQU $5879
    DEF AUD_BANKSWITCH EQU $35d6
    DEF AUD_W_FADE_CTRL EQU $cfc7
    DEF AUD_AUDIO2_PLAY EQU $6035
    SECTION "ROM0 audio", ROM0[$2307]
ELIF DEF(_DE)
    DEF AUD_WAIT_SOUND EQU $3762
    DEF AUD_W_LAST_MUSIC EQU $cfcf
    DEF AUD_W_STATUS4 EQU $d733
    DEF AUD_W_WALK_BIKE_SURF EQU $d705
    DEF AUD_W_MAP_MUSIC_ID EQU $d360
    DEF AUD_W_MAP_MUSIC_BANK EQU $d361
    DEF AUD_AUDIO2_UPDATE EQU $5882
    DEF AUD_BANKSWITCH EQU $35f0
    DEF AUD_W_FADE_CTRL EQU $cfcc
    DEF AUD_AUDIO2_PLAY EQU $6040
    SECTION "ROM0 audio", ROM0[$2307]
ELIF DEF(_FR)
    DEF AUD_WAIT_SOUND EQU $3765
    DEF AUD_W_LAST_MUSIC EQU $cfcf
    DEF AUD_W_STATUS4 EQU $d733
    DEF AUD_W_WALK_BIKE_SURF EQU $d705
    DEF AUD_W_MAP_MUSIC_ID EQU $d360
    DEF AUD_W_MAP_MUSIC_BANK EQU $d361
    DEF AUD_AUDIO2_UPDATE EQU $587b
    DEF AUD_BANKSWITCH EQU $35f3
    DEF AUD_W_FADE_CTRL EQU $cfcc
    DEF AUD_AUDIO2_PLAY EQU $6039
    SECTION "ROM0 audio", ROM0[$2303]
ELIF DEF(_IT)
    DEF AUD_WAIT_SOUND EQU $3760
    DEF AUD_W_LAST_MUSIC EQU $cfcf
    DEF AUD_W_STATUS4 EQU $d733
    DEF AUD_W_WALK_BIKE_SURF EQU $d705
    DEF AUD_W_MAP_MUSIC_ID EQU $d360
    DEF AUD_W_MAP_MUSIC_BANK EQU $d361
    DEF AUD_AUDIO2_UPDATE EQU $5876
    DEF AUD_BANKSWITCH EQU $35ee
    DEF AUD_W_FADE_CTRL EQU $cfcc
    DEF AUD_AUDIO2_PLAY EQU $6034
    SECTION "ROM0 audio", ROM0[$2307]
ELIF DEF(_ES)
    DEF AUD_WAIT_SOUND EQU $3767
    DEF AUD_W_LAST_MUSIC EQU $cfcf
    DEF AUD_W_STATUS4 EQU $d733
    DEF AUD_W_WALK_BIKE_SURF EQU $d705
    DEF AUD_W_MAP_MUSIC_ID EQU $d360
    DEF AUD_W_MAP_MUSIC_BANK EQU $d361
    DEF AUD_AUDIO2_UPDATE EQU $587c
    DEF AUD_BANKSWITCH EQU $35f5
    DEF AUD_W_FADE_CTRL EQU $cfcc
    DEF AUD_AUDIO2_PLAY EQU $603a
    SECTION "ROM0 audio", ROM0[$2306]
ELSE
    FAIL "Define exactly one release symbol"
ENDC

PlayDefaultMusic::
    call AUD_WAIT_SOUND
    xor a
    ld c, a
    ld d, a
    ld [AUD_W_LAST_MUSIC], a
    jr PlayDefaultMusicCommon

PlayDefaultMusicFadeOutCurrent::
    ld c, $0a
    ld d, $00
    ld a, [AUD_W_STATUS4]
    bit 5, a
    jr z, PlayDefaultMusicCommon
    xor a
    ld [AUD_W_LAST_MUSIC], a
    ld c, $08
    ld d, c

PlayDefaultMusicCommon::
    ld a, [AUD_W_WALK_BIKE_SURF]
    and a
    jr z, .walking
    cp $02
    jr z, .surfing
    ld a, $d2
    jr .select
.surfing
    ld a, $d6
.select
    ld b, a
    ld a, d
    and a
    ld a, $1f
    jr nz, .saveBank
    ld [$c0ef], a
.saveBank
    ld [$c0f0], a
    jr .checkTrack
.walking
    ld a, [AUD_W_MAP_MUSIC_ID]
    ld b, a
    call CompareMapMusicBankWithCurrentBank
    jr c, .play
.checkTrack
    ld a, [AUD_W_LAST_MUSIC]
    cp b
    ret z
.play
    ld a, c
    ld [AUD_W_FADE_CTRL], a
    ld a, b
    ld [AUD_W_LAST_MUSIC], a
    ld [$c0ee], a
    jp PlaySound

UpdateMusic6Times::
    ld a, [$c0ef]
    ld b, a
    cp $02
    jr nz, .checkAudio2
    ld hl, $5103
    jr .run
.checkAudio2
    cp $08
    jr nz, .audio3
    ld hl, AUD_AUDIO2_UPDATE
    jr .run
.audio3
    ld hl, $5177
.run
    ld c, $06
.loop
    push bc
    push hl
    call AUD_BANKSWITCH
    pop hl
    pop bc
    dec c
    jr nz, .loop
    ret

CompareMapMusicBankWithCurrentBank::
    ld a, [AUD_W_MAP_MUSIC_BANK]
    ld e, a
    ld a, [$c0ef]
    cp e
    jr nz, .different
    ld [$c0f0], a
    and a
    ret
.different
    ld a, c
    and a
    ld a, e
    jr nz, .save
    ld [$c0ef], a
.save
    ld [$c0f0], a
    scf
    ret

PlayMusic::
    ld b, a
    ld [$c0ee], a
    xor a
    ld [AUD_W_FADE_CTRL], a
    ld a, c
    ld [$c0ef], a
    ld [$c0f0], a
    ld a, b

PlaySound::
    push hl
    push de
    push bc
    ld b, a
    ld a, [$c0ee]
    and a
    jr z, .checkFade
    xor a
    ld [$c02a], a
    ld [$c02b], a
    ld [$c02c], a
    ld [$c02d], a
.checkFade
    ld a, [AUD_W_FADE_CTRL]
    and a
    jr z, .noFade
    ld a, [$c0ee]
    and a
    jr z, .done
    xor a
    ld [$c0ee], a
    ld a, [AUD_W_LAST_MUSIC]
    cp $ff
    jr nz, .fadeOut
    xor a
    ld [AUD_W_FADE_CTRL], a
.noFade
    xor a
    ld [$c0ee], a
    ldh a, [$ffb8]
    ldh [$ffb9], a
    ld a, [$c0ef]
    ldh [$ffb8], a
    ld [$2000], a
    cp $02
    jr nz, .checkAudio2
    ld a, b
    call $5876
    jr .restoreBank
.checkAudio2
    cp $08
    jr nz, .audio3
    ld a, b
    call AUD_AUDIO2_PLAY
    jr .restoreBank
.audio3
    ld a, b
    call $58ea
.restoreBank
    ldh a, [$ffb9]
    ldh [$ffb8], a
    ld [$2000], a
    jr .done
.fadeOut
    ld a, b
    ld [AUD_W_LAST_MUSIC], a
    ld a, [AUD_W_FADE_CTRL]
    ld [AUD_W_FADE_CTRL + 1], a
    ld [AUD_W_FADE_CTRL + 2], a
    ld a, b
    ld [AUD_W_FADE_CTRL], a
.done
    pop bc
    pop de
    pop hl
    ret

PURGE AUD_WAIT_SOUND
PURGE AUD_W_LAST_MUSIC
PURGE AUD_W_STATUS4
PURGE AUD_W_WALK_BIKE_SURF
PURGE AUD_W_MAP_MUSIC_ID
PURGE AUD_W_MAP_MUSIC_BANK
PURGE AUD_AUDIO2_UPDATE
PURGE AUD_BANKSWITCH
PURGE AUD_W_FADE_CTRL
PURGE AUD_AUDIO2_PLAY
