; ROM0 Trainers2. Exact per-release source reconstructed from the six project ROMs.

IF DEF(_JP)
SECTION "Trainers2 JP", ROM0[$35c6]
; JP: $35C6-$3605, 64 bytes, SHA-1 d7c2b5002d5ff2b6e5a18b5dcbe896936b8fbb48
GetTrainerInformation::
    db $cd, $fe, $35, $fa, $f0, $d0, $a7, $20, $25, $3e, $0e, $cd, $1c, $36, $fa, $18
    db $d0, $3d, $21, $ca, $5c, $01, $05, $00, $cd, $e5, $3a, $11, $1a, $d0, $2a, $12
    db $13, $2a, $12, $11, $25, $d0, $2a, $12, $13, $2a, $12, $c3, $2d, $36, $21, $1a
    db $d0, $11, $61, $73, $73, $23, $72, $c9, $06, $04, $21, $b7, $7f, $c3, $36, $36
ELIF DEF(_EN)
SECTION "Trainers2 EN", ROM0[$3566]
; EN: $3566-$35A5, 64 bytes, SHA-1 939ef8489bc3981d6141988096a9d35747ddbedb
GetTrainerInformation::
    db $cd, $9e, $35, $fa, $2b, $d1, $a7, $20, $25, $3e, $0e, $cd, $bc, $35, $fa, $31
    db $d0, $3d, $21, $14, $59, $01, $05, $00, $cd, $87, $3a, $11, $33, $d0, $2a, $12
    db $13, $2a, $12, $11, $46, $d0, $2a, $12, $13, $2a, $12, $c3, $cd, $35, $21, $33
    db $d0, $11, $de, $6e, $73, $23, $72, $c9, $06, $04, $21, $58, $7a, $c3, $d6, $35
ELIF DEF(_DE)
SECTION "Trainers2 DE", ROM0[$3580]
; DE: $3580-$35BF, 64 bytes, SHA-1 3560d383a913de2317e9bc23f8708aa1d752f2de
GetTrainerInformation::
    db $cd, $b8, $35, $fa, $30, $d1, $a7, $20, $25, $3e, $0e, $cd, $d6, $35, $fa, $36
    db $d0, $3d, $21, $14, $59, $01, $05, $00, $cd, $a1, $3a, $11, $38, $d0, $2a, $12
    db $13, $2a, $12, $11, $4b, $d0, $2a, $12, $13, $2a, $12, $c3, $e7, $35, $21, $38
    db $d0, $11, $e1, $6e, $73, $23, $72, $c9, $06, $04, $21, $66, $7a, $c3, $f0, $35
ELIF DEF(_FR)
SECTION "Trainers2 FR", ROM0[$3583]
; FR: $3583-$35C2, 64 bytes, SHA-1 8151ea488493d0619c2036bd9b0073202e88b283
GetTrainerInformation::
    db $cd, $bb, $35, $fa, $30, $d1, $a7, $20, $25, $3e, $0e, $cd, $d9, $35, $fa, $36
    db $d0, $3d, $21, $14, $59, $01, $05, $00, $cd, $a4, $3a, $11, $38, $d0, $2a, $12
    db $13, $2a, $12, $11, $4b, $d0, $2a, $12, $13, $2a, $12, $c3, $ea, $35, $21, $38
    db $d0, $11, $ec, $6e, $73, $23, $72, $c9, $06, $04, $21, $69, $7a, $c3, $f3, $35
ELIF DEF(_IT)
SECTION "Trainers2 IT", ROM0[$357e]
; IT: $357E-$35BD, 64 bytes, SHA-1 393ca411fc399916990ab557cb47bf1f250c1c84
GetTrainerInformation::
    db $cd, $b6, $35, $fa, $30, $d1, $a7, $20, $25, $3e, $0e, $cd, $d4, $35, $fa, $36
    db $d0, $3d, $21, $14, $59, $01, $05, $00, $cd, $9f, $3a, $11, $38, $d0, $2a, $12
    db $13, $2a, $12, $11, $4b, $d0, $2a, $12, $13, $2a, $12, $c3, $e5, $35, $21, $38
    db $d0, $11, $00, $6f, $73, $23, $72, $c9, $06, $04, $21, $8c, $7a, $c3, $ee, $35
ELIF DEF(_ES)
SECTION "Trainers2 ES", ROM0[$3585]
; ES: $3585-$35C4, 64 bytes, SHA-1 f53d425ece245bf4ad5f48a4dd1c83a517e29fb6
GetTrainerInformation::
    db $cd, $bd, $35, $fa, $30, $d1, $a7, $20, $25, $3e, $0e, $cd, $db, $35, $fa, $36
    db $d0, $3d, $21, $14, $59, $01, $05, $00, $cd, $a6, $3a, $11, $38, $d0, $2a, $12
    db $13, $2a, $12, $11, $4b, $d0, $2a, $12, $13, $2a, $12, $c3, $ec, $35, $21, $38
    db $d0, $11, $fe, $6e, $73, $23, $72, $c9, $06, $04, $21, $87, $7a, $c3, $f5, $35
ELSE
    FAIL "Define exactly one release symbol"
ENDC
