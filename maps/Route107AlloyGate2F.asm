	const_def 2 ; object constants
	const NEWOLIVINEGATEWEST2F_LASS
	const NEWOLIVINEGATEWEST2F_TWIN

Route107AlloyGate2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

	
Route107AlloyGate2FCooltrainerfScript:
	jumptextfaceplayer Route107AlloyGate2FCooltrainerfText

Route107AlloyGate2FCooltrainerfText:
    text "Ich schaue mir"
    line "gerne die Wellen"
    cont "des Meeres von"
    cont "hier aus an."
	done
	
Route107AlloyGate2FBugCatcherScript:
	jumptextfaceplayer Route107AlloyGate2FBugCatcherText

Route107AlloyGate2FBugCatcherText:
    text "Ich wünschte, ich"
    line "hätte ein #MON,"
    para "das mich über das"
    line "Wasser trägt!"
	done
	
Route107AlloyGate2FSign:
	jumptext Route107AlloyGate2FSignText
	
Route107AlloyGate2FSignText:
    text "<PLAY_G> schaut"
    line "durch das"
    cont "Fernrohr."

    para "Eine kleine Insel-"
    line "Stadt liegt in der"
    cont "Ferne!"
	done

Route107AlloyGate2FSign2:
	jumptext Route107AlloyGate2FSign2Text
	
Route107AlloyGate2FSign2Text:
    text "<PLAY_G> schaut"
    line "durch das"
    cont "Fernrohr."

    para "Die Wellen sehen"
    line "rau aus!"
	done
	
Route107AlloyGate2F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  5,  0, ROUTE_107_ALLOY_GATE, 5

	db 0 ; coord events

	db 2 ; bg events
	bg_event 1,  0, BGEVENT_READ, Route107AlloyGate2FSign
	bg_event 3,  0, BGEVENT_READ, Route107AlloyGate2FSign2

	db 2 ; object events
	object_event  1,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route107AlloyGate2FCooltrainerfScript, -1
	object_event  5,  4, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route107AlloyGate2FBugCatcherScript, -1
	