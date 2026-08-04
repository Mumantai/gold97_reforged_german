	const_def 2 ; object constants
	const KANTO_HOTEL_NURSE
	const KANTO_HOTEL_ROCKER
	const KANTO_HOTEL_JANINE

KantoHotel_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KantoHotelJanine:
	jumptextfaceplayer KantoHotelJanineText

KantoHotelNurse:
	jumptextfaceplayer KantoHotelNurseText

KantoHotelRocker:
	jumptextfaceplayer KantoHotelRockerText
	
KantoHotelJanineText:
	text "Ich mache hier"
	line "mit meinem Freund"
	cont "Urlaub."
	done

KantoHotelRockerText:
    text "Ich war noch nie"
    line "in KANTO."

    para "Es gibt hier viel"
    line "zu sehen."
	done

KantoHotelNurseText:
    text "#MON? Nein, das"
    line "ist ein Hotel für"
    cont "Menschen."

    para "Wir sind voll"
    line "ausgebucht."
	done

KantoHotel_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  1,  7, KANTO_REGION, 16
	warp_event  2,  7, KANTO_REGION, 16

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  5,  2, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoHotelNurse, -1
	object_event  8,  5, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoHotelRocker, -1
	object_event 10,  5, SPRITE_BETA_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoHotelJanine, -1
