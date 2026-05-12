	const_def 2 ; object constants
	const ELMSHOUSE_ELMS_WIFE
	const ELMSHOUSE_ELMS_SON

SilentHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

ElmsWife:
	jumptextfaceplayer ElmsWifeText

ElmsSon:
	jumptextfaceplayer ElmsSonText

SilentHousePC:
	jumptext SilentHousePCText

SilentHouseBookshelf:
	jumpstd difficultbookshelf

ElmsWifeText:
    text "Hi, <PLAY_G>! Mein"
    line "Sohn ist immer so"
    cont "energiegeladen."

    para "Wenn er sich etwas"
    line "in den Kopf setzt,"
    para "dann geht er es"
    line "auch mit voller"
    cont "Energie an."
	done

ElmsSonText:
    text "Wenn ich groß bin,"
    line "werde ich ein"
    cont "#MON-Züchter!"

    para "Ich werde alle"
    line "#MON aufziehen!"
	done

SilentHouseLabFoodText:
; unused
	text "Hier ist etwas zu"
	line "essen. Es muss für"
	cont "das LABOR sein."
	done

SilentHousePokemonFoodText:
; unused
	text "Hier ist etwas zu"
	line "essen. Es muss für"
	cont "die #MON sein."
	done

SilentHousePCText:
	text "#MON. Woher"
	line "kommen sie?"

	para "Wohin gehen sie?"

	para "Warum war noch nie"
	line "jemand Zeuge der"
	cont "Geburt eines"
	cont "#MON?"

	para "Ich will es wis-"
	line "sen. Ich werde"

	para "mein Leben in den"
	line "Dienst der #-"
	cont "MON-Forschung"
	cont "stellen!"

	para "…"

	para "Dies ist ein Teil"
	line "von PROF. EICH"
	cont "Aufzeichnungen."
	done

SilentHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, SILENT_TOWN, 4
	warp_event  3,  7, SILENT_TOWN, 4

	db 0 ; coord events

	db 2 ; bg events
	bg_event  5,  1, BGEVENT_READ, SilentHouseBookshelf
	bg_event  5,  0, BGEVENT_READ, SilentHouseBookshelf

	db 2 ; object events
	object_event  5,  3, SPRITE_BUENA, SPRITEMOVEDATA_STANDING_LEFT, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ElmsWife, -1
	object_event  2,  4, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ElmsSon, -1
