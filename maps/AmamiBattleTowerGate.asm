	const_def 2 ; object constants
	const AMAMIBATTLETOWERGATE_ROCKER
	const AMAMIBATTLETOWERGATE_TWIN

AmamiBattleTowerGate_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .ShowSailor

.ShowSailor:
	clearevent EVENT_BATTLE_TOWER_OUTSIDE_SAILOR_NEW
	return

AmamiBattleTowerGateRockerScript:
	jumptextfaceplayer AmamiBattleTowerGateRockerText

AmamiBattleTowerGateTwinScript:
	jumptextfaceplayer AmamiBattleTowerGateTwinText

AmamiBTGateCopScript:
	jumptextfaceplayer AmamiBTGateCopText

UnknownText_0x9f66f:
	text "Bist du auch ge-"
	line "kommen, um den"
	cont "DUELLTURM zu"
	cont "sehen?"

	para "Aber du kannst"
	line "noch nicht hinein."
	done

UnknownText_0x9f6ba:
	text "Der DUELLTURM ist"
	line "geöffnet."

	para "Ich möchte hinein,"
	line "aber ich habe mir"

	para "noch keinen guten"
	line "Spruch ausgedacht,"
	cont "wenn ich gewinne."
	done

AmamiBattleTowerGateRockerText:
	text "Gehst du zum"
	line "DUELLTURM?"

	para "Das ist ein Ge-"
	line "heimnis, aber du"

	para "erhältst spezielle"
	line "Preise, wenn du"
	cont "oft gewinnst."
	done

UnknownText_0x9f783:
	text "Ich trainiere"
	line "meine #MON,"

	para "damit ich bereit"
	line "für den DUELLTURM"
	cont "bin."
	done

AmamiBattleTowerGateTwinText:
	text "Die Level der"
	line "#MON, die ich"

	para "einsetzen möchte,"
	line "sind unter-"
	cont "schiedlich."

	para "Ich muss sie jetzt"
	line "trainieren!"
	done

AmamiBTGateCopText:
    text "Wenn du weiter"
    line "nach Osten gehst,"
    cont "kommst du nach"
    cont "KIKAITANI."

    para "Die meisten Leute"
    line "kommen aber wegen"
    cont "des DUELLTURMs."
	done


AmamiBattleTowerGate_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event  0,  4, AMAMI_TOWN, 10
	warp_event  0,  5, AMAMI_TOWN, 9
	warp_event  7,  0, BATTLE_TOWER_OUTSIDE, 3
	warp_event  8,  0, BATTLE_TOWER_OUTSIDE, 4
	warp_event  9,  4, BATTLE_TOWER_OUTSIDE, 5
	warp_event  9,  5, BATTLE_TOWER_OUTSIDE, 6

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  3,  1, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AmamiBattleTowerGateRockerScript, EVENT_BATTLE_TOWER_OUTSIDE_SAILOR
	object_event  5,  4, SPRITE_TWIN, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AmamiBattleTowerGateTwinScript, -1
	object_event  4,  7, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AmamiBTGateCopScript, -1
