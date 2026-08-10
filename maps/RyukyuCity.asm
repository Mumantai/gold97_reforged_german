	const_def 2 ; object constants
	const SAFFRON_POKEFAN_M
	const SAFFRON_TEACHER
	const SAFFRON_TWIN
	const SAFFRON_BUG_CATCHER
	const SAFFRON_LASS
	const SAFFRON_COOLTRAINER_M
	const SAFFRON_SWIMMER_GUY
	const SAFFRON_SWIMMER_GIRL

RyukyuCity_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_SAFFRON
	return

RyukyuCityPokecenterSign:
	jumpstd pokecentersign

RyukyuCityMartSign:
	jumpstd martsign
	
RyukyuCitySign:
	jumptext RyukyuCitySignText
	
SaffronPokefanMScript:
	jumptextfaceplayer SaffronPokefanMText
	
SaffronTeacherScript:
	jumptextfaceplayer SaffronTeacherText
	
SaffronTwinScript:
	jumptextfaceplayer SaffronTwinText
	
SaffronBugCatcherScript:
	jumptextfaceplayer SaffronBugCatcherText
	
SaffronLassScript:
	jumptextfaceplayer SaffronLassText
	
SaffronCooltrainerMScript:
	jumptextfaceplayer SaffronCooltrainerMText
	
SaffronSwimmerGuyScript:
	jumptextfaceplayer SaffronSwimmerGuyText
	
SaffronSwimmerGirlScript:
	jumptextfaceplayer SaffronSwimmerGirlText

RyukyuPokefanM2Script:
	jumptextfaceplayer RyukyuPokefanM2Text
	
RyukyuCityHotelSign:
	jumptext RyukyuCityHotelSignText
	
RyukyuCitySignText:
	text "RUUCHUU CITY"

	para "Das strahlende"
	line "Juwel der"
	cont "NANTO-INSELN"
	done

SaffronTeacherText:
    text "Aber aber, Kinder."

    para "Lauft doch nicht"
    line "einfach ins Meer!"
	done
	
SaffronPokefanMText:
	text "Das Wetter hier"
	line "ist perfekt, wenn"
	cont "auch etwas feucht."
	done
	
SaffronBugCatcherText:
	text "Ich will schwimmen"
	line "gehen!"
	done
	
SaffronTwinText:
	text "Lass uns ein Eis"
	line "holen!"
	done
	
SaffronCooltrainerMText:
	text "Ich glaube, ich"
	line "fahre heute mit"
	cont "dem Boot raus."
	done
	
SaffronLassText:
    text "Viele Leute, die"
    line "du in der Stadt"
    para "siehst, leben gar"
    line "nicht hier."
	done
	
SaffronSwimmerGuyText:
	text "Ich komme im"
	line "Urlaub immer her,"
	cont "wenn ich kann!"
	done
	
SaffronSwimmerGirlText:
    text "Nirgendwo kann man"
    line "sich besser ent-"
    cont "spannen, als hier!"
	done

RyukyuPokefanM2Text:
    text "Ich schaue gerne"
    line "den Wellen auf"
    cont "dem Meer zu."
	done

RyukyuCityHotelSignText:
	text "RUUCHUU HOTEL UND"
	line "RESTAURANT"

	para "Das ultimative"
	line "Reiseerlebnis auf"
	cont "den NANTO-INSELN!"
	done


RyukyuCity_MapEvents:
	db 0, 0 ; filler

	db 13 ; warp events
	warp_event 31, 26, RYUKYU_MART, 1
	warp_event 11,  4, RYUKYU_POKECENTER_1F, 1
	warp_event 33, 11, RYUKYU_CITY_MERIDIAN_PATH_GATE, 1
	warp_event 22, 31, RYUKYU_URASOE_GATE, 1
	warp_event 23, 31, RYUKYU_URASOE_GATE, 2
	warp_event 23,  7, RYUKYU_TRADE_HOUSE, 1
	warp_event 30, 18, RYUKYU_TRADE_SPEECH_HOUSE, 1
	warp_event 27,  8, RYUKYU_ABORETUM, 1
	warp_event 28,  8, RYUKYU_ABORETUM, 2
	warp_event 16, 27, RYUKYU_FAKE_GYM, 1
	warp_event 14, 16, RYUKYU_RESTAURANT, 1
	warp_event 18, 19, RYUKYU_HOTEL, 1
	warp_event 19, 19, RYUKYU_HOTEL, 2


	db 0 ; coord events

	db 4 ; bg events
	bg_event 12,  4, BGEVENT_READ, RyukyuCityPokecenterSign
	bg_event 32, 26, BGEVENT_READ, RyukyuCityMartSign
	bg_event 24, 14, BGEVENT_READ, RyukyuCitySign
	bg_event 14, 18, BGEVENT_READ, RyukyuCityHotelSign

	db 9 ; object events
	object_event 29, 13, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SaffronPokefanMScript, -1
	object_event 11, 11, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SaffronTeacherScript, -1
	object_event 11, 12, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SaffronTwinScript, -1
	object_event 11, 10, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SaffronBugCatcherScript, -1
	object_event 21, 21, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SaffronLassScript, -1
	object_event  9, 19, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SaffronCooltrainerMScript, -1
	object_event  5, 20, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SaffronSwimmerGuyScript, -1
	object_event  6, 10, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SaffronSwimmerGirlScript, -1
	object_event  8, 29, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RyukyuPokefanM2Script, -1
