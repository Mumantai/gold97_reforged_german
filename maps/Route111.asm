	const_def 2 ; object constants
	const ROUTE41_SWIMMER_GUY1
	const ROUTE41_SWIMMER_GIRL1

Route111_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route111WhirlIslandSign:
	jumptext Route111WhirlIslandSignText

TrainerSwimmerfKaylee:
	trainer SWIMMERF, KAYLEE, EVENT_BEAT_SWIMMERF_KAYLEE, SwimmerfKayleeSeenText, SwimmerfKayleeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfKayleeAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermMathew:
	trainer SWIMMERM, MATHEW, EVENT_BEAT_SWIMMERM_MATHEW, SwimmermMathewSeenText, SwimmermMathewBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermMathewAfterBattleText
	waitbutton
	closetext
	end
	
TrainerSwimmermGeorge:
	trainer SWIMMERM, GEORGE, EVENT_BEAT_SWIMMERM_GEORGE, SwimmermGeorgeSeenText, SwimmermGeorgeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermGeorgeAfterBattleText
	waitbutton
	closetext
	end
	
TrainerSwimmerfKara:
	trainer SWIMMERF, KARA, EVENT_BEAT_SWIMMERF_KARA, SwimmerfKaraSeenText, SwimmerfKaraBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfKaraAfterBattleText
	waitbutton
	closetext
	end

Route111Rock:
; unused
	jumpstd smashrock

Route111HiddenMaxEther:
	hiddenitem MAX_ETHER, EVENT_ROUTE_41_HIDDEN_MAX_ETHER

Route111WhirlIslandSignText:
	text "STRUDELINSEL"
	line "EINGANG"
	done

SwimmerfKayleeSeenText:
	text "Ich wette, du"
	line "reitest nur auf"
	para "deinem #MON,"
	line "weil du das kalte"
	para "Wasser nicht"
	line "aushältst!"
	done

SwimmerfKayleeBeatenText:
	text "So machst du das?"
	done

SwimmerfKayleeAfterBattleText:
    text "Ehrlich gesagt,"
    line "könnte es gefäh-"
    para "lich sein, zu"
    line "lange im kalten"
    cont "Wasser zu bleiben."
	done
	
SwimmermMathewSeenText:
	text "Brr!"

	para "Das kalte Wasser"
	line "stählt den"
	cont "Charakter!"
	done

SwimmermMathewBeatenText:
	text "Ooh, du hast eine"
	line "super Ausdauer!"
	done

SwimmermMathewAfterBattleText:
	text "Weiter nach Norden"
	line "kann ich nicht"
	cont "schwimmen."

	para "Da wird das Wasser"
	line "zu gefährlich!"
	done
	
SwimmermGeorgeSeenText:
	text "Ich bin etwas"
	line "müde. Wenn ich"
	cont "gewinne, leihst du"
	cont "mir dein #MON."
	done

SwimmermGeorgeBeatenText:
	text "Keuch, japs…"
	done

SwimmermGeorgeAfterBattleText:
	text "SPIZZARDIA ist"
	line "noch so weit weg."

	para "Aber der Rückweg"
	line "nach KITAOMORIA"
	cont "CITY ist auch"
	cont "nicht viel kürzer."

	para "Was soll ich tun?"
	done

SwimmerfKaraSeenText:
	text "Wenn du eine Pause"
	line "brauchst, dann"
	cont "halte deinen Kopf"
	cont "über Wasser und"
	cont "paddle mit den"
	cont "Füßen."

	para "Auf diese Weise"
	line "legst du eine"

	para "Ruhepause ein und"
	line "sammelst Energie."
	done

SwimmerfKaraBeatenText:
	text "Oh! Du bist aus-"
	line "geruhter als ich."
	done

SwimmerfKaraAfterBattleText:
	text "Ich habe tief aus"
	line "dem Inneren der"
	cont "STRUDELINSEL ein"
	cont "Brüllen gehört."
	done

Route111_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5, 31, WHIRL_ISLAND_1F, 1
	warp_event  8, 51, ROUTE_111_BLUE_FOREST_GATE, 1
	warp_event  9, 51, ROUTE_111_BLUE_FOREST_GATE, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event  4, 33, BGEVENT_ITEM, Route111HiddenMaxEther
	bg_event  7, 33, BGEVENT_READ, Route111WhirlIslandSign


	db 4 ; object events
	object_event 12, 17, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermMathew, -1
	object_event 12,  8, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfKaylee, -1
	object_event 11, 26, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerSwimmermGeorge, -1
	object_event 10, 42, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfKara, -1

