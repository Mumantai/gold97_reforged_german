	const_def 2 ; object constants
	const KOBANFISHERHOUSE_GURU

KobanFisherHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KobanFisherHouseGuruScript:
	jumptextfaceplayer KobanFisherHouseGuruText
	
KobanFisherHouseGuruText:
    text "Man sagt, dass"
    line "Drachen-#MON"
    para "noch immer in der"
    line "Höhle nördlich von"
    cont "hier leben."

    para "Beim Angeln konnte"
    line "ich noch nie eines"
    cont "finden."

    para "Vielleicht braucht"
    line "man estwas"
    para "Besseres als eine"
    line "einfache ANGEL."
	done

KobanFisherHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  7, KOBAN_ISLAND, 4
	warp_event  4,  7, KOBAN_ISLAND, 4

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  2, 3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, KobanFisherHouseGuruScript, -1
