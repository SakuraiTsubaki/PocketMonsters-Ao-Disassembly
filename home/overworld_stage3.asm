; ROM0 overworld reconstruction — stage 3.
; CheckMapConnections through the byte immediately before PlayMapChangeSound.
; JP: $0773-$0881; localized: $07BA-$08C8.
; 271 bytes / 125 instructions; opcode skeleton identical across all 6 releases.

MACRO OVR3_DEFV16
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

OVR3_DEFV16 OVR3_0000, $d2e1, $d362, $d367, $d367, $d367, $d367
OVR3_DEFV16 OVR3_0007, $d306, $d387, $d38c, $d38c, $d38c, $d38c
OVR3_DEFV16 OVR3_000A, $d2dd, $d35e, $d363, $d363, $d363, $d363
OVR3_DEFV16 OVR3_000D, $d30e, $d38f, $d394, $d394, $d394, $d394
OVR3_DEFV16 OVR3_0010, $d2e1, $d362, $d367, $d367, $d367, $d367
OVR3_DEFV16 OVR3_0013, $d2e0, $d361, $d366, $d366, $d366, $d366
OVR3_DEFV16 OVR3_0017, $d30d, $d38e, $d393, $d393, $d393, $d393
OVR3_DEFV16 OVR3_001C, $d2e0, $d361, $d366, $d366, $d366, $d366
OVR3_DEFV16 OVR3_001F, $d30f, $d390, $d395, $d395, $d395, $d395
OVR3_DEFV16 OVR3_0023, $d310, $d391, $d396, $d396, $d396, $d396
OVR3_DEFV16 OVR3_002B, $d30c, $d38d, $d392, $d392, $d392, $d392
OVR3_DEFV16 OVR3_003A, $d2de, $d35f, $d364, $d364, $d364, $d364
OVR3_DEFV16 OVR3_003E, $d2df, $d360, $d365, $d365, $d365, $d365
OVR3_DEFV16 OVR3_0045, $d4a4, $d525, $d52a, $d52a, $d52a, $d52a
OVR3_DEFV16 OVR3_004B, $d311, $d392, $d397, $d397, $d397, $d397
OVR3_DEFV16 OVR3_004E, $d2dd, $d35e, $d363, $d363, $d363, $d363
OVR3_DEFV16 OVR3_0051, $d319, $d39a, $d39f, $d39f, $d39f, $d39f
OVR3_DEFV16 OVR3_0054, $d2e1, $d362, $d367, $d367, $d367, $d367
OVR3_DEFV16 OVR3_0057, $d2e0, $d361, $d366, $d366, $d366, $d366
OVR3_DEFV16 OVR3_005B, $d318, $d399, $d39e, $d39e, $d39e, $d39e
OVR3_DEFV16 OVR3_0060, $d2e0, $d361, $d366, $d366, $d366, $d366
OVR3_DEFV16 OVR3_0063, $d31a, $d39b, $d3a0, $d3a0, $d3a0, $d3a0
OVR3_DEFV16 OVR3_0067, $d31b, $d39c, $d3a1, $d3a1, $d3a1, $d3a1
OVR3_DEFV16 OVR3_006F, $d317, $d398, $d39d, $d39d, $d39d, $d39d
OVR3_DEFV16 OVR3_007E, $d2de, $d35f, $d364, $d364, $d364, $d364
OVR3_DEFV16 OVR3_0082, $d2df, $d360, $d365, $d365, $d365, $d365
OVR3_DEFV16 OVR3_0088, $d2e0, $d361, $d366, $d366, $d366, $d366
OVR3_DEFV16 OVR3_008F, $d2f0, $d371, $d376, $d376, $d376, $d376
OVR3_DEFV16 OVR3_0092, $d2dd, $d35e, $d363, $d363, $d363, $d363
OVR3_DEFV16 OVR3_0095, $d2f7, $d378, $d37d, $d37d, $d37d, $d37d
OVR3_DEFV16 OVR3_0098, $d2e0, $d361, $d366, $d366, $d366, $d366
OVR3_DEFV16 OVR3_009B, $d2e1, $d362, $d367, $d367, $d367, $d367
OVR3_DEFV16 OVR3_009F, $d2f8, $d379, $d37e, $d37e, $d37e, $d37e
OVR3_DEFV16 OVR3_00A4, $d2e1, $d362, $d367, $d367, $d367, $d367
OVR3_DEFV16 OVR3_00A7, $d2f9, $d37a, $d37f, $d37f, $d37f, $d37f
OVR3_DEFV16 OVR3_00AB, $d2fa, $d37b, $d380, $d380, $d380, $d380
OVR3_DEFV16 OVR3_00B5, $d2de, $d35f, $d364, $d364, $d364, $d364
OVR3_DEFV16 OVR3_00B9, $d2df, $d360, $d365, $d365, $d365, $d365
OVR3_DEFV16 OVR3_00C0, $d4a3, $d524, $d529, $d529, $d529, $d529
OVR3_DEFV16 OVR3_00C6, $d2fb, $d37c, $d381, $d381, $d381, $d381
OVR3_DEFV16 OVR3_00C9, $d2dd, $d35e, $d363, $d363, $d363, $d363
OVR3_DEFV16 OVR3_00CC, $d302, $d383, $d388, $d388, $d388, $d388
OVR3_DEFV16 OVR3_00CF, $d2e0, $d361, $d366, $d366, $d366, $d366
OVR3_DEFV16 OVR3_00D2, $d2e1, $d362, $d367, $d367, $d367, $d367
OVR3_DEFV16 OVR3_00D6, $d303, $d384, $d389, $d389, $d389, $d389
OVR3_DEFV16 OVR3_00DB, $d2e1, $d362, $d367, $d367, $d367, $d367
OVR3_DEFV16 OVR3_00DE, $d304, $d385, $d38a, $d38a, $d38a, $d38a
OVR3_DEFV16 OVR3_00E2, $d305, $d386, $d38b, $d38b, $d38b, $d38b
OVR3_DEFV16 OVR3_00EC, $d2de, $d35f, $d364, $d364, $d364, $d364
OVR3_DEFV16 OVR3_00F0, $d2df, $d360, $d365, $d365, $d365, $d365
OVR3_DEFV16 OVR3_00F3, $1035, $107c, $107c, $107c, $107c, $107c
OVR3_DEFV16 OVR3_00F6, $22f2, $2312, $2312, $230e, $2312, $2311
OVR3_DEFV16 OVR3_00FB, $3e33, $3def, $3e09, $3e0c, $3e07, $3e0e
OVR3_DEFV16 OVR3_0100, $785b, $785b, $785b, $785b, $785b, $785b
OVR3_DEFV16 OVR3_0103, $3636, $35d6, $35f0, $35f3, $35ee, $35f5
OVR3_DEFV16 OVR3_0106, $09b5, $09fc, $09fc, $09fc, $09fc, $09fc
OVR3_DEFV16 OVR3_0109, $03bb, $0402, $0402, $0402, $0402, $0402
OVR3_DEFV16 OVR3_010C, $03b8, $03ff, $03ff, $03ff, $03ff, $03ff

PURGE OVR3_DEFV16

IF DEF(_JP)
SECTION "Overworld stage 3", ROM0[$0773]
ELSE
SECTION "Overworld stage 3", ROM0[$07ba]
ENDC

CheckMapConnections::
	ld a, [OVR3_0000]
	cp $ff
	jr nz, .checkEastMap
	ld a, [OVR3_0007]
	ld [OVR3_000A], a
	ld a, [OVR3_000D]
	ld [OVR3_0010], a
	ld a, [OVR3_0013]
	ld c, a
	ld a, [OVR3_0017]
	add c
	ld c, a
	ld [OVR3_001C], a
	ld a, [OVR3_001F]
	ld l, a
	ld a, [OVR3_0023]
	ld h, a
	srl c
	jr z, .savePointer1
.pointerAdjustmentLoop1
	ld a, [OVR3_002B]
	add $06
	ld e, a
	ld d, $00
	ld b, $00
	add hl, de
	dec c
	jr nz, .pointerAdjustmentLoop1
.savePointer1
	ld a, l
	ld [OVR3_003A], a
	ld a, h
	ld [OVR3_003E], a
	jp .loadNewMap
.checkEastMap
	ld b, a
	ld a, [OVR3_0045]
	cp b
	jr nz, .checkNorthMap
	ld a, [OVR3_004B]
	ld [OVR3_004E], a
	ld a, [OVR3_0051]
	ld [OVR3_0054], a
	ld a, [OVR3_0057]
	ld c, a
	ld a, [OVR3_005B]
	add c
	ld c, a
	ld [OVR3_0060], a
	ld a, [OVR3_0063]
	ld l, a
	ld a, [OVR3_0067]
	ld h, a
	srl c
	jr z, .savePointer2
.pointerAdjustmentLoop2
	ld a, [OVR3_006F]
	add $06
	ld e, a
	ld d, $00
	ld b, $00
	add hl, de
	dec c
	jr nz, .pointerAdjustmentLoop2
.savePointer2
	ld a, l
	ld [OVR3_007E], a
	ld a, h
	ld [OVR3_0082], a
	jp .loadNewMap
.checkNorthMap
	ld a, [OVR3_0088]
	cp $ff
	jr nz, .checkSouthMap
	ld a, [OVR3_008F]
	ld [OVR3_0092], a
	ld a, [OVR3_0095]
	ld [OVR3_0098], a
	ld a, [OVR3_009B]
	ld c, a
	ld a, [OVR3_009F]
	add c
	ld c, a
	ld [OVR3_00A4], a
	ld a, [OVR3_00A7]
	ld l, a
	ld a, [OVR3_00AB]
	ld h, a
	ld b, $00
	srl c
	add hl, bc
	ld a, l
	ld [OVR3_00B5], a
	ld a, h
	ld [OVR3_00B9], a
	jp .loadNewMap
.checkSouthMap
	ld b, a
	ld a, [OVR3_00C0]
	cp b
	jr nz, .didNotEnterConnectedMap
	ld a, [OVR3_00C6]
	ld [OVR3_00C9], a
	ld a, [OVR3_00CC]
	ld [OVR3_00CF], a
	ld a, [OVR3_00D2]
	ld c, a
	ld a, [OVR3_00D6]
	add c
	ld c, a
	ld [OVR3_00DB], a
	ld a, [OVR3_00DE]
	ld l, a
	ld a, [OVR3_00E2]
	ld h, a
	ld b, $00
	srl c
	add hl, bc
	ld a, l
	ld [OVR3_00EC], a
	ld a, h
	ld [OVR3_00F0], a
.loadNewMap
	call OVR3_00F3
	call OVR3_00F6
	ld b, $09
	call OVR3_00FB
	ld b, $05
	ld hl, OVR3_0100
	call OVR3_0103
	call OVR3_0106
	jp OVR3_0109
.didNotEnterConnectedMap
	jp OVR3_010C
