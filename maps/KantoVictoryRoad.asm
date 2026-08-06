	const_def 2 ; object constants
	const KANTOVICTORYROAD_POKE_BALL1
	const KANTOVICTORYROAD_POKE_BALL2
	const KANTOVICTORYROAD_POKE_BALL3
	const KANTOVICTORYROAD_POKE_BALL4
	const KANTOVICTORYROAD_POKE_BALL5
	const KANTOVICTORYROAD_COOLTRM1
	const KANTOVICTORYROAD_COOLTRM2
	const KANTOVICTORYROAD_COOLTRM3
	const KANTOVICTORYROAD_COOLTRF1
	const KANTOVICTORYROAD_COOLTRF2
	const KANTOVICTORYROAD_COOLTRF3

KantoVictoryRoad_MapScripts:
	db 0 ; scene scripts
	db 0 ; callbacks


KantoVictoryRoadTMEarthquake:
	itemball PROTEIN

KantoVictoryRoadMaxRevive:
	itemball REVIVE

KantoVictoryRoadFullRestore:
	itemball HYPER_POTION

KantoVictoryRoadFullHeal:
	itemball FULL_HEAL

KantoVictoryRoadHPUp:
	itemball HP_UP

KantoVictoryRoadHiddenMaxPotion:
	hiddenitem MAX_POTION, EVENT_KANTO_VICTORY_ROAD_HIDDEN_MAX_POTION

KantoVictoryRoadHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_KANTO_VICTORY_ROAD_HIDDEN_FULL_HEAL


;----------------------------------------------------------

TrainerKVR1:
	trainer COOLTRAINERM, GAVEN, EVENT_BEAT_KANTO_VICTORY_ROAD_TRAINER1, CTGavenSeenText, CTGavenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CTGavenAfterBattleText
	waitbutton
	closetext
	end

TrainerKVR2:
	trainer COOLTRAINERM, EVERITT, EVENT_BEAT_KANTO_VICTORY_ROAD_TRAINER2, CTEverittSeenText, CTEverittBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CTEverittAfterBattleText
	waitbutton
	closetext
	end

TrainerKVR3:
	trainer COOLTRAINERM, CHESTER, EVENT_BEAT_KANTO_VICTORY_ROAD_TRAINER3, CTChesterSeenText, CTChesterBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CTChesterAfterBattleText
	waitbutton
	closetext
	end

TrainerKVR4:
	trainer COOLTRAINERF, BETH, EVENT_BEAT_KANTO_VICTORY_ROAD_TRAINER4, CTBethSeenText, CTBethBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CTBethAfterBattleText
	waitbutton
	closetext
	end

TrainerKVR5:
	trainer COOLTRAINERF, KENZIE, EVENT_BEAT_KANTO_VICTORY_ROAD_TRAINER5, CTKenzieSeenText, CTKenzieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CTKenzieAfterBattleText
	waitbutton
	closetext
	end

TrainerKVR6:
	trainer COOLTRAINERF, ALLY, EVENT_BEAT_KANTO_VICTORY_ROAD_TRAINER6, CTAllySeenText, CTAllyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CTAllyAfterBattleText
	waitbutton
	closetext
	end

;----------------------------------------------------------

CTGavenSeenText:
    text "Wenn du bis an die"
    line "die Spitze willst,"
    cont "musst du erst an"
    cont "mir vorbei!"
	done

CTGavenBeatenText:
    text "Unglaublich!"
	done

CTGavenAfterBattleText:
    text "Auch wenn diese"
    line "Höhle nicht mehr"
    cont "die eigentliche"
    cont "SIEGESSTRASSE ist,"
    cont "musst du hier"
    cont "durch, wenn du die"
    cont "#MON LIGA sehen"
    cont "willst!"
	done

CTEverittSeenText:
    text "Hiyah!"

    para "Ich trainiere"
    line "in dieser Höhle"
    cont "seit einem Jahr!"

    para "Du wirst mein"
    line "letzter Gegner,"
    cont "bevor ich zum"
    cont "INDIGO PLATEAU"
    cont "aufbreche!"
    done

CTEverittBeatenText:
    text "Hä? Was sagst du?"
	done

CTEverittAfterBattleText:
    text "Wie bitte?"
    line "Die #MON LIGA"
    cont "ist umgezogen?"

    para "Und ich muss"
    line "mir jetzt 8 neue"
    cont "ORDEN holen?!"

    para "Haha! Hahahaha!"
	done


CTChesterSeenText:
    text "Hmpf! Wenn so"
    line "ein Landei aus"
    cont "ALABASTIA es zum"
    cont "ARENALEITER und"
    cont "CHAMP schafft,"
    cont "sollte ich als"
    cont "überlegener Stadt-"
    cont "mensch keinerlei"
    cont "Probleme haben!"
	done

CTChesterBeatenText:
	text "P-pardon?"
	done

CTChesterAfterBattleText:
    text "Oh? Und wo genau"
    line "kommst DU her?"

    para "…"

    para "SILENITIA?"
    line "Nie davon gehört!"
	done

CTBethSeenText:
    text "INDIGO PLATEAU…"

    para "Dieser Ort war"
    line "mal der Höhepunkt"
    cont "für alle Trainer…"

    para "Beweise mir, dass"
    line "du es verdienst,"
    cont "hier zu sein!"
	done

CTBethBeatenText:
	text "Verstanden…"
	done

CTBethAfterBattleText:
    text "Das hier war einst"
    line "der Standort der"
    cont "#MON LIGA."

    para "Jetzt ist es nur"
    line "noch ein weiterer"
    cont "Schritt auf einer"
    cont "größeren Reise,"
    cont "seit die LIGA"
    cont "die ganze Nation"
    cont "umfasst!"
	done

CTKenzieSeenText:
    text "ROT? Ehrlich"
    line "gesagt bin ich"
    cont "eher Fan von"
    cont "BLAU!"
	done

CTKenzieBeatenText:
	text "Ciao!"
	done

CTKenzieAfterBattleText:
    text "Also wirklich!"
    line "ROT hat nicht halb"
    cont "so viel Charisma"
    cont "wie BLAU es als"
    cont "CHAMP hatte!"

    para "Er sagt ja auch"
    line "nicht mal was!"
    cont "Was soll das?"
	done

CTAllySeenText:
    text "Ich habe schon"
    line "7 ORDEN aus NIHON!"
    cont "Du siehst mir nach"
    cont "einem Gegner aus,"
    cont "an dem ich mir die"
    cont "Zähne ausbeißen"
    cont "kann!"
	done

CTAllyBeatenText:
	text "Was, du auch?"
	done

CTAllyAfterBattleText:
    text "Natürlich hast du"
    line "auch 7 ORDEN,"
    cont "warum solltest du"
    cont "dich sonst hier"
    cont "durchkämpfen?"
	done

KantoVictoryRoad_MapEvents:
	db 0, 0 ; filler

	db 10 ; warp events
	warp_event  8, 67, KANTO_REGION, 30 ; entrance
	warp_event  1, 49, KANTO_VICTORY_ROAD, 3
	warp_event  1, 35, KANTO_VICTORY_ROAD, 2
	warp_event 13, 31, KANTO_VICTORY_ROAD, 5
	warp_event 13, 17, KANTO_VICTORY_ROAD, 4
	warp_event 17, 33, KANTO_VICTORY_ROAD, 7
	warp_event 17, 19, KANTO_VICTORY_ROAD, 6
	warp_event  0, 11, KANTO_VICTORY_ROAD, 9
	warp_event  0, 27, KANTO_VICTORY_ROAD, 8
	warp_event 13,  5, KANTO_REGION, 33 ; exit

	db 0 ; coord events

	db 2 ; bg events
	bg_event  3, 29, BGEVENT_ITEM, KantoVictoryRoadHiddenMaxPotion
	bg_event  3, 65, BGEVENT_ITEM, KantoVictoryRoadHiddenFullHeal

	db 11 ; object events
	object_event  3, 28, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, KantoVictoryRoadTMEarthquake, EVENT_KANTO_VICTORY_ROAD_TM_EARTHQUAKE
	object_event 12, 48, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, KantoVictoryRoadMaxRevive, EVENT_KANTO_VICTORY_ROAD_MAX_REVIVE
	object_event 18, 29, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, KantoVictoryRoadFullRestore, EVENT_KANTO_VICTORY_ROAD_FULL_RESTORE
	object_event 15, 48, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, KantoVictoryRoadFullHeal, EVENT_KANTO_VICTORY_ROAD_FULL_HEAL
	object_event  7, 38, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, KantoVictoryRoadHPUp, EVENT_KANTO_VICTORY_ROAD_HP_UP
	object_event  5, 65, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerKVR1, -1
	object_event 14,  9, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerKVR2, -1
	object_event 10, 35, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerKVR3, -1
	object_event  4, 50, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerKVR4, -1
	object_event 12, 28, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerKVR5, -1
	object_event  1, 19, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerKVR6, -1
