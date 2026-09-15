; Hardware and fixed memory constants required by the first reconstructed ROM0 routines.

DEF rJOYP EQU $ff00
DEF rIF   EQU $ff0f
DEF rLCDC EQU $ff40
DEF rLY   EQU $ff44
DEF rIE   EQU $ffff
DEF rROMB EQU $2000

DEF wShadowOAM EQU $c300
DEF wShadowOAMEnd EQU $c3a0
DEF wBuffer EQU $cee9
DEF hLoadedROMBank EQU $ffb8

DEF LCDC_ENABLE_BIT EQU 7
DEF IE_VBLANK_BIT EQU 0
DEF LY_VBLANK_PLUS_ONE EQU 145
DEF HIDDEN_SPRITE_Y EQU 160
DEF OBJ_SIZE EQU 4
DEF OAM_COUNT EQU 40
