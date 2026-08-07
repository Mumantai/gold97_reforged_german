	const_def 2 ; object constants
	const GIOVANNISROOM_GIOVANNI

GiovannisRoom_MapScripts:
	db 2 ; scene scripts
	scene_script .LockDoor ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .GiovannisRoomDoors

.LockDoor:
	priorityjump .GiovannisDoorLocksBehindYou
	end

.DummyScene:
	end

.GiovannisRoomDoors:
	checkevent EVENT_GIOVANNIS_ROOM_ENTRANCE_CLOSED
	iffalse .KeepEntranceOpen
	changeblock 4, 14, $2a ; wall
.KeepEntranceOpen:
	checkevent EVENT_GIOVANNIS_ROOM_EXIT_OPEN
	iffalse .KeepExitClosed
	changeblock 4, 2, $16 ; open door
.KeepExitClosed:
	return

.GiovannisDoorLocksBehindYou:
	applymovement PLAYER, GiovannisRoom_EnterMovement
	refreshscreen $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 4, 14, $2a ; wall
	reloadmappart
	closetext
	setscene SCENE_FINISHED
	setevent EVENT_GIOVANNIS_ROOM_ENTRANCE_CLOSED
	waitsfx
	end

GiovanniScript_Battle:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ELITE_4_GIOVANNI
	iftrue GiovanniScript_AfterBattle
	writetext GiovanniScript_GiovanniBeforeText
	waitbutton
	closetext
	winlosstext GiovanniScript_GiovanniBeatenText, 0
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue GiovanniRematchTeam
	loadtrainer GIOVANNI_E4, GIOVANNI_E41
returntomainGiovanni:
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ELITE_4_GIOVANNI
	opentext
	writetext GiovanniScript_GiovanniDefeatText
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	changeblock 4, 2, $16 ; open door
	reloadmappart
	closetext
	setevent EVENT_GIOVANNIS_ROOM_EXIT_OPEN
	waitsfx
	end

GiovanniScript_AfterBattle:
	writetext GiovanniScript_GiovanniDefeatText
	waitbutton
	closetext
	end

GiovanniRematchTeam:
	loadtrainer GIOVANNI_E4, GIOVANNI_E42
	jump returntomainGiovanni

GiovannisRoom_EnterMovement:
	step UP
	step UP
	step UP
	step UP
	step_end

GiovanniScript_GiovanniBeforeText:
	text "Uwahaha!"

	para "Deine Augen trügen"
	line "dich nicht!"

	para "Ich bin es,"
	line "GIOVANNI!"

	para "Du magst mein"
    line "wahres Ich kennen,"
    cont "doch ich bin auch"
    cont "ein vollwertiges"
    cont "Mitglied der"
    cont "TOP VIER!"

    para "Ich habe immer"
    line "noch vor TEAM"
    cont "ROCKET wieder"
    cont "aufzubauen."

    para "Bis dahin werde"
    line "ich alles Nötige"
    cont "tun um dieses Ziel"
    cont "zu erreichen!"

    para "Also dann,"
    line "<PLAY_G>,"
    para "ich hoffe du bist"
    line "gut vorbereitet,"
    cont "denn deine Reise"
    cont "endet hier!"
	done

GiovanniScript_GiovanniBeatenText:
	text "Argh!"

	para "Du bist ja sogar"
	line "noch stärker als"
	cont "beim letzten Mal!"
	done

GiovanniScript_GiovanniDefeatText:
    text "Ich verachte dich."

    para "Aber du hast"
    line "meinen Respekt."

    para "Unter anderen"
    line "Umständen hätten"
    cont "wir vielleicht"
    cont "Verbündete sein"
    cont "können…"

    para "Dennoch…"

    para "Du hast mich"
    line "besiegt."

    para "Geh weiter."

    para "Der CHAMP wartet…"
	done

GiovannisRoom_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4, 17, AGATHAS_ROOM, 3
	warp_event  5, 17, AGATHAS_ROOM, 4
	warp_event  4,  2, LANCES_ROOM, 1
	warp_event  5,  2, LANCES_ROOM, 2

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  7, SPRITE_GIOVANNI, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GiovanniScript_Battle, -1
