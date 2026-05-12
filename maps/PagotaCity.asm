	const_def 2 ; object constants
	const PAGOTACITY_LASS
	const PAGOTACITY_SUPER_NERD
	const PAGOTACITY_GRAMPS
	const PAGOTACITY_YOUNGSTER
	const PAGOTACITY_FRUIT_TREE
	const PAGOTACITY_POKE_BALL1
	const PAGOTACITY_POKE_BALL2
	const PAGOTACITY_GRAMPS2

PagotaCity_MapScripts:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint
	callback MAPCALLBACK_OBJECTS, .grampsgone

.FlyPoint:
	setflag ENGINE_FLYPOINT_VIOLET
	return
	
.grampsgone
	checkevent EVENT_TALKED_TO_KURT_AND_FALKNER
	iftrue .gone
	return
	
.gone
	disappear PAGOTACITY_GRAMPS2
	return

PagotaCityLassScript:
	jumptextfaceplayer PagotaCityLassText

PagotaCitySuperNerdScript:
	jumptextfaceplayer PagotaCitySuperNerdText

PagotaCityGrampsScript:
	jumptextfaceplayer PagotaCityGrampsText
	
PagotaCityGrampsScript2:
	jumptextfaceplayer PagotaCityGramps2Text

PagotaCityYoungsterScript:
	jumptextfaceplayer PagotaCityYoungsterText

KurtsHouseSign:
	jumptext KurtsHouseSignText

PagotaCitySign:
	jumptext PagotaCitySignText

PagotaGymSign:
	jumptext PagotaGymSignText

BrassTowerSign:
	jumptext BrassTowerSignText

EarlsPokemonAcademySign:
	jumptext EarlsPokemonAcademySignText

BillsHouseSign2:
	jumptext BillsHouseSign2Text

PagotaCityPokecenterSign:
	jumpstd pokecentersign

PagotaCityMartSign:
	jumpstd martsign

PagotaCityPPUp:
	itemball PP_UP

PagotaCityRareCandy:
	itemball RARE_CANDY
	

PagotaCityFruitTree:
	fruittree FRUITTREE_PAGOTA_CITY 

PagotaCityHiddenHyperPotion:
	hiddenitem HYPER_POTION, EVENT_PAGOTA_CITY_HIDDEN_HYPER_POTION
	
KurtsDoorLockedScript:
	opentext
	writetext KurtsDoorLockedText
	waitbutton
	closetext
	applymovement PLAYER, KurtsDoorLocked_Movement
	end
	
KurtsDoorLocked_Movement:
	step DOWN
	step_end

	
KurtsDoorLockedText:
	text "Abgeschlossen…"
	done

PagotaCityLassText:
	text "Man sagt, dass im"
	line "MESSINGTURM"
	cont "Geister umgehen."

	para "#MON-Attacken"
	line "des Typs Normal"
	para "haben bei Geistern"
	line "keine Wirkung."
	done

PagotaCitySuperNerdText:
	text "Hey, bist du ein"
	line "#MON-Trainer?"

	para "Schlägst du den"
	line "hiesigen ARENA-"
	cont "LEITER, dann"
	cont "darfst du dich"
	para "bald zur Elite"
	line "zählen!"
	done

PagotaCityGrampsText:
	text "FALK ist ein"
	line "wirklich toller"
	cont "Arenaleiter."

	para "Seine Flug-#MON"
	line "sind trainiert, um"
	para "in Paraden und"
	line "anderen Events"
	cont "aufzutreten."
	done
	
PagotaCityGramps2Text:
    text "Es tut mir Leid…"

    para "Der TURM wird"
    line "gerade gereinigt."

    para "Bitte komm später"
    line "wieder."
	done
	
PagotaCityGuardText:
    text "Der ARENALEITER"
    line "ist gerade nicht"
    cont "da."

    para "Bitte komm später"
    line "wieder."
	done

PagotaCityYoungsterText:
    text "Hinter mir ist der"
    line "MESSINGTURM!"

    para "Viele Trainer"
    line "versuchen ihn zu"
    para "erklimmen, um den"
    line "Segen des ÄLTESTEN"
    cont "zu erhalten."

    para "Ohne ihn kannst du"
    line "die ARENA nicht"
    cont "herausfordern."
	done

PagotaCitySignText:
	text "PAGETIA CITY"

	para "Zeitlos wie die"
	line "Sterne am Himmel"
	done

PagotaGymSignText:
	text "PKMN-ARENA von"
	line "PAGETIA CITY"

	para "LEITUNG: FALK"
	line "Der elegante"

	para "Meister der Flug-"
	line "#MON"
	done

BrassTowerSignText:
	text "MESSINGTURM"

	para "Erfahre das Wesen"
	line "der #MON"
	done

EarlsPokemonAcademySignText:
	text "EARLs KUNST-HAUS"
	done
	
KurtsHouseSignText:
	text "KURTs HAUS"
	done
	
BillsHouseSign2Text:
	text "BILLs HAUS"
	done
	


PagotaCity_MapEvents:
	db 0, 0 ; filler

	db 14 ; warp events
	warp_event  3, 26, PAGOTA_MART, 1
	warp_event 26, 14, PAGOTA_GYM, 1
	warp_event 27, 14, PAGOTA_GYM, 2
	warp_event 10, 26, PAGOTA_NICKNAME_SPEECH_HOUSE, 1
	warp_event 27, 28, PAGOTA_POKECENTER_1F, 1
	warp_event 22, 26, PAGOTA_TRAINER_SCHOOL, 1
	warp_event 11, 17, BRASS_TOWER_1F, 1
	warp_event 19, 31, ROUTE_101_PAGOTA_GATE, 2
	warp_event 18, 31, ROUTE_101_PAGOTA_GATE, 1
	warp_event  3, 31, KURTS_HOUSE, 1
	warp_event 12, 17, BRASS_TOWER_1F, 2
	warp_event  4, 14, EARLS_ART_HOUSE, 1
	warp_event  5, 14, EARLS_ART_HOUSE, 2
	warp_event 30, 22, BILLS_FAMILYS_HOUSE, 1

	db 1 ; coord events
	coord_event  3, 32, SCENE_KURTS_HOUSE_LOCKED, KurtsDoorLockedScript

	db 9 ; bg events
	bg_event 20, 29, BGEVENT_READ, PagotaCitySign
	bg_event 28, 16, BGEVENT_READ, PagotaGymSign
	bg_event  8, 16, BGEVENT_READ, BrassTowerSign
	bg_event  8, 14, BGEVENT_READ, EarlsPokemonAcademySign
	bg_event 28, 28, BGEVENT_READ, PagotaCityPokecenterSign
	bg_event  4, 26, BGEVENT_READ, PagotaCityMartSign
	bg_event 14, 11, BGEVENT_ITEM, PagotaCityHiddenHyperPotion
	bg_event  4, 32, BGEVENT_READ, KurtsHouseSign
	bg_event 26, 22, BGEVENT_READ, BillsHouseSign2

	db 8 ; object events
	object_event 26, 30, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PagotaCityLassScript, -1
	object_event 24, 18, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PagotaCitySuperNerdScript, -1
	object_event 15, 25, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PagotaCityGrampsScript, -1
	object_event 10, 21, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PagotaCityYoungsterScript, -1
	object_event 23, 21, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PagotaCityFruitTree, -1
	object_event 16,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PagotaCityPPUp, EVENT_PAGOTA_CITY_PP_UP
	object_event 23,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PagotaCityRareCandy, EVENT_PAGOTA_CITY_RARE_CANDY
	object_event  9, 19, SPRITE_GRAMPS, SPRITEMOVEDATA_STILL, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PagotaCityGrampsScript2, 0
