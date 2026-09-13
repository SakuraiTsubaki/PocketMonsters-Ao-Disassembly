; ROM0 Reload tiles. Exact per-release source reconstructed from the six project ROMs.

IF DEF(_JP)
SECTION "Reload tiles JP", ROM0[$30cf]
; JP: $30CF-$3119, 75 bytes, SHA-1 f6bf0b4db8325a712a113aa42f5b7b19e4eb3b9f
ReloadMapData::
    db $f0, $b8, $f5, $fa, $dd, $d2, $cd, $75, $12, $cd, $c7, $16, $cd, $00, $37, $cd
    db $63, $0c, $cd, $a1, $09, $cd, $e1, $16, $f1, $e0, $b8, $ea, $00, $20, $c9, $f0
    db $b8, $f5, $fa, $dd, $d2, $cd, $75, $12, $cd, $c7, $16, $cd, $a1, $09, $cd, $e1
    db $16, $f1, $e0, $b8, $ea, $00, $20, $c9, $21, $ad, $d6, $cb, $a6, $06, $1c, $21
    db $ed, $54, $c3, $36, $36, $3e, $01, $ea, $3c, $cc, $c9
ELIF DEF(_EN)
SECTION "Reload tiles EN", ROM0[$3071]
; EN: $3071-$30BB, 75 bytes, SHA-1 e456b864695b1944eb9648825e78aaf45d319dec
ReloadMapData::
    db $f0, $b8, $f5, $fa, $5e, $d3, $cd, $bc, $12, $cd, $61, $00, $cd, $a0, $36, $cd
    db $aa, $0c, $cd, $e8, $09, $cd, $7b, $00, $f1, $e0, $b8, $ea, $00, $20, $c9, $f0
    db $b8, $f5, $fa, $5e, $d3, $cd, $bc, $12, $cd, $61, $00, $cd, $e8, $09, $cd, $7b
    db $00, $f1, $e0, $b8, $ea, $00, $20, $c9, $21, $2e, $d7, $cb, $a6, $06, $1c, $21
    db $90, $4f, $c3, $d6, $35, $3e, $01, $ea, $3c, $cc, $c9
ELIF DEF(_DE)
SECTION "Reload tiles DE", ROM0[$308b]
; DE: $308B-$30D5, 75 bytes, SHA-1 4602cd69e9995d9176779a3abb30e5e5cbdda643
ReloadMapData::
    db $f0, $b8, $f5, $fa, $63, $d3, $cd, $bc, $12, $cd, $61, $00, $cd, $ba, $36, $cd
    db $aa, $0c, $cd, $e8, $09, $cd, $7b, $00, $f1, $e0, $b8, $ea, $00, $20, $c9, $f0
    db $b8, $f5, $fa, $63, $d3, $cd, $bc, $12, $cd, $61, $00, $cd, $e8, $09, $cd, $7b
    db $00, $f1, $e0, $b8, $ea, $00, $20, $c9, $21, $33, $d7, $cb, $a6, $06, $1c, $21
    db $8e, $4f, $c3, $f0, $35, $3e, $01, $ea, $3c, $cc, $c9
ELIF DEF(_FR)
SECTION "Reload tiles FR", ROM0[$308e]
; FR: $308E-$30D8, 75 bytes, SHA-1 2623e2dc2b40ff4b12f8ccad75cf99183d55d1fe
ReloadMapData::
    db $f0, $b8, $f5, $fa, $63, $d3, $cd, $bc, $12, $cd, $61, $00, $cd, $bd, $36, $cd
    db $aa, $0c, $cd, $e8, $09, $cd, $7b, $00, $f1, $e0, $b8, $ea, $00, $20, $c9, $f0
    db $b8, $f5, $fa, $63, $d3, $cd, $bc, $12, $cd, $61, $00, $cd, $e8, $09, $cd, $7b
    db $00, $f1, $e0, $b8, $ea, $00, $20, $c9, $21, $33, $d7, $cb, $a6, $06, $1c, $21
    db $93, $4f, $c3, $f3, $35, $3e, $01, $ea, $3c, $cc, $c9
ELIF DEF(_IT)
SECTION "Reload tiles IT", ROM0[$3089]
; IT: $3089-$30D3, 75 bytes, SHA-1 75dbe2786d5507951830e1b82e8f4d2b65f691a4
ReloadMapData::
    db $f0, $b8, $f5, $fa, $63, $d3, $cd, $bc, $12, $cd, $61, $00, $cd, $b8, $36, $cd
    db $aa, $0c, $cd, $e8, $09, $cd, $7b, $00, $f1, $e0, $b8, $ea, $00, $20, $c9, $f0
    db $b8, $f5, $fa, $63, $d3, $cd, $bc, $12, $cd, $61, $00, $cd, $e8, $09, $cd, $7b
    db $00, $f1, $e0, $b8, $ea, $00, $20, $c9, $21, $33, $d7, $cb, $a6, $06, $1c, $21
    db $91, $4f, $c3, $ee, $35, $3e, $01, $ea, $3c, $cc, $c9
ELIF DEF(_ES)
SECTION "Reload tiles ES", ROM0[$3090]
; ES: $3090-$30DA, 75 bytes, SHA-1 548efa7ba8b85f4be360b3b866fc5c901a723976
ReloadMapData::
    db $f0, $b8, $f5, $fa, $63, $d3, $cd, $bc, $12, $cd, $61, $00, $cd, $bf, $36, $cd
    db $aa, $0c, $cd, $e8, $09, $cd, $7b, $00, $f1, $e0, $b8, $ea, $00, $20, $c9, $f0
    db $b8, $f5, $fa, $63, $d3, $cd, $bc, $12, $cd, $61, $00, $cd, $e8, $09, $cd, $7b
    db $00, $f1, $e0, $b8, $ea, $00, $20, $c9, $21, $33, $d7, $cb, $a6, $06, $1c, $21
    db $94, $4f, $c3, $f5, $35, $3e, $01, $ea, $3c, $cc, $c9
ELSE
    FAIL "Define exactly one release symbol"
ENDC
