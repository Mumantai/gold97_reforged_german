	const_def 2 ; object constants
	const BRASSTOWER2F_MEDIUM1
	const BRASSTOWER2F_MEDIUM2
	const BRASSTOWER2F_MEDIUM3
	const BRASSTOWER2F_POKE_BALL

BrassTower2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BrassTower2FSign:
	jumptext BrassTower2FSignText

BrassTower2FXAccuracy:
	itemball X_ACCURACY
	
TrainerMediumMartha:
	trainer MEDIUM, MARTHA, EVENT_BEAT_MEDIUM_MARTHA, MediumMarthaSeenText, MediumMarthaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext MediumMarthaAfterBattleText
	waitbutton
	closetext
	end
	
BrassTower2FSignText:
    text "Eine Statue von"
    line "PIKACHU."

    para "PIKACHU lehrt uns,"
    line "dass selbst die"
    para "beliebtesten #-"
    line "MON es verdienen,"
    para "mit Respekt und"
    line "Würde behandelt zu"
    para "werden und nicht"
    line "nur als Status-"
    para "symbol betrachtet"
    line "zu werden."
	done


MediumMarthaSeenText:
	text "Was bringt dich"
	line "hier her?"
	done

MediumMarthaBeatenText:
	text "Deine Bestimmung"
	line "ist klar."
	done

MediumMarthaAfterBattleText:
    text "Nur die weisesten"
    line "Trainer erkennen,"
    para "wie wichtig das"
    line "Band zwischen"
    para "Mensch und #MON"
    line "wirklich ist."
	done
	
TrainerMediumGrace:
	trainer MEDIUM, GRACE, EVENT_BEAT_MEDIUM_GRACE, MediumGraceSeenText, MediumGraceBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext MediumGraceAfterBattleText
	waitbutton
	closetext
	end


MediumGraceSeenText:
    text "Wenn man es rich-"
    line "tig macht, kann"
    para "ein #MON-Kampf"
    line "eine spirituelle"
    cont "Erfahrung sein."
	done

MediumGraceBeatenText:
	text "Ich hoffe, du hast"
	line "es gespürt."
	done

MediumGraceAfterBattleText:
    text "Wir sind in vie-"
    line "lerlei Hinsicht"
    para "stärker auf #-"
    line "MON angewiesen,"
    cont "als sie auf uns."
	done
	
TrainerMediumBethany:
	trainer MEDIUM, BETHANY, EVENT_BEAT_MEDIUM_BETHANY, MediumBethanySeenText, MediumBethanyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext MediumBethanyAfterBattleText
	waitbutton
	closetext
	end


MediumBethanySeenText:
    text "Spürst du eine"
    line "übernatürliche"
    para "Präsenz an diesem"
    line "Ort?"
	done

MediumBethanyBeatenText:
	text "Hmmm."
	done

MediumBethanyAfterBattleText:
    text "Jeder spürt sie,"
    line "auf die eine oder"
    cont "andere Art."
	done
	


BrassTower2F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  0,  1, BRASS_TOWER_1F, 3
	warp_event 11,  4, BRASS_TOWER_3F, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event  8,  1, BGEVENT_READ, BrassTower2FSign

	db 4 ; object events
	object_event 10,  2, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerMediumMartha, EVENT_ALLOY_CAPTAIN_AND_TOWER_SAGES_GONE
	object_event  1,  7, SPRITE_GRANNY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerMediumGrace, EVENT_ALLOY_CAPTAIN_AND_TOWER_SAGES_GONE
	object_event  9,  6, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerMediumBethany, EVENT_ALLOY_CAPTAIN_AND_TOWER_SAGES_GONE
	object_event 11,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BrassTower2FXAccuracy, EVENT_BRASS_TOWER_2F_X_ACCURACY
