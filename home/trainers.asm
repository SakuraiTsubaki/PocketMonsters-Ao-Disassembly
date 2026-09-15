; Release dispatcher for the ROM0 trainers block.
IF DEF(_JP)
    INCLUDE "home/trainers_jp.asm"
ELIF DEF(_EN)
    INCLUDE "home/trainers_en.asm"
ELIF DEF(_DE)
    INCLUDE "home/trainers_de.asm"
ELIF DEF(_FR)
    INCLUDE "home/trainers_fr.asm"
ELIF DEF(_IT)
    INCLUDE "home/trainers_it.asm"
ELIF DEF(_ES)
    INCLUDE "home/trainers_es.asm"
ELSE
    FAIL "Define exactly one release symbol"
ENDC
