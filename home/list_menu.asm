; Release dispatcher for the ROM0 list-menu block.
IF DEF(_JP)
    INCLUDE "home/list_menu_jp.asm"
ELIF DEF(_EN)
    INCLUDE "home/list_menu_en.asm"
ELIF DEF(_DE)
    INCLUDE "home/list_menu_de.asm"
ELIF DEF(_FR)
    INCLUDE "home/list_menu_fr.asm"
ELIF DEF(_IT)
    INCLUDE "home/list_menu_it.asm"
ELIF DEF(_ES)
    INCLUDE "home/list_menu_es.asm"
ELSE
    FAIL "Define exactly one release symbol"
ENDC
