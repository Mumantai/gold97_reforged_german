	const_def 2 ; object constants
	const BRASSTOWER3F_SAGE1
	const BRASSTOWER3F_SAGE2
	const BRASSTOWER3F_SAGE3


BrassTower3F_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 0 ; callbacks

.DummyScene0:
	end

.DummyScene1:
	end

BrassTower3FSign:
	jumptext BrassTower3FSignText
	
BrassTower3FSignText:
    text "Eine Statue von"
    line "TENTOXA."

    para "Trotz seines"
    line "einschüchternden"
    para "Aussehens, lehrt"
    line "uns TENTOXA, dass"
    para "alle #MON reine"
    line "Herzen haben."

    para "Diese Statue ist"
    line "einem TENTOXA ge-"
    para "widmet, das mit"
    line "seinen Tentakeln"
    para "ein Kind vor dem"
    line "Ertrinken im Fluss"
    para "neben diesem Turm"
    line "rettete."
	done


TrainerSageJeffrey:
	trainer SAGE, JEFFREY, EVENT_BEAT_SAGE_JEFFREY, SageJeffreySeenText, SageJeffreyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageJeffreyAfterBattleText
	waitbutton
	closetext
	end


SageJeffreySeenText:
    text "Was bedeutet es"
    line "für dich, diesen"
    cont "Turm zu erklimmen?"
	done

SageJeffreyBeatenText:
    text "Nun denn."
	done

SageJeffreyAfterBattleText:
    text "Suche einen Sinn"
    line "auf deiner Reise."

    para "Nicht nur hier im"
    line "Turm, sondern auch"
    para "in allem, was"
    line "danach kommt."
	done
	
TrainerSagePing:
	trainer SAGE, PING, EVENT_BEAT_SAGE_PING, SagePingSeenText, SagePingBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SagePingAfterBattleText
	waitbutton
	closetext
	end


SagePingSeenText:
    text "Im vierten Stock"
    line "befindet sich der"
    cont "Zugang zum Dach."

    para "Aber selbst wir"
    line "dürfen diesen"
    para "geweihten Ort"
    line "nicht betreten."
	done

SagePingBeatenText:
    text "Du scheinst deine"
    line "#MON sehr gut"
    cont "zu behandeln."
	done

SagePingAfterBattleText:
    text "Hoffentlich kehrt"
    line "das legendäre"
    para "regenbogenfarbene"
    line "#MON eines"
    cont "Tages zurück."
	done
	
TrainerSageNeal:
	trainer SAGE, NEAL, EVENT_BEAT_SAGE_NEAL, SageNealSeenText, SageNealBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageNealAfterBattleText
	waitbutton
	closetext
	end


SageNealSeenText:
    text "Du hast es weit"
    line "geschafft."

    para "Beeindruckend."
	done

SageNealBeatenText:
    text "Bitte, fahre fort."
	done

SageNealAfterBattleText:
    text "Wenn FALK dich ge-"
    line "beten hat, diesen"
    para "Turm zu erklimmen,"
    line "dann muss er eine"
    para "große Zukunft in"
    line "dir sehen."
	done

BrassTower3F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 11,  4, BRASS_TOWER_2F, 2
	warp_event 10,  1, BRASS_TOWER_4F, 1

	db 0 ; coord events


	db 1 ; bg events
	bg_event  4,  1, BGEVENT_READ, BrassTower3FSign

	db 3 ; object events
	object_event  1, 10, SPRITE_SAGE, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerSageJeffrey, EVENT_ALLOY_CAPTAIN_AND_TOWER_SAGES_GONE
	object_event  7,  9, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerSagePing, EVENT_ALLOY_CAPTAIN_AND_TOWER_SAGES_GONE
	object_event  7,  1, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerSageNeal, EVENT_ALLOY_CAPTAIN_AND_TOWER_SAGES_GONE

