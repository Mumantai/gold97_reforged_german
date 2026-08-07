	const_def 2 ; object constants
	const CROWN_PASS_SILVER

CrownPass_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RivalBattleFinal:
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	turnobject CROWN_PASS_SILVER, DOWN
	pause 15
	applymovement CROWN_PASS_SILVER, CrownPassSilverWalksToPlayer
	turnobject PLAYER, LEFT
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext CrownPassSilverBeforeText
	waitbutton
	closetext
	checkevent EVENT_GOT_CRUIZE_FROM_OAK
	iftrue .cruise
	checkevent EVENT_GOT_CHIKORITA_FROM_OAK
	iftrue .CHIKORITA
	winlosstext CrownPassSilverWinText, CrownPassSilverLossText
	loadtrainer RIVAL1, RIVAL1_5_CRUIZE
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .returnfrombattle

.cruise
	winlosstext CrownPassSilverWinText, CrownPassSilverLossText
	loadtrainer RIVAL1, RIVAL1_5_CHIKORITA
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .returnfrombattle

.CHIKORITA
	winlosstext CrownPassSilverWinText, CrownPassSilverLossText
	loadtrainer RIVAL1, RIVAL1_5_FLAMBEAR
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .returnfrombattle

.returnfrombattle
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext CrownPassSilverAfterText
	waitbutton
	closetext
	applymovement PLAYER, CrownPassPlayer1StepToTheSide
	applymovement CROWN_PASS_SILVER, CrownPassSilverLeavesMovement
	disappear CROWN_PASS_SILVER
	setscene SCENE_CROWN_PASS_NOTHING
	setevent EVENT_EMERGENCY_SWITCH
	setmapscene CROWN_CITY, SCENE_CROWN_PASS_MEET_RIVAL
	special HealParty
	special FadeOutMusic
	waitsfx
	playmapmusic
	pause 15
	end

CrownPassHiddenFullRestore:
	hiddenitem FULL_RESTORE, EVENT_CROWN_PASS_HIDDEN_FULL_RESTORE

CrownPassHiddenXSpecial:
	hiddenitem X_SPECIAL, EVENT_CROWN_PASS_HIDDEN_X_SPECIAL

CrownPassSilverWalksToPlayer:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	turn_head RIGHT
	step_end

CrownPassPlayer1StepToTheSide:
	step RIGHT
	turn_head LEFT
	step_end

CrownPassSilverLeavesMovement:
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

CrownPassSilverBeforeText:
	text "Hi, <PLAY_G>!"

	para "Du willst den"
	line "KOROKANIABERG"
	cont "erklimmen, oder?"

	para "Es war eine lange"
	line "Reise."

	para "Wir beide haben"
	line "viel durchgemacht."

	para "Sind deine #MON"
	line "bereit?"

	para "Lass uns genau"
	line "hier gegeneinander"
	cont "antreten!"

	para "Ein Kampf zwischen"
	line "zwei Freunden!"
	done

CrownPassSilverWinText:
	text "…"
	done

CrownPassSilverLossText:
	text "…"
	done

CrownPassSilverAfterText:
    text "Weißt du, was mir"
    line "klar geworden ist?"

    para "Ich war so aufge-"
    line "regt, die LIGA"
    cont "herauszufordern."

    para "Ich wollte die"
    line "stärksten #MON"
    cont "haben."

    para "Ich wollte der"
    line "härteste Trainer"
    cont "sein, den es gibt."

    para "Aber die ganze"
    line "Sache mit TEAM"
    para "ROCKET hat mich"
    line "zum Nachdenken"
    cont "gebracht."

    para "Ich habe erkannt,"
    line "dass ich mein Team"
    para "mit mehr Fürsorge"
    line "behandeln muss."

    para "Darum glaube ich,"
    line "ich bin noch nicht"
    para "ganz bereit, mich"
    line "der #MON LIGA"
    para "zu stellen, bis"
    line "ich mehr an mir"
    para "gearbeitet habe."

	para "Viel Glück,"
	line "<PLAY_G>."

	para "Bis bald."
	done

CrownPass_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 10, 33, VICTORY_ROAD_GATE, 3
	warp_event 11,  1, CROWN_CITY, 1

	db 1 ; coord events
	coord_event 12,  7, SCENE_DEFAULT, RivalBattleFinal

	db 2 ; bg events
	bg_event  5, 16, BGEVENT_ITEM, CrownPassHiddenFullRestore
	bg_event 12, 14, BGEVENT_ITEM, CrownPassHiddenXSpecial

	db 1 ; object events
	object_event 11,  2, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_EMERGENCY_SWITCH
