	const_def 2
	const DAITOHOUSE_GEOFFREY
	const DAITOHOUSE_GNOTE

DaitoGardenerGeoffHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


GeoffInsideScript:
	faceplayer
	checkevent EVENT_GOT_BERRY_JUICE_FROM_GEOFF
	iftrue gotjuiceoutside
	opentext
	writetext GeoffInsideMeetText
	buttonsound
	verbosegiveitem BERRY_JUICE
	iffalse NoRoomGeoff
	setevent EVENT_GOT_BERRY_JUICE_FROM_GEOFF
gotjuiceoutside:
	opentext
	writetext WantFactText
	yesorno
	iffalse EndConvo
	random 5
	jump GeoffJumptable
EndConvo:
	writetext AhOkText
	waitbutton
NoRoomGeoff:
	closetext
	end
	
GeoffJumptable:
	ifequal 0, papayas
	ifequal 1, coconuts
	ifequal 2, mangoes
	ifequal 3, bananas
	ifequal 4, pineapples
	
papayas:
	writetext PapayaText
	waitbutton
	jump NoRoomGeoff
	
	
WantFactText:
	text "Willst du über"
	line "die tropischen"
	cont "Früchte lernen,"
	cont "die ich anbaue?"
	done
	
AhOkText:
    text "Ach so, gut."
    line "Vielleicht ein"
    cont "andermal."
	done
	
PapayaText:
    text "Papayas gehören zu"
    line "den Früchten, die"
    cont "man am leichtesten"
    cont "anbauen kann."

    para "Man muss bloß die"
    line "Samen in den Boden"
    cont "werfen und kann"
    cont "ihnen beim Wachsen"
    cont "zusehen!"

    para "Die wachsen so"
    line "gut, dass sie fast"
    cont "wie Unkraut sind!"

    para "Die männlichen"
    line "Pflanzen tragen"
    cont "keine Früchte, die"
    cont "kann man also"
    cont "einfach fällen."
	done
	
coconuts:
	writetext CoconutText
	waitbutton
	jump NoRoomGeoff
	
CoconutText:
    text "Kokosnüsse stellen"
    line "sich die Meisten"
    cont "als braune Kugeln"
    cont "mit Haaren vor."

    para "Tatsächlich sehen"
    line "sie erst so aus,"
    cont "wenn ihre dicke,"
    cont "faserige Schale"
    cont "entfernt wurde."

    para "Am besten entfernt"
    line "man die Schale mit"
    cont "dem spitzen Ende"
    cont "eines Hammers."

    para "Zuerst schlägt man"
    line "Schlitze hinein"
    cont "und hebt sie dann"
    cont "stückweise ab!"

    para "Falls du also mal"
    line "mit einem Zimmer-"
    cont "mann auf einer"
    cont "Insel strandest,"
    cont "kannst du diesen"
    cont "Trick testen."
	done
	
mangoes:
	writetext MangoText
	waitbutton
	jump NoRoomGeoff
	
MangoText:
    text "Mangos brauchen"
    line "ein paar Monate,"
    cont "um am Baum voll"
    cont "zu reifen."

    para "Und die Bäume"
    line "selbst brauchen"
    cont "Jahre, um groß"
    cont "genug zu werden,"
    cont "um eine einzige"
    cont "Mango zu tragen."

    para "Manchen Kulturen"
    line "essen die Mangos"
    cont "auch unreif."

	para "Sie sind dann so"
	line "hart, dass man"
	cont "kaum hineinbeißen"
	cont "kann und sie sind"
	cont "dann sehr sauer."

	para "Ich esse sie aber"
	line "trotzdem so, ich"
	cont "bin nämlich sehr"
	cont "ungeduldig!"
	done
	
	
bananas:
	writetext BananaText
	waitbutton
	jump NoRoomGeoff
	
BananaText:
    text "Bananen gehören zu"
    line "den bekanntesten"
    cont "Früchten."

    para "Aber wusstest du,"
    line "dass alle Bananen"
    cont "im Supermarkt"
    cont "genetisch gleich"
    cont "sind?"

    para "Wegen der kommer-"
    line "ziellen Zucht haben"
    cont "die Bananen keine"
    cont "Samen, also müssen"
    cont "sie durch Steck-"
    cont "linge vermehrt"
    cont "werden."

    para "Das bedeutet, dass"
    line "alle Pflanzen"
    cont "einer Plantage im"
    cont "Prinzip identisch"
    cont "sind!"

    para "Das ging einmal"
    line "nach hinten los,"
    cont "als eine Krankheit"
    cont "eine ganze Sorte"
    cont "Bananen ausgerott-"
    cont "et hat, und die"
    cont "Züchter auf eine"
    cont "andere Sorte"
    cont "umsteigen mussten,"
    cont "die immun dagegen"
    cont "war!"
	done
	
	
	
pineapples:
	writetext PineappleText
	waitbutton
	jump NoRoomGeoff

PineappleText:
    text "Ähnlich wie bei"
    line "Bananen, sind auch"
    cont "Ananas genetisch"
    cont "identisch, durch"
    cont "die Art, wie sie"
    cont "vermehrt werden!"

    para "Versuch das mal,"
    line "wenn du irgendwo"
    cont "wohnst, wo es warm"
    cont "genug ist:"

    para "Schneide die Krone"
    line "deiner Ananas ab"
    cont "und pflanze sie"
    cont "direkt in den"
    cont "Boden."

    para "Gieß sie und pass"
    line "gut auf sie auf,"
    cont "dann wirst du bald"
    cont "sehen, wie eine"
    cont "neue Ananas an"
    cont "ihr wächst!"

    para "Das kannst du"
    line "immer wieder tun"
    cont "und so einen"
    cont "endlosen Vorrat an"
    cont "Ananas bekommen."
	done

GeoffInsideMeetText:
    text "Hey, haben wir uns"
    line "nicht schon mal"
    cont "auf ROUTE 104"
    cont "getroffen?"

    para "Ich war es satt,"
    line "zu versuchen, im"
    cont "Wüstenboden etwas"
    cont "anzubauen, also"
    cont "bin ich hierher"
    cont "gezogen, um auf"
    cont "dieser RANCH zu"
    cont "arbeiten!"

    para "Da du dir extra"
    line "die Mühe gemacht"
    cont "hast, hierher zu"
    cont "kommen, gebe ich"
    cont "dir ein Getränk"
    cont "aus!"
	done


GeoffOutNote:
	jumptext GeoffOutNoteText
	
GeoffOutNoteText:
    text "Bin Besorgungen"
    line "machen. Bin am"
    para "Nachmittag wieder"
    line "zurück."

    para "- GEOFFREY"
	done

DaitoGardenerGeoffHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, DAITO_RANCH, 3
	warp_event  5,  7, DAITO_RANCH, 3

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event 7,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN,0, 0, -1, NITE, PAL_NPC_BROWN , OBJECTTYPE_SCRIPT, 0, GeoffInsideScript, -1
	object_event  5,  4, SPRITE_PAPER, 0, 0, 0, -1, MORN, PAL_OW_SILVER, OBJECTTYPE_SCRIPT, 0, GeoffOutNote, -1
