	const_def 2
	const DAITO_MILTANK1
	const DAITO_MILTANK2
	const DAITO_MILTANK3
	const DAITO_MILTANK4
	const DAITO_FARMER1
	const DAITO_FARMER2
	const DAITO_GEOFFREY

DaitoRanch_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setevent EVENT_GEOFFREY_GONE_TO_DAITO
	setflag ENGINE_FLYPOINT_DAITO
	return

DaitoRanchSign:
	jumptext DaitoRanchSignText
	
DaitoRanchSignText:
	text "DAITO RANCH"

	para "Milcherzeuger der"
	line "NANTO-INSELN"
	done

SummerHomeSign:
	jumptext SummerHomeSignText
	
SummerHomeSignText:
    text "Sommerhaus von"
    line "GEOFFREY dem"
    cont "Gärtner."
	done

Route39Miltank:
	opentext
	writetext Route39MiltankText
	cry MILTANK
	waitbutton
	closetext
	end

Route39MiltankText:
	text "MILTANK: Muuh!"
	done
	
DaitoFarmer1Script:
	jumptextfaceplayer DaitoFarmer1Text
	
DaitoFarmer1Text:
	text "Siehst du die"
	line "Bäume dort?"

	para "Das nennt man"
	line "einen Windschutz."

	para "Er schützt die"
	line "Felder vor den"
	cont "starken Winden,"
	cont "die hier durch-"
	cont "wehen."
	done

DaitoFarmer2Script:
	jumptextfaceplayer DaitoFarmer2Text
	
DaitoFarmer2Text:
	text "Das Feld ist zur"
	line "Zeit voll von"
	cont "Blumen, weil wir"
	cont "den Boden für die"
	cont "nächste Pflanzzeit"
	cont "vorbereiten!"

	para "Eventuell liegen"
	line "hier noch ein paar"
	cont "Beeren herum."
	done

HiddenBerry1:
	hiddenitem MIRACLEBERRY, EVENT_DAITO_HIDDENBERRY1
	
HiddenBerry2:
	hiddenitem GOLD_BERRY, EVENT_DAITO_HIDDENBERRY2
	
HiddenBerry3:
	hiddenitem MYSTERYBERRY, EVENT_DAITO_HIDDENBERRY3
	
HiddenBerry4:
	hiddenitem BITTER_BERRY, EVENT_DAITO_HIDDENBERRY4


DaitoGeoffPatioScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_BERRY_JUICE_FROM_GEOFF
	iftrue .geoffpart2
	writetext GeoffThanksVisitText
	buttonsound
	verbosegiveitem BERRY_JUICE
	iffalse .NoRoom
	setevent EVENT_GOT_BERRY_JUICE_FROM_GEOFF
.geoffpart2:
	writetext GeoffIslandLifeText
	waitbutton
.NoRoom:
	closetext
	end

GeoffThanksVisitText:
    text "Hey hey! Ein"
    line "Besucher auf"
    cont "meiner Veranda!"

    para "Da du dir extra"
    line "die Mühe gemacht"
    cont "hast, hierher zu"
    cont "kommen, gebe ich"
    cont "dir ein Getränk"
    cont "aus!"
	done

GeoffIslandLifeText:
    text "Was hälst du von"
    line "diesem Ort?"

    para "Tolle Aussicht,"
    line "oder?"

    para "Viel besser als"
    line "das Leben auf der"
    cont "verstauben, ollen"
    cont "ROUTE 104."

    para "Hier kann ich"
    line "sogar allerlei"
    cont "tropische Pflanzen"
    cont "anbauen!"

    para "Komm doch später"
    line "mal rein, dann"
    cont "erzähle ich dir"
    cont "alles darüber."
	done


DaitoRanch_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 11,  8, DAITO_RANCH_HOUSE, 1
	warp_event  8,  9, DAITO_RANCH_BARN, 1
	warp_event 19, 14, DAITO_GG_HOUSE, 1

	db 0 ; coord events

	db 6 ; bg events
	bg_event 12, 11, BGEVENT_READ, DaitoRanchSign
	bg_event 20, 16, BGEVENT_READ, SummerHomeSign
	
	bg_event 10, 27, BGEVENT_ITEM, HiddenBerry1
	bg_event 13, 26, BGEVENT_ITEM, HiddenBerry2
	bg_event 11, 25, BGEVENT_ITEM, HiddenBerry3
	bg_event 15, 25, BGEVENT_ITEM, HiddenBerry4

	db 7 ; object events
	object_event  8, 17, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route39Miltank, -1
	object_event 11, 16, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route39Miltank, -1
	object_event 10, 19, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route39Miltank, -1
	object_event 13, 18, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route39Miltank, -1
	object_event 16, 23, SPRITE_FISHING_GURU, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, DaitoFarmer1Script, -1
	object_event 11, 26, SPRITE_FISHING_GURU, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, DaitoFarmer2Script, -1
	object_event 20, 10, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT,0, 0, -1, DAY, PAL_NPC_BROWN , OBJECTTYPE_SCRIPT, 0, DaitoGeoffPatioScript, -1
