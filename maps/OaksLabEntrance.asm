	const_def 2 ; object constants
	const OAKS_LAB_ENTRANCE_AIDE
	const OAKS_LAB_ENTRANCE_SILVER
	const OAKS_LAB_ENTRANCE_BLUE
	const OAKS_LAB_ENTRANCE_DAISY

OaksLabEntrance_MapScripts:
	db 6 ; scene scripts
	scene_script .SceneElmDoorLocked ; SCENE_DEFAULT
	scene_script .SceneHeadToTheBack ;
	scene_script .SceneOaksLabEntranceNothing ;does this work?
	scene_script .SceneOaksLabEntranceBattle ;seems to!
	scene_script .SceneOaksLabEntranceDaisy
	scene_script .SceneOakLabFrontRoomAfterTalkingToClerk

	db 0 ; callbacks
	
.SceneElmDoorLocked:
	end
	
.SceneHeadToTheBack:
	follow OAKS_LAB_ENTRANCE_BLUE, PLAYER
	applymovement OAKS_LAB_ENTRANCE_BLUE, Movement_BlueToBack
	stopfollow
	playsound SFX_ENTER_DOOR
	disappear OAKS_LAB_ENTRANCE_BLUE
	applymovement PLAYER, Movement_PlayerThroughDoor
	playsound SFX_ENTER_DOOR
	special FadeOutPalettes
	warpfacing UP, OAKS_LAB, 3, 7
	end

.SceneOaksLabEntranceNothing:
	end

.SceneOaksLabEntranceBattle:
	end
	
.SceneOaksLabEntranceDaisy:
	end
	
.SceneOakLabFrontRoomAfterTalkingToClerk
	end

BattleScript:
	applymovement PLAYER, Movement_DownOne
	playsound SFX_EXIT_BUILDING
	moveobject OAKS_LAB_ENTRANCE_SILVER, 4, 0
	appear OAKS_LAB_ENTRANCE_SILVER
	applymovement OAKS_LAB_ENTRANCE_SILVER, Movement_SilverDownOne
	special FadeOutMusic
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext TimeToBattle
	waitbutton
	closetext
	checkevent EVENT_GOT_CRUIZE_FROM_OAK
	iftrue .Cruise
	checkevent EVENT_GOT_CHIKORITA_FROM_OAK
	iftrue .CHIKORITA
	winlosstext SilverEntranceWinText, SilverEntranceLossText
	loadtrainer RIVAL1, RIVAL1_1_CRUIZE
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterVictorious
	jump .AfterYourDefeat

.Cruise:
	winlosstext SilverEntranceWinText, SilverEntranceLossText
	loadtrainer RIVAL1, RIVAL1_1_CHIKORITA
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterVictorious
	jump .AfterYourDefeat

.CHIKORITA:
	winlosstext SilverEntranceWinText, SilverEntranceLossText
	loadtrainer RIVAL1, RIVAL1_1_FLAMBEAR
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterVictorious
	jump .AfterYourDefeat

.AfterVictorious:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext EntranceRivalText_YouWon
	waitbutton
	closetext
	jump .FinishRival

.AfterYourDefeat:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext EntranceRivalText_YouLost
	waitbutton
	closetext
.FinishRival:
	applymovement OAKS_LAB_ENTRANCE_SILVER, SilverLeavesLab
	disappear OAKS_LAB_ENTRANCE_SILVER
	setscene SCENE_OAK_ENTRANCE_DAISY
	special HealParty
	playmapmusic
	end


DoorLockedScript:
	opentext
	writetext DoorLockedText
	waitbutton
	closetext
	applymovement PLAYER, DoorLocked_Movement
	end
	
DaisyStopsScript1:
	applymovement OAKS_LAB_ENTRANCE_DAISY, DaisyWalksUp1
	opentext
	writetext DaisySpeechText
	buttonsound
	stringtotext .mapcardname, MEM_BUFFER_1
	scall .JumpstdReceiveItem
	setflag ENGINE_MAP_CARD
	writetext DaisySpeechText2
	buttonsound
	verbosegiveitem POTION
	verbosegiveitem POKE_BALL, 5
	writetext DaisySpeechText3
	waitbutton
	closetext
	applymovement OAKS_LAB_ENTRANCE_DAISY, DaisyLeftMovement
	setscene SCENE_OAK_ENTRANCE_NOTHING
	setmapscene ROUTE_101, SCENE_ROUTE29_CATCH_TUTORIAL
	end
	
.JumpstdReceiveItem:
	jumpstd receiveitem
	end

.mapcardname
	db "KARTEN-MODUL@"
	
DaisyStopsScript2:
	applymovement OAKS_LAB_ENTRANCE_DAISY, DaisyWalksUp2
	opentext
	writetext DaisySpeechText
	buttonsound
	stringtotext .mapcardname, MEM_BUFFER_1
	scall .JumpstdReceiveItem
	setflag ENGINE_MAP_CARD
	writetext DaisySpeechText2
	buttonsound
	verbosegiveitem POTION
	verbosegiveitem POKE_BALL, 5
	writetext DaisySpeechText3
	waitbutton
	closetext
	applymovement OAKS_LAB_ENTRANCE_DAISY, DaisyLeftMovement
	setscene SCENE_OAK_ENTRANCE_NOTHING
	setmapscene ROUTE_101, SCENE_ROUTE29_CATCH_TUTORIAL
	end
	
.JumpstdReceiveItem:
	jumpstd receiveitem
	end

.mapcardname
	db "KARTEN-MODUL@"
	
OaksLabEntranceDaisyScript:
	jumptextfaceplayer Text_RootingText

OaksLabEntranceSilverScript:
	jumptextfaceplayer OaksLabEntranceSilverText

OaksLabEntranceAideScript:
	jumptextfaceplayer OaksLabEntranceAideText
	
OaksLabEntranceComputerScript:
	jumptext OaksLabEntranceComputerText
	
OaksLabEntranceBookshelf:
	jumpstd difficultbookshelf
	
OaksLabEntranceSign:
	jumptext OaksLabEntranceSignText
	
OaksLabEntranceSignText:
	text "SICHERE regelmäßig"
	line "deinen Spielstand!"
	done	
	
OaksLabEntranceComputerText:
    text "Ein Bericht über"
    line "#MON Habitate."
	done
	
Text_RootingText:
	text "Ich drück dir die"
	line "Daumen!"
	done
	
DaisySpeechText:
    text "Oh, du gehst auf"
    line "eine Reise?"

    para "BLAU ist mein"
    line "kleiner Bruder."

    para "Wenn Opa dir eine"
    line "Aufgabe gegeben"
    para "hat, würde ich dir"
    line "gerne helfen."

    para "Er sollte dir"
    line "eigentlich noch"
    cont "das hier geben!"
	done

DaisySpeechText2:
    text "Mit dem KARTEN-"
    line "MODUL kannst du"
    para "die Karte direkt"
    line "auf deinem #COM"
    cont "ansehen!"

    para "So…"
    line "Wie kann ich dir"
    cont "sonst noch helfen?"

    para "…"

    para "Oh, ich weiß!"
	done

DaisySpeechText3:
    text "Ein TRANK kann"
    line "deine #MON"
    para "heilen, wenn sie"
    line "verletzt sind und"
    para "mit #BÄLLEN"
    line "kannst du wilde"
    cont "#MON fangen."

    para "Wenn du mehr"
    line "#BLLE brauchst,"
    para "kannst du dir im"
    line "<PKMN>-SUPERMARKT"
    cont "neue kaufen."
	
	para "Viel Glück,"
	line "<PLAY_G>!"
	
    para "Ich drück dir die"
    line "Daumen!"
	done

SilverEntranceWinText:
    text "Wow! Ich dachte,"
    line "mein #MON wäre"
    cont "das Beste!"
	done

EntranceRivalText_YouLost:
    text "<PLAY_G>! Ich bin"
    line "bereit der Welt zu"
    para "zeigen, wie stark"
    line "mein #MON ist!"

    para "Wir sehen uns!"
	done

SilverEntranceLossText:
    text "Alles klar!"
    line "Mein #MON ist"
    cont "der Hammer!"
	done

EntranceRivalText_YouWon:
	text "<PLAY_G>! Ich bin"
    line "bereit der Welt zu"
    para "zeigen, wie stark"
    line "mein #MON ist!"

    para "Wir sehen uns!"
	done
	
TimeToBattle:
	text "<PLAY_G>!"

	para "So einfach kommst"
	line "du nicht davon!"

	para "PROF. EICH hat uns"
	line "diese #MON ge-"
	para "geben, also müssen"
	line "wir jetzt mit"
	cont "ihnen kämpfen!"

	para "Ich werde mich"
	line "nicht zurück-"
	cont "halten!"
	done

OaksLabEntranceAideText:
    text "Falls du nach"
    line "PROF. EICH suchst,"
    para "er ist für gewöhn-"
    line "lich hinten in"
    cont "seinem Büro."
	done
	
OaksLabEntranceSilverText:
	text "Yo, <PLAY_G>!"
	
    para "Anscheinend ist"
    line "PROF. EICH gerade"
    cont "nicht da!"

    para "Was hat er denn"
    line "gedacht, wann wir"
    cont "hier sein würden?"
	done
	
DaisyLeftMovement:
	step LEFT
	step LEFT
	turn_head DOWN
	step_end
	
DaisyWalksUp1:
	step RIGHT
	step RIGHT
	step UP
	step_end
	
DaisyWalksUp2:
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step_end
	
SilverLeavesLab:
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end
	
Movement_SilverDownOne:
	step DOWN
	step_end
	
Movement_DownOne:
	step DOWN
	turn_head UP
	step_end

DoorLocked_Movement:
	turn_head DOWN
	step DOWN
	step_end

Movement_BlueToBack:
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end

Movement_PlayerThroughDoor:
	step UP
	step_end

DoorLockedScriptWeekends:
	checkcode VAR_WEEKDAY
	ifequal SATURDAY, .DoorIsLockedWeekend
	checkcode VAR_WEEKDAY
	ifequal SUNDAY, .DoorIsLockedWeekend
	end

.DoorIsLockedWeekend
	opentext
	writetext DoorLockedText
	waitbutton
	closetext
	applymovement PLAYER, DoorLocked_Movement
	end

DoorLockedText:
	text "The door seems to"
	line "be locked…"
	done

OaksLabEntrance_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3, 15, SILENT_TOWN, 1
	warp_event  4, 15, SILENT_TOWN, 5
	warp_event  4,  0, OAKS_LAB, 1


	db 5 ; coord events
	coord_event  4,  1, SCENE_DEFAULT, DoorLockedScript
	coord_event  4,  1, SCENE_OAK_ENTRANCE_BATTLE, BattleScript
	coord_event  3, 11, SCENE_OAK_ENTRANCE_DAISY, DaisyStopsScript1
	coord_event  4, 11, SCENE_OAK_ENTRANCE_DAISY, DaisyStopsScript2
	coord_event  4,  1, SCENE_OAK_LAB_FRONT_ROOM_AFTER_TALKING_TO_CLERK, DoorLockedScriptWeekends

	db 14 ; bg events
	bg_event  6,  1, BGEVENT_READ, OaksLabEntranceComputerScript
	bg_event  0,  7, BGEVENT_READ, OaksLabEntranceBookshelf
	bg_event  1,  7, BGEVENT_READ, OaksLabEntranceBookshelf
	bg_event  2,  7, BGEVENT_READ, OaksLabEntranceBookshelf
	bg_event  5,  7, BGEVENT_READ, OaksLabEntranceBookshelf
	bg_event  6,  7, BGEVENT_READ, OaksLabEntranceBookshelf
	bg_event  7,  7, BGEVENT_READ, OaksLabEntranceBookshelf
	bg_event  0, 11, BGEVENT_READ, OaksLabEntranceBookshelf
	bg_event  1, 11, BGEVENT_READ, OaksLabEntranceBookshelf
	bg_event  2, 11, BGEVENT_READ, OaksLabEntranceBookshelf
	bg_event  5, 11, BGEVENT_READ, OaksLabEntranceBookshelf
	bg_event  6, 11, BGEVENT_READ, OaksLabEntranceBookshelf
	bg_event  7, 11, BGEVENT_READ, OaksLabEntranceBookshelf
	bg_event  2,  0, BGEVENT_READ, OaksLabEntranceSign


	db 4 ; object events
	object_event  6, 13, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OaksLabEntranceAideScript, -1
	object_event  3,  4, SPRITE_SILVER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OaksLabEntranceSilverScript, EVENT_RIVAL_OAKS_LAB_ENTRANCE
	object_event  4, 14, SPRITE_BLUE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_BLUE_OAKS_LAB_ENTRANCE
	object_event  1, 13, SPRITE_DAISY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OaksLabEntranceDaisyScript, EVENT_DAISY_OAKS_LAB_ENTRANCE

	
