	const_def 2 ; object constants
	const ROUTE2GATE_SCIENTIST
	const ROUTE2GATE_ROCKET1
	const ROUTE2GATE_ROCKET2

Route116Gate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
Route116GateRocket1Script:
	opentext
	writetext Route116GateRocket1Text
	waitbutton
	closetext
	end
	
Route116GateRocket2Script:
	opentext
	writetext Route116GateRocket2Text
	waitbutton
	closetext
	end

Route116GateScientistScript:
	faceplayer
	opentext
	checkevent EVENT_RIVAL_BURNED_TOWER
	iftrue .NoAzaleaRockets
	writetext Route116GateScientistText
	waitbutton
	closetext
	end

.NoAzaleaRockets:
	writetext Route116GateScientistTextNoRockets
	waitbutton
	closetext
	end

Route116GateAideScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_EVERSTONE_FROM_ELM
	iftrue .AlreadyGotEverstone
	writetext AideGivesEverstoneText1
	buttonsound
	verbosegiveitem EVERSTONE
	iffalse .NoRoomForEverstone
	writetext AideGivesEverstoneText2
	waitbutton
	setevent EVENT_GOT_EVERSTONE_FROM_ELM
	closetext
	end

.NoRoomForEverstone:
	writetext AideGivesEverstoneText3
	waitbutton
	closetext
	end
	
.AlreadyGotEverstone
	writetext AideGivesEverstoneText2
	buttonsound
	closetext
	end

AideGivesEverstoneText1:
	text "Hallo, <PLAY_G>!"

	para "Erinnerst du dich"
	line "an mich? Ich bin"
	cont "einer von PROF."
	cont "EICHs ASSISTENTEN."

	para "Er hat vergessen,"
	line "dir das hier zu"
    cont "geben, bevor er"
    cont "gegangen ist."
	done

AideGivesEverstoneText2:
    text "Dieser EWIGSTEIN"
    line "kann die Entwick-"
    cont "lung seines Trä-"
    cont "gers verhindern!"

    para "Es ist ein echt"
    line "praktischer Item,"
    cont "wenn du nicht"
    cont "willst, dass ein"
    cont "bestimmtes #MON"
    cont "sich entwickelt."
	done

AideGivesEverstoneText3:
	text "Oje…"

	para "Du hast keinen"
	line "Platz dafür!"
	done
	
Route116GateRocket1Text:
	text "Fufufufu…"

	para "Unser FLEGMON-Team"
	line "sollte bald mit"
	cont "einer neuen Ladung"
	cont "RUTEN zurück sein…"
	done
	
Route116GateRocket2Text:
	text "Hehehehe…"

	para "Niemand wird be-"
	line "merken, dass den"
	cont "FLEGMON die RUTEN"
	cont "fehlen, bis es zu"
	cont "spät ist…"
	done

Route116GateScientistText:
    text "Diese Männer sehen"
    line "aus wie Mitglieder"
    cont "von TEAM ROCKET."

    para "Könnten sie das"
    line "wirklich sein?"

    para "Ich wünschte nur,"
    line "sie würden den"
    cont "Ausgang nicht mehr"
    cont "blockieren, aber"
    cont "ich habe zu viel"
    cont "Angst vor ihnen…"
	done
	
Route116GateScientistTextNoRockets:
    text "Hinter diesem Tor,"
    line "liegt ein wirres"
    cont "Labyrinth aus"
    cont "Bäumen und eine"
    cont "verzwickte Höhle."

    para "Bereite dich also"
    line "gut darauf vor!"
	done

Route116Gate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, ROUTE_116, 1
	warp_event  5,  0, ROUTE_116, 2
	warp_event  4,  7, BIRDON_TOWN, 7
	warp_event  5,  7, BIRDON_TOWN, 8

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route116GateScientistScript, -1
	object_event  4,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route116GateRocket1Script, EVENT_RIVAL_BURNED_TOWER
	object_event  5,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route116GateRocket2Script, EVENT_RIVAL_BURNED_TOWER
	object_event  3,  1, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route116GateAideScript, EVENT_BIRDON_AIDE_HIDDEN