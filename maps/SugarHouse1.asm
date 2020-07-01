	const_def 2 ; object constants
	const SUGARHOUSE_1_CLAIR

SugarHouse1_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SugarHouse1ClairScript:
	faceplayer
	opentext
	checkevent EVENT_SWITCH_14
	iftrue .AfterDratiniGift
	checkitem MACHINE_PART
	iffalse .NoOrbYet
	checkevent EVENT_GOT_DRATINI
	iffalse .GiveDratiniClair
.AfterDratiniGift
	writetext DragonsAreGreatText
	waitbutton
	closetext
	end
	
.NoOrbYet
	writetext GoGetTheOrbText
	waitbutton
	closetext
	end
	
.GiveDratiniClair
	writetext ClairTakeThisDratiniText
	waitbutton
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFullClair
	writetext ClairPlayerReceivedDratiniText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke DRATINI, 15
;	checkevent EVENT_ANSWERED_DRAGON_MASTER_QUIZ_WRONG
	special GiveDratini
	setevent EVENT_GOT_DRATINI
	setevent EVENT_SWITCH_14
	takeitem MACHINE_PART
;	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_7
	writetext ClairSymbolicDragonText
	waitbutton
	closetext
	end	
	
.PartyFullClair:
	writetext DragonShrinePartyFullTextClair
	waitbutton
	closetext
	end
	
ClairPlayerReceivedDratiniText:
	text "<PLAYER> received"
	line "DRATINI!"
	done
	
ClairSymbolicDragonText:
	text "DRAGON #MON are"
	line "difficult to"
	para "raise, but their"
	line "majesty and"
	para "strength make it"
	line "worth it."
	para "I trust you can"
	line "raise that DRATINI"
	cont "properly."
	done
	
DragonShrinePartyFullTextClair:
	text "You have no room"
	line "in your party for"
	cont "this!"
	done
	
ClairTakeThisDratiniText:
	text "Ah, the DRAGON"
	line "ORB!"
	para "I see you have"
	line "learned of the"
	para "power of DRAGON"
	line "#MON!"
	para "I would like to"
	line "reward you with"
	para "a special #MON"
	line "that deserves to"
	para "be raised by a"
	line "worthy TRAINER!"
	done
	
GoGetTheOrbText:
	text "Retreive the"
	line "DRAGON ORB from"
	para "a TRAINER in the"
	line "cave, and bring it"
	cont "to me."
	done
	
DragonsAreGreatText:
	text "Being a DRAGON"
	line "TRAINER requires"
	para "more dedication"
	line "than most types."
	para "It is very much a"
	line "way of life."
	done

SugarHouse1ClairText:
	text "yo sup"
	done

SugarHouse1_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, PALLET_TOWN, 1
	warp_event  5,  7, PALLET_TOWN, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  7, 4, SPRITE_CLAIR, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SugarHouse1ClairScript, EVENT_BLACKTHORN_CITY_GRAMPS_NOT_BLOCKING_DRAGONS_DEN
