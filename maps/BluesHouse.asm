	const_def 2 ; object constants
	const DAISYSNOTE

BluesHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

DaisysLetter:
	jumptext DaisysLetterText
	
DaisysLetterText:
    text "Eine Nachricht"
    line "von SARAH."

    para "Bitte schau ab und"
    line "zu nach dem Haus,"
    cont "während wir in"
    cont "SILENITIA sind."

    para "Es kann eine Weile"
    line "dauern, bis wir"
    cont "zurück sind, aber"
    cont "Opa freut sich so"
    cont "sehr auf sein"
    cont "neues Projekt mit"
    cont "den Kindern aus"
    cont "der Stadt."

    para "Falls ROT etwas"
    line "braucht, es ist"
    cont "immer Essen im"
    cont "Kühlschrank."

    para "Danke, dass du ein"
    line "so guter Nachbar"
    cont "bist!"

    para "-SARAH EICH"
	done


BluesHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, KANTO_REGION, 20
	warp_event  5,  7, KANTO_REGION, 20

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  4, SPRITE_PAPER, 0, 0, 0, -1, -1, PAL_OW_SILVER, OBJECTTYPE_SCRIPT, 0, DaisysLetter, -1
