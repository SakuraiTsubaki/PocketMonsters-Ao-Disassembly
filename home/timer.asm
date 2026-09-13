; Timer interrupt handler. The original games immediately return.

IF DEF(_JP)
SECTION "ROM0 timer", ROM0[$22e6]
ELIF DEF(_FR)
SECTION "ROM0 timer", ROM0[$2302]
ELIF DEF(_ES)
SECTION "ROM0 timer", ROM0[$2305]
ELSE
SECTION "ROM0 timer", ROM0[$2306]
ENDC

Timer::
    reti
