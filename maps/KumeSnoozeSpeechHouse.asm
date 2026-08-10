	const_def 2 ; object constants
	const KUMESNOOZESPEECHHOUSE_TEACHER

KumeSnoozeSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KumeSnoozeSpeechHouseTeacherScript:
	jumptextfaceplayer KumeSnoozeSpeechHouseTeacherText
	
KumeSnoozeSpeechHouseTeacherText:
    text "Das Leben ist so"
    line "friedvoll hier auf"
    cont "den NANTO-INSELN."

    para "Ich glaube, ich"
    line "mache ein kleines"
    cont "Nickerchen…"
	done
	
	

KumeSnoozeSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, KUME_CITY, 4
	warp_event  5,  7, KUME_CITY, 4

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  4,  4, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, KumeSnoozeSpeechHouseTeacherScript, -1
