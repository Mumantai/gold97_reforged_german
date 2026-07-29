	const_def 2 ; object constants
	const MAHOGANYPOKECENTER1F_NURSE
	const MAHOGANYPOKECENTER1F_POKEFAN_M
	const MAHOGANYPOKECENTER1F_YOUNGSTER
	const MAHOGANYPOKECENTER1F_COOLTRAINER_F

SanskritPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SanskritPokecenter1FNurseScript:
	jumpstd pokecenternurse

SanskritPokecenter1FPokefanMScript:
	jumptextfaceplayer SanskritPokecenter1FPokefanMText

SanskritPokecenter1FYoungsterScript:
	jumptextfaceplayer SanskritPokecenter1FYoungsterText

SanskritPokecenter1FCooltrainerFScript:
	jumptextfaceplayer SanskritPokecenter1FCooltrainerFText

SanskritPokecenter1FPokefanMText:
	text "Wie? TEAM ROCKET"
	line "ist wieder da?"

    para "Es gibt ein Haus"
    line "in der Stadt, in"
    cont "dem sich angeblich"
    cont "mehrere von denen"
    cont "aufhalten sollen."

	para "Ich frage mich,"
	line "was sie planen…"
	done

SanskritPokecenter1FYoungsterText:
	text "Ich verhindere,"
	line "dass sich meine"
	cont "#MON zu"
	cont "rasch entwickeln."

	para "Ich bringe ihnen"
	line "verschiedene"
	cont "Attacken bei, be-"
	cont "vor ich sie sich"
	cont "entwickeln lasse."
	done

SanskritPokecenter1FCooltrainerFText:
	text "#MON werden"
	line "stärker, wenn sie"
	cont "sich entwickeln."

	para "Aber sie erlernen"
	line "neue Attacken auch"
	cont "langsamer."
	done

SanskritPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  7, SANSKRIT_TOWN, 4
	warp_event  6,  7, SANSKRIT_TOWN, 4
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SanskritPokecenter1FNurseScript, -1
	object_event  9,  2, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SanskritPokecenter1FPokefanMScript, -1
	object_event  1,  3, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SanskritPokecenter1FYoungsterScript, -1
	object_event  2,  3, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SanskritPokecenter1FCooltrainerFScript, -1
