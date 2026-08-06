	const_def 2 ; object constants
	const OAKS_KANTO_LAB_AIDE1
	const OAKS_KANTO_LAB_AIDE2

OaksLabKanto_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

OaksLabKantoBookshelf:
	jumpstd difficultbookshelf

OaksLabKantoPoster1:
	jumptext OaksLabKantoPoster1Text

OaksLabKantoPoster2:
	jumptext OaksLabKantoPoster2Text
	
OaksLabKantoPC:
	jumptext OaksLabKantoPCText

OaksLabKantoPoster1Text:
	text "Drücke START, um"
	line "das MENÜ zu"
	cont "öffnen."
	done

OaksLabKantoPoster2Text:
	text "Möchtest du deinen"
	line "Spielstand von"

	para "Zeit zu Zeit"
	line "speichern, dann"
	cont "wähle im MENÜ die"
	cont "Option SICHERN."
	done

OaksLabKantoPCText:
	text "Er ist nicht"
	line "an…"
	done

KantoAide1:
	jumptextfaceplayer KantoAide1Text
	
KantoAide1Text:
    text "Als PROF. EICH"
    line "auf nach SILENITIA"
    cont "ist, mussten wir"
    cont "zurückbleiben, um"
    cont "alles im Labor"
    cont "zusammenzupacken."

    para "Ich schätze, es"
    line "ist einfacher,"
    cont "#MON auf dem"
    cont "Land zu studieren,"
    cont "als im urbanen"
    cont "KANTO."
	done

KantoAide2:
	checkevent EVENT_GIVEN_BALL_FROM_AIDE
	iftrue AideGivenLevelBall
	faceplayer
	opentext
	writetext AideGivingLevelBallText
	buttonsound
	verbosegiveitem LEVEL_BALL
	iffalse .noroom
	setevent EVENT_GIVEN_BALL_FROM_AIDE
	writetext AideGivenLevelBallText
.noroom
	waitbutton
	closetext
	end
	
AideGivenLevelBall:
	jumptextfaceplayer AideGivenLevelBallText

AideGivingLevelBallText:
    text "PROF. EICH hat"
    line "eine Menge von"
    cont "#BÄLLEN für"
    cont "seine Forschung"
    cont "bestellt."

    para "Ich finde sie"
    line "überall beim"
    cont "Aufräumen."

    para "Hier, du kannst"
    line "wahrscheinlich"
    cont "eher etwas damit"
    cont "anfangen."
	done

AideGivenLevelBallText:
    text "Er erzählte, dass"
    line "viele dieser #-"
    cont "BÄLLE von niemand"
    cont "geringerem als dem"
    cont "berühmten KURT aus"
    cont "PAGETIA CITY ange-"
    cont "fertigt wurden!"

    para "Setze ihn mit"
    line "Bedacht ein!"
	done


OaksLabKanto_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  7, KANTO_REGION, 18
	warp_event  4,  7, KANTO_REGION, 19

	db 0 ; coord events

	db 7 ; bg events
	bg_event  0,  5, BGEVENT_READ, OaksLabKantoBookshelf
	bg_event  1,  5, BGEVENT_READ, OaksLabKantoBookshelf
	bg_event  7,  5, BGEVENT_READ, OaksLabKantoBookshelf
	bg_event  6,  5, BGEVENT_READ, OaksLabKantoBookshelf
	bg_event  2,  0, BGEVENT_READ, OaksLabKantoPoster1
	bg_event  4,  0, BGEVENT_READ, OaksLabKantoPoster2
	bg_event  0,  1, BGEVENT_READ, OaksLabKantoPC

	db 2 ; object events
	object_event  2,  3, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, KantoAide1, -1
	object_event  5,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, KantoAide2, -1
