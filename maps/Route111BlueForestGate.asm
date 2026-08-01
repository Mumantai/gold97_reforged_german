	const_def 2 ; object constants
	const ROUTE29ROUTE46GATE_OFFICER
	const ROUTE29ROUTE46GATE_YOUNGSTER

Route111BlueForestGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route111BlueForestGateOfficerScript:
	jumptextfaceplayer Route111BlueForestGateOfficerText

Route111BlueForestGateYoungsterScript:
	jumptextfaceplayer Route111BlueForestGateYoungsterText

Route111BlueForestGateOfficerText:
    text "NIHON ist bekannt"
    line "für raue Gewässer"
    cont "im Norden."

    para "Die Gegend um die,"
    line "passend benannte,"
    para "STRUDELINSEL ist"
    line "wahrscheinlich das"
    cont "beste Beispiel."

    para "Geh nicht nach"
    line "Norden, ohne dich"
    cont "vorzubereiten!"
	done

Route111BlueForestGateYoungsterText:
    text "Ich hörte, seltene"
    line "#MON leben auf"
    cont "der STRUDELINSEL."
	done

Route111BlueForestGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, ROUTE_111, 2
	warp_event  5,  0, ROUTE_111, 3
	warp_event  4,  7, BLUE_FOREST, 9
	warp_event  5,  7, BLUE_FOREST, 10

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route111BlueForestGateOfficerScript, -1
	object_event  6,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route111BlueForestGateYoungsterScript, -1
