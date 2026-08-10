	const_def 2 ; object constants
	const MOTOBU_PATH_SWIMMER1
	const MOTOBU_PATH_SWIMMER2
	const MOTOBU_PATH_SWIMMER3

MotobuPath_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


TrainerSwimmerfJill:
	trainer SWIMMERF, JILL, EVENT_BEAT_SWIMMERF_JILL, SwimmerfJillSeenText, SwimmerfJillBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfJillAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfMary:
	trainer SWIMMERF, MARY, EVENT_BEAT_SWIMMERF_MARY, SwimmerfMarySeenText, SwimmerfMaryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfMaryAfterBattleText
	waitbutton
	closetext
	end


TrainerSwimmerfKatie:
	trainer SWIMMERF, KATIE, EVENT_BEAT_SWIMMERF_KATIE, SwimmerfKatieSeenText, SwimmerfKatieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfKatieAfterBattleText
	waitbutton
	closetext
	end


SwimmerfJillSeenText:
    text "Das Wasser ist"
    line "so schön und"
    cont "warm hier!"
	done

SwimmerfJillBeatenText:
	text "Iieh!"
	done

SwimmerfJillAfterBattleText:
    text "Jetzt muss ich ins"
    line "#MON-CENTER,"
    para "also muss ich auch"
    line "aus dem Wasser."
    cont "Na ja."
	done

SwimmerfMarySeenText:
    text "Ich ziehe Kreise"
    line "um dich herum!"
	done

SwimmerfMaryBeatenText:
	text "Jetzt ist mir"
	line "schwindelig!"
	done

SwimmerfMaryAfterBattleText:
    text "Ich glaube, ich"
    line "kriege hier einen"
    cont "Hitzschlag."
	done

SwimmerfKatieSeenText:
	text "Platsch!"
	done

SwimmerfKatieBeatenText:
	text "Weggespült!"
	done

SwimmerfKatieAfterBattleText:
    text "Willst du sehen,"
    line "wie lange ich die"
    para "Luft anhalten"
    line "kann?"
	done

MotobuPathSign:
	jumptext MotobuPathSignText
	
MotobuPathSignText:
	text "MUTUBU-PFAD"

	para "NAGOTANI -"
	line "II-SHIMA"
	done


MotobuPath_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 1 ; bg events
	bg_event 57,  7, BGEVENT_READ, MotobuPathSign

	db 3 ; object events
	object_event 14,  7, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfJill, -1
	object_event 21,  9, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfMary, -1
	object_event 28,  7, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfKatie, -1
