	const_def 2 ; object constants
	const SilentTown_TEACHER
	const SilentTown_FISHER
	const SilentTown_SILVER
	const SilentTown_BLUE
	const SilentTown_PACKAGE

SilentTown_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint
	callback MAPCALLBACK_TILES, .ClearRocks

.ClearRocks:
	checkevent EVENT_ROUTE_115_ROCKS_DEMOLISHED
	iftrue .NewBarkRocksDone
	changeblock  19, 15, $25 ; rock
	return

	
.NewBarkRocksDone
	return

.DummyScene0:
	end

.DummyScene1:
	end
	
.FlyPoint:
	setflag ENGINE_FLYPOINT_SILENT
	clearevent EVENT_FIRST_TIME_BANKING_WITH_MOM
	return
	
MomHasBeenRenamed:
    text "Deine Mutter heißt"
    line "jetzt <MOM>!"
	done
	
NameMomAgainText:
    text "Hallo!"

    para "Diese Nachricht"
    line "erscheint nur in"
    para "älteren Spiel-"
    line "ständen, in denen"
    para "deine MUTTER even-"
    line "tuell falsch im"
    line "Telefonbuch deines"
    para "#COMs einge-"
    line "tragen ist."

    para "Überprüfe, ob der"
    line "Name deiner MUTTER"
    para "korrekt angezeigt"
    line "wird."

    para "Häufig steht der"
    line "Name des Spielers"
    line "stattdessen dort."

    para "Du kannst sie hier"
    line "umbenennen, um das"
    para "Problem zu beheben"
    line "oder wenn du ihr"
    para "einfach einen"
    line "anderen Namen"
    cont "geben möchtest."

    para "Dies kann nur"
    line "einmal gemacht"
    cont "werden."

    para "Möchtest du deine"
    line "MUTTER umbenennen?"
	done
	
NameMomAgainText2:
    text "Sprich mit diesem"
    line "Schild, um deiner"
    para "MUTTER einen neuen"
    line "Namen zu geben."
	done


SilentTownPokecenterSign:
	jumpstd pokecentersign
	
SilentTown_RivalGreets:
	applymovement SilentTown_SILVER, RivalMeetsPlayer
	turnobject PLAYER, RIGHT
	special FadeOutMusic
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext SilentTownRivalText1
	waitbutton
	closetext
	showemote EMOTE_SHOCK, SilentTown_SILVER, 15
	opentext
	writetext SilentTownRivalText2
	waitbutton
	special NameMom
	closetext
	setevent EVENT_NAMED_MOM_CHECK_FOR_SAVES
	showemote EMOTE_SHOCK, SilentTown_SILVER, 15
	opentext
	writetext SilentTownRivalText3
	closetext
	applymovement SilentTown_SILVER, RivalGoesToLab
	disappear SilentTown_SILVER
	setscene SCENE_TEACHER_STOPS
	special FadeOutMusic
	pause 15
	special RestartMapMusic
	setevent EVENT_RIVAL_SILENT_TOWN
	setevent EVENT_BLUE_OAKS_LAB_ENTRANCE
	setevent EVENT_DAISY_OAKS_LAB_ENTRANCE
	setevent EVENT_VIOLET_GYM_FALKNER
	setmapscene RADIO_TOWER_6F, SCENE_RADIOTOWER6F_NOTHING; this makes it so the giovanni scene plays, was missed for a while
	end

BlueStopsYouScene1:
	playmusic MUSIC_SHOW_ME_AROUND
	opentext
	writetext Text_WaitPlayer
	waitbutton
	closetext
	showemote EMOTE_SHOCK, PLAYER, 15
	turnobject PLAYER, RIGHT
	appear SilentTown_BLUE
	applymovement SilentTown_BLUE, BlueStopsPlayer1
	opentext
	writetext Text_ItsDangerousToGoAlone
	waitbutton
	closetext
	setevent EVENT_RIVAL_OAKS_LAB_ENTRANCE
	setmapscene OAKS_LAB_ENTRANCE, SCENE_HEAD_TO_THE_BACK
	setmapscene OAKS_LAB, SCENE_DEFAULT
	clearevent EVENT_BLUE_OAKS_LAB_ENTRANCE
	follow SilentTown_BLUE, PLAYER
	applymovement SilentTown_BLUE, BlueTakesPlayerToLab1
	stopfollow
	playsound SFX_ENTER_DOOR
	disappear SilentTown_BLUE
	applymovement PLAYER, PlayerEntersLab
	playsound SFX_ENTER_DOOR
	special FadeOutPalettes
	warpfacing UP, OAKS_LAB_ENTRANCE, 4, 15
	end

BlueStopsYouScene2:
	playmusic MUSIC_SHOW_ME_AROUND
	opentext
	writetext Text_WaitPlayer
	waitbutton
	closetext
	showemote EMOTE_SHOCK, PLAYER, 15
	turnobject PLAYER, RIGHT
	appear SilentTown_BLUE
	applymovement SilentTown_BLUE, BlueStopsPlayer2
	opentext
	writetext Text_ItsDangerousToGoAlone
	waitbutton
	closetext
	setevent EVENT_RIVAL_OAKS_LAB_ENTRANCE
	setmapscene OAKS_LAB_ENTRANCE, SCENE_HEAD_TO_THE_BACK
	setmapscene OAKS_LAB, SCENE_DEFAULT
	clearevent EVENT_BLUE_OAKS_LAB_ENTRANCE
	follow SilentTown_BLUE, PLAYER
	applymovement SilentTown_BLUE, BlueTakesPlayerToLab2
	stopfollow
	playsound SFX_ENTER_DOOR
	disappear SilentTown_BLUE
	applymovement PLAYER, PlayerEntersLab
	playsound SFX_ENTER_DOOR
	special FadeOutPalettes
	warpfacing UP, OAKS_LAB_ENTRANCE, 4, 15
	end

SilentTownRivalScript:
	faceplayer
	opentext
	writetext Text_GearIsImpressive
	waitbutton
	closetext
	end
	
SilentTownBlueScript:
	opentext
	writetext Text_Study101
	waitbutton
	closetext
	end

SilentTownTeacherScript:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_MOM_AFTER_GETTING_POKEDEX
	iftrue .CallMom
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue .MonIsAdorable
	writetext Text_GearIsImpressive
	waitbutton
	closetext
	end

.MonIsAdorable:
	writetext Text_YourMonIsAdorable
	waitbutton
	closetext
	end

.CallMom:
	writetext Text_CallMomOnGear
	waitbutton
	closetext
	end

SilentTownFisherScript:
	jumptextfaceplayer Text_OakDiscoveredNewMon

SilentTownSign:
	jumptext SilentTownSignText

SilentTownPlayersHouseSign:
	opentext
	checkevent EVENT_NAMED_MOM_CHECK_FOR_SAVES
	iffalse .NameMomAgain
	writetext SilentTownPlayersHouseSignText
	waitbutton
	closetext
	end
	
.NameMomAgain
	writetext NameMomAgainText
	yesorno
	iffalse .DontNameMomAgain
	special NameMom 
	closetext 
	setevent EVENT_NAMED_MOM_CHECK_FOR_SAVES
	opentext
	writetext MomHasBeenRenamed
	waitbutton
	closetext
	end
	
.DontNameMomAgain
	writetext NameMomAgainText2
	waitbutton
	closetext
	end

SilentTownOaksLabSign:
	jumptext SilentTownOaksLabSignText

SilentTownRivalsHouseSign:
	jumptext SilentTownRivalsHouseSignText
	
BlueTakesPlayerToLab1:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step_end
	
BlueTakesPlayerToLab2:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step_end
	
BlueStopsPlayer1:
	step UP
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

BlueStopsPlayer2:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

RivalMeetsPlayer:
	step UP
	step UP
	step UP
	step UP
	step UP
	step LEFT
	step_end
	
RivalGoesToLab:
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end
	
PlayerEntersLab:
	step UP
	step_end
	
	
TrophyPackageScript:
	opentext
	checkevent EVENT_GOLD_TROPHY_IN_PACKAGE
	iftrue .goldtrophy
	checkevent EVENT_SILVER_TROPHY_IN_PACKAGE
	iftrue .silvertrophy
.dummynotrophy
	closetext
	end
.goldtrophy
	writetext PackageIsHereText
	waitbutton
	verbosegiveitem GORGEOUS_BOX
	iffalse .dummynotrophy
	setevent EVENT_PACKAGE_TAKEN_NO_SHOW
	setevent EVENT_TAKEN_GOLD_TROPHY
	disappear SilentTown_PACKAGE
	jump .dummynotrophy
.silvertrophy
	writetext PackageIsHereText
	waitbutton
	verbosegiveitem NORMAL_BOX
	iffalse .dummynotrophy
	setevent EVENT_PACKAGE_TAKEN_NO_SHOW
	setevent EVENT_TAKEN_SILVER_TROPHY
	disappear SilentTown_PACKAGE
	jump .dummynotrophy
	
PackageIsHereText:
    text "Ein Paket für…"

    para "<PLAYER>!"

    para "Was könnte da nur"
    line "drin sein?"
	done
	
Text_Study101:
    text "…Und wenn wir nur"
    line "ein paar Tage"
    para "länger die #MON"
    line "auf ROUTE 101"
    cont "beobachten würden…"

    para "…"

    para "Er scheint völlig"
    line "in seine Arbeit"
    cont "vertieft zu sein…"
	done

Text_GearIsImpressive:
    text "Wow, dein #COM"
    line "ist beeindruckend!"

    para "Hast du den von"
    line "Mama bekommen?"
	done

Text_WaitPlayer:
	text "Warte! Stopp!"
	done

Text_ItsDangerousToGoAlone:
	text "Was denkst du,"
	line "tust du da?"
	
    text "Es ist gefährlich,"
    line "ohne #MON das"
    cont "Haus zu verlassen!"

    para "Auf dem Weg zur"
    line "nächsten Stadt"
    para "können jederzeit"
    line "wilde #MON"
    cont "auftauchen."

    para "Du brauchst dein"
    line "eigenes #MON,"
    para "um dich selbst zu"
    line "schützen!"

    para "Ah! Warte, bist du"
    line "vielleicht…?"

    para "…Komm mit mir!"
	done

Text_YourMonIsAdorable:
    text "Oh! Dein #MON"
   	line "ist bezaubernd!"

   	para "Ich wünschte, ich"
   	line "hätte auch eines."
	done

Text_CallMomOnGear:
	text "Ruf deine Mama mit"
	line "dem #COM an,"

	para "damit sie weiß,"
	line "was du machst."
	done

Text_OakDiscoveredNewMon:
	text "Yo, <PLAYER>!"

	para "Ich habe gehört,"
	line "PROF. EICH hat"
	cont "neue #MON"
	cont "entdeckt."
	done

SilentTownRivalText1:
	text "<RIVAL>: Hey,"
	line "<PLAYER>!"

	para "Du wirst niemals"
	line "glauben, was mir"
	cont "passiert ist!"

	para "Ich habe eine Mail"
	line "von PROF. EICH"
	cont "bekommen!"

	para "Ja, der berühmte!"
	done

SilentTownRivalText2:
    text "Du hast auch eine"
    line "bekommen?!"

    para "Mann, das ist echt"
    line "nicht fair!"

    para "Hmpf!"

    para "Hmm… naja… du… äh…"

    para "Wie nennst du"
    line "deine Mutter"
    cont "nochmal?"
	done
	
SilentTownRivalText3:
	text "<MOM>?"

    para "Bahaha!"

    para "Du bringst mich"
    line "zum Lachen!"

    para "Sie so zu nennen,"
    line "ist so kindisch!"

	para "Naja, ich gehe mal"
	line "zu PROF. EICH!"

	para "Wir sehen uns"
	line "dann dort!"
	done

SilentTownSignText:
	text "Stets friedliches"
	line "SILENITIA"
	done

SilentTownPlayersHouseSignText:
	text "Haus von <PLAYER>"
	done

SilentTownOaksLabSignText:
	text "EICH-#MON-LABOR"
	done

SilentTownRivalsHouseSignText:
	text "Haus von <RIVAL>"
	done

SilentTown_MapEvents:
	db 0, 0 ; filler

	db 7 ; warp events
	warp_event 14, 19, OAKS_LAB_ENTRANCE, 1
	warp_event  5, 12, PLAYERS_HOUSE_1F, 1
	warp_event 13, 12, SILENT_POKECENTER_1F, 1
	warp_event  3, 20, SILENT_HOUSE, 1
	warp_event 15, 19, OAKS_LAB_ENTRANCE, 2
	warp_event  9, 18, AMAMI_POKECENTER_1F, 1
	warp_event  9,  5, VICTORY_ROAD_GATE, 1


	db 3 ; coord events
	coord_event  1, 16, SCENE_TEACHER_STOPS, BlueStopsYouScene1
	coord_event  1, 17, SCENE_TEACHER_STOPS, BlueStopsYouScene2
	coord_event  5, 13, SCENE_DEFAULT, SilentTown_RivalGreets

	db 5 ; bg events
	bg_event 16, 13, BGEVENT_READ, SilentTownSign
	bg_event  8, 12, BGEVENT_READ, SilentTownPlayersHouseSign
	bg_event 10, 19, BGEVENT_READ, SilentTownOaksLabSign
	bg_event  6, 20, BGEVENT_READ, SilentTownRivalsHouseSign
	bg_event 14, 12, BGEVENT_READ, SilentTownPokecenterSign

	db 5 ; object events
	object_event  9, 14, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilentTownTeacherScript, -1
	object_event 12, 21, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1,  0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SilentTownFisherScript, -1
	object_event  7, 18, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilentTownRivalScript, EVENT_RIVAL_SILENT_TOWN
	object_event  7, 17, SPRITE_BLUE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SilentTownBlueScript, EVENT_BLUE_SILENT_TOWN
	object_event  4, 13, SPRITE_BELMITT, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TrophyPackageScript, EVENT_PACKAGE_TAKEN_NO_SHOW
