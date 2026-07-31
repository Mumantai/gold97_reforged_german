	const_def 2 ; object constants
	const KOBANISLAND_GRANNY
	const KOBANISLAND_TWIN
	const KOBANISLAND_GRAMPS
	const KOBANISLAND_CLAIR

KobanIsland_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_KOBAN
	return

KobanIslandTeacherScript:
	jumptextfaceplayer KobanIslandTeacherText

KobanIslandGrampsScript:
	jumptextfaceplayer KobanIslandGrampsText

KobanIslandFisherScript:
	jumptextfaceplayer KobanIslandFisherText

KobanPokecenterSign:
	jumpstd pokecentersign

KobanMartSign:
	jumpstd martsign

KobanIslandSign:
	jumptext KobanIslandSignText

DragonsMawSign:
	jumptext DragonsMawSignText
	
KobanIslandClairScript:
	faceplayer
	opentext
	writetext ClairGreetingsText
	waitbutton
	closetext
	wait 2
	checkcode VAR_FACING
	ifequal RIGHT, .ClairWalksAroundPlayer
	applymovement KOBANISLAND_CLAIR, ClairLeavesMovement
	disappear KOBANISLAND_CLAIR
	setevent EVENT_KOBAN_ISLAND_CLAIR_BLOCKING_DRAGONS_MAW
	clearevent EVENT_CLAIRS_HOUSE_HIDE_CLAIR
	end

.ClairWalksAroundPlayer
	applymovement KOBANISLAND_CLAIR, ClairLeavesMovement2
	disappear KOBANISLAND_CLAIR
	setevent EVENT_KOBAN_ISLAND_CLAIR_BLOCKING_DRAGONS_MAW
	clearevent EVENT_CLAIRS_HOUSE_HIDE_CLAIR
	end

KobanIslandTeacherText:
	text "Meeresströmungen"
	line "machen diese Insel"
	para "etwas wärmer als"
	line "KITAOMORIA CITY,"
	para "das gleich östlich"
	line "von hier liegt."
	done

KobanIslandGrampsText:
    text "Die Trainer in"
    line "dieser Stadt haben"
    para "eine langreichende"
    line "Tradition, Drachen"
    cont "großzuziehen."
	done

KobanIslandFisherText:
	text "Eines Tages will"
	line "ich ein DRAGORAN"
	cont "großziehen!"
	done

KobanIslandSignText:
	text "SATORIA INSEL"

	para "Eine kleine Insel"
	line "mit großer"
	cont "Geschichte"
	done

DragonsMawSignText:
	text "DRACHENSCHLUND"
	done
	
ClairGreetingsText:
    text "Sei gegrüßt."

    para "Wer bist du denn?"

    para "…"

    para "Nun, <PLAYER>,"
    line "mein Name ist"
    cont "SANDRA."

    para "Ich bin NIHONs"
    line "bekannteste"
    cont "Drachenmeisterin."

    para "…Naja, die"
    line "zweitbekannteste."

    para "Aber worum es hier"
    line "eigentlich geht,"
    para "ist, dass hinter"
    line "mir der DRACHEN-"
    cont "SCHLUND liegt."

    para "Er ist ein"
    line "mystischer Ort, an"
    para "dem die ersten"
    line "Drachen-#MON"
    para "gelebt haben"
    line "sollen."

    para "Hast du schon"
    line "Drachen-#MON?"

	para "Wenn du unter"
	line "Drachentrainern"
	cont "respektiert werden"
	para "willst, solltest"
	line "du in der Höhle"
	cont "trainieren."

	para "Dort drin sind"
    line "mehrere Drachen-"
    cont "trainer."

    para "Einer von ihnen"
    line "trägt den DRACHEN"
    cont "ORB bei sich."

	para "Finde heraus, wer"
	line "den ORB hat und"
	cont "bring ihn mir."

	para "Das ist dein"
	line "erster Schritt, um"
	para "ein respektierter"
	line "Drachentrainer zu"
	cont "werden."

	para "Ich werde in"
	line "meinem Haus auf"
	cont "dich warten."
	done

ClairLeavesMovement:
	step LEFT
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end
	
ClairLeavesMovement2:
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

KobanIsland_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  5,  5, KOBAN_CLAIRS_HOUSE, 1
	warp_event  5, 10, KOBAN_MART, 1
	warp_event  9, 10, KOBAN_POKECENTER_1F, 1
	warp_event 15,  9, KOBAN_FISHER_HOUSE, 1
	warp_event 13,  5, DRAGONS_MAW, 1

	db 0 ; coord events

	db 4 ; bg events
	bg_event 10, 10, BGEVENT_READ, KobanPokecenterSign
	bg_event  6, 10, BGEVENT_READ, KobanMartSign
	bg_event 10, 14, BGEVENT_READ, KobanIslandSign
	bg_event 14,  6, BGEVENT_READ, DragonsMawSign

	db 4 ; object events
	object_event  9,  6, SPRITE_GRANNY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KobanIslandTeacherScript, -1
	object_event  8, 12, SPRITE_TWIN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 2, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, KobanIslandFisherScript, -1
	object_event 13, 11, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KobanIslandGrampsScript, -1
	object_event 13,  6, SPRITE_CLAIR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0 , -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, KobanIslandClairScript, EVENT_KOBAN_ISLAND_CLAIR_BLOCKING_DRAGONS_MAW
