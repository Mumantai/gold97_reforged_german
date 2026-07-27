	const_def 2 ; object constants
	const GOLDENRODPOKECENTER1F_NURSE 
	const GOLDENRODPOKECENTER1F_GAMEBOY_KID
	const GOLDENRODPOKECENTER1F_LASS

WestpointPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

WestpointPokecenter1FNurseScript:
	jumpstd pokecenternurse



WestpointPokecenter1FGameboyKidScript:
	jumptextfaceplayer WestpointPokecenter1FGameboyKidText

WestpointPokecenter1FLassScript:
	jumptextfaceplayer WestpointPokecenter1FLassText

WestpointPokecenter1FGameboyKidText:
    text "Hast du versucht,"
    line "#MON mit einem"
    para "SUPERBALL zu"
    line "fangen?"

    para "Er eignet sich"
    line "besser besser zum"
    para "Fangen als ein"
    line "#BALL."
	done

WestpointPokecenter1FLassText:
	text "Ein starkes #-"
	line "MON muss nicht"
	cont "zwingend gewinnen."

	para "Meist entscheidet"
	line "der Vor- oder"
	cont "Nachteil des Typs."

	para "Ich glaube nicht,"
	line "dass es ein #-"
	cont "MON gibt, das al-"
	cont "len anderen über-"
	cont "legen ist."
	done



WestpointPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  7, WESTPORT_CITY, 8
	warp_event  6,  7, WESTPORT_CITY, 8
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestpointPokecenter1FNurseScript, -1
	object_event  8,  1, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, WestpointPokecenter1FGameboyKidScript, -1
	object_event  1,  4, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestpointPokecenter1FLassScript, -1
