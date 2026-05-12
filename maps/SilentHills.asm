	const_def 2 ; object constants
	const ROUTE37_WEIRD_TREE1
	const ROUTE37_WEIRD_TREE2
	const ROUTE37_BUG_CATCHER
	const ROUTE37_BUG_CATCHER2
	const ROUTE37_FRUIT_TREE1
	const ROUTE37_SUNNY
	const ROUTE37_YOUNGSTER
	const ROUTE37_FRUIT_TREE2
	const ROUTE37_FRUIT_TREE3
	const ROUTE37_ROCKER
	const ROUTE37_POKEBALL

SilentHills_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .Sunny

.Sunny:
	checkcode VAR_WEEKDAY
	ifequal SUNDAY, .SunnyAppears
	disappear ROUTE37_SUNNY
	return

.SunnyAppears:
	appear ROUTE37_SUNNY
	return

TrainerBeautyVictoria:
	trainer LASS, VICTORIA, EVENT_BEAT_BEAUTY_VICTORIA, BeautyVictoriaSeenText, BeautyVictoriaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BeautyVictoriaAfterBattleText
	waitbutton
	closetext
	end

TrainerYoungsterAlbert:
	trainer YOUNGSTER, ALBERT, EVENT_BEAT_YOUNGSTER_ALBERT, YoungsterAlbertSeenText, YoungsterAlbertBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterAlbertAfterBattleText
	waitbutton
	closetext
	end
	
TrainerFledglingClayton:
	trainer FLEDGLING, CLAYTON, EVENT_BEAT_FLEDGLING_CLAYTON, FledglingClaytonSeenText, FledglingClaytonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FledglingClaytonAfterBattleText
	waitbutton
	closetext
	end

TrainerBugCatcherDon:
	trainer BUG_CATCHER, DON, EVENT_BEAT_BUG_CATCHER_DON, BugCatcherDonSeenText, BugCatcherDonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugCatcherDonAfterBattleText
	waitbutton
	closetext
	end

SunnyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_MAGNET_FROM_SUNNY
	iftrue SunnySundayScript
	checkcode VAR_WEEKDAY
	ifnotequal SUNDAY, SunnyNotSundayScript
	checkevent EVENT_MET_SUNNY_OF_SUNDAY
	iftrue .MetSunny
	writetext MeetSunnyText
	buttonsound
	setevent EVENT_MET_SUNNY_OF_SUNDAY
.MetSunny:
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Kris
	writetext SunnyGivesGiftText1
	buttonsound
	jump .next
.Kris:
	writetext SunnyGivesGiftText2
	buttonsound
.next
	verbosegiveitem MAGNET
	iffalse SunnyDoneScript
	setevent EVENT_GOT_MAGNET_FROM_SUNNY
	writetext SunnyGaveGiftText
	waitbutton
	closetext
	end

SunnySundayScript:
	writetext SunnySundayText
	waitbutton
SunnyDoneScript:
	closetext
	end

SunnyNotSundayScript:
	writetext SunnyNotSundayText
	waitbutton
	closetext
	end

SilentHillsSign:
	jumptext SilentHillsSignText

SilentHillsSign2:
	jumptext SilentHillsSign2Text

SilentHillsFruitTree1:
	fruittree FRUITTREE_SILENT_HILLS_1

SilentHillsFruitTree2:
	fruittree FRUITTREE_SILENT_HILLS_2

SilentHillsFruitTree3:
	fruittree FRUITTREE_SILENT_HILLS_3

SilentHillsHiddenEther:
	hiddenitem ETHER, EVENT_ROUTE_37_HIDDEN_ETHER
	
DarkCaveVioletEntrancePotion:
	itemball POTION
	
SilentHillsRockerScript:
	jumptextfaceplayer SilentHillsRockerText
	
SilentHillsRockerText:
    text "Ich bin kein"
    line "Trainer, aber hier"
    cont "gibt es einige!"

    para "Wenn sie dich"
    line "sehen, musst du"
    cont "gegen sie kämpfen."

    para "Sei darauf"
    line "vorbereitet!"
	done

BugCatcherDonSeenText:
    text "Diese Hügel sind"
    line "ein guter Ort, um"
    para "noch mehr Käfer"
    line "zu finden!"
	done

BugCatcherDonBeatenText:
	text "Ich habe verloren."
	line "So ein Mist…"
	done

BugCatcherDonAfterBattleText:
    text "Mir sind die #-"
    line "BÄLLE ausgegangen,"
    para "als ich #MON"
    line "fangen wollte."

    para "Ich hätte mehr"
    line "kaufen sollen…"
	done
	
YoungsterAlbertSeenText:
    text "Dich habe ich hier"
    line "noch nie gesehen."

    para "Hälst dich wohl"
    line "für stark, was?"
	done

YoungsterAlbertBeatenText:
	text "Du bist stark!"
	done

YoungsterAlbertAfterBattleText:
    text "Ich versuche, der"
    line "Beste mit meinen"
    para "Lieblings-#MON"
    line "zu werden."

    para "Ich benutze nicht"
    line "die gleichen"
    para "starken #MON,"
    line "wie alle anderen."
	done
	
FledglingClaytonSeenText:
    text "Das ist für mich"
    line "noch alles neu…"

    para "Oh, für dich auch?"
	done

FledglingClaytonBeatenText:
	text "Du bist hart!"
	done

FledglingClaytonAfterBattleText:
    text "Ich glaube daran,"
    line "dass Niederlagen"
    para "mir helfen, ein"
    line "besserer Trainer"
    cont "zu werden."
	done
	
BeautyVictoriaSeenText:
    text "Oh, du bist ja ein"
    line "süßer Trainer!"

    para "Ich mag dich, aber"
    line "ich halte mich"
    para "nicht zurück!"
	done

BeautyVictoriaBeatenText:
    text "Dann mal los… Ups,"
    line "schon vorbei?"
	done

BeautyVictoriaAfterBattleText:
    text "Wow, du musst echt"
    line "gut sein, um mich"
    cont "zu besiegen!"

    para "Mach weiter so!"
	done

MeetSunnyText:
	text "SONNFRIED: Hi!"

	para "Ich bin SONNFRIED"
	line "von Sonntag. Soll"
	cont "heißen, heute ist"
	cont "Sonntag!"
	done

SunnyGivesGiftText1:
	text "Man hat mir auf-"
	line "getragen, dir das"
	cont "zu geben, wenn ich"
	cont "dich treffe!"
	done

SunnyGivesGiftText2:
	text "Mir wurde aufge-"
	line "tragen, dir das"

	para "zu überreichen,"
	line "wenn ich dich"
	cont "treffe!"
	done

SunnyGaveGiftText:
	text "SONNFRIED: Dieses"
	line "Ding…"

	para "Äh…"

	para "…Was war das"
	line "nochmal…"

	para "…"

	para "Ah! Jetzt erinnere"
	line "ich mich!"

	para "Ein #MON, das"
	line "Elektro-Attacken"

	para "verwendet, sollte"
	line "dies erhalten."

	para "Meine Schwester"
	line "MONJA behauptet,"
	cont "es verstärkt"
	cont "Elektro-Attacken!"
	done

SunnySundayText:
	text "SONNFRIED: Meine"
	line "Geschwister heißen"
	cont "MONJA, DIETLINDE,"
	cont "MITKO, DONATUS,"
	cont "FRIEDA und SAMSON."

	para "Sie sind alle"
	line "älter als ich!"
	done

SunnyNotSundayText:
	text "SONNFRIED: Ist"
	line "heute nicht Sonn-"
	cont "tag? Äh… Das habe"
	cont "ich vergessen!"
	done

SilentHillsSignText:
	text "SILENITIA HÜGEL"

	para "Ein Sammelpunkt"
	line "für aufstrebende"
	cont "Trainer"
	done

SilentHillsSign2Text:
	text "SILENITIA HÜGEL"

	para "Nach Norden zum"
	line "Ausgang."

	para "Weiter nach Norden"
	line "nach PAGETIA CITY."
	done

SilentHills_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  6,  0, ROUTE_101, 1
	warp_event  7,  0, ROUTE_101, 2
	warp_event 49, 30, ROUTE_101, 3
	warp_event 49, 31, ROUTE_101, 4
	
	db 0 ; coord events

	db 3 ; bg events
	bg_event 45, 28, BGEVENT_READ, SilentHillsSign
	bg_event  7,  4, BGEVENT_READ, SilentHillsSign2
	bg_event 21, 14, BGEVENT_ITEM, SilentHillsHiddenEther

	db 10 ; object events
	object_event 34, 18, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerBeautyVictoria, -1
	object_event  7, 19, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerYoungsterAlbert, -1
	object_event 41, 19, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBugCatcherDon, -1
	object_event 15, 20, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFledglingClayton, -1
	object_event 24,  9, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilentHillsFruitTree1, -1
	object_event 26, 14, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SunnyScript, EVENT_ROUTE_37_SUNNY_OF_SUNDAY
	object_event 24, 26, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilentHillsFruitTree2, -1
	object_event 27, 29, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilentHillsFruitTree3, -1
	object_event 41, 28, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilentHillsRockerScript, -1
	object_event 19,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DarkCaveVioletEntrancePotion, EVENT_DARK_CAVE_VIOLET_ENTRANCE_POTION
