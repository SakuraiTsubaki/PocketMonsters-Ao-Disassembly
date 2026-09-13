; ROM0 Money. Exact per-release source reconstructed from the six project ROMs.

IF DEF(_JP)
SECTION "Money JP", ROM0[$3606]
; JP: $3606-$361B, 22 bytes, SHA-1 6972860b92ece05b8eb298087f8e333b611b9327
HasEnoughMoney::
    db $11, $cb, $d2, $21, $9f, $ff, $0e, $03, $c3, $ec, $3a, $11, $23, $d5, $21, $a0
    db $ff, $0e, $02, $c3, $ec, $3a
ELIF DEF(_EN)
SECTION "Money EN", ROM0[$35a6]
; EN: $35A6-$35BB, 22 bytes, SHA-1 b91ea35738c59953b374d3c2bbae94e47d949b54
HasEnoughMoney::
    db $11, $47, $d3, $21, $9f, $ff, $0e, $03, $c3, $8e, $3a, $11, $a4, $d5, $21, $a0
    db $ff, $0e, $02, $c3, $8e, $3a
ELIF DEF(_DE)
SECTION "Money DE", ROM0[$35c0]
; DE: $35C0-$35D5, 22 bytes, SHA-1 94ead8b58ea7654ab352db6cbfa294ee5fbe5eda
HasEnoughMoney::
    db $11, $4c, $d3, $21, $9f, $ff, $0e, $03, $c3, $a8, $3a, $11, $a9, $d5, $21, $a0
    db $ff, $0e, $02, $c3, $a8, $3a
ELIF DEF(_FR)
SECTION "Money FR", ROM0[$35c3]
; FR: $35C3-$35D8, 22 bytes, SHA-1 c7e7212ace4b8f3dde945798c3972789d417ed82
HasEnoughMoney::
    db $11, $4c, $d3, $21, $9f, $ff, $0e, $03, $c3, $ab, $3a, $11, $a9, $d5, $21, $a0
    db $ff, $0e, $02, $c3, $ab, $3a
ELIF DEF(_IT)
SECTION "Money IT", ROM0[$35be]
; IT: $35BE-$35D3, 22 bytes, SHA-1 312c5a06f6d9ad72117d6d61b0043ad008846f2f
HasEnoughMoney::
    db $11, $4c, $d3, $21, $9f, $ff, $0e, $03, $c3, $a6, $3a, $11, $a9, $d5, $21, $a0
    db $ff, $0e, $02, $c3, $a6, $3a
ELIF DEF(_ES)
SECTION "Money ES", ROM0[$35c5]
; ES: $35C5-$35DA, 22 bytes, SHA-1 a4e0ea605b31f4a2c3d7d3890811bb1f19f0c2f1
HasEnoughMoney::
    db $11, $4c, $d3, $21, $9f, $ff, $0e, $03, $c3, $ad, $3a, $11, $a9, $d5, $21, $a0
    db $ff, $0e, $02, $c3, $ad, $3a
ELSE
    FAIL "Define exactly one release symbol"
ENDC
