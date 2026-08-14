	const_def 2 ; object constants
	const AMAMIPORT_SAILOR1
	const AMAMIPORT_SAILOR2
	const AMAMIPORT_SUPER_NERD

AmamiPort_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .LeaveFastShip ; SCENE_AMAMIPORT_LEAVE_SHIP

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.DummyScene0:
	end

.LeaveFastShip:
	priorityjump .LeaveFastShipScript
	end

.FlyPoint:
	setflag ENGINE_FLYPOINT_AMAMI
	return

.LeaveFastShipScript:
	disappear AMAMIPORT_SAILOR1
	checkevent EVENT_REPAIRED_SHIP_FUEL_LINE
	iffalse .NeedNewPart
	applymovement PLAYER, AmamiPlayerLeavesShip
	applymovement AMAMIPORT_SAILOR2, AmamiSailorMovesAway
	applymovement PLAYER, AmamiPlayerLeavesShip2
	applymovement AMAMIPORT_SAILOR2, AmamiSailorBlocksEntry
	appear AMAMIPORT_SAILOR1
	setscene SCENE_DEFAULT
	setevent EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	clearevent EVENT_WESTPORT_PORT_PASSAGE_POKEFAN_M
	setevent EVENT_FAST_SHIP_FIRST_TIME
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	blackoutmod AMAMI_TOWN
	end
	
.NeedNewPart
	applymovement PLAYER, AmamiPlayerLeavesShip3
	pause 10
	appear AMAMIPORT_SAILOR1
	turnobject PLAYER, DOWN
	opentext
	writetext NeedANewPartText
	waitbutton
	closetext
	applymovement PLAYER, AmamiPlayerLeavesShip4
	applymovement AMAMIPORT_SAILOR2, AmamiSailorMovesAway
	applymovement PLAYER, AmamiPlayerLeavesShip2
	applymovement AMAMIPORT_SAILOR2, AmamiSailorBlocksEntry
	setscene SCENE_DEFAULT
	setevent EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	clearevent EVENT_WESTPORT_PORT_PASSAGE_POKEFAN_M
	setevent EVENT_FAST_SHIP_FIRST_TIME
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	blackoutmod AMAMI_TOWN
	end
	

AmamiPortSailorGuardScript:
	faceplayer
	opentext
	checkevent EVENT_REPAIRED_SHIP_FUEL_LINE
	iffalse .StillNeedToReturnPart
	writetext AmamiPortSailorGoToWestportText
	yesorno
	iffalse AmamiPortNotRidingScript
	writetext UnknownText_0x74f8b
	buttonsound
	checkitem S_S_TICKET
	iffalse .NoTicket
	writetext AmamiPortSSTicketText
	waitbutton
	closetext
	applymovement PLAYER, AmamiPlayerWalkRight
	applymovement AMAMIPORT_SAILOR2, AmamiSailorMovesAway
	applymovement PLAYER, AmamiPlayerWalksToShip
	opentext
	writetext AmamiPortSailorBoardingSoonText
	closetext
	turnobject WestportPort_SAILOR1, DOWN
	pause 10
	playsound SFX_EXIT_BUILDING
	disappear AMAMIPORT_SAILOR1
	waitsfx
	applymovement PLAYER, AmamiPlayerEntersShip
	playsound SFX_EXIT_BUILDING
	special FadeOutPalettes
	waitsfx
	setevent EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	clearevent EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	clearevent EVENT_BEAT_POKEMANIAC_ETHAN
	clearevent EVENT_BEAT_BURGLAR_COREY
	clearevent EVENT_BEAT_BUG_CATCHER_KEN
	clearevent EVENT_BEAT_GUITARIST_CLYDE
	clearevent EVENT_BEAT_POKEFANM_JEREMY
	clearevent EVENT_BEAT_POKEFANF_GEORGIA
	clearevent EVENT_BEAT_SAILOR_KENNETH
	clearevent EVENT_BEAT_TEACHER_SHIRLEY
	clearevent EVENT_BEAT_SCHOOLBOY_NATE
	clearevent EVENT_BEAT_SCHOOLBOY_RICKY
	setevent EVENT_FAST_SHIP_DESTINATION_WESTPORT
	appear AMAMIPORT_SAILOR1
	setmapscene FAST_SHIP_1F, SCENE_FASTSHIP1F_ENTER_SHIP
	warp FAST_SHIP_1F, 25, 1
	end
	
.StillNeedToReturnPart
	opentext
	writetext GoGetThePart
	waitbutton
	closetext
	checkitem CARD_KEY
	iftrue .GiveFuelLine
	end

.GiveFuelLine
	showemote EMOTE_SHOCK, AMAMIPORT_SAILOR2, 15
	opentext
	writetext YouHaveTheFuelLine
	waitbutton
	closetext
	takeitem CARD_KEY
	applymovement AMAMIPORT_SAILOR2, SailorWalksToShipAndBack
	opentext
	writetext ThanksForTheFuelLine
	waitbutton
	closetext
	setevent EVENT_REPAIRED_SHIP_FUEL_LINE
	clearevent EVENT_TELEPORT_GUY
	end
	
.NoTicket
	writetext AmamiSailorNoTicketText
	waitbutton
	closetext
	end

AmamiPortNotRidingScript:
	writetext UnknownText_0x74fa7
	waitbutton
	closetext
	end


AmamiPortSuperNerdScript:
	faceplayer
	opentext
	writetext UnknownText_0x750a6
	waitbutton
	closetext
	end

AmamiPortHiddenIron:
	hiddenitem IRON, EVENT_AMAMI_PORT_HIDDEN_IRON
	
SailorWalksToShipAndBack:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step RIGHT
	step LEFT
	step RIGHT
	step LEFT
	step RIGHT
	step LEFT
	step RIGHT
	step LEFT
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end
	
AmamiSailorBlocksEntry:
	step RIGHT
	step DOWN
	turn_head UP
	step_end

AmamiSailorMovesAway:
	step UP
	step LEFT
	turn_head RIGHT
	step_end
	
AmamiPlayerWalkRight:
	step RIGHT
	turn_head LEFT
	step_end

AmamiPlayerWalksToShip:
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end
	
AmamiPlayerEntersShip:
	step DOWN
	step_end
	
AmamiPlayerLeavesShip:
	step UP
	step UP
	step UP
	step UP
	step_end
	
AmamiPlayerLeavesShip2:
	step UP
	step UP
	step RIGHT
	step_end
	
AmamiPlayerLeavesShip3:
	step UP
	step_end

AmamiPlayerLeavesShip4:
	step UP
	step UP
	step UP
	step_end

	
ThanksForTheFuelLine:
    text "Danke, Knirps!"

    para "Die M.S. AQUA ist"
    line "wieder voll"
    cont "funktionsfähig!"

    para "Wir können dir"
    line "nicht genug"
    cont "danken!"

    para "Sprich mit dem"
    line "KAPITÄN, wenn du"
    cont "das nächste Mal"
    cont "an Bord bist."

    para "Ich bin sicher,"
    line "er wird sich dir"
    cont "irgendwie erkennt-"
    cont "lich zeigen!"
	done
	
YouHaveTheFuelLine:
    text "Ah, die BENZIN-"
    line "LEITUNG! Wow!"

    para "Lass mich das der"
    line "Crew an Bord"
    cont "bringen!"
	done
	
NeedANewPartText:
    text "Warte, Knirps"

    para "Das Unwetter hat"
    line "die BENZINLEITUNG"
    cont "des Schiffs"
    cont "beschädigt!"

    para "In KUMIA CITY gibt"
    line "es jemanden, der"
    cont "sicherlich eine"
    cont "neue für uns hat."

    para "Bis dahin können"
    line "wir nicht nach"
    cont "PORT ABANISHI"
    cont "zurück."

    para "Kannst du nach"
    line "KUMIA CITY gehen"
    cont "und die BENZIN-"
    cont "LEITUNG holen?"

    para "Ansonsten sind wir"
    line "hier gestrandet!"
	done
		
GoGetThePart:
    text "Okay, Knirps. Wir"
    line "brauchen eine neue"
    cont "BENZINLEITUNG."

    para "Es gibt da einen"
    line "Typen in KUMIA"
    cont "CITY, der eine"
    cont "haben sollte."

    para "Bring sie hierher"
    line "zurück, wenn du"
    cont "sie hast!"
	done

AmamiPortSailorBoardingSoonText:
	text "Wir legen bald ab."
	line "Komm bitte"
	cont "an Bord."
	done

AmamiPortSailorGoToWestportText:
	text "Willkommen am"
	line "AMAMIA PIER."

	para "Trittst du heute"
	line "deine Reise nach"
	cont "PORT ABANISHI an?"
	done

UnknownText_0x74f8b:
	text "Zeige mir bitte"
	line "dein BOOTSTICKET!"
	done

UnknownText_0x74fa7:
	text "Komm jederzeit"
	line "wieder vorbei!"
	done

AmamiPortSSTicketText:
	text "<PLAYER> zeigt"
	line "das BOOTSTICKET."

	para "In Ordnung."
	line "Dankeschön!"
	done
	
AmamiSailorNoTicketText:
	text "…"
	para "Tut mir Leid!"
	line "Du darfst nur"

	para "mit TICKET"
	line "an Bord."
	done

UnknownText_0x750a6:
	text "Du kommst vom"
	line "Festland?"

	para "Dort sollen viele"
	line "seltene #MON"
	cont "leben."
	done

AmamiPort_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 13,  7, AMAMI_PORT_PASSAGE, 5
	warp_event  7, 17, FAST_SHIP_1F, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event  6, 10, BGEVENT_ITEM, AmamiPortHiddenIron

	db 3 ; object events
	object_event  7, 17, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  7, 12, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AmamiPortSailorGuardScript, -1
	object_event 10, 10, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AmamiPortSuperNerdScript, -1
