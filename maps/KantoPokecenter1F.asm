	const_def 2 ; object constants
	const KANTOPOKECENTER1F_NURSE
	const KANTOPOKECENTER1F_COOLTRAINERM
	const KANTOPOKECENTER1F_GRANNY
	const KANTOPOKECENTER1F_YOUNGSTER

KantoPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KantoPokecenter1FNurseScript:
	jumpstd pokecenternurse
	
KantoPokecenterCooltrainerMScript:
	jumptextfaceplayer KantoPokecenterCooltrainerMText
	
KantoPokecenterGrannyScript:
	jumptextfaceplayer KantoPokecenterGrannyText
	
KantoPokecenterYoungsterScript:
	jumptextfaceplayer KantoPokecenterYoungsterText
	
KantoPokecenterCooltrainerMText:
    text "Hier gibt es eine"
    line "Menge zu sehen und"
    cont "zu erleben."

    para "Warst du schon in"
    line "der PKMN-ARENA,"
    cont "um gegen ROT zu"
    cont "kämpfen?"
	done
	
KantoPokecenterGrannyText:
	text "Viele starke"
	line "Trainer kommen"
	para "nach KANTO, um"
	line "gegen unseren ROT"
	cont "zu kämpfen."
	done
	
KantoPokecenterYoungsterText:
    text "Ich hörte, in der"
    line "Nähe von GENEOS"
    para "CITY gibt es eine"
    line "#MON-PENSION."
	done

KantoPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  7, KANTO_REGION, 5
	warp_event  6,  7, KANTO_REGION, 5
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoPokecenter1FNurseScript, -1
	object_event  3,  5, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoPokecenterCooltrainerMScript, -1
	object_event 10,  1, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoPokecenterGrannyScript, -1
	object_event 14,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoPokecenterYoungsterScript, -1
