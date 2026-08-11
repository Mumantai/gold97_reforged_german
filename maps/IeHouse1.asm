	const_def 2
	const IEHOUSENPC1
	const IEHOUSENPC2

IeHouse1_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Ie1NPC1Script:
	jumptextfaceplayer Ie1NPC1Text
	
Ie1NPC2Script:
	jumptextfaceplayer Ie1NPC2Text
	
Ie1NPC1Text:
    text "Als ich jung war,"
    line "war der SCHLOSS-"
    cont "BERG der ganze"
    cont "Stolz der Stadt."

    para "Jetzt liegt er in"
    line "Trümmern. Wirklich"
    cont "eine Schande…"
	done
	
Ie1NPC2Text:
    text "Das SCHLOSS war"
    line "ein historisch"
    cont "wichtiges Wahrzei-"
    cont "chen und es wurde"
    cont "auch so behandelt."

    para "Das änderte sich,"
    line "als sich etwas"
    cont "Wildes in die"
    cont "Höhle unter dem"
    cont "Schloss einge-"
    cont "nistet hat."

    para "Angeblich hat der"
    line "Fluch einer trau-"
    cont "rigen Frau, die"
    cont "dort ums Leben"
    cont "kam, einen GRÜNEN"
    cont "DRACHEN hervor-"
    cont "gerufen."
	done



IeHouse1_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, IE_TOWN, 4
	warp_event  5,  7, IE_TOWN, 4

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  4,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Ie1NPC1Script, -1
	object_event  7,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Ie1NPC2Script, -1
