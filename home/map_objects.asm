; Release dispatcher for the ROM0 map-objects block.
IF DEF(_JP)
    INCLUDE "home/map_objects_jp.asm"
ELIF DEF(_EN)
    INCLUDE "home/map_objects_en.asm"
ELIF DEF(_DE)
    INCLUDE "home/map_objects_de.asm"
ELIF DEF(_FR)
    INCLUDE "home/map_objects_fr.asm"
ELIF DEF(_IT)
    INCLUDE "home/map_objects_it.asm"
ELIF DEF(_ES)
    INCLUDE "home/map_objects_es.asm"
ELSE
    FAIL "Define exactly one release symbol"
ENDC
