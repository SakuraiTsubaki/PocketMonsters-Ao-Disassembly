; Generation I hardware-divider RNG across all catalogued Blue releases.
; JP bank $04:$7fee; EN $04:$7a8f; DE $04:$7a9d;
; ES $04:$7abe; FR $04:$7aa0; IT $04:$7ac3.

Random_::
    ldh a, [rDIV]
    ld b, a
    ldh a, [hRandomAdd]
    adc b
    ldh [hRandomAdd], a
    ldh a, [rDIV]
    ld b, a
    ldh a, [hRandomSub]
    sbc b
    ldh [hRandomSub], a
    ret
