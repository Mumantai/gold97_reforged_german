	const_def 2 ; object constants
	const ROUTE38_LASS
	const ROUTE38_YOUNGSTER
	const ROUTE38_FRUIT_TREE
	const ROUTE38_BUENA2

Route108_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerBirdKeeperToby:
	trainer BIRD_KEEPER, TOBY, EVENT_BEAT_BIRD_KEEPER_TOBY, BirdKeeperTobySeenText, BirdKeeperTobyBeatenText, 0, .Script

.Script
	endifjustbattled
	opentext
	writetext BirdKeeperTobyAfterBattleText
	waitbutton
	closetext
	end

TrainerLassDana1:
	trainer LASS, DANA, EVENT_BEAT_LASS_DANA, LassDana1SeenText, LassDana1BeatenText, 0, .Script

.Script
	endifjustbattled
	opentext
	writetext UnknownText_0x1a20ec
	waitbutton
	closetext
	end

TrainerBeautyOlivia:
	trainer BEAUTY, OLIVIA, EVENT_BEAT_BEAUTY_OLIVIA, BeautyOliviaSeenText, BeautyOliviaBeatenText, 0, .Script

.Script
	endifjustbattled
	opentext
	writetext BeautyOliviaAfterBattleText
	waitbutton
	closetext
	end

Route108Sign:
	jumptext Route108SignText

Route108TrainerTips:
	jumptext Route108TrainerTipsText

Route108FruitTree:
	fruittree FRUITTREE_ROUTE_108

BirdKeeperTobySeenText:
	text "Fliege hoch in die"
	line "Luft, mein"
	cont "herrliches"
	cont "Vogel-#MON!"
	done

BirdKeeperTobyBeatenText:
	text "Ich fühle mich,"
	line "als würde ich mich"
	cont "selbst in die"
	cont "Lüfte erheben."
	done

BirdKeeperTobyAfterBattleText:
	text "Ich habe vor,"
	line "in GENEOS CITY"
	para "im KAMPF-DOJO zu"
	line "trainieren."

	para "Flug-#MON sind"
	line "stark gegen"
	cont "Kampf-#MON."

	para "…Ist das ein"
    line "unfairer Vorteil?"
	done

LassDana1SeenText:
	text "Du scheinst dich"
	line "mit #MON"
	cont "auszukennen."

	para "Gibst du mir bitte"
	line "einige Ratschläge?"
	done

LassDana1BeatenText:
	text "Ich verstehe. So"
	line "kämpfst du also."
	done

UnknownText_0x1a20ec:
	text "Ich kenne etwas"
	line "sehr Bekömmliches!"

	para "KUHMUH-MILCH ist"
	line "ein nahrhaftes"
	cont "Getränk für #-"
	cont "MON!"

	para "Du kannst sie in"
	line "SENDESTIA CITY"
	cont "kaufen."
	done

BeautyOliviaSeenText:
	text "Meine #MON und"
	line "ich sind wunder-"
	cont "schön, nicht wahr?"
	done

BeautyOliviaBeatenText:
    text "Ich hale meine"
    line "#MON stets"
    cont "top gepflegt."
	done

BeautyOliviaAfterBattleText:
	text "Warst du schon mal"
	line "mit deinen #MON"
	para "beim Coiffeur in"
	line "PORT ABANISHI?"
	done

Route108SignText:
	text "ROUTE 108"

	para "GENEOS CITY     -"
	line "KITAOMORIA CITY"
	done

Route108TrainerTipsText:
	text "TIPPS für TRAINER"
	line "Wenn sich ein"

	para "#MON weiter-"
	line "entwickelt, kannst"

	para "du diesen Prozess"
	line "aufhalten."

	para "Drücke während"
	line "der Entwicklung"
	cont "den B-Knopf."

	para "So wird das #-"
	line "MON erschreckt und"
	cont "es bricht die"
	cont "Entwicklung ab."
	done

Route108_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 2 ; bg events
	bg_event  6,  4, BGEVENT_READ, Route108Sign
	bg_event 18,  4, BGEVENT_READ, Route108TrainerTips

	db 4 ; object events
	object_event  8,  7, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerLassDana1, -1
	object_event 13, 13, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperToby, -1
	object_event 28,  5, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route108FruitTree, -1
	object_event 23,  5, SPRITE_BUENA, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBeautyOlivia, -1
