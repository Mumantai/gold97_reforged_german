	const_def 2 ; object constants
	const BRASSTOWER4F_POKE_BALL1
	const BRASSTOWER4F_SAGE1
	const BRASSTOWER4F_SAGE2

BrassTower4F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
SproutTower4FSign:
	jumptext SproutTower4FSignText
	
SproutTower4FSignText:
    text "Eine Statue von"
    line "HO-OH."

    para "Das legendäre"
    line "Vogel-#MON, das"
    para "einst auf dem"
    line "Dach dieses Turmes"
    cont "nistete."

    para "Mögen wir seinen"
    line "Nistplatz ehren,"
    para "auf dass es eines"
    line "Tages zurückkehren"
    cont "möge."
	done



BrassTower4FEscapeRope:
	itemball ESCAPE_ROPE
	
TrainerSageLi:
	trainer SAGE, LI, EVENT_BEAT_SAGE_LI, SageLiSeenText, SageLiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageLiAfterBattleText
	waitbutton
	closetext
	end


SageLiSeenText:
    text "Es war die richti-"
    line "ge Entscheidung,"
    para "diese Reise an-"
    line "zutreten."

    para "Das spüre ich."
	done

SageLiBeatenText:
	text "Ich wusste es!"
	done

SageLiAfterBattleText:
	text "Bitte, geh weiter"
	line "auf die nächste"
	cont "Ebene."
	done
	
TrainerSageGaku:
	trainer SAGE, GAKU, EVENT_BEAT_SAGE_GAKU, SageGakuSeenText, SageGakuBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageGakuAfterBattleText
	waitbutton
	closetext
	end


SageGakuSeenText:
    text "Die meiste Zeit"
    line "verbringen wir mit"
    cont "Selbstreflexion."
	done

SageGakuBeatenText:
	text "Ich fühle mich"
	line "vollkommen."
	done

SageGakuAfterBattleText:
    text "Der Geist vermag"
    line "es, viele Gedanken"
    para "an einem Tag zu"
    line "fassen und weiter-"
    cont "zugeben."
	done


BrassTower4F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 10,  1, BRASS_TOWER_3F, 2
	warp_event 11, 11, BRASS_TOWER_5F, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event  8,  1, BGEVENT_READ, SproutTower4FSign

	db 3 ; object events
	object_event  0,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BrassTower4FEscapeRope, EVENT_BRASS_TOWER_4F_ESCAPE_ROPE
	object_event  3,  1, SPRITE_SAGE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerSageLi, EVENT_ALLOY_CAPTAIN_AND_TOWER_SAGES_GONE
	object_event  9,  9, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSageGaku, EVENT_ALLOY_CAPTAIN_AND_TOWER_SAGES_GONE
