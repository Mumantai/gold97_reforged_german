	const_def 2 ; object constants
	const CELADONMANSION2F_DEVELOPER

KantoCeladonMansion2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KantoCeladonMansion2FComputer:
	jumptext KantoCeladonMansion2FComputerText

KantoCeladonMansion2FMeetingRoomSign:
	jumptext KantoCeladonMansion2FMeetingRoomSignText

KantoCeladonMansion2FBookshelf:
	jumpstd difficultbookshelf
	
KantoCeladonMansionClerk:
	jumptextfaceplayer KantoCeladonMansionClerkText
	
KantoCeladonMansionClerkText:
	text "Hey! Ich bin der"
	line "Entwickler!"

	para "Also der andere."

	para "Der, von dem die"
	line "da oben nichts"
	cont "wissen wollen."

	para "Vielen Dank fürs"
	line "Spielen!"

	para "Ich habe sehr hart"
	line "hieran gearbeitet."

	para "Ich wollte, dass"
	line "es sich so auten-"
	para "tisch wie möglich"
	line "anfühlt."

	para "Abgesehen von"
	line "diesem Bruch der"
	cont "4. Wand."
	done

KantoCeladonMansion2FComputerText:
	text "Ein Computer mit"
	line "vielen offenen"
	cont "Fenstern:"

	para "Paint, Explorer,"
	line "Notepad++, Polished"
	cont "Map und BGB."
	done

KantoCeladonMansion2FMeetingRoomSignText:
	text "ROM-HACK"
	line "ENTWICKLUNGSRAUM"
	done

KantoCeladonMansion2F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  2,  0, KANTO_CELADON_MANSION_1F, 4
	warp_event  4,  0, KANTO_CELADON_MANSION_3F, 2
	warp_event  6,  0, KANTO_CELADON_MANSION_3F, 3
	warp_event  7,  0, KANTO_CELADON_MANSION_1F, 5

	db 0 ; coord events

	db 4 ; bg events
	bg_event  0,  6, BGEVENT_READ, KantoCeladonMansion2FComputer
	bg_event  4,  9, BGEVENT_UP, KantoCeladonMansion2FMeetingRoomSign
	bg_event  0,  1, BGEVENT_READ, KantoCeladonMansion2FBookshelf
	bg_event  1,  6, BGEVENT_READ, KantoCeladonMansion2FComputer


	db 1 ; object events
	object_event  2,  4, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoCeladonMansionClerk, -1
