	const_def 2 ; object constants
	const ISEN_STRAIT_SEASIDE_PATH_GATE_OFFICER
	const ISEN_STRAIT_SEASIDE_PATH_GATE_BUG_CATCHER

IsenStraitSeasidePathGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


IsenStraitSeasidePathGateOfficerScript:
	jumptextfaceplayer IsenStraitSeasidePathGateOfficerText

IsenStraitSeasidePathGateBugCatcherScript:
	jumptextfaceplayer IsenStraitSeasidePathGateBugCatcherText
	
IsenStraitSeasidePathGateBugCatcherText:
    text "Die wilden #MON"
    line "auf den INSELN"
    cont "sind sehr stark."

    para "Viel stärker, als"
    line "auf dem Festland,"
    cont "glaube ich."
	done

IsenStraitSeasidePathGateOfficerText:
	text "Ich hörte, die"
	line "ISEN-STRAẞE birgt"
	para "verborgene Reste"
	line "geheimer Experi-"
	cont "mente zur Erschaf-"
	para "fung eines künst-"
	line "lichen #MONs."

	para "Was könnte das"
	line "wohl bedeuten?"
	done


IsenStraitSeasidePathGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  7, ISEN_STRAIT, 1
	warp_event  1,  7, ISEN_STRAIT, 1
	warp_event  8,  7, SEASIDE_PATH, 1
	warp_event  9,  7, SEASIDE_PATH, 1

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, IsenStraitSeasidePathGateOfficerScript, -1
	object_event  1,  2, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, IsenStraitSeasidePathGateBugCatcherScript, -1
