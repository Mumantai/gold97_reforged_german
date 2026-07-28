	const_def 2 ; object constants
	const BOULDERMINESB1F_POKE_BALL1
	const BOULDERMINESB1F_BOULDER
	const BOULDERMINESB1F_POKE_BALL2
	const BOULDERMINESB1F_POKEMANIAC
	const BOULDERMINESB1F_HIKER
	const BOULDERMINESB1F_ITEMBALL

BoulderMinesB1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BoulderMinesB1FTMSwift:
	itemball TM_SWIFT

BoulderMinesB1FXDefend:
	itemball X_DEFEND



BoulderMinesB1FBoulder:
	jumpstd strengthboulder

TrainerPokemaniacAndrew:
	trainer POKEMANIAC, ANDREW, EVENT_BEAT_POKEMANIAC_ANDREW, PokemaniacAndrewSeenText, PokemaniacAndrewBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacAndrewAfterBattleText
	waitbutton
	closetext
	end
	
TrainerHikerPhillip:
	trainer HIKER, PHILLIP, EVENT_BEAT_HIKER_PHILLIP, HikerPhillipSeenText, HikerPhillipBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerPhillipAfterBattleText
	waitbutton
	closetext
	end
	
BoulderMinesB1FMoonStone:
	itemball MOON_STONE
	
HikerPhillipSeenText:
    text "Berge hoch zu"
    line "wandern macht zwar"
    cont "Spaß, aber Höhlen"
    cont "zu erkunden ist"
    cont "einfach spannend."
	done

HikerPhillipBeatenText:
	text "Verirr dich nicht!"
	done
	
HikerPhillipAfterBattleText:
	text "Meine Gesteins-"
	line "#MON fühlen"
	cont "sich hier pudel-"
	cont "wohl."
	done
	
PokemaniacAndrewSeenText:
	text "Man sagt, ein"
	line "seltenes #MON"
	cont "wohnt tief in"
	cont "diesen Minen."
	done

PokemaniacAndrewBeatenText:
	text "Du hast mich echt"
	line "verdroschen!"
	done
	
PokemaniacAndrewAfterBattleText:
	text "Hast du dieses"
	line "seltene #MON"
	cont "gesehen?"
	done

BoulderMinesB1F_MapEvents:
	db 0, 0 ; filler

	db 8 ; warp events
	warp_event  3,  3, BOULDER_MINES_B2F, 1
	warp_event  9,  5, BOULDER_MINES_B2F, 2
	warp_event 21,  5, BOULDER_MINES_1F, 2
	warp_event 37,  3, BOULDER_MINES_1F, 3
	warp_event 33,  5, BOULDER_MINES_B2F, 3
	warp_event 33, 13, BOULDER_MINES_B2F, 8
	warp_event 39, 11, BOULDER_MINES_1F, 4
	warp_event 39, 17, BOULDER_MINES_1F, 5

	db 0 ; coord events

	db 0 ; bg events

	db 6 ; object events
	object_event 38,  8, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BoulderMinesB1FTMSwift, EVENT_BOULDER_MINES_B1F_TM_SWIFT
	object_event 22, 10, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BoulderMinesB1FBoulder, -1
	object_event 29, 17, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BoulderMinesB1FXDefend, EVENT_BOULDER_MINES_B1F_X_DEFEND
	object_event 35,  8, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 5, TrainerPokemaniacAndrew, -1
	object_event  7, 10, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerHikerPhillip, -1
	object_event  2, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BoulderMinesB1FMoonStone, EVENT_PICKED_UP_MOON_STONE_FROM_AERODACTYL_ITEM_ROOM

