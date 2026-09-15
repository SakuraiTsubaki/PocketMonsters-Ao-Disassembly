; Pocket Monsters Ao / Pokemon Blue ROM0 serial/link routines.
; Reconstructed directly from all six source ROMs.
; 481 bytes / 260 SM83 instructions in every release; opcode skeleton identical.

IF DEF(_JP)
    DEF SER_W_UNKNOWN2 EQU $d051
    DEF SER_SAVE_SCREEN EQU $3777
    DEF SER_PRINT_WAITING_TEXT EQU $4b5c
    DEF SER_BANKSWITCH EQU $3636
    DEF SER_LOAD_SCREEN EQU $3783
    SECTION "ROM0 serial", ROM0[$2105]
ELIF DEF(_EN)
    DEF SER_W_UNKNOWN2 EQU $d074
    DEF SER_SAVE_SCREEN EQU $3719
    DEF SER_PRINT_WAITING_TEXT EQU $4c05
    DEF SER_BANKSWITCH EQU $35d6
    DEF SER_LOAD_SCREEN EQU $3725
    SECTION "ROM0 serial", ROM0[$2125]
ELIF DEF(_DE)
    DEF SER_W_UNKNOWN2 EQU $d079
    DEF SER_SAVE_SCREEN EQU $3733
    DEF SER_PRINT_WAITING_TEXT EQU $4c01
    DEF SER_BANKSWITCH EQU $35f0
    DEF SER_LOAD_SCREEN EQU $373f
    SECTION "ROM0 serial", ROM0[$2125]
ELIF DEF(_FR)
    DEF SER_W_UNKNOWN2 EQU $d079
    DEF SER_SAVE_SCREEN EQU $3736
    DEF SER_PRINT_WAITING_TEXT EQU $4c82
    DEF SER_BANKSWITCH EQU $35f3
    DEF SER_LOAD_SCREEN EQU $3742
    SECTION "ROM0 serial", ROM0[$2121]
ELIF DEF(_IT)
    DEF SER_W_UNKNOWN2 EQU $d079
    DEF SER_SAVE_SCREEN EQU $3731
    DEF SER_PRINT_WAITING_TEXT EQU $4c55
    DEF SER_BANKSWITCH EQU $35ee
    DEF SER_LOAD_SCREEN EQU $373d
    SECTION "ROM0 serial", ROM0[$2125]
ELIF DEF(_ES)
    DEF SER_W_UNKNOWN2 EQU $d079
    DEF SER_SAVE_SCREEN EQU $3738
    DEF SER_PRINT_WAITING_TEXT EQU $4c3d
    DEF SER_BANKSWITCH EQU $35f5
    DEF SER_LOAD_SCREEN EQU $3744
    SECTION "ROM0 serial", ROM0[$2124]
ELSE
    FAIL "Define exactly one release symbol"
ENDC

Serial::
    push af
    push bc
    push de
    push hl
    ldh a, [$ffaa]
    inc a
    jr z, .connectionNotYetEstablished
    ldh a, [$ff01]
    ldh [$ffad], a
    ldh a, [$ffac]
    ldh [$ff01], a
    ldh a, [$ffaa]
    cp $02
    jr z, .done
    ld a, $80
    ldh [$ff02], a
    jr .done
.connectionNotYetEstablished
    ldh a, [$ff01]
    ldh [$ffad], a
    ldh [$ffaa], a
    cp $02
    jr z, .usingInternalClock
    xor a
    ldh [$ff01], a
    ld a, $03
    ldh [$ff04], a
.waitDiv
    ldh a, [$ff04]
    bit 7, a
    jr nz, .waitDiv
    ld a, $80
    ldh [$ff02], a
    jr .done
.usingInternalClock
    xor a
    ldh [$ff01], a
.done
    ld a, $01
    ldh [$ffa9], a
    ld a, $fe
    ldh [$ffac], a
    pop hl
    pop de
    pop bc
    pop af
    reti

Serial_ExchangeBytes::
    ld a, $01
    ldh [$ffab], a
.loop
    ld a, [hl]
    ldh [$ffac], a
    call Serial_ExchangeByte
    push bc
    ld b, a
    inc hl
    ld a, $30
.wait
    dec a
    jr nz, .wait
    ldh a, [$ffab]
    and a
    ld a, b
    pop bc
    jr z, .store
    dec hl
    cp $fd
    jr nz, .loop
    xor a
    ldh [$ffab], a
    jr .loop
.store
    ld [de], a
    inc de
    dec bc
    ld a, b
    or c
    jr nz, .loop
    ret

Serial_ExchangeByte::
    xor a
    ldh [$ffa9], a
    ldh a, [$ffaa]
    cp $02
    jr nz, .loop
    ld a, $81
    ldh [$ff02], a
.loop
    ldh a, [$ffa9]
    and a
    jr nz, .received
    ldh a, [$ffaa]
    cp $01
    jr nz, .counter2
    call IsUnknownCounterZero
    jr z, .counter2
    call WaitLoop_15Iterations
    push hl
    ld hl, $cc48
    inc [hl]
    jr nz, .noCarry
    dec hl
    inc [hl]
.noCarry
    pop hl
    call IsUnknownCounterZero
    jr nz, .loop
    jp SetUnknownCounterToFFFF
.counter2
    ldh a, [$ffff]
    and $0f
    cp $08
    jr nz, .loop
    ld a, [SER_W_UNKNOWN2]
    dec a
    ld [SER_W_UNKNOWN2], a
    jr nz, .loop
    ld a, [SER_W_UNKNOWN2 + 1]
    dec a
    ld [SER_W_UNKNOWN2 + 1], a
    jr nz, .loop
    ldh a, [$ffaa]
    cp $01
    jr z, .received
    ld a, $ff
.waitExternal
    dec a
    jr nz, .waitExternal
.received
    xor a
    ldh [$ffa9], a
    ldh a, [$ffff]
    and $0f
    sub $08
    jr nz, .skipReload
    ld [SER_W_UNKNOWN2], a
    ld a, $50
    ld [SER_W_UNKNOWN2 + 1], a
.skipReload
    ldh a, [$ffad]
    cp $fe
    ret nz
    call IsUnknownCounterZero
    jr z, .done
    push hl
    ld hl, $cc48
    ld a, [hl]
    dec a
    ld [hld], a
    inc a
    jr nz, .noBorrow
    dec [hl]
.noBorrow
    pop hl
    call IsUnknownCounterZero
    jr z, SetUnknownCounterToFFFF
.done
    ldh a, [$ffff]
    and $0f
    cp $08
    ld a, $fe
    ret z
    ld a, [hl]
    ldh [$ffac], a
    call DelayFrame
    jp Serial_ExchangeByte

WaitLoop_15Iterations::
    ld a, $0f
.loop
    dec a
    jr nz, .loop
    ret

IsUnknownCounterZero::
    push hl
    ld hl, $cc47
    ld a, [hli]
    or [hl]
    pop hl
    ret

SetUnknownCounterToFFFF::
    dec a
    ld [$cc47], a
    ld [$cc48], a
    ret

Serial_ExchangeLinkMenuSelection::
    ld hl, $cc42
    ld de, $cc3d
    ld c, $02
    ld a, $01
    ldh [$ffab], a
.loop
    call DelayFrame
    ld a, [hl]
    ldh [$ffac], a
    call Serial_ExchangeByte
    ld b, a
    inc hl
    ldh a, [$ffab]
    and a
    ld a, $00
    ldh [$ffab], a
    jr nz, .loop
    ld a, b
    ld [de], a
    inc de
    dec c
    jr nz, .loop
    ret

Serial_PrintWaitingTextAndSyncAndExchangeNybble::
    call SER_SAVE_SCREEN
    ld hl, SER_PRINT_WAITING_TEXT
    ld b, $01
    call SER_BANKSWITCH
    call Serial_SyncAndExchangeNybble
    jp SER_LOAD_SCREEN

Serial_SyncAndExchangeNybble::
    ld a, $ff
    ld [$cc3e], a
.loop1
    call Serial_ExchangeNybble
    call DelayFrame
    call IsUnknownCounterZero
    jr z, .next1
    push hl
    ld hl, $cc48
    dec [hl]
    jr nz, .next2
    dec hl
    dec [hl]
    jr nz, .next2
    pop hl
    xor a
    jp SetUnknownCounterToFFFF
.next2
    pop hl
.next1
    ld a, [$cc3e]
    inc a
    jr z, .loop1
    ld b, $0a
.loop2
    call DelayFrame
    call Serial_ExchangeNybble
    dec b
    jr nz, .loop2
    ld b, $0a
.loop3
    call DelayFrame
    call Serial_SendZeroByte
    dec b
    jr nz, .loop3
    ld a, [$cc3e]
    ld [$cc3d], a
    ret

Serial_ExchangeNybble::
    call .doExchange
    ld a, [$cc42]
    add a, $60
    ldh [$ffac], a
    ldh a, [$ffaa]
    cp $02
    jr nz, .doExchange
    ld a, $81
    ldh [$ff02], a
.doExchange
    ldh a, [$ffad]
    ld [$cc3d], a
    and $f0
    cp $60
    ret nz
    xor a
    ldh [$ffad], a
    ld a, [$cc3d]
    and $0f
    ld [$cc3e], a
    ret

Serial_SendZeroByte::
    xor a
    ldh [$ffac], a
    ldh a, [$ffaa]
    cp $02
    ret nz
    ld a, $81
    ldh [$ff02], a
    ret

Serial_TryEstablishingExternallyClockedConnection::
    ld a, $02
    ldh [$ff01], a
    xor a
    ldh [$ffad], a
    ld a, $80
    ldh [$ff02], a
    ret

PURGE SER_W_UNKNOWN2
PURGE SER_SAVE_SCREEN
PURGE SER_PRINT_WAITING_TEXT
PURGE SER_BANKSWITCH
PURGE SER_LOAD_SCREEN
