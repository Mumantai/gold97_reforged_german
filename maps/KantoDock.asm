	const_def 2 ; object constants
	const KD_SAILOR1
	const KD_SAILOR2
	const KD_SAILOR3
	const KD_TRUCKMAN
	const KD_ITEMBALL

KantoDock_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KantoDockItemBall:
	itemball STAR_PIECE

TrainerKDOCK1:
	trainer SAILOR, KENT, EVENT_BEAT_KDOCKS_TRAINER1, SailorKentSeenText, SailorKentBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorKentAfterBattleText
	waitbutton
	closetext
	end

TrainerKDOCK2:
	trainer SAILOR, ERNEST, EVENT_BEAT_KDOCKS_TRAINER2, SailorErnestSeenText, SailorErnestBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorErnestAfterBattleText
	waitbutton
	closetext
	end

TrainerKDOCK3:
	trainer SAILOR, SVEN, EVENT_BEAT_KDOCKS_TRAINER3, SailorSvenSeenText, SailorSvenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorSvenAfterBattleText
	waitbutton
	closetext
	end

SailorKentSeenText:
    text "Es dauert noch 'ne"
    line "Weile, bis das"
    cont "nächste Schiff"
    cont "ablegt."

    para "Lass uns etwas"
    line "Zeit totschlagen!"
	done

SailorKentBeatenText:
    text "Ich habe meinen"
    line "TRANK auf dem"
    cont "Schiff vergessen!"
	done

SailorKentAfterBattleText:
    text "Ich habe ja  noch"
    line "genug Zeit, um zum"
    cont "#MON-CENTER zu"
    cont "laufen."
	done

SailorErnestSeenText:
    text "Ich bin der"
    line "härteste Knochen"
    cont "hier am Hafen!"
	done

SailorErnestBeatenText:
	text "Argh, du hast mich"
	line "überwältigt!"
	done

SailorErnestAfterBattleText:
    text "Du solltest hier"
    line "anheuern!"

    para "Man braucht schon"
    line "ein dickes Fell,"
    cont "um am Hafen zu"
    cont "arbeiten!"
	done

SailorSvenSeenText:
    text "Ich komme gerade"
    line "aus SPIZZARDIA."

    para "Hier ist es viel"
    line "zu heiß!"
	done

SailorSvenBeatenText:
	text "Oh, ich schwitze!"
	done

SailorSvenAfterBattleText:
    text "Ich glaube, ich"
    line "brauche etwas"
    cont "Schatten und auch"
    cont "etwas Wasser…"
	done

KantoDockTruckMan:
	jumptextfaceplayer KantoDockTruckManText
	
KantoDockTruckManText:
    text "Andauernd sind die"
    line "Kinder in der Nähe"
    cont "meines Wagens am"
    cont "Rumschnüffeln."

    para "Sie sind wohl vom"
    line "tadellosen Zustand"
    cont "des Transporters"
    cont "beeindruckt."

    para "Guck, nicht ein"
    line "Fleckchen Rost!"
	done

TruckBGEvent:
	jumptext TruckText
	
TruckText:
    text "Ein Transporter"
    line "aus den 80ern."

    para "Er glänzt von"
    line "vorn bis hinten."

    para "Sehr schön…"
	done


KantoDock_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 14,  0, KANTO_REGION, 44

	db 0 ; coord events

	db 2 ; bg events
	bg_event 22,  0, BGEVENT_READ, TruckBGEvent
	bg_event 23,  0, BGEVENT_READ, TruckBGEvent

	db 5 ; object events
	object_event  7,  0, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerKDOCK1, -1
	object_event 27,  4, SPRITE_SAILOR, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerKDOCK2, -1
	object_event 26,  7, SPRITE_SAILOR, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerKDOCK3, -1
	object_event 21,  0, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoDockTruckMan, -1
	object_event  2,  0, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, KantoDockItemBall, EVENT_KANTO_DOCK_STARPIECE
