; ROM0 Item wrappers. Exact per-release source reconstructed from the six project ROMs.

IF DEF(_JP)
SECTION "Item wrappers JP", ROM0[$311a]
; JP: $311A-$3145, 44 bytes, SHA-1 1c6c7cfc66edec778bab0f581795626bf7a11feb
UseItem::
    db $06, $03, $21, $53, $56, $c3, $36, $36, $f0, $b8, $f5, $3e, $03, $e0, $b8, $ea
    db $00, $20, $cd, $e9, $69, $d1, $7a, $e0, $b8, $ea, $00, $20, $c9, $e5, $d5, $c5
    db $06, $03, $21, $94, $6a, $cd, $36, $36, $c1, $d1, $e1, $c9
ELIF DEF(_EN)
SECTION "Item wrappers EN", ROM0[$30bc]
; EN: $30BC-$30E7, 44 bytes, SHA-1 1b04cc7f91939cba1aa3303ba0213035ae2017ee
UseItem::
    db $06, $03, $21, $c7, $55, $c3, $d6, $35, $f0, $b8, $f5, $3e, $03, $e0, $b8, $ea
    db $00, $20, $cd, $f1, $66, $d1, $7a, $e0, $b8, $ea, $00, $20, $c9, $e5, $d5, $c5
    db $06, $03, $21, $64, $67, $cd, $d6, $35, $c1, $d1, $e1, $c9
ELIF DEF(_DE)
SECTION "Item wrappers DE", ROM0[$30d6]
; DE: $30D6-$3101, 44 bytes, SHA-1 10651b629ac4fc73c57187b405341505adb7f4c3
UseItem::
    db $06, $03, $21, $c7, $55, $c3, $f0, $35, $f0, $b8, $f5, $3e, $03, $e0, $b8, $ea
    db $00, $20, $cd, $ea, $66, $d1, $7a, $e0, $b8, $ea, $00, $20, $c9, $e5, $d5, $c5
    db $06, $03, $21, $5d, $67, $cd, $f0, $35, $c1, $d1, $e1, $c9
ELIF DEF(_FR)
SECTION "Item wrappers FR", ROM0[$30d9]
; FR: $30D9-$3104, 44 bytes, SHA-1 177cd2bb779c8c3ea76d1e23be1e21662ff8d3b8
UseItem::
    db $06, $03, $21, $c7, $55, $c3, $f3, $35, $f0, $b8, $f5, $3e, $03, $e0, $b8, $ea
    db $00, $20, $cd, $e1, $66, $d1, $7a, $e0, $b8, $ea, $00, $20, $c9, $e5, $d5, $c5
    db $06, $03, $21, $54, $67, $cd, $f3, $35, $c1, $d1, $e1, $c9
ELIF DEF(_IT)
SECTION "Item wrappers IT", ROM0[$30d4]
; IT: $30D4-$30FF, 44 bytes, SHA-1 77f62ee3779984f56c1dfb3be80c100e24a9c4a0
UseItem::
    db $06, $03, $21, $c7, $55, $c3, $ee, $35, $f0, $b8, $f5, $3e, $03, $e0, $b8, $ea
    db $00, $20, $cd, $eb, $66, $d1, $7a, $e0, $b8, $ea, $00, $20, $c9, $e5, $d5, $c5
    db $06, $03, $21, $5e, $67, $cd, $ee, $35, $c1, $d1, $e1, $c9
ELIF DEF(_ES)
SECTION "Item wrappers ES", ROM0[$30db]
; ES: $30DB-$3106, 44 bytes, SHA-1 6e4c308a7395257c0b81f0b55e82b31328870aad
UseItem::
    db $06, $03, $21, $c7, $55, $c3, $f5, $35, $f0, $b8, $f5, $3e, $03, $e0, $b8, $ea
    db $00, $20, $cd, $f3, $66, $d1, $7a, $e0, $b8, $ea, $00, $20, $c9, $e5, $d5, $c5
    db $06, $03, $21, $66, $67, $cd, $f5, $35, $c1, $d1, $e1, $c9
ELSE
    FAIL "Define exactly one release symbol"
ENDC
