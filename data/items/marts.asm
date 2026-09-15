; Pocket Monsters Ao / Pokemon Blue mart inventories.
; Exact 148-byte table, byte-identical across JP/EN/DE/FR/IT/ES.
; Encoding: $fe, item-count, item IDs..., $ff.

IF DEF(_JP)
SECTION "ROM0 marts", ROM0[$2422]
ELIF DEF(_FR)
SECTION "ROM0 marts", ROM0[$243e]
ELIF DEF(_ES)
SECTION "ROM0 marts", ROM0[$2441]
ELSE
SECTION "ROM0 marts", ROM0[$2442]
ENDC

ViridianMartClerkText::
    db $fe, 4, $04, $0b, $0f, $0c, $ff
PewterMartClerkText::
    db $fe, 7, $04, $14, $1d, $0b, $0c, $0e, $0f, $ff
CeruleanMartClerkText::
    db $fe, 7, $04, $14, $1e, $0b, $0c, $0e, $0f, $ff
UnusedBikeShopClerkText::
    db $fe, 1, $06, $ff
VermilionMartClerkText::
    db $fe, 6, $04, $13, $0d, $0e, $0f, $1e, $ff
LavenderMartClerkText::
    db $fe, 9, $03, $13, $35, $1d, $38, $0b, $0c, $0d, $0f, $ff
CeladonMart2FClerk1Text::
    db $fe, 9, $03, $13, $35, $38, $0b, $0c, $0d, $0e, $0f, $ff
CeladonMart2FClerk2Text::
    db $fe, 9, $e8, $e9, $ca, $cf, $ed, $c9, $cd, $d1, $d9, $ff
CeladonMart4FClerkText::
    db $fe, 5, $33, $20, $21, $22, $2f, $ff
CeladonMart5FClerk1Text::
    db $fe, 7, $2e, $37, $3a, $41, $42, $43, $44, $ff
CeladonMart5FClerk2Text::
    db $fe, 5, $23, $24, $25, $26, $27, $ff
FuchsiaMartClerkText::
    db $fe, 6, $02, $03, $13, $35, $34, $38, $ff
UnusedMartClerkText::
    db $fe, 5, $03, $12, $13, $34, $35, $ff
CinnabarMartClerkText::
    db $fe, 7, $02, $03, $12, $39, $1d, $34, $35, $ff
SaffronMartClerkText::
    db $fe, 6, $03, $12, $39, $1d, $34, $35, $ff
IndigoPlateauLobbyClerkText::
    db $fe, 7, $02, $03, $10, $11, $34, $35, $39, $ff
