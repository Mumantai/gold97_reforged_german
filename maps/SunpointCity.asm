	const_def 2 ; object constants
	const SUNPOINTCITY_STANDING_YOUNGSTER
	const SUNPOINTCITY_POKEFAN_M
	const SUNPOINTCITY_LASS
	const SUNPOINTCITY_ROCK1
	const SUNPOINTCITY_ROCK3
	const SUNPOINTCITY_POKEFAN_F
	const SUNPOINTCITY_BALL
	const SUNPOINTCITY_FRUIT_TREE_1
	const SUNPOINTCITY_FRUIT_TREE_2


SunpointCity_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_CIANWOOD
	setevent EVENT_TEKNOS_BRIDGE_REPAIRED
	return


SunpointCityChucksWife:
	jumptextfaceplayer ChucksWifeFlySpeechText

SunpointCityYoungster:
	jumptextfaceplayer SunpointCityYoungsterText

SunpointCityPokefanM:
	jumptextfaceplayer SunpointCityPokefanMText

SunpointCityLass:
	jumptextfaceplayer SunpointCityLassText

SunpointCitySign:
	jumptext SunpointCitySignText
	
SunpointHiddenWaterStone:
	hiddenitem WATER_STONE, EVENT_SOUTH_POINT_HIDDEN_WATER_STONE

SunpointPharmacySign:
	jumpstd martsign

SunpointPhotoStudioSign:
	jumptext SunpointPhotoStudioSignText

SunpointPokeSeerSign:
	jumptext SunpointPokeSeerSignText

SunpointPokecenterSign:
	jumpstd pokecentersign

SunpointCityRock:
	jumpstd smashrock

SunpointCityHiddenRevive:
	hiddenitem REVIVE, EVENT_CIANWOOD_CITY_HIDDEN_REVIVE

SunpointCityHiddenMaxEther:
	itemball MAX_ETHER
	
SunpointFruitTree1:
	fruittree FRUITTREE_SUNPOINT_CITY_1
	
SunpointFruitTree2:
	fruittree FRUITTREE_SUNPOINT_CITY_2

ChucksWifeFlySpeechText:
    text "Auf dieser Seite"
    line "von NIHON ist das"
    cont "Klima deutlich"
    cont "wärmer als in der"
    cont "restlichen Region."
	done

ChucksWifeChubbyText:
	text "Mein Mann hat ge-"
	line "gen dich verloren."
	cont "Also muss er här-"
	cont "ter trainieren."

	para "Das ist auch gut"
	line "so. Er hat in"
	cont "letzter Zeit etwas"
	cont "Speck angesetzt."
	done

SunpointCityYoungsterText:
	text "Have you ever been"
	line "to BLUE FOREST?"
	para "It's cold and"
	line "snowy over there."
	para "I couldn't live"
	line "there!"
	para "The cold is not"
	line "for me."
	done

SunpointCityPokefanMText:
    text "Seltene #MON"
    line "sollen im MAGMA-"
    cont "SCHACHT leben."

    para "Es ist schwer, in"
    line "die Höhle zu"
    cont "gelangen, weil"
    para "heruntergefallene"
    line "Felsen den Eingang"
    cont "oft blockieren."
	done

SunpointCityLassText:
    text "Diese Stadt hat"
    line "keine ARENA."

    para "Das braucht sie"
    line "aber auch nicht."
	done

SunpointCitySignText:
    text "KAZANAMI CITY"

    para "NIHONs Zentrum für"
    line "Internationalen"
    cont "Handel"
	done

SunpointPharmacySignText:
	text "APOTHEKE von"
    line "KAZANAMI CITY"

    para "Gerne erwarten wir"
    line "Ihre medizinischen"
    cont "Fragen"
	done

SunpointPhotoStudioSignText:
	text "TIPPS FÜR TRAINER"

	para "Manche VM-Attacken"
	line "benötigen ORDEN,"
	cont "um außerhalb von"
	cont "Kämpfen benutzt"
	cont "zu werden."

	para "In Kämpfen können"
	line "sie jederzeit"
	cont "verwendet werden."
	done

SunpointPokeSeerSignText:
    text "ACHTUNG:"

    para "Gefährliche Felsen"
    line "fallen regelmäßig"
    para "aus dem MAGMA-"
    line "SCHACHT."

    para "Betreten auf"
    line "eigene Gefahr."
	done

SunpointCity_MapEvents:
	db 0, 0 ; filler

	db 11 ; warp events
	warp_event 18, 13, MAGMA_SHAFT_1F, 1
	warp_event 33, 16, SUNPOINT_POKECENTER_1F, 1
	warp_event 19, 24, SUNPOINT_MART, 1
	warp_event 33, 25, SUNPOINT_PHOTO_STUDIO, 1
	warp_event 35, 11, ROUTE_118_SUNPOINT_GATE, 1
	warp_event 26, 12, POKE_SEERS_HOUSE, 1
	warp_event 30,  5, SUNPOINT_DOCKS_SUNPOINT_GATE, 3
	warp_event 31,  5, SUNPOINT_DOCKS_SUNPOINT_GATE, 4
	warp_event 30, 31, ROUTE_119_SUNPOINT_GATE, 1
	warp_event 31, 31, ROUTE_119_SUNPOINT_GATE, 2
	warp_event 25, 23, SKATEBOARDER_HOUSE, 1

	db 0 ; coord events

	db 7 ; bg events
	bg_event 28, 20, BGEVENT_READ, SunpointCitySign
	bg_event 23, 33, BGEVENT_ITEM, SunpointHiddenWaterStone
	bg_event 34, 16, BGEVENT_READ, SunpointPokecenterSign
	bg_event 20, 24, BGEVENT_READ, SunpointPharmacySign
	bg_event 16, 24, BGEVENT_READ, SunpointPhotoStudioSign
	bg_event 30, 16, BGEVENT_READ, SunpointPokeSeerSign
	bg_event 35, 27, BGEVENT_ITEM, SunpointCityHiddenRevive

	db 9 ; object events
	object_event 27, 15, SPRITE_FISHING_GURU, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SunpointCityYoungster, -1
	object_event 16, 29, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SunpointCityPokefanM, -1
	object_event 32, 21, SPRITE_ROCKER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SunpointCityLass, -1
	object_event 19, 19, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SunpointCityRock, -1
	object_event 17, 18, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SunpointCityRock, -1
	object_event 15, 29, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SunpointCityChucksWife, -1
	object_event 7,  26, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SunpointCityHiddenMaxEther, EVENT_CIANWOOD_CITY_HIDDEN_MAX_ETHER
	object_event  1,  8, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SunpointFruitTree1, -1
	object_event  2,  7, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SunpointFruitTree2, -1
