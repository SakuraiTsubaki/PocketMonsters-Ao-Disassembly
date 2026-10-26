; Generation I byte-copy routine across all catalogued Blue releases.
; JP ROM0:$171b; EN/DE/ES/FR/IT ROM0:$00b5.

CopyData::
    ld a, [hli]
    ld [de], a
    inc de
    dec bc
    ld a, c
    or b
    jr nz, CopyData
    ret
