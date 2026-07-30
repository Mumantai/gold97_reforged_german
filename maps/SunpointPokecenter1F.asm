	const_def 2 ; object constants
	const CIANWOODPOKECENTER1F_NURSE
	const CIANWOODPOKECENTER1F_LASS
	const CIANWOODPOKECENTER1F_GYM_GUY
	const CIANWOODPOKECENTER1F_SUPER_NERD

SunpointPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SunpointPokecenter1FNurseScript:
	jumpstd pokecenternurse

SunpointPokecenter1FLassScript:
	jumptextfaceplayer SunpointPokecenter1FLassText

CianwoodGymGuyScript:
	faceplayer
	checkevent EVENT_ROUTE_5_6_POKEFAN_M_BLOCKS_UNDERGROUND_PATH
	iftrue .CianwoodGymGuyWinScript
	opentext
	writetext CianwoodGymGuyText
	waitbutton
	closetext
	end

.CianwoodGymGuyWinScript:
	opentext
	writetext CianwoodGymGuyWinText
	waitbutton
	closetext
	end

SunpointPokecenter1FSuperNerdScript:
	jumptextfaceplayer SunpointPokecenter1FSuperNerdText

SunpointPokecenter1FLassText:
    text "Kennst du diesen"
    line "Drang, mit deinen"
    cont "#MON vor deinen"
    cont "Freunen anzugeben?"

    para "Ich prahle immerzu"
    line "mit meinem schönen"
    cont "BELLEDAME."
	done

CianwoodGymGuyText:
    text "Warst du oben bei"
    line "den DOCKS?"

    para "Irgendwas Faules"
    line "geht da vor sich."
	done

CianwoodGymGuyWinText:
    text "Das an den DOCKS"
    line "war TEAM ROCKET?"

    para "Kaum zu glauben,"
    line "dass die sich"
    cont "wieder blicken"
    cont "lassen!"
	done


SunpointPokecenter1FSuperNerdText:
	text "Ich liebe es, mit"
	line "meinen trainierten"
	para "#MON anzugeben."
	line "Du etwa nicht?"

	para "Ich werde einige"
	line "Kämpfe bestreiten,"
	para "um mit meinen"
	line "#MON anzugeben!"
	done

SunpointPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  7, SUNPOINT_CITY, 2
	warp_event  6,  7, SUNPOINT_CITY, 2
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SunpointPokecenter1FNurseScript, -1
	object_event  1,  4, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SunpointPokecenter1FLassScript, -1
	object_event 10,  1, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CianwoodGymGuyScript, -1
	object_event 12,  5, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SunpointPokecenter1FSuperNerdScript, -1
