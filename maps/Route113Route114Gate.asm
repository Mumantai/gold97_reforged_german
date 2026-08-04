	const_def 2 ; object constants
	const ROUTE34ILEXFORESTGATE_TEACHER1
	const ROUTE34ILEXFORESTGATE_BUTTERFREE
	const ROUTE34ILEXFORESTGATE_LASS
	const ROUTE34ILEXFORESTGATE_TEACHER2

Route113Route114Gate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route113Route114GateTeacherScript:
	faceplayer
	opentext
	writetext Route113Route114GateTeacherText
	waitbutton
	closetext
	end

Route113Route114GateButterfreeScript:
	opentext
	writetext Route113Route114GateButterfreeText
	cry BUTTERFREE
	waitbutton
	closetext
	end

Route113Route114GateLassScript:
	jumptextfaceplayer Route113Route114GateLassText

Route113Route114GateTeacherText:
    text "Ist die Luft hier"
    line "nicht erfrischend?"

    para "#MON lieben"
    line "süße Gerüche."

    para "Bestimmte #MON"
    line "können diese auch"
    cont "selber verströmen."

    para "Wusstest du das?"
	done

Route113Route114GateButterfreeText:
	text "SMETTBO: Boh!"
	done

Route113Route114GateLassText:
	text "Wo sagtest du,"
	line "kommst du her?"

	para "SILENITIA?"

	para "Das ist gar nicht"
	line "mal so weit weg."
	done

Route113Route114Gate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, ROUTE_113, 1
	warp_event  5,  0, ROUTE_113, 2
	warp_event  4,  7, ROUTE_114, 1
	warp_event  5,  7, ROUTE_114, 2

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  0,  3, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route113Route114GateTeacherScript, EVENT_ROUTE_34_ILEX_FOREST_GATE_TEACHER_BEHIND_COUNTER
	object_event  0,  4, SPRITE_BUTTERFREE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route113Route114GateButterfreeScript, -1
	object_event  6,  4, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route113Route114GateLassScript, EVENT_ROUTE_34_ILEX_FOREST_GATE_LASS
