; ROM0 NPC movement. Exact per-release source reconstructed from the six project ROMs.

IF DEF(_JP)
SECTION "NPC movement JP", ROM0[$315b]
; JP: $315B-$31B4, 90 bytes, SHA-1 90bb106c065226cd3be1080ccc6d9ddca07138b5
IsPlayerCharacterBeingControlledByGame::
    db $fa, $57, $cc, $a7, $c0, $fa, $b5, $d6, $cb, $4f, $c0, $fa, $af, $d6, $e6, $80
    db $c9, $21, $b5, $d6, $cb, $46, $cb, $86, $20, $2f, $fa, $57, $cc, $a7, $c8, $3d
    db $87, $16, $00, $5f, $21, $9e, $31, $19, $2a, $66, $6f, $f0, $b8, $f5, $fa, $58
    db $cc, $e0, $b8, $ea, $00, $20, $fa, $0b, $cf, $cd, $db, $3d, $f1, $e0, $b8, $ea
    db $00, $20, $c9, $f2, $7c, $c0, $7d, $2d, $7e, $06, $06, $21, $90, $7c, $c3, $36
    db $36, $06, $06, $21, $cd, $7c, $c3, $36, $36, $c9
ELIF DEF(_EN)
SECTION "NPC movement EN", ROM0[$30fd]
; EN: $30FD-$3156, 90 bytes, SHA-1 151dc1cf7a03696fc097722128b8c90507aa5d87
IsPlayerCharacterBeingControlledByGame::
    db $fa, $57, $cc, $a7, $c0, $fa, $36, $d7, $cb, $4f, $c0, $fa, $30, $d7, $e6, $80
    db $c9, $21, $36, $d7, $cb, $46, $cb, $86, $20, $2f, $fa, $57, $cc, $a7, $c8, $3d
    db $87, $16, $00, $5f, $21, $40, $31, $19, $2a, $66, $6f, $f0, $b8, $f5, $fa, $58
    db $cc, $e0, $b8, $ea, $00, $20, $fa, $10, $cf, $cd, $97, $3d, $f1, $e0, $b8, $ea
    db $00, $20, $c9, $42, $64, $10, $65, $7d, $65, $06, $06, $21, $e0, $63, $c3, $d6
    db $35, $06, $06, $21, $1d, $64, $c3, $d6, $35, $c9
ELIF DEF(_DE)
SECTION "NPC movement DE", ROM0[$3117]
; DE: $3117-$3170, 90 bytes, SHA-1 eda13e1bf96d04a445e48d59af98b61bc9bb51dd
IsPlayerCharacterBeingControlledByGame::
    db $fa, $57, $cc, $a7, $c0, $fa, $3b, $d7, $cb, $4f, $c0, $fa, $35, $d7, $e6, $80
    db $c9, $21, $3b, $d7, $cb, $46, $cb, $86, $20, $2f, $fa, $57, $cc, $a7, $c8, $3d
    db $87, $16, $00, $5f, $21, $5a, $31, $19, $2a, $66, $6f, $f0, $b8, $f5, $fa, $58
    db $cc, $e0, $b8, $ea, $00, $20, $fa, $15, $cf, $cd, $b1, $3d, $f1, $e0, $b8, $ea
    db $00, $20, $c9, $47, $64, $15, $65, $82, $65, $06, $06, $21, $e5, $63, $c3, $f0
    db $35, $06, $06, $21, $22, $64, $c3, $f0, $35, $c9
ELIF DEF(_FR)
SECTION "NPC movement FR", ROM0[$311a]
; FR: $311A-$3173, 90 bytes, SHA-1 7e53d87863a6cd04ca7db3b37e9101d1d930a19b
IsPlayerCharacterBeingControlledByGame::
    db $fa, $57, $cc, $a7, $c0, $fa, $3b, $d7, $cb, $4f, $c0, $fa, $35, $d7, $e6, $80
    db $c9, $21, $3b, $d7, $cb, $46, $cb, $86, $20, $2f, $fa, $57, $cc, $a7, $c8, $3d
    db $87, $16, $00, $5f, $21, $5d, $31, $19, $2a, $66, $6f, $f0, $b8, $f5, $fa, $58
    db $cc, $e0, $b8, $ea, $00, $20, $fa, $15, $cf, $cd, $b4, $3d, $f1, $e0, $b8, $ea
    db $00, $20, $c9, $47, $64, $15, $65, $82, $65, $06, $06, $21, $e5, $63, $c3, $f3
    db $35, $06, $06, $21, $22, $64, $c3, $f3, $35, $c9
ELIF DEF(_IT)
SECTION "NPC movement IT", ROM0[$3115]
; IT: $3115-$316E, 90 bytes, SHA-1 ca775e1f10bd3eb6c2a57ac8a1a7bc6911fffb72
IsPlayerCharacterBeingControlledByGame::
    db $fa, $57, $cc, $a7, $c0, $fa, $3b, $d7, $cb, $4f, $c0, $fa, $35, $d7, $e6, $80
    db $c9, $21, $3b, $d7, $cb, $46, $cb, $86, $20, $2f, $fa, $57, $cc, $a7, $c8, $3d
    db $87, $16, $00, $5f, $21, $58, $31, $19, $2a, $66, $6f, $f0, $b8, $f5, $fa, $58
    db $cc, $e0, $b8, $ea, $00, $20, $fa, $15, $cf, $cd, $af, $3d, $f1, $e0, $b8, $ea
    db $00, $20, $c9, $47, $64, $15, $65, $82, $65, $06, $06, $21, $e5, $63, $c3, $ee
    db $35, $06, $06, $21, $22, $64, $c3, $ee, $35, $c9
ELIF DEF(_ES)
SECTION "NPC movement ES", ROM0[$311c]
; ES: $311C-$3175, 90 bytes, SHA-1 7f8c187df68a2e08d32248f12e4aa7c387e1354f
IsPlayerCharacterBeingControlledByGame::
    db $fa, $57, $cc, $a7, $c0, $fa, $3b, $d7, $cb, $4f, $c0, $fa, $35, $d7, $e6, $80
    db $c9, $21, $3b, $d7, $cb, $46, $cb, $86, $20, $2f, $fa, $57, $cc, $a7, $c8, $3d
    db $87, $16, $00, $5f, $21, $5f, $31, $19, $2a, $66, $6f, $f0, $b8, $f5, $fa, $58
    db $cc, $e0, $b8, $ea, $00, $20, $fa, $15, $cf, $cd, $b6, $3d, $f1, $e0, $b8, $ea
    db $00, $20, $c9, $47, $64, $15, $65, $82, $65, $06, $06, $21, $e5, $63, $c3, $f5
    db $35, $06, $06, $21, $22, $64, $c3, $f5, $35, $c9
ELSE
    FAIL "Define exactly one release symbol"
ENDC
