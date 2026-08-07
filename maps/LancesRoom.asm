	const_def 2 ; object constants
	const LANCESROOM_LANCE
	const LANCESROOM_OAK

LancesRoom_MapScripts:
	db 2 ; scene scripts
	scene_script .LockDoor ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_LANCESROOM_APPROACH_LANCE

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .LancesRoomDoors

.LockDoor:
	priorityjump .LancesDoorLocksBehindYou
	end

.DummyScene:
	end

.LancesRoomDoors:
	checkevent EVENT_LANCES_ROOM_ENTRANCE_CLOSED
	iffalse .KeepEntranceOpen
	changeblock 4, 22, $34 ; wall
.KeepEntranceOpen:
	checkevent EVENT_LANCES_ROOM_EXIT_OPEN
	iffalse .KeepExitClosed
	changeblock 4, 0, $0b ; open door
.KeepExitClosed:
	return

.LancesDoorLocksBehindYou:
	applymovement PLAYER, LancesRoom_EnterMovement
	refreshscreen $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 4, 22, $34 ; wall
	reloadmappart
	closetext
	setscene SCENE_LANCESROOM_APPROACH_LANCE
	setevent EVENT_LANCES_ROOM_ENTRANCE_CLOSED
	end

Script_ApproachLanceFromLeft:
	special FadeOutMusic
	applymovement PLAYER, MovementData_ApproachLanceFromLeft
	jump LancesRoomLanceScript

Script_ApproachLanceFromRight:
	special FadeOutMusic
	applymovement PLAYER, MovementData_ApproachLanceFromRight
LancesRoomLanceScript:
	turnobject LANCESROOM_LANCE, LEFT
	opentext
	writetext LanceBattleIntroText
	waitbutton
	closetext
	winlosstext LanceBattleWinText, 0
	setlasttalked LANCESROOM_LANCE
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue LanceRematchTeam
	loadtrainer CHAMPION, LANCE
returntomainLance:
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	setevent EVENT_BEAT_CHAMPION_LANCE
	opentext
	writetext LanceBattleAfterText
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	changeblock 4, 0, $0b ; open door
	reloadmappart
	closetext
	setevent EVENT_LANCES_ROOM_ENTRANCE_CLOSED
	musicfadeout MUSIC_POKEMON_TALK, 16
	pause 30
	showemote EMOTE_SHOCK, LANCESROOM_LANCE, 15
	turnobject LANCESROOM_LANCE, DOWN
	pause 10
	turnobject PLAYER, DOWN
	appear LANCESROOM_OAK
	applymovement LANCESROOM_OAK, LancesRoomMovementData_OakWalksIn
	turnobject LANCESROOM_OAK, UP
	opentext
	writetext UnknownText_0x18121b
	waitbutton
	closetext
	turnobject PLAYER, RIGHT
	turnobject LANCESROOM_LANCE, LEFT
	opentext
	writetext UnknownText_0x18134b
	waitbutton
	closetext
	applymovement LANCESROOM_LANCE, LancesRoomMovementData_LancePositionsSelfToGuidePlayerAway
	turnobject PLAYER, UP
	opentext
	writetext UnknownText_0x18137b
	waitbutton
	closetext
	follow LANCESROOM_LANCE, PLAYER
	turnobject LANCESROOM_OAK, UP
	applymovement LANCESROOM_LANCE, LancesRoomMovementData_LanceLeadsPlayerToHallOfFame
	stopfollow
	playsound SFX_EXIT_BUILDING
	disappear LANCESROOM_LANCE
	applymovement PLAYER, LancesRoomMovementData_PlayerExits
	playsound SFX_EXIT_BUILDING
	disappear PLAYER
	applymovement LANCESROOM_OAK, LancesRoomMovementData_OakTriesToFollow
	opentext
	writetext UnknownText_0x1813c5
	pause 30
	closetext
	special FadeOutPalettes
	pause 15
	warpfacing UP, HALL_OF_FAME, 4, 13
	end

LanceRematchTeam:
	loadtrainer CHAMPION, LANCE2
	jump returntomainLance

LancesRoom_EnterMovement:
	step UP
	step UP
	step UP
	step UP
	step_end

MovementData_ApproachLanceFromLeft:
	step UP
	step UP
	turn_head RIGHT
	step_end

MovementData_ApproachLanceFromRight:
	step UP
	step LEFT
	step UP
	turn_head RIGHT
	step_end

LancesRoomMovementData_OakTriesToFollow:
	step UP
	step UP
	step_end

LancesRoomMovementData_OakWalksIn:
	step UP
	step UP
	step UP
	step_end

LancesRoomMovementData_LancePositionsSelfToGuidePlayerAway:
	step UP
	step LEFT
	turn_head DOWN
	step_end

LancesRoomMovementData_LanceLeadsPlayerToHallOfFame:
	step UP
	step_end

LancesRoomMovementData_PlayerExits:
	step UP
	step_end

LanceBattleIntroText:
	text "SIEGFRIED:"
	line "Ich habe dich"
	cont "erwartet."

	para "<PLAY_G>!"

    para "Ich habe gehört,"
    line "was du bereits"
    cont "erreicht hast."

    para "Es war nur eine"
    line "Frage der Zeit,"
    cont "bis jemand mit"
    cont "deinen Fähigkeiten"
    cont "sich mir stellen"
    cont "würde."

	para "Worte sind hier"
	line "fehl am Platze."

	para "Ein Kampf wird"
	line "zeigen, wer"
	para "der Stärkere von"
	line "uns beiden ist."

	para "Ich, der beste"
	line "aller Trainer und"
	para "CHAMP der"
	line "#MON LIGA…"

	para "Ich, SIEGFRIED"
	line "der Drachenmeis-"
	cont "ter, nehme deine"
	cont "Herausforderung"
	cont "an!"
	done

LanceBattleWinText:
	text "…Es ist vorbei."

	para "Aber es fühlt sich"
	line "seltsam an."

	para "Ich bin nicht"
	line "wütend, dass ich"
	cont "verloren habe. Ich"
	cont "bin glücklich."

	para "Glücklich, dass"
	line "ich den Aufstieg"
	para "eines neuen"
	line "CHAMPs miterleben"
	cont "durfte."
	done

LanceBattleAfterText:
	text "…Woa."

	para "Du bist sehr"
	line "stark geworden,"
	cont "<PLAY_G>."

	para "Deine #MON"
	line "haben deine starke"
	para "und aufrechte"
	line "Persönlichkeit"
	cont "akzeptiert."

	para "Auch du wirst"
	line "zusammen mit"
	para "deinen #MON"
	line "stärker werden."
	done

UnknownText_0x18121b:
	text "EICH: Ah,"
	line "<PLAY_G>!"

	para "Dein Sieg in der"
	line "LIGA ist einfach"
	cont "fantastisch!"

	para "Deine Hingabe, das"
	line "Vertrauen und die"
	para "Liebe zu deinen"
	line "#MON haben"
	cont "dir dies er-"
	cont "möglicht."

	para "Auch deine #-"
	line "MON waren super."

	para "Ihr Glaube an dich"
	line "hat sie all das"
	para "durchstehen"
	line "lassen."

	para "Als ich dich um"
	line "Hilfe bei meinen"
	para "Forschungen bat,"
    line "war mir noch nicht"
    para "klar, was für eine"
    line "große Hilfe du"
    cont "sein würdest!"

    para "Dass du sogar die"
    line "LIGA meistern"
    cont "würdest!"

    para "Du hast so viel"
    line "erreicht!"

	para "Glückwunsch,"
	line "<PLAY_G>!"
	done

UnknownText_0x18134b:
    text "SIEGFRIED: Ja, du"
    line "kannst wirklich"
    cont "stolz sein."

    para "Stolz auf dich und"
    line "auf deine #MON."
	done

UnknownText_0x18137b:
    text "SIEGFRIED:"
    line "<PLAY_G>, würdest"
    cont "du bitte mit mir"
    cont "mitkommen?"

    para "Es ist Zeit, dass"
    line "die Leistung von"
    para "dir und deinen"
    line "#MON anerkannt"
    cont "wird."
	done

UnknownText_0x1813c5:
	text "EICH: Herzlichen"
	line "Glückwunsch noch"
	cont "einmal, <PLAY_G>!"
	done

LancesRoom_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4, 23, GIOVANNIS_ROOM, 3
	warp_event  5, 23, GIOVANNIS_ROOM, 4
	warp_event  4,  1, HALL_OF_FAME, 1
	warp_event  5,  1, HALL_OF_FAME, 2

	db 2 ; coord events
	coord_event  4,  5, SCENE_LANCESROOM_APPROACH_LANCE, Script_ApproachLanceFromLeft
	coord_event  5,  5, SCENE_LANCESROOM_APPROACH_LANCE, Script_ApproachLanceFromRight

	db 0 ; bg events

	db 2 ; object events
	object_event  5,  3, SPRITE_LANCE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LancesRoomLanceScript, -1
	object_event  4,  7, SPRITE_OAK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_LANCES_ROOM_OAK_AND_MARY
