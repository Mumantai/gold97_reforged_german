	const_def 2 ; object constants
	const LORELEISROOM_LORELEI

LoreleisRoom_MapScripts:
	db 2 ; scene scripts
	scene_script .LockDoor ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .LoreleisRoomDoors

.LockDoor:
	priorityjump .LoreleisDoorLocksBehindYou
	end

.DummyScene:
	end

.LoreleisRoomDoors:
	checkevent EVENT_LORELEIS_ROOM_ENTRANCE_CLOSED
	iffalse .KeepEntranceOpen
	changeblock 4, 14, $2a ; wall
.KeepEntranceOpen:
	checkevent EVENT_LORELEIS_ROOM_EXIT_OPEN
	iffalse .KeepExitClosed
	changeblock 4, 2, $16 ; open door
.KeepExitClosed:
	return

.LoreleisDoorLocksBehindYou:
	applymovement PLAYER, LoreleisRoom_EnterMovement
	refreshscreen $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 4, 14, $2a ; wall
	reloadmappart
	closetext
	setscene SCENE_FINISHED
	setevent EVENT_LORELEIS_ROOM_ENTRANCE_CLOSED
	waitsfx
	end

LoreleiScript_Battle:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ELITE_4_LORELEI
	iftrue LoreleiScript_AfterBattle
	writetext LoreleiScript_LoreleiBeforeText
	waitbutton
	closetext
	winlosstext LoreleiScript_LoreleiBeatenText, 0
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue LoreleiRematchTeam
	loadtrainer LORELEI, LORELEI1
returntomainLorelei:
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ELITE_4_LORELEI
	opentext
	writetext LoreleiScript_LoreleiDefeatText
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	changeblock 4, 2, $16 ; open door
	reloadmappart
	closetext
	setevent EVENT_LORELEIS_ROOM_EXIT_OPEN
	waitsfx
	end

LoreleiRematchTeam:
	loadtrainer LORELEI, LORELEI2
	jump returntomainLorelei


LoreleiScript_AfterBattle:
	writetext LoreleiScript_LoreleiDefeatText
	waitbutton
	closetext
	end

LoreleisRoom_EnterMovement:
	step UP
	step UP
	step UP
	step UP
	step_end

LoreleiScript_LoreleiBeforeText:
    text "Willkommen in der"
    line "#MON LIGA,
    cont "<PLAYER>."

    para "Erlaube mir, mich"
    line "vorzustellen."
    cont "Ich bin LORELEI."

    para "Meine eiskalten"
    line "#MON haben"
    cont "schon so manchen"
    cont "Trainer vor Angst"
    cont "erstarren lassen."

    para "Eis-#MON sind"
    line "kalt und gnaden-"
    cont "los, aber auch"
    cont "wunderschön."

	para "Du wirst um Gnade"
	line "winseln, wenn ich"
	cont "deine  #MON"
	cont "eingefroren habe!"

	para "Hehe…"
	
	para "Lass und anfangen!"
	done

LoreleiScript_LoreleiBeatenText:
	text "Ich… Ich kann…"
	line "es nicht glauben…"
	done

LoreleiScript_LoreleiDefeatText:
    text "Gut gemacht,"
    line "Trainer."

    para "Aber von hier an"
    line "wird es nur noch"
    cont "schwerer."

    para "Geh."

    para "Das hier war nur"
    line "ein Vorgeschmack"
    cont "auf die TOP VIER."
	done

LoreleisRoom_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5, 17, NIHON_LEAGUE, 4
	warp_event  4,  2, KOGAS_ROOM, 1
	warp_event  5,  2, KOGAS_ROOM, 2

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  7, SPRITE_LORELEI, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LoreleiScript_Battle, -1
