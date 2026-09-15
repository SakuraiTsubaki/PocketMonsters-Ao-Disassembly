; ROM0 Textbox wrapper. Exact per-release source reconstructed from the six project ROMs.

IF DEF(_JP)
SECTION "Textbox wrapper JP", ROM0[$3146]
; JP: $3146-$315A, 21 bytes, SHA-1 5b0785d13817660d3cf7c2d597606fb7c974f860
DisplayTextBoxID::
    db $f0, $b8, $f5, $3e, $01, $e0, $b8, $ea, $00, $20, $cd, $6d, $76, $c1, $78, $e0
    db $b8, $ea, $00, $20, $c9
ELIF DEF(_EN)
SECTION "Textbox wrapper EN", ROM0[$30e8]
; EN: $30E8-$30FC, 21 bytes, SHA-1 d6a4455e7151b2edce0b2fda673ecb0a432ed441
DisplayTextBoxID::
    db $f0, $b8, $f5, $3e, $01, $e0, $b8, $ea, $00, $20, $cd, $ea, $72, $c1, $78, $e0
    db $b8, $ea, $00, $20, $c9
ELIF DEF(_DE)
SECTION "Textbox wrapper DE", ROM0[$3102]
; DE: $3102-$3116, 21 bytes, SHA-1 b9e3d21edfa0d2d8fc7580326c05478f81044e1b
DisplayTextBoxID::
    db $f0, $b8, $f5, $3e, $01, $e0, $b8, $ea, $00, $20, $cd, $09, $73, $c1, $78, $e0
    db $b8, $ea, $00, $20, $c9
ELIF DEF(_FR)
SECTION "Textbox wrapper FR", ROM0[$3105]
; FR: $3105-$3119, 21 bytes, SHA-1 1711aba62622c7dbb09b7ec1e1e24e4d7142a2bb
DisplayTextBoxID::
    db $f0, $b8, $f5, $3e, $01, $e0, $b8, $ea, $00, $20, $cd, $7e, $73, $c1, $78, $e0
    db $b8, $ea, $00, $20, $c9
ELIF DEF(_IT)
SECTION "Textbox wrapper IT", ROM0[$3100]
; IT: $3100-$3114, 21 bytes, SHA-1 b80e5b58648adbb5d2bf93883c37164a3d8c570c
DisplayTextBoxID::
    db $f0, $b8, $f5, $3e, $01, $e0, $b8, $ea, $00, $20, $cd, $3b, $73, $c1, $78, $e0
    db $b8, $ea, $00, $20, $c9
ELIF DEF(_ES)
SECTION "Textbox wrapper ES", ROM0[$3107]
; ES: $3107-$311B, 21 bytes, SHA-1 646eb533bcffcb913e10fe14bd073ad36eb26f66
DisplayTextBoxID::
    db $f0, $b8, $f5, $3e, $01, $e0, $b8, $ea, $00, $20, $cd, $58, $73, $c1, $78, $e0
    db $b8, $ea, $00, $20, $c9
ELSE
    FAIL "Define exactly one release symbol"
ENDC
