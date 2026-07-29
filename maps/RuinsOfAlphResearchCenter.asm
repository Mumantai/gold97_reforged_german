	const_def 2 ; object constants
	const RUINSOFALPHRESEARCHCENTER_SCIENTIST1
	const RUINSOFALPHRESEARCHCENTER_SCIENTIST2
	const RUINSOFALPHRESEARCHCENTER_SCIENTIST3

RuinsOfAlphResearchCenter_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_RUINSOFALPHRESEARCHCENTER_NOTHING
	scene_script .GetUnownDex ; SCENE_RUINSOFALPHRESEARCHCENTER_GET_UNOWN_DEX

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .ScientistCallback

.DummyScene0:
	end

.GetUnownDex:
	priorityjump .GetUnownDexScript
	end

.ScientistCallback:
	checkscene
	ifequal SCENE_RUINSOFALPHRESEARCHCENTER_GET_UNOWN_DEX, .ShowScientist
	return

.ShowScientist:
	moveobject RUINSOFALPHRESEARCHCENTER_SCIENTIST3, 2, 4
	appear RUINSOFALPHRESEARCHCENTER_SCIENTIST3
	return

.GetUnownDexScript:
	pause 15
	turnobject RUINSOFALPHRESEARCHCENTER_SCIENTIST3, DOWN
	showemote EMOTE_SHOCK, RUINSOFALPHRESEARCHCENTER_SCIENTIST3, 15
	opentext
	writetext RuinsOfAlphResearchCenterModifiedDexBeforeText
	waitbutton
	closetext
	applymovement RUINSOFALPHRESEARCHCENTER_SCIENTIST3, MovementData_0x5926f
	playsound SFX_BOOT_PC
	pause 60
	playsound SFX_SWITCH_POKEMON
	pause 30
	playsound SFX_TALLY
	pause 30
	playsound SFX_TRANSACTION
	pause 30
	turnobject RUINSOFALPHRESEARCHCENTER_SCIENTIST3, DOWN
	opentext
	writetext RuinsOfAlphResearchCenterModifiedDexText
	waitbutton
	closetext
	applymovement RUINSOFALPHRESEARCHCENTER_SCIENTIST3, MovementData_0x59274
	opentext
	writetext RuinsOfAlphResearchCenterDexUpgradedText
	playsound SFX_ITEM
	waitsfx
	setflag ENGINE_UNOWN_DEX
	writetext RuinsOfAlphResearchCenterScientist3Text
	waitbutton
	closetext
	applymovement RUINSOFALPHRESEARCHCENTER_SCIENTIST3, MovementData_0x59276
	setscene SCENE_RUINSOFALPHRESEARCHCENTER_NOTHING
	end

RuinsOfAlphResearchCenterScientist3Script:
	faceplayer
	opentext
	checkcode VAR_UNOWNCOUNT
	ifequal NUM_UNOWN, .PrinterAvailable
	writetext RuinsOfAlphResearchCenterScientist3Text
	waitbutton
	closetext
	end

.PrinterAvailable:
	writetext RuinsOfAlphResearchCenterScientist3_PrinterAvailable
	waitbutton
	closetext
	end

RuinsOfAlphResearchCenterScientist1Script:
	faceplayer
	opentext
	checkcode VAR_UNOWNCOUNT
	ifequal NUM_UNOWN, .GotAllUnown
	checkflag ENGINE_UNOWN_DEX
	iftrue .GotUnownDex
	checkevent EVENT_MADE_UNOWN_APPEAR_IN_RUINS
	iftrue .UnownAppeared
	writetext RuinsOfAlphResearchCenterScientist1Text
	waitbutton
	closetext
	end

.UnownAppeared:
	writetext RuinsOfAlphResearchCenterScientist1Text_UnownAppeared
	waitbutton
	closetext
	end

.GotUnownDex:
	writetext RuinsOfAlphResearchCenterScientist1Text_GotUnownDex
	waitbutton
	closetext
	end

.GotAllUnown:
	checkevent EVENT_GOT_UNOWN_DOLL_FROM_SCIENTIST
	iffalse .GetDoll
	writetext RuinsOfAlphResearchCenterScientist1Text_GotAllUnown
	waitbutton
	closetext
	clearevent EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_YOUNGSTERS
	end


.GetDoll
	writetext RuinsOfAlphResearchCenterScientist2Text_GetDoll
	waitbutton
	waitsfx
	writetext GotUnownDollText
	playsound SFX_ITEM
	waitsfx
;	waitbutton
	setevent EVENT_GOT_UNOWN_DOLL_FROM_SCIENTIST
	setevent EVENT_DECO_UNOWN_DOLL
	writetext RuinsOfAlphResearchCenterScientist2Text_GetDoll2
	waitbutton
	closetext
	end


RuinsOfAlphResearchCenterScientist2Script:
	faceplayer
	opentext
	checkcode VAR_UNOWNCOUNT
	ifequal NUM_UNOWN, .GotAllUnown
	checkevent EVENT_MADE_UNOWN_APPEAR_IN_RUINS
	iftrue .UnownAppeared
	writetext RuinsOfAlphResearchCenterScientist2Text
	waitbutton
	closetext
	end

.UnownAppeared:
	writetext RuinsOfAlphResearchCenterScientist2Text_UnownAppeared
	waitbutton
	closetext
	end

.GotAllUnown:
	writetext RuinsOfAlphResearchCenterScientist2Text_GotAllUnown
	waitbutton
	closetext
	end

RuinsOfAlphResearchCenterComputer:
	opentext
	checkevent EVENT_RUINS_OF_ALPH_RESEARCH_CENTER_SCIENTIST
	iftrue .SkipChecking
	checkcode VAR_UNOWNCOUNT
	ifequal NUM_UNOWN, .GotAllUnown
.SkipChecking:
	writetext RuinsOfAlphResearchCenterComputerText
	waitbutton
	closetext
	end

.GotAllUnown:
	writetext RuinsOfAlphResearchCenterComputerText_GotAllUnown
	waitbutton
	closetext
	end

RuinsOfAlphResearchCenterPrinter:
	opentext
	checkevent EVENT_RUINS_OF_ALPH_RESEARCH_CENTER_SCIENTIST
	iftrue .SkipChecking
	checkcode VAR_UNOWNCOUNT
	ifequal NUM_UNOWN, .PrinterAvailable
.SkipChecking:
	writetext RuinsOfAlphResearchCenterPrinterText_DoesntWork
	waitbutton
	closetext
	end

.PrinterAvailable:
	writetext RuinsOfAlphResearchCenterUnownPrinterText
	waitbutton
	special UnownPrinter
	closetext
	end

RuinsOfAlphResearchCenterPhoto:
; unreferenced
	jumptext RuinsOfAlphResearchCenterProfSilktreePhotoText

RuinsOfAlphResearchCenterBookshelf:
RuinsOfAlphResearchCenterBookshelf2:
RuinsOfAlphResearchCenterBookshelf3:
	jumptext RuinsOfAlphResearchCenterAcademicBooksText
	
RuinsOfAlphResearchCenterComputer2:
	jumptext RuinsOfAlphResearchCenterComputer2Text

MovementData_0x5926f:
	step DOWN
	step DOWN
	step UP
	step UP
	turn_head UP
	step_end

MovementData_0x59274:
	step DOWN
	step DOWN
	step_end

MovementData_0x59276:
	step UP
	step UP
	step_end
	
RuinsOfAlphResearchCenterComputer2Text:
    text "Der Computer zeigt"
    line "Bilder voll mit"
    cont "seltsamen Zeichen."
	done
	
RuinsOfAlphResearchCenterModifiedDexBeforeText:
    text "Ah!"
    line "Da bist du ja!"

    para "Lass mich kurz mal"
    line "deinen #DEX"
    cont "ansehen."
	done

RuinsOfAlphResearchCenterModifiedDexText:
	text "Geschafft!"

	para "Ich habe deinen"
	line "#DEX erweitert."

	para "Ich habe dir einen"
	line "optionalen #DEX"

	para "extra für ICOGNITO"
	line "eingebaut. Er"

	para "speichert sie in"
	line "der Reihenfolge,"
	cont "in der du sie"
	cont "fängst."
	done

RuinsOfAlphResearchCenterDexUpgradedText:
	text "<PLAYER>s #DEX"
	line "wurde erweitert."
	done

RuinsOfAlphResearchCenterScientist3Text:
	text "Jedes ICOGNITO,"
	line "das du fängst,"
	cont "wird darin einge-"
	cont "tragen."

	para "Schlage nach,"
	line "um zu erfahren,"
	cont "wie viele es gibt."
	done

RuinsOfAlphResearchCenterScientist3_PrinterAvailable:
	text "Hast du alle"
	line "verschiedenen"
	cont "ICOGNITO?"

	para "Das ist eine"
	line "Spitzenleistung!"

	para "Ich habe den"
	line "Drucker aufge-"
	cont "stellt, um"
	cont "ICOGNITOs Daten"
	cont "auszudrucken."

	para "Du kannst ihn"
	line "jederzeit gerne"
	cont "benutzen."
	done

RuinsOfAlphResearchCenterScientist1Text:
	text "Die RUINEN sind"
	line "zirka 1500"
	cont "Jahre alt."

	para "Aber niemand weiß,"
	line "warum sie erbaut"
	cont "wurden."
	done

RuinsOfAlphResearchCenterScientist1Text_GotUnownDex:
	text "Ich frage mich,"
	line "wie viele #MON"
	cont "wohl in den RUINEN"
	cont "leben?"
	done

RuinsOfAlphResearchCenterScientist1Text_UnownAppeared:
	text "Es gibt #MON"
	line "in den RUINEN?"

	para "Das sind unfass-"
	line "bare Neuigkeiten!"

	para "Das müssen wir"
	line "erforschen."
	done

RuinsOfAlphResearchCenterScientist1Text_GotAllUnown:
	text "Unsere Forschung"
	line "und deine Hilfe"

	para "geben uns einen"
	line "tiefen Einblick in"
	cont "die RUINEN."

	para "Es scheint, als ob"
	line "die RUINEN als"

	para "Habitat für #-"
	line "MON gebaut wurden."
	done

RuinsOfAlphResearchCenterScientist2Text:
	text "An die Wände der"
	line "RUINEN sind selt-"
	cont "same Zeichen"

	para "gemalt."
	line "Sie sind der"

	para "Schlüssel zur"
	line "Lösung des Rätsels"
	cont "um die RUINEN."
	done

RuinsOfAlphResearchCenterScientist2Text_UnownAppeared:
	text "Die seltsamen"
	line "#MON, die du in"
	cont "den RUINEN gesehen"
	cont "hast?"

	para "Es scheint, sie"
	line "ähneln den"

	para "Zeichnungen an"
	line "den Wänden."

	para "Hmm…"

	para "Das bedeutet, es"
	line "gibt viele"
	cont "von ihnen…"
	done

RuinsOfAlphResearchCenterUnusedText1:
; unused
	text "Wir denken, dass"
	line "irgendetwas für"

	para "die rätselhaften"
	line "Muster in den"

	para "RUINEN verantwort-"
	line "lich war."

	para "Darauf basiert"
	line "unsere Forschung."
	done

RuinsOfAlphResearchCenterUnusedText2:
; unused
	text "Unsere Forschung"
	line "hat ergeben…,"

	para "diese selt-"
	line "samen Muster ent-"
	cont "standen, als das"

	para "#KOM-CENTER"
	line "errichtet wurde."

	para "Das bedeutet, dass"
	line "Radiowellen einen"

	para "gewissen Einfluß"
	line "haben…"
	done

RuinsOfAlphResearchCenterScientist2Text_GotAllUnown:
	text "Warum sind diese"
	line "antiken Muster"

	para "jetzt an den Wän-"
	line "den aufgetaucht?"

	para "Das wird immer"
	line "geheimnisvoller…"
	done

RuinsOfAlphResearchCenterComputerText:
	text "ALPH-RUINEN"
	line "10. Forschungsjahr"
	done

RuinsOfAlphResearchCenterComputerText_GotAllUnown:
	text "Geheimnisvolles"
	line "#MON"
	cont "Name: ICOGNITO"

	para "26 verschiedene"
	line "gefunden."
	done

RuinsOfAlphResearchCenterPrinterText_DoesntWork:
	text "Das scheint noch"
	line "nicht zu"
	cont "funktionieren."
	done

RuinsOfAlphResearchCenterUnownPrinterText:
	text "ICOGNITO kann"
	line "gedruckt werden."
	done

RuinsOfAlphResearchCenterProfSilktreePhotoText:
; unused
	text "Ein Foto von PROF."
	line "SEIDENBAUM, er hat"
	cont "dieses FORSCHUNGS-"
	cont "ZENTRUM gegründet."
	done

RuinsOfAlphResearchCenterAcademicBooksText:
	text "Es gibt viele"
	line "wissenschaftliche"
	cont "Bücher dort."

	para "Antike Ruinen…"
	line "Geheimnisse der"
	cont "Antike…"
	done

GotUnownDollText:
	text "<PLAYER> erhält"
	line "ICOGNITO-PUPPE!"
	done
	
RuinsOfAlphResearchCenterScientist2Text_GetDoll:
    text "Wow! Du hast alle"
    line "verschiedenen"
    cont "ICOGNITO!"

    para "Hier, ein kleines"
    line "Geschenk, um das"
    cont "zu feiern!"
	done
	
RuinsOfAlphResearchCenterScientist2Text_GetDoll2:
    text "Es ist eine"
    line "ICOGNITO-PUPPE."

    para "Stell sie in"
    line "deinem Zimmer aus!"
	done


RuinsOfAlphResearchCenter_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, SANSKRIT_TOWN, 3
	warp_event  3,  7, SANSKRIT_TOWN, 3
	
	db 0 ; coord events

	db 6 ; bg events
	bg_event  1,  1, BGEVENT_READ, RuinsOfAlphResearchCenterBookshelf
	bg_event  0,  1, BGEVENT_READ, RuinsOfAlphResearchCenterBookshelf
	bg_event  3,  1, BGEVENT_READ, RuinsOfAlphResearchCenterBookshelf
	bg_event  0,  0, BGEVENT_READ, RuinsOfAlphResearchCenterComputer
	bg_event  6,  1, BGEVENT_READ, RuinsOfAlphResearchCenterPrinter
	bg_event  2,  3, BGEVENT_READ, RuinsOfAlphResearchCenterComputer2

	db 3 ; object events
	object_event  7,  5, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphResearchCenterScientist1Script, -1
	object_event  4,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_WANDER, 2, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphResearchCenterScientist2Script, -1
	object_event  2,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphResearchCenterScientist3Script, EVENT_RUINS_OF_ALPH_RESEARCH_CENTER_SCIENTIST
