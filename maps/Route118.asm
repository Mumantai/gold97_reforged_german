	const_def 2 ; object constants
	const ROUTE4_YOUNGSTER
	const ROUTE4_LASS1
	const ROUTE4_LASS2
	const ROUTE4_POKE_BALL
	const HONTO_ROUTE_TRAINER
	const HONTO_ROUTE_MON
	const ROUTE4_FRUIT_TREE
	const ROUTE4_SWIMMERM2
	const ROUTE4_SWIMMERF
	const ROUTE4_SWIMMERF2

Route118_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
HontoTownRouteCooltrainermScript:
	end
HontoTownRouteMonsterScript:
	end
	
Route118FruitTree:
	fruittree FRUITTREE_ROUTE_118
	
TrainerSwimmerfElaine:
	trainer SWIMMERF, ELAINE, EVENT_BEAT_SWIMMERF_ELAINE, SwimmerfElaineSeenText, SwimmerfElaineBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfElaineAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfPaula:
	trainer SWIMMERF, PAULA, EVENT_BEAT_SWIMMERF_PAULA, SwimmerfPaulaSeenText, SwimmerfPaulaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfPaulaAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdKeeperHank:
	trainer BIRD_KEEPER, HANK, EVENT_BEAT_BIRD_KEEPER_HANK, BirdKeeperHankSeenText, BirdKeeperHankBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperHankAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerHope:
	trainer PICNICKER, HOPE, EVENT_BEAT_PICNICKER_HOPE, PicnickerHopeSeenText, PicnickerHopeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerHopeAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerSharon:
	trainer PICNICKER, SHARON, EVENT_BEAT_PICNICKER_SHARON, PicnickerSharonSeenText, PicnickerSharonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerSharonAfterBattleText
	waitbutton
	closetext
	end
	

TrainerSwimmermRandall:
	trainer SWIMMERM, RANDALL, EVENT_BEAT_SWIMMERM_RANDALL, SwimmermRandallSeenText, SwimmermRandallBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermRandallAfterBattleText
	waitbutton
	closetext
	end
	
TrainerSwimmermCharlie:
	trainer SWIMMERM, CHARLIE, EVENT_BEAT_SWIMMERM_CHARLIE, SwimmermCharlieSeenText, SwimmermCharlieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermCharlieAfterBattleText
	waitbutton
	closetext
	end
	

MtMoonSquareSign:
	jumptext MtMoonSquareSignText

Route118HPUp:
	itemball HP_UP

Route118HiddenUltraBall:
	hiddenitem ULTRA_BALL, EVENT_ROUTE_4_HIDDEN_ULTRA_BALL

BirdKeeperHankSeenText:
	text "Ich trainiere"
	line "#MON. Trittst"
	cont "du gegen mich an?"
	done

BirdKeeperHankBeatenText:
	text "Uff! Ich habe"
	line "verloren…"
	done

BirdKeeperHankAfterBattleText:
	text "Hast du ein spe-"
	line "zielles #MON,"
	para "das du trainieren"
	line "möchtest, setze es"
	para "an die erste Stel-"
	line "le und tausche es"
	cont "sofort aus."

	para "So funktioniert"
	line "das."
	done

PicnickerHopeSeenText:
	text "Ich spüre, dass"
	line "ich gewinnen kann."

	para "Mal sehen, ob"
	line "das stimmt!"
	done

PicnickerHopeBeatenText:
	text "Argh, du bist zu"
	line "stark."
	done

PicnickerHopeAfterBattleText:
    text "Ich hörte, dass"
    line "manche #MON"
    cont "Baby-Formen haben,"

    para "die aus EIERN"
    line "schlüpfen."

    para "Aber wo bekommt"
    line "man ein #MON-EI"
    cont "her?"
	done

PicnickerSharonSeenText:
	text "Ähm…"
	line "Ich…"
	cont "Kämpfe mit mir?"
	done

PicnickerSharonBeatenText:
	text "…"
	done

PicnickerSharonAfterBattleText:
    text "……Ich kam her, um"
    line "PIEPI zu sehen,"

    para "aber ich habe"
    line "keines gefunden."
	done
	
SwimmermCharlieSeenText:
	text "Das Wasser ist"
	line "schön warm. Ich"
	cont "bin also sehr"
	cont "locker und gelenk."

	para "Natürlich trete"
	line "ich gegen dich an!"
	done
	
SwimmermCharlieBeatenText:
	text "Oje! Ich habe eine"
	line "Gänsehaut!"
	done

SwimmermCharlieAfterBattleText:
	text "Ist es nicht"
	line "sehr entspannend,"
	cont "sich auf dem"
	cont "Wasser treiben"
	cont "zu lassen?"
	done
	
SwimmermRandallSeenText:
	text "Heh, du bist jung"
	line "und fit!"

	para "Surfe nicht auf"
	line "deinem #MON!"
	cont "Schwimme!"
	done

SwimmermRandallBeatenText:
	text "Oh, oh. Ich habe"
	line "verloren…"
	done

SwimmermRandallAfterBattleText:
	text "Schwimmen hält"
	line "deinen ganzen"
	cont "Körper fit und"
	cont "gesund."
	done
	
SwimmerfElaineSeenText:
    text "Gehst du nach"
    line "KAZANAMI CITY?"

    para "Wie wäre es zuerst"
    line "mit einem Kampf?"
	done

SwimmerfElaineBeatenText:
	text "Den habe ich"
	line "verloren!"
	done

SwimmerfElaineAfterBattleText:
    text "Ich würde sagen,"
    line "ich bin ein bess-"
    cont "erer Schwimmer als"
    line "du. Yeah!"
	done

SwimmerfPaulaSeenText:
	text "Ich habe keine"
	line "Schwimmreifen."

	para "Ich halte mich an"
	line "einem Wasser-"
	cont "#MON fest!"
	done

SwimmerfPaulaBeatenText:
	text "Oh, ich fühle mich"
	line "so schwindelig!"
	done

SwimmerfPaulaAfterBattleText:
	text "Ich lasse mich im"
	line "Wasser treiben und"
	cont "von den Wellen"
	cont "davontragen."
	done

MtMoonSquareSignText:
	text "ROUTE 118"
	para "KAZANAMI CITY -"
	line "GLYPHONTIA"
	done

Route118_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  4, 11, ROUTE_118_SUNPOINT_GATE, 4

	db 0 ; coord events

	db 2 ; bg events
	bg_event  6, 10, BGEVENT_READ, MtMoonSquareSign
	bg_event 16,  4, BGEVENT_ITEM, Route118HiddenUltraBall

	db 11 ; object events
	object_event 64,  8, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerBirdKeeperHank, -1
	object_event  8, 12, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerPicnickerHope, -1
	object_event 11,  9, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerPicnickerSharon, -1
	object_event  6,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route118HPUp, EVENT_ROUTE_4_HP_UP
	object_event 72,  4, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, HontoTownRouteCooltrainermScript, -1
	object_event 72,  5, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, HontoTownRouteMonsterScript, -1
	object_event 17,  7, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route118FruitTree, -1
	object_event 37,  5, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermRandall, -1
	object_event 50, 10, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermCharlie, -1
	object_event 42, 12, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerSwimmerfElaine, -1
	object_event 57,  8, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfPaula, -1
