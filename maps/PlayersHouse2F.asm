	const_def 2 ; object constants
	const PLAYERSHOUSE2F_CONSOLE
	const PLAYERSHOUSE2F_DOLL_1
	const PLAYERSHOUSE2F_DOLL_2
	const PLAYERSHOUSE2F_BIG_DOLL
	const PLAYERSHOUSE_CLEFDOLL
	const PLAYERSHOUSE2F_KEN

PlayersHouse2F_MapScripts:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .InitializeRoom
	callback MAPCALLBACK_TILES, .SetSpawn

; unused
.Null:
	end

.InitializeRoom:
	special ToggleDecorationsVisibility
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_8
	checkevent EVENT_INITIALIZED_EVENTS
	iftrue .SkipInitialization
	jumpstd initializeevents
	return

.SkipInitialization:
	return

.SetSpawn:
	special ToggleMaptileDecorations
	return

	db 0, 0, 0 ; filler

MeetKenScript:
	turnobject PLAYER, LEFT
	turnobject PLAYERSHOUSE2F_KEN, RIGHT
PlayersHouse2F_Ken:
	faceplayer
	opentext
	writetext KenGreeting1
	waitbutton
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue .KenPart2
	setevent EVENT_TALKED_TO_KEN_AT_BEGINNING
	checkevent EVENT_READ_OAKS_EMAIL
	iffalse .KenEmailScript
	waitbutton
	closetext
	setscene SCENE_PLAYERS_HOUSE_2F_NOTHING
	end
	
.KenEmailScript
	
	closetext
	checkcode VAR_FACING
	ifequal UP, .DontNeedToWalk
	applymovement PLAYER, PlayerToReadEmailMovement
	turnobject PLAYERSHOUSE2F_KEN, DOWN
	end

.DontNeedToWalk
	end
	
.KenPart2
	checkevent EVENT_GOT_TM31_MUD_SLAP
	iftrue .KenPart3
	writetext KenGreeting2
	waitbutton
	closetext
	end
	
.KenPart3
	writetext KenGreeting3
	waitbutton
	closetext
	end

KenGreeting1:
	text "KEN: Hey, <PLAYER>!"

    para "Ich glaube, du"
    line "hast vorhin eine"
    para "neue E-Mail auf"
    line "dem PC bekommen."

    para "Lies sie lieber,"
    line "bevor du das Haus"
    cont "verlässt."
	done
	
KenGreeting2:
	text "KEN: Hey, <PLAYER>!"

    para "PROF: EICH hat"
    line "dich gebeten, ihm"
    para "bei einem neuen"
    line "#DEX zu helfen?"

    para "Wow, das ist wild!"
    line "Viel Glück auf"
    cont "deinem Abenteuer!"
	done
	
KenGreeting3:
	text "Ich habe ein Vor-"
    line "stellungsgespräch"
    para "für einen Job als"
    line "Radio-Moderator in"
    cont "PORT ABANISHI!"

    para "Vielleicht hörst"
    line "du mich bald im"
    cont "Radio, Bruder!"

    para "Wünsch mir Glück!"

    para "Und dir auch viel"
    line "Glück da draußen!"
	done


Doll1Script:
	describedecoration DECODESC_LEFT_DOLL

Doll2Script:
	describedecoration DECODESC_RIGHT_DOLL

BigDollScript:
	describedecoration DECODESC_BIG_DOLL

GameConsoleScript:
	describedecoration DECODESC_CONSOLE

PlayersHousePosterScript:
	conditional_event EVENT_PLAYERS_ROOM_POSTER, .Script

.Script:
	describedecoration DECODESC_POSTER

PlayersHouseRadioScript:
	jumpstd radio1

PlayersHouseBookshelfScript:
	jumpstd picturebookshelf

PlayersHousePCScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue .PlayersHousePC2
	opentext
	writetext PlayersRadioText2
	waitbutton
	closetext
	setevent EVENT_READ_OAKS_EMAIL
	checkevent EVENT_TALKED_TO_KEN_AT_BEGINNING
	iffalse .DontSetKenScene
	setscene SCENE_PLAYERS_HOUSE_2F_NOTHING
	end
	
.DontSetKenScene
	end
	
.Warp:
	warp NONE, 0, 0
	end

.PlayersHousePC2
	opentext
	special PlayersHousePC
	iftrue .Warp
	closetext
	end
	
PlayersDollScript:
	opentext
	writetext PlayersDollText
	waitbutton
	closetext
	end
	
PlayerToReadEmailMovement:
	step DOWN
	step_end

PlayersDollText:
    text "Eine Puppe, die du"
    line "zu Weihnachten von"
    para "einem Verwandten"
    line "aus KANTO bekommen"
    cont "hast."
	done

PlayersRadioText2:
	text "<PLAY_G> schaltet"
	line "den PC ein."

	para "Was ist das?"
	line "Eine neue E-Mail?"
	
	para "…"
	
    para "Ich hoffe, du"
    line "entschuldigst die"
    para "plötzliche E-Mail,"
    line "aber es gibt da"
    para "etwas, was ich dir"
    line "anvertrauen will."

    para "Kommst du bitte"
    line "vorbei, um es dir"
    cont "abzuholen?"

	para "#MON-Professor"
	line "EICH"
	
	done

PlayersHouse2F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  9,  0, PLAYERS_HOUSE_1F, 3

	db 1 ; coord events
	coord_event  9,  1, SCENE_DEFAULT, MeetKenScript

	db 5 ; bg events
	bg_event  3,  1, BGEVENT_UP, PlayersHousePCScript
	bg_event  2,  1, BGEVENT_READ, PlayersHouseRadioScript
	bg_event  5,  1, BGEVENT_READ, PlayersHouseBookshelfScript
	bg_event  1,  1, BGEVENT_READ, PlayersHouseBookshelfScript
	bg_event  8,  0, BGEVENT_IFSET, PlayersHousePosterScript

	db 6 ; object events
	object_event  7,  2, SPRITE_CONSOLE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GameConsoleScript, EVENT_PLAYERS_HOUSE_2F_CONSOLE
	object_event  4,  6, SPRITE_DOLL_1, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Doll1Script, EVENT_PLAYERS_HOUSE_2F_DOLL_1
	object_event  5,  6, SPRITE_DOLL_2, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Doll2Script, EVENT_PLAYERS_HOUSE_2F_DOLL_2
	object_event  0,  6, SPRITE_BIG_DOLL, SPRITEMOVEDATA_BIGDOLL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BigDollScript, EVENT_PLAYERS_HOUSE_2F_BIG_DOLL
	object_event  6,  1, SPRITE_CLEFAIRY, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PlayersDollScript, -1
	object_event  8,  1, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PlayersHouse2F_Ken, EVENT_ROUTE_102_SILVER
