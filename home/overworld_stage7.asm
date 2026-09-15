; ROM0 overworld reconstruction — stage 7.
; Collision and tile-pair handling, followed by the 44-byte pair-collision data table.

MACRO OVR7_DEFV16
IF DEF(_JP)
    DEF \1 EQU \2
ELIF DEF(_EN)
    DEF \1 EQU \3
ELIF DEF(_DE)
    DEF \1 EQU \4
ELIF DEF(_FR)
    DEF \1 EQU \5
ELIF DEF(_IT)
    DEF \1 EQU \6
ELIF DEF(_ES)
    DEF \1 EQU \7
ELSE
    FAIL "Define exactly one release symbol"
ENDC
ENDM

OVR7_DEFV16 OVR7_0833, $d6b5, $d736, $d73b, $d73b, $d73b, $d73b
OVR7_DEFV16 OVR7_0840, $d4a9, $d52a, $d52f, $d52f, $d52f, $d52f
OVR7_DEFV16 OVR7_0855, $0c37, $0c7e, $0c7e, $0c7e, $0c7e, $0c7e
OVR7_DEFV16 OVR7_086B, $2391, $23b1, $23b1, $23ad, $23b1, $23b0
OVR7_DEFV16 OVR7_0874, $3eb1, $3e6d, $3e87, $3e8a, $3e85, $3e8c
OVR7_DEFV16 OVR7_0877, $cfad, $cfc6, $cfcb, $cfcb, $cfcb, $cfcb
OVR7_DEFV16 OVR7_087B, $d4af, $d530, $d535, $d535, $d535, $d535
OVR7_DEFV16 OVR7_088F, $3eb1, $3e6d, $3e87, $3e8a, $3e85, $3e8c
OVR7_DEFV16 OVR7_0896, $7f22, $6672, $6677, $6677, $6677, $6677
OVR7_DEFV16 OVR7_0899, $3636, $35d6, $35f0, $35f3, $35ee, $35f5
OVR7_DEFV16 OVR7_08A0, $d6b5, $d736, $d73b, $d73b, $d73b, $d73b
OVR7_DEFV16 OVR7_08A9, $cf09, $cf0e, $cf13, $cf13, $cf13, $cf13
OVR7_DEFV16 OVR7_08AC, $cfad, $cfc6, $cfcb, $cfcb, $cfcb, $cfcb
OVR7_DEFV16 OVR7_08B0, $d2e6, $d367, $d36c, $d36c, $d36c, $d36c
OVR7_DEFV16 OVR7_08C0, $cf09, $cf0e, $cf13, $cf13, $cf13, $cf13

PURGE OVR7_DEFV16

IF DEF(_JP)
SECTION "Overworld stage 7", ROM0[$0b8a]
ELSE
SECTION "Overworld stage 7", ROM0[$0bd1]
ENDC
CollisionCheckOnLand::
	ld a, [OVR7_0833]
	bit 6, a
	jr nz, OVR7_L_0870
	ld a, [$cd38]
	and a
	jr nz, OVR7_L_0870
	ld a, [OVR7_0840]
	ld d, a
	ld a, [$c10c]
	and d
	jr nz, OVR7_L_0862
	xor a
	ldh [$ff8c], a
	call IsSpriteInFrontOfPlayer
	ldh a, [$ff8c]
	and a
	jr nz, OVR7_L_0862
	ld hl, OVR7_0855
	call CheckForJumpingAndTilePairCollisions
	jr c, OVR7_L_0862
	call CheckTilePassable
	jr nc, OVR7_L_0870
OVR7_L_0862::
	ld a, [$c02a]
	cp $b4
	jr z, OVR7_L_086E
	ld a, $b4
	call OVR7_086B
OVR7_L_086E::
	scf
	ret
OVR7_L_0870::
	and a
	ret
CheckTilePassable::
	ld a, $35
	call OVR7_0874
	ld a, [OVR7_0877]
	ld c, a
	ld hl, OVR7_087B
	ld a, [hli]
	ld h, [hl]
	ld l, a
OVR7_L_0881::
	ld a, [hli]
	cp $ff
	jr z, OVR7_L_088A
	cp c
	ret z
	jr OVR7_L_0881
OVR7_L_088A::
	scf
	ret
CheckForJumpingAndTilePairCollisions::
	push hl
	ld a, $35
	call OVR7_088F
	push de
	push bc
	ld b, $06
	ld hl, OVR7_0896
	call OVR7_0899
	pop bc
	pop de
	pop hl
	and a
	ld a, [OVR7_08A0]
	bit 6, a
	ret nz
	ld a, [$c45c]
	ld [OVR7_08A9], a
	ld a, [OVR7_08AC]
	ld c, a
OVR7_L_08B0::
	ld a, [OVR7_08B0]
	ld b, a
	ld a, [hli]
	cp $ff
	jr z, OVR7_L_08DE
	cp b
	jr z, OVR7_L_08C0
	inc hl
OVR7_L_08BD::
	inc hl
	jr OVR7_L_08B0
OVR7_L_08C0::
	ld a, [OVR7_08C0]
	ld b, a
	ld a, [hl]
	cp b
	jr z, OVR7_L_08CF
	inc hl
	ld a, [hl]
	cp b
	jr z, OVR7_L_08D6
	jr OVR7_L_08BD
OVR7_L_08CF::
	inc hl
	ld a, [hl]
	cp c
	jr z, OVR7_L_08DC
	jr OVR7_L_08B0
OVR7_L_08D6::
	dec hl
	ld a, [hli]
	cp c
	inc hl
	jr nz, OVR7_L_08B0
OVR7_L_08DC::
	scf
	ret
OVR7_L_08DE::
	and a
	ret
; FORMAT: tileset number, tile 1, tile 2; terminated by $ff.
; This 44-byte table is byte-identical in all six source ROMs.
TilePairCollisionsLand::
    db $11, $20, $05
    db $11, $41, $05
    db $03, $30, $2e
    db $11, $2a, $05
    db $11, $05, $21
    db $03, $52, $2e
    db $03, $55, $2e
    db $03, $56, $2e
    db $03, $20, $2e
    db $03, $5e, $2e
    db $03, $5f, $2e
    db $ff

TilePairCollisionsWater::
    db $03, $14, $2e
    db $03, $48, $2e
    db $11, $14, $05
    db $ff
