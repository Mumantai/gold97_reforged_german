	const_def 2
	const FORKEDSTRAIT_FISHER1
	const FORKEDSTRAIT_FISHER2
	const FORKEDSTRAIT_ITEMBALL

ForkedStrait_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

ForkedStraitItemball:
	itemball LURE_BALL

TrainerForkedStrait1:
	trainer FISHER, STIRNER, EVENT_BEAT_FORKED_STRAIT_STIRNER, FisherStirnerSeenText, FisherStirnerBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherStirnerAfterBattleText
	waitbutton
	closetext
	end

FisherStirnerSeenText:
    text "Ich will bei den"
    line "SÜDLICHEN INSELN"
    para "angeln gehen, aber"
    line "sie lassen nur"
    para "Wissenschaftler"
    line "dort hin!"
	done

FisherStirnerBeatenText:
    text "Philosophie ist"
    line "eine Wissenschaft!"
    cont "Lasst mich rein!"
	done

FisherStirnerAfterBattleText:
    text "Das Gesetz ist ein"
    line "Schreckgespenst!"

    para "Ich angle, wo ich"
    line "will!"
	done


TrainerForkedStrait2:
	trainer FISHER, EDGAR, EVENT_BEAT_FORKED_STRAIT_EDGAR, FisherEdgarSeenText, FisherEdgarBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherEdgarAfterBattleText
	waitbutton
	closetext
	end

FisherEdgarSeenText:
    text "Ich bin der"
    line "stärkste Angler"
    cont "der Welt!"

    para "Fordere mich"
    line "heraus… Wenn"
    cont "du dich traust!"
	done

FisherEdgarBeatenText:
	text "Du bist einer"
	line "SUPERANGEL würdig…"
	done
	
FisherEdgarAfterBattleText:
    text "Ich kann dir"
    line "nichts mehr bei-"
    cont "bringen, Kleiner."

    para "Du bist jetzt der"
    line "Angelmeister!"
	done

CheckpointSignpost:
	jumptext CheckpointSignpostText
	
CheckpointSignpostText:
	text "SÜDLICHE INSELN"
	line "KONTROLLPUNKT"

	para "OFFIZIELLE"
	line "ERLAUBSNIS ZUM"
	cont "BETRETEN BENÖTIGT"
	done


ForkedStrait_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  9, 41,  FORKED_STRAIT_GATE, 1
	warp_event 10, 41,  FORKED_STRAIT_GATE, 2
	warp_event  8, 41,  FORKED_STRAIT_GATE, 1
	warp_event 11, 41,  FORKED_STRAIT_GATE, 2

	db 0 ; coord events

	db 1 ; bg events
	bg_event 12, 41, BGEVENT_READ, CheckpointSignpost

	db 3 ; object events
	object_event  6,  5, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, TrainerForkedStrait1, -1
	object_event  4, 26, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, TrainerForkedStrait2, -1
	object_event 15, 13, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, ForkedStraitItemball, EVENT_FORKED_STRAIT_LURE_BALL
	