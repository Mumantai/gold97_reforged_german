	const_def 2 ; object constants
	const ROUTE39_BEAUTY
	const ROUTE39_POKEFAN_M
	const ROUTE39_POKEFAN_F1
	const ROUTE39_PSYCHIC_NORMAN
	const ROUTE39_FRUIT_TREE
	const ROUTE39_POKEFAN_F2
	const ROUTE39_STANDING_YOUNGSTER
	const ROUTE39_BUENA2

Route109_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
TrainerSailorHarry:
	trainer SAILOR, HARRY, EVENT_BEAT_SAILOR_HARRY, SailorHarrySeenText, SailorHarryBeatenText, 0, .Script

.Script
	endifjustbattled
	opentext
	writetext SailorHarryAfterBattleText
	waitbutton
	closetext
	end

TrainerSchoolboyChad1:
	trainer SCHOOLBOY, CHAD, EVENT_BEAT_SCHOOLBOY_CHAD, SchoolboyChad1SeenText, SchoolboyChad1BeatenText, 0, .Script

.Script
	endifjustbattled
	opentext
	writetext SchoolboyChad1AfterBattleText
	waitbutton
	closetext
	end


TrainerPokefanmDerek:
	trainer POKEFANM, DEREK, EVENT_BEAT_POKEFANM_DEREK, PokefanmDerekSeenText, PokefanmDerekBeatenText, 0, .Script

.Script
	endifjustbattled
	opentext
	writetext PokefanMDerekText_NotBragging
	waitbutton
	closetext
	end

TrainerPokefanfRuth:
	trainer POKEFANF, RUTH, EVENT_BEAT_POKEFANF_RUTH, PokefanfRuthSeenText, PokefanfRuthBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanfRuthAfterBattleText
	waitbutton
	closetext
	end


TrainerBeautyValerie:
	trainer BEAUTY, VALERIE, EVENT_BEAT_BEAUTY_VALERIE, BeautyValerieSeenText, BeautyValerieBeatenText, 0, .Script

.Script
	endifjustbattled
	opentext
	writetext BeautyValerieAfterBattleText
	waitbutton
	closetext
	end


TrainerPsychicNorman:
	trainer PSYCHIC_T, NORMAN, EVENT_BEAT_PSYCHIC_NORMAN, PsychicNormanSeenText, PsychicNormanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicNormanAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanfJaime:
	faceplayer
	opentext
	checktime NITE
	iffalse .NotNight
	checkevent EVENT_BEAT_POKEFANF_JAIME
	iftrue .Beaten
	writetext PokefanfJaimeSeenText
	waitbutton
	closetext
	winlosstext PokefanfJaimeBeatenText, 0
	loadtrainer POKEFANF, JAIME
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_POKEFANF_JAIME
	closetext
	end

.Beaten:
	writetext PokefanfJaimeAfterBattleText
	waitbutton
	closetext
	end

.NotNight:
	writetext PokefanfJaimeHopeItGetsDarkText
	waitbutton
	closetext
	end

MoomooFarmSign:
	jumptext MoomooFarmSignText

Route109TrainerTips:
	jumptext Route109TrainerTipsText

Route109FruitTree:
	fruittree FRUITTREE_ROUTE_109

Route109HiddenNugget:
	hiddenitem NUGGET, EVENT_ROUTE_39_HIDDEN_NUGGET

Route109ChixText:
	text "DODORST: Mooo!"
	done

PokefanmDerekSeenText:
	text "Genau der richtige"
	line "Moment, um mit"
	cont "PIKACHU anzugeben!"
	done

PokefanmDerekBeatenText:
	text "Ich hatte keine"
	line "Zeit, mit PIKACHU"
	cont "zu prahlen…"
	done

PokefanMDerekText_NotBragging:
	text "Ich höre mir deine"
	line "Prahlerei gar"
	cont "nicht an!"

	para "Wir #-FANS"
	line "haben ein Gelübde,"

	para "das uns verbietet,"
	line "Leuten beim"
	cont "Prahlen zuzuhören!"
	done

PokefanfRuthSeenText:
	text "Was für süße"
	line "#MON!"

	para "Zeigen wir uns"
	line "gegenseitig unsere"
	cont "#MON, und zwar"
	cont "gleichzeitig!"
	done

PokefanfRuthBeatenText:
	text "Mir macht es"
	line "nichts aus,"
	cont "zu verlieren."
	done

PokefanfRuthAfterBattleText:
	text "Weißt du über"
	line "Baby-#MON"
	cont "Bescheid?"

	para "Die sind bestimmt"
	line "super-süß!"
	done

PokefanMDerekPikachuIsItText:
	text "PIKACHU muss sein!"
	line "Was meinst du?"
	done

PsychicNormanSeenText:
	text "Zeig doch mal, was"
	line "deine #MON"
	cont "drauf haben."
	done

PsychicNormanBeatenText:
	text "He, deine #MON"
	line "sind sehr fähig!"
	done

PsychicNormanAfterBattleText:
	text "Du weißt von den"
	line "unterschiedlichen"
	cont "#-Fähigkeiten?"

	para "Bei den Menschen"
	line "ist das ganz"
	cont "ähnlich. Jeder hat"
	cont "unterschiedliche"
	cont "Talente."
	done

PokefanfJaimeHopeItGetsDarkText:
	text "Ufu… Ich hoffe, es"
	line "wird bald dunkel."
	done

PokefanfJaimeSeenText:
	text "Du kommst gerade"
	line "recht."

	para "Auf in den Kampf."
	done

PokefanfJaimeBeatenText:
	text "Oh, wie"
	line "ernüchternd…"
	done

PokefanfJaimeAfterBattleText:
	text "Ich traf PONITA"
	line "nachts, genau hier"
	cont "auf ROUTE 109."

	para "Ich weiß nicht"
	line "warum, aber es"

	para "scheint es zu"
	line "mögen, wenn ich"
	cont "hier trainiere."

	para "Es scheint mich"
	line "durch das Training"

	para "hier mehr zu"
	line "mögen, als wenn"

	para "ich woanders"
	line "trainiere."
	done


BeautyValerieSeenText:
	text "Hallo! Du bist"
	line "bestimmt so nett"

	para "und zeigst mir"
	line "deine #MON?"
	done

BeautyValerieBeatenText:
	text "Ich bin froh, dass"
	line "ich deine #MON"
	cont "sehen durfte!"
	done

BeautyValerieAfterBattleText:
	text "Wenn ich #-"
	line "MON sehe, scheint"
	cont "mich das zu"
	cont "entspannen."
	done
	
SailorHarrySeenText:
	text "Ich war im Aus-"
	line "land. Deswegen"

	para "kenne ich alle"
	line "#MON-Arten!"
	done

SailorHarryBeatenText:
	text "Deine Fähigkeiten"
	line "sind Spitzen-"
	cont "klasse!"
	done

SailorHarryAfterBattleText:
	text "Alle Menschen auf"
	line "der ganzen Welt"

	para "leben glücklich"
	line "zusammen mit den"
	cont "#MON."
	done

SchoolboyChad1SeenText:
	text "Jetzt probiere ich"
	line "etwas aus, das ich"
	cont "heute gelernt"
	cont "habe."
	done

SchoolboyChad1AfterBattleText:
	text "Ich fürchte, ich"
	line "habe noch nicht"
	cont "genug gelernt."
	done

SchoolboyChadSoManyTestsText:
	text "Ich habe so viele"
	line "Prüfungen, dass"

	para "ich nicht viel"
	line "Zeit für #MON"
	cont "habe."

	para "Wenn ich also mal"
	line "Zeit zum Spielen"
	cont "habe, dann konzen-"
	cont "triere ich mich."
	done

Route109SignText:
	text "ROUTE 109"

	para "GENEOS CITY   -"
	line "KITAOMORIA CITY"
	done

MoomooFarmSignText:
	text "Lass deine"
	line "#MON in einem"
	cont "#MON-CENTER"
	cont "heilen!"
	done

Route109TrainerTipsText:
	text "TIPPS für TRAINER"
	line "Benutze KOPFNUSS,"

	para "um #MON"
	line "aus den Bäumen"
	cont "zu schütteln."

	para "Auf den Bäumen"
	line "leben verschiedene"
	cont "Arten von #MON."

	para "Benutze KOPFNUSS"
	line "an jedem Baum, den"
	cont "du siehst!"
	done

Route109_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 15, 13, AMPARE_CAVERN_1F, 1
	warp_event 13, 28, ROUTE_109_POKECENTER_1F, 1
	warp_event  8,  5, ROUTE_109_ROUTE_110_GATE, 1
	warp_event  9,  5, ROUTE_109_ROUTE_110_GATE, 2

	db 0 ; coord events

	db 3 ; bg events
	bg_event  4, 56, BGEVENT_READ, Route109TrainerTips
	bg_event 14, 28, BGEVENT_READ, MoomooFarmSign
	bg_event  4, 35, BGEVENT_ITEM, Route109HiddenNugget

	db 8 ; object events
	object_event 12, 56, SPRITE_BUENA, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBeautyValerie, -1
	object_event 10, 46, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerPokefanmDerek, -1
	object_event  5, 22, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerPokefanfRuth, -1
	object_event  5, 31, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPsychicNorman, -1
	object_event 10, 23, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route109FruitTree, -1
	object_event  5, 63, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, TrainerPokefanfJaime, -1
	object_event  6, 84, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSchoolboyChad1, -1
	object_event  7,  7, SPRITE_SAILOR, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerSailorHarry, -1
