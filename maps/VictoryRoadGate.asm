	const_def 2 ; object constants
	const VICTORYROADGATE_OFFICER
	const VICTORYROADGATE_COOLTRAINERM
	const VICTORYROADGATE_COOLTRAINERF

VictoryRoadGate_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 0 ; callbacks

.DummyScene0:
	end

.DummyScene1:
	end

VictoryRoadGateBadgeCheckScene:
	turnobject PLAYER, LEFT
	jump VictoryRoadGateBadgeCheckScript

VictoryRoadGateOfficerScript:
	faceplayer
VictoryRoadGateBadgeCheckScript:
	opentext
	writetext VictoryRoadGateOfficerText
	buttonsound
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iffalse .NoPokemonEvenYet
	checkcode VAR_BADGES
	ifgreater NUM_JOHTO_BADGES - 1, .AllEightBadges
	writetext VictoryRoadGateNotEnoughBadgesText
	waitbutton
	closetext
	applymovement PLAYER, VictoryRoadGateStepDownMovement
	end

.NoPokemonEvenYet
	writetext VictoryRoadGateNotEvenATrainer
	waitbutton
	closetext
	applymovement PLAYER, VictoryRoadGateStepDownMovement
	end

.AllEightBadges:
	writetext VictoryRoadGateEightBadgesText
	waitbutton
	closetext
	setscene SCENE_FINISHED
	end

VictoryRoadGateStepDownMovement:
	step DOWN
	step_end
	
VictoryRoadGateCooltrainerMScript:
	jumptextfaceplayer VictoryRoadGateCooltrainerMText
	
VictoryRoadGateCooltrainerFScript:
	jumptextfaceplayer VictoryRoadGateCooltrainerFText
	
VictoryRoadGateCooltrainerMText:
    text "Ich kann es kaum"
    line "glauben!"

    para "Ich stehe kurz"
    line "davor die #MON"
    cont "LIGA herauszu-"
    cont "fordern!"

    para "Darauf habe ich"
    line "mein ganzes Leben"
    cont "lang gewartet!"
	done
	
VictoryRoadGateCooltrainerFText:
    text "Der KOROKANIA-PASS"
    line "ist ein Kinder-"
    cont "spiel."

    para "Die wahre Heraus-"
    line "forderung ist es,"
    para "von KOROKANIA CITY"
    line "aus den Gipfel des"
    para "KOROKANIABERGs zu"
    line "erklimmen."
	done
	
VictoryRoadGateNotEvenATrainer:
    text "Du siehst ja nicht"
    line "mal aus wie ein"
    cont "#MON-TRAINER."

    para "Tut mir Leid, aber"
    line "ich kann hier nur"
    para "qualifizierte"
    line "Trainer durch-"
    cont "lassen."
	done

VictoryRoadGateOfficerText:
	text "Nur Trainer, die"
	line "sich als würdig"
	cont "erwiesen haben,"
	cont "dürfen eintreten."
	done

VictoryRoadGateNotEnoughBadgesText:
    text "Du besitzt keine"
    line "acht ORDEN."

    para "Tut mir Leid, aber"
    line "nur Trainer, die"
    para "genug ORDEN haben,"
    line "dürfen KOROKANIA"
    para "CITY betreten und"
    line "den KOROKANIABERG"
    cont "erklimmen."
	done

VictoryRoadGateEightBadgesText:
    text "Oh! Acht Orden!"

    para "Du hast dich als"
    line "würdig erwiesen."

    para "Bitte, geh weiter!"
	done

VictoryRoadGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  9, 17, SILENT_TOWN, 7
	warp_event 10, 17, SILENT_TOWN, 7
	warp_event  9,  0, CROWN_PASS, 1
	warp_event 10,  0, CROWN_PASS, 1

	db 1 ; coord events
	coord_event 10, 11, SCENE_DEFAULT, VictoryRoadGateBadgeCheckScene

	db 0 ; bg events

	db 3 ; object events
	object_event  8, 11, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VictoryRoadGateOfficerScript, -1
	object_event 12,  3, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VictoryRoadGateCooltrainerMScript, -1
	object_event  7,  2, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VictoryRoadGateCooltrainerFScript, -1
