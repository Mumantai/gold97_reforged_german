	const_def 2 ; object constants
	const NANJO_FOREST_YOUNGSTER
	const NANJO_FOREST_BUG_CATCHER
	const NANJO_FOREST_SILVER
	const NANJO_FOREST_ITEMBALL_1
	const NANJO_FOREST_ITEMBALL_2
	const NANJO_FOREST_ITEMBALL_3
	const NANJO_FOREST_ITEMBALL_4

NanjoForest_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TriWingYoungsterScript:
	faceplayer
	checkevent EVENT_RECEIVED_TRI_WING_FROM_YOUNGSTER
	iftrue .AlreadyGaveTriWing
	checkevent EVENT_REPAIRED_SHIP_FUEL_LINE
	iftrue .TryGivingTriWing
.NoTriWingYet
	opentext
	writetext NoTriWingYetText
	waitbutton
	closetext
	turnobject NANJO_FOREST_YOUNGSTER, RIGHT
	end
	
.TryGivingTriWing
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .NoTriWingYet
	checkevent EVENT_TRI_WING_YOUNGSTER_SETUP
	iffalse .SetUpTriWing
	opentext
	writetext HeresTriWingText
	waitbutton
	verbosegiveitem TRI_WING
	writetext WhatDoesTriWingDoText
	waitbutton
	closetext
	setevent EVENT_RECEIVED_TRI_WING_FROM_YOUNGSTER
	turnobject NANJO_FOREST_YOUNGSTER, RIGHT
	end
	
.SetUpTriWing
	opentext
	writetext NoTriWingYetText
	waitbutton
	closetext
	setevent EVENT_TRI_WING_YOUNGSTER_SETUP
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	turnobject NANJO_FOREST_YOUNGSTER, RIGHT
	end
	
.AlreadyGaveTriWing
	opentext
	writetext AlreadyGaveTriWingText
	waitbutton
	closetext
	turnobject NANJO_FOREST_YOUNGSTER, RIGHT
	end
	
TriWingBugCatcherScript:
	faceplayer
	opentext
	writetext TriWingBugCatcherText
	waitbutton
	closetext
	turnobject NANJO_FOREST_BUG_CATCHER, RIGHT
	end
	
NanjoForestSilverScript:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue .TalkToSilverAfterBattle
	playmusic MUSIC_RIVAL_ENCOUNTER
	faceplayer
	opentext
	writetext NanjoForestSilverBefore
	waitbutton
	closetext
	checkevent EVENT_GOT_CRUIZE_FROM_OAK
	iftrue .Cruise
	checkevent EVENT_GOT_CHIKORITA_FROM_OAK
	iftrue .CHIKORITA
	winlosstext NanjoForestSilverTextWin, NanjoForestSilverTextLoss
	loadtrainer RIVAL2, RIVAL2_1_CRUIZE
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .FinishBattle

.Cruise:
	winlosstext NanjoForestSilverTextWin, NanjoForestSilverTextLoss
	loadtrainer RIVAL2, RIVAL2_1_CHIKORITA
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .FinishBattle

.CHIKORITA:
	winlosstext NanjoForestSilverTextWin, NanjoForestSilverTextLoss
	loadtrainer RIVAL2, RIVAL2_1_FLAMBEAR
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .FinishBattle

.FinishBattle:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext NanjoForestSilverAfter
	waitbutton
	closetext
	setevent EVENT_NANJO_FOREST_RIVAL_DEFEATED
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	playmapmusic
	end
	
.TalkToSilverAfterBattle
	faceplayer
	opentext
	writetext NanjoForestSilverAfter
	waitbutton
	closetext
	end
	

NanjoForestMaxRevive:
	itemball MAX_REVIVE

NanjoForestUltraBall:
	itemball ULTRA_BALL

NanjoForestFullHeal:
	itemball FULL_HEAL

NanjoForestFullRestore:
	itemball FULL_RESTORE
	
NanjoForestSign:
	jumptext NanjoForestSignText
	
NanjoForestSignText:
    text "KEINEN MÜLL"
    line "ABLADEN"

    para "Bitte räumt hinter"
    line "euch auf."
	done
	
NanjoForestSilverBefore:
	text "<RIVAL>: Hey,"
	line "<PLAY_G>!"

	para "Lange nicht"
	line "gesehen!"

	para "Ich bin hier auf"
	line "den INSELN, um"
	para "weiter zu trainie-"
	line "ren und das Band"
	para "mit meinen #MON"
	line "zu stärken."

	para "Ich habe mehr da-"
	line "rüber gelernt, wie"
	para "ich mit ihnen als"
    line "Team arbeite."

    para "Wir sind uns in"
    line "letzter Zeit viel"
    cont "näher gekommen."

    para "Wir sind auch viel"
    line "stärker geworden!"

    para "Du weißt, was das"
    line "bedeutet!"
	done
	
NanjoForestSilverTextWin:
	text "Du hast mich!"
	done

NanjoForestSilverTextLoss:
	text "Alles klar!"
	done
	
NanjoForestSilverAfter:
	text "Puh, das war ein"
	line "guter Kampf."

	para "Ich glaube, ich"
	line "bin mit dem Trai-"
	cont "ning hier fertig."

	para "Ich habe gehört,"
	line "BLAU soll auch auf"
	cont "den INSELN sein"
	cont "um Nachforschungen"
	cont "zu betreiben."

	para "Vielleicht triffst"
	line "du ihn irgendwann!"
	done
	
WhatDoesTriWingDoText:
	text "Ich frage mich,"
	line "woher es kommt."

	para "Könnte es ein"
	line "#MON gewesen"
	cont "sein?"
	done
	
HeresTriWingText:
    text "Hey, schau dir"
    line "das mal an!"

    para "Es ist eine"
    line "seltsame, drei-"
    cont "farbige Feder!"

    para "Schon irgendwie"
    line "cool, aber sie ist"
    cont "ganz nass und"
    cont "eklig."

    para "Du kannst sie"
    line "gerne haben!"
	done
	
AlreadyGaveTriWingText:
	text "Man weiß nie, was"
	line "man hier findet."
	done
	
NoTriWingYetText:
    text "Ich suche nach"
    line "interessanten"
    para "Sachen, die an den"
    line "Strand gespült"
    cont "werden."

    para "Ich finde viele"
    line "Items, wie TRÄNKE"
    cont "und HYPERHEILER."

    para "Einmal habe ich"
    line "sogar ein NUGGET"
    cont "gefunden!"

    para "Hier kann man"
    line "echt coole Sachen"
    cont "finden."

    para "Komm doch irgend-"
    line "wann mal wieder"
    para "und schau bei mir"
    line "vorbei."

    para "Ich teile dann ein"
    line "Bisschen von dem,"
    para "was ich gefunden"
    line "habe, mit dir!"
	done
	
TriWingBugCatcherText:
    text "Mein Bruder und"
    line "ich finden viele"
    para "coole Sachen, die"
    line "an den Strand ge-"
    cont "spült werden!"

    para "Wir sehen das"
    line "nicht als Müll,"
    para "denn manchmal sind"
    line "es echte Schätze!"
	done	

NanjoForest_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0, 22, URASOE_TRAIL, 3
	warp_event  0, 23, URASOE_TRAIL, 4
	warp_event 43,  5, GREAT_EAST_STRAIT, 1
	warp_event 43,  4, GREAT_EAST_STRAIT, 2

	db 0 ; coord events

	db 1 ; bg events
	bg_event 29, 25, BGEVENT_READ, NanjoForestSign

	db 7 ; object events
	object_event 27, 11, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TriWingYoungsterScript, -1
	object_event 27, 10, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TriWingBugCatcherScript, -1
	object_event  6, 12, SPRITE_SILVER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, NanjoForestSilverScript, EVENT_NANJO_FOREST_RIVAL_DEFEATED
	object_event 26, 34, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, NanjoForestMaxRevive, EVENT_NANJO_FOREST_MAX_REVIVE
	object_event 15,  8, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, NanjoForestUltraBall, EVENT_NANJO_FOREST_ULTRA_BALL
	object_event  8, 19, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, NanjoForestFullHeal, EVENT_NANJO_FOREST_FULL_HEAL
	object_event 31, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, NanjoForestFullRestore, EVENT_NANJO_FOREST_FULL_RESTORE
