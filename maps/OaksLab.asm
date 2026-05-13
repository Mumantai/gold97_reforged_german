	const_def 2 ; object constants
	const OAKSLAB_OAK
	const OAKSLAB_OAKS_AIDE
	const OAKSLAB_POKE_BALL1
	const OAKSLAB_POKE_BALL2
	const OAKSLAB_POKE_BALL3
	const OAKSLAB_BLUE
	const OAKSLAB_SILVER

OaksLab_MapScripts:
	db 6 ; scene scripts
	scene_script .MeetOak ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_OAKSLAB_CANT_LEAVE
	scene_script .DummyScene2 ; SCENE_OAKSLAB_NOTHING
	scene_script .DummyScene3 ; SCENE_OAKSLAB_MEET_OFFICER
	scene_script .DummyScene4 ; SCENE_OAKSLAB_UNUSED
	scene_script .DummyScene5 ; SCENE_OAKSLAB_AIDE_GIVES_POTION

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .MoveOakCallback

.MeetOak:
	priorityjump .WalkUpToOak
	end

.DummyScene1:
	end

.DummyScene2:
	end

.DummyScene3:
	end

.DummyScene4:
	end

.DummyScene5:
	end

.MoveOakCallback:
	checkscene
	iftrue .Skip ; not SCENE_DEFAULT
	moveobject OAKSLAB_OAK, 4, 2
.Skip:
	return
	

.WalkUpToOak:
	applymovement PLAYER, OaksLab_WalkUpToOakMovement
	showemote EMOTE_SHOCK, OAKSLAB_OAK, 15
	opentext
	writetext OakText_Intro
	waitbutton
	closetext
	showemote EMOTE_SHOCK, OAKSLAB_SILVER, 15
	opentext
	writetext Text_OakIsOld
	waitbutton
	closetext
	pause 15
	opentext
	writetext Text_OakSpeech
	waitbutton
	closetext
	showemote EMOTE_SHOCK, OAKSLAB_SILVER, 15
	opentext
	writetext Text_Interesting
	waitbutton
	closetext
	showemote EMOTE_SHOCK, OAKSLAB_BLUE, 15
	opentext
	writetext BlueText_Pokedex
	waitbutton
	closetext
	applymovement OAKSLAB_BLUE, BlueGivesDex1
	pause 10
	applymovement OAKSLAB_BLUE, BlueGivesDex2
	pause 5
	opentext
	writetext Lab_GetDexText
	playsound SFX_ITEM
	waitsfx
	setflag ENGINE_POKEDEX
	pause 15
	waitbutton
	closetext
	applymovement OAKSLAB_BLUE, BlueGivesDex3
	opentext
	writetext Text_OakDream
	waitbutton
	closetext
	applymovement OAKSLAB_SILVER, MoveHeadLeft
	opentext
	writetext Text_RivalGenerous
	waitbutton
	closetext
	applymovement OAKSLAB_SILVER, MoveHeadUp
	setscene SCENE_OAKSLAB_CANT_LEAVE
	end

OaksLabSilverScript:
	jumptextfaceplayer Text_Best
	
OaksLabBlueScript:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .BlueAfterEliteFour
	faceplayer
	opentext
	writetext BlueText_Accepted
	waitbutton
	closetext
	end
	
.BlueAfterEliteFour
	faceplayer
	opentext
	writetext BlueText_Accepted2
	waitbutton
	closetext
	end

ProfOakScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SS_TICKET_FROM_OAK
	iftrue OakCheckMasterBall
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue OakGiveTicketScript
OakCheckMasterBall:
	checkevent EVENT_GOT_MASTER_BALL_FROM_OAK
	iftrue OakCheckEverstone
	checkflag ENGINE_RISINGBADGE
	iftrue OakGiveMasterBallScript
OakCheckEverstone:
	checkevent EVENT_TOLD_ELM_ABOUT_TOGEPI_OVER_THE_PHONE
	iffalse OakCheckTogepiEgg
	waitbutton
	closetext
	end

OakCheckTogepiEgg:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue OakAfterLeagueInPerson
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue OakAfterRadioTowerInPerson
	checkevent EVENT_RIVAL_BURNED_TOWER
	iftrue OakRocketsReturnedScript
	checkevent EVENT_GOT_ODD_EGG_FROM_OAKS_AIDE
	iftrue OakHearAboutLeagueHatchScript
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue OakOpportunityScript
	writetext OakText_LetYourMonBattleIt
	waitbutton
	closetext
	end

LabTryToLeaveScript:
	turnobject OAKSLAB_OAK, DOWN
	opentext
	writetext LabWhereGoingText
	waitbutton
	closetext
	applymovement PLAYER, OaksLab_CantLeaveMovement
	end
	
OakHearAboutLeagueHatchScript:
	writetext OakHearAboutLeagueHatchText
	waitbutton
	closetext
	end
	
OakRocketsReturnedScript:
	writetext OakRocketsReturnedText
	waitbutton
	closetext
	end
	
OakAfterRadioTowerInPerson:
	writetext OakYoureBasicallyAHeroText
	waitbutton
	closetext
	end
	
OakAfterLeagueInPerson:
	writetext OakAfterLeagueInPersonText
	waitbutton
	closetext
	end

FlambearPokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue LookAtOakPokeBallScript
	turnobject OAKSLAB_OAK, DOWN
	refreshscreen
	pokepic FLAMBEAR
	cry FLAMBEAR
	waitbutton
	closepokepic
	opentext
	writetext TakeFlambearText
	yesorno
	iffalse DidntChooseStarterScript
	disappear OAKSLAB_POKE_BALL1
	setevent EVENT_GOT_FLAMBEAR_FROM_OAK
	writetext ChoseStarterText
	buttonsound
	waitsfx
	pokenamemem FLAMBEAR, MEM_BUFFER_0
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke FLAMBEAR, 5, BERRY
	closetext
	applymovement OAKSLAB_SILVER, SilverGetCruiseMovement
	opentext
	writetext Text_SilverTakeThisOne
	waitbutton
	closetext
	disappear OAKSLAB_POKE_BALL2
	opentext
	writetext Text_SilverGetCruise
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	closetext
	setevent EVENT_CRUIZE_POKEBALL_IN_OAKS_LAB
	setevent EVENT_PLAYERS_HOUSE_1F_NEIGHBOR
	clearevent EVENT_PLAYERS_NEIGHBORS_HOUSE_NEIGHBOR
	jump OakDirectionsScript

CruisePokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue LookAtOakPokeBallScript
	turnobject OAKSLAB_OAK, DOWN
	refreshscreen
	pokepic CRUIZE
	cry CRUIZE
	waitbutton
	closepokepic
	opentext
	writetext TakeCruiseText
	yesorno
	iffalse DidntChooseStarterScript
	disappear OAKSLAB_POKE_BALL2
	setevent EVENT_GOT_CRUIZE_FROM_OAK
	writetext ChoseStarterText
	buttonsound
	waitsfx
	pokenamemem CRUIZE, MEM_BUFFER_0
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke CRUIZE, 5, BERRY
	closetext
	applymovement OAKSLAB_SILVER, SilverGetCHIKORITAMovement
	opentext
	writetext Text_SilverTakeThisOne
	waitbutton
	closetext
	disappear OAKSLAB_POKE_BALL3
	opentext
	writetext Text_SilverGetCHIKORITA
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	closetext
	setevent EVENT_CHIKORITA_POKEBALL_IN_OAKS_LAB
	setevent EVENT_PLAYERS_HOUSE_1F_NEIGHBOR
	clearevent EVENT_PLAYERS_NEIGHBORS_HOUSE_NEIGHBOR
	jump OakDirectionsScript

CHIKORITAPokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue LookAtOakPokeBallScript
	turnobject OAKSLAB_OAK, DOWN
	refreshscreen
	pokepic CHIKORITA
	cry CHIKORITA
	waitbutton
	closepokepic
	opentext
	writetext TakeCHIKORITAText
	yesorno
	iffalse DidntChooseStarterScript
	disappear OAKSLAB_POKE_BALL3
	setevent EVENT_GOT_CHIKORITA_FROM_OAK
	writetext ChoseStarterText
	buttonsound
	waitsfx
	pokenamemem CHIKORITA, MEM_BUFFER_0
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke CHIKORITA, 5, BERRY
	closetext
	applymovement OAKSLAB_SILVER, SilverGetFlambearMovement
	opentext
	writetext Text_SilverTakeThisOne
	waitbutton
	closetext
	disappear OAKSLAB_POKE_BALL1
	opentext
	writetext Text_SilverGetFlambear
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	closetext
	setevent EVENT_FLAMBEAR_POKEBALL_IN_OAKS_LAB
	setevent EVENT_PLAYERS_HOUSE_1F_NEIGHBOR
	clearevent EVENT_PLAYERS_NEIGHBORS_HOUSE_NEIGHBOR
	jump OakDirectionsScript

DidntChooseStarterScript:
	writetext DidntChooseStarterText
	waitbutton
	closetext
	end

OakDirectionsScript:
	applymovement OAKSLAB_OAK, OakToTable
	turnobject PLAYER, UP
	opentext
	writetext OakDirectionsText1
	waitbutton
	closetext
	addcellnum PHONE_ELM
	opentext
	writetext GotOaksNumberText
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	waitbutton
	closetext
	opentext
	writetext OakDirectionsText3
	waitbutton
	closetext
	applymovement OAKSLAB_OAK, OakBackFromTable
	setevent EVENT_GOT_A_POKEMON_FROM_OAK
	setevent EVENT_RIVAL_CHERRYGROVE_CITY
	setscene SCENE_OAKSLAB_AIDE_GIVES_POTION
	setmapscene SILENT_TOWN, SCENE_NEW_BARK_NOTHING
	setmapscene OAKS_LAB_ENTRANCE, SCENE_OAK_ENTRANCE_BATTLE
	setevent EVENT_SILVER_IN_OAKS_LAB
	clearevent EVENT_DAISY_OAKS_LAB_ENTRANCE
	setevent EVENT_BIRDON_AIDE_HIDDEN
	end

OakOpportunityScript:
	writetext OakOpportunityText
	waitbutton
	closetext
	end

LookAtOakPokeBallScript:
	opentext
	writetext OakPokeBallText
	waitbutton
	closetext
	end

OakGiveMasterBallScript:
	writetext OakGiveMasterBallText1
	buttonsound
	verbosegiveitem MASTER_BALL
	iffalse .notdone
	setevent EVENT_GOT_MASTER_BALL_FROM_OAK
	writetext OakGiveMasterBallText2
	waitbutton
.notdone
	closetext
	end

OakGiveTicketScript:
	writetext OakGiveTicketText
	buttonsound
	verbosegiveitem S_S_TICKET
	setevent EVENT_GOT_SS_TICKET_FROM_OAK
	writetext OakGiveTicketText
	waitbutton
	closetext
	end

OaksAideScript:
	faceplayer
	opentext
	writetext AideText_AlwaysBusy
	waitbutton
	closetext
	end

OaksLabTrashcan:
	jumptext OaksLabTrashcanText

OaksLabBookshelf:
	jumpstd difficultbookshelf
	
OakBackFromTable:
	step LEFT
	step LEFT
	step DOWN
	step_end

MoveHeadLeft:
	turn_head LEFT
	step_end
	
MoveHeadUp:
	turn_head UP
	step_end
	
OakToTable:
	step UP
	step RIGHT
	step RIGHT
	turn_head DOWN
	step_end
	
SilverGetCruiseMovement:
	step RIGHT
	step RIGHT
	step UP
	step UP
	step_end
	
SilverGetFlambearMovement:
	step RIGHT
	step UP
	step UP
	step_end
	
SilverGetCHIKORITAMovement:
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step UP
	step_end

OaksLab_WalkUpToOakMovement:
	step UP
	step UP
	step_end

OaksLab_CantLeaveMovement:
	step UP
	step_end

BlueGivesDex1:
	step RIGHT
	step RIGHT
	step DOWN
	step_end
	
BlueGivesDex2:
	step LEFT
	turn_head DOWN
	step_end
	
BlueGivesDex3:
	step UP
	step LEFT
	turn_head DOWN
	step_end
	
BlueText_Accepted2:
    text "Wie stehen die"
    line "Dinge jetzt, wo du"
    cont "der CHAMP bist?"

    para "Ich hoffe, alles"
    line "läuft bestens."

    para "Hast du <RIVAL> in"
    line "letzter Zeit mal"
    cont "gesehen?"

    para "Ich weiß, dass er"
    line "fleißig mit seinen"
    cont "#MON trainiert."

    para "Ich glaube, er hat"
    line "gelernt, mit ihnen"
    para "zusammen als Team"
    line "zu arbeiten."
	done
	
Text_SilverTakeThisOne:
    text "Dieses #MON"
    line "sieht stark aus!"

    para "Ich nehme es."
	done
	
Text_SilverGetCruise:
	text "<RIVAL> erhält"
	line "AMISSIO!"
	done
	
Text_SilverGetFlambear:
	text "<RIVAL> erhält"
	line "PYROXIO!"
	done
	
Text_SilverGetCHIKORITA:
	text "<RIVAL> erhält"
	line "ENDIVIE!"
	done
		
Text_Best:
	text "Mein #MON wird"
	line "das beste werden!"
	done

Lab_GetDexText:
	text "<PLAYER> erhält"
	line "#DEX!"
	done
	
OakText_Intro:
	text "EICH: <PLAY_G>!"
	line "Da bist du ja!"

	done
	
Text_OakIsOld:
    text "<RIVAL>: Ich kann"
    line "es nicht fassen."

    para "Dieser alte Kauz"
    line "soll PROF. EICH"
    cont "sein…"
	done
	
Text_OakSpeech:
    text "EICH: Haha!"

    para "In der Tat, junger"
    line "Mann, aber ich bin"
    cont "noch nicht so alt!"

    para "Ich habe euch zwei"
    line "aus einem wichti-"
    cont "gen Grund hierher"
    cont "gerufen…"

    para "Seit ich ein Junge"
    line "war, träumte ich"
    para "davon, ein voll-"
    line "ständiges Handbuch"
    para "über jede Spezies"
    line "#MON zu haben."

    para "Jedoch…"

    para "Jeden Tag werden"
    line "mehr und mehr neue"
    cont "Arten entdeckt!"

    para "…und mein Alter"
    line "holt mich ein…"

    para "Also!"

    para "Ich bitte euch,"
    line "meine Forschung"
    cont "fortzuführen."
	done

Text_Interesting:
	text "<RIVAL>: Wow!"

    para "Du willst, dass"      ; Silber ist frech, deshalb duzt er den Prof.
    line "wir 'nen Haufen"
    para "#MON finden und"
    line "für dich fangen!?"

    para "So viele, wie wir"
    line "wollen?"
	done
	
BlueText_Pokedex:
    text "BLAU: Genau!"

    para "Es wird allerdings"
    line "nicht leicht sein."

    para "Ich habe auch"
    line "damals versucht,"
    cont "den #DEX zu"
    cont "vervollständigen…"

    para "Doch ich wurde zu"
    line "arrogant…"

    para "Ich habe mich zu"
    line "sehr darauf fokus-"
    cont "siert, der beste"
    cont "Trainer zu sein,"
    para "dass ich mein Ziel"
    line "aus den Augen"
    cont "verloren habe."

    para "Deshalb helfe ich"
    line "Opa heute mit"
    cont "seiner Forschung."

    para "Hier! Nehmt diesen"
    line "#DEX!"

    para "Er speichert auto-"
    line "matisch Daten über"
    para "#MON, die ihr"
    line "fangt oder denen"
    cont "ihr begegnet."
	done
	
Text_OakDream:
    text "EICH: Alles, was"
    line "ihr jetzt noch"
    para "braucht, ist ein"
    line "#MON-Partner"
    cont "für eure Reise."

    para "Dort auf dem Tisch"
    line "liegen drei"
    cont "#BÄLLE."

    para "Ihr dürft euch"
    line "beide einen davon"
    cont "aussuchen."

    para "Das #MON darin"
    line "wird euer Partner!"
	done
	
Text_RivalGenerous:
    text "<RIVAL>: Du darfst"
    line "zuerst aussuchen,"
    cont "<PLAY_G>…"

    para "Ich möchte noch"
    line "etwas Zeit zum"
    cont "Überlegen haben."
	done

BlueText_Accepted:
    text "Danke, <PLAY_G>,"
    line "dass du Opa auch"
    cont "helfen willst!"
	done

OakText_ChooseAPokemon:
	text "Ich möchte, dass"
	line "du eines der"

	para "#MON aus"
	line "einem dieser BÄLLE"
	cont "trainierst."

	para "Du wirst der erste"
	line "Kamerad dieses"
	cont "#MON sein,"
	cont "<PLAY_G>!"

	para "Such dir eins aus!"
	done

OakText_LetYourMonBattleIt:
	text "Erscheint ein"
	line "wildes #MON,"
	cont "lass deine #MON"
	cont "dagegen kämpfen."
	done

LabWhereGoingText:
	text "EICH: Warte! Wohin"
	line "gehst du?"
	done

TakeFlambearText:
	text "EICH: Willst du"
	line "PYROXIO, das"
	cont "Feuer-#MON?"
	done

TakeCruiseText:
	text "EICH: Wählst du"
	line "AMISSIO, das"
	cont "Wasser-#MON?"
	done

TakeCHIKORITAText:
	text "EICH: Entscheidest"
	line "du dich für"
	para "ENDIVIE, das"
	line "Pflanzen-#MON?"
	done

DidntChooseStarterText:
	text "EICH: Überlege es"
	line "dir gut!"

	para "Die Wahl deines"
	line "Partners ist sehr"
	cont "wichtig."
	done

ChoseStarterText:
	text "EICH: Ich bin auch"
	line "der Meinung, dass"
	cont "dieses #MON"
	cont "sehr gut ist!"
	done

ReceivedStarterText:
	text "<PLAYER> erhält"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

OakDirectionsText1:
    text "ROUTE 101 und die"
    line "SILENITIA HÜGEL"
    para "wären ein guter"
    line "Start, um nach"
    cont "#MON zu suchen."

    para "Ich bin sicher,"
    line "ihr macht das"
    cont "super!"

    para "Aber nur für den"
    line "Fall, ist hier"
    cont "meine Nummer."

    para "Ruft an, wenn es"
    line "etwas gibt!"
	done

OakDirectionsText3:
	text "<PLAY_G>,"
	para "<RIVAL>, ich"
	line "zähle auf euch!"
	done

GotOaksNumberText:
	text "<PLAYER> erhält"
	line "EICHs Nummer."
	done

OakOpportunityText:
    text "Das ist eine"
    line "aufregende"
    cont "Gelegenheit!"
	done

OakPokeBallText:
	text "Er beinhaltet ein"
	line "von PROF. EICH ge-"
	cont "fangenes #MON."
	done

OakHearAboutLeagueHatchText:
    text "Wie ich höre,"
    line "stellst du dich"
    para "der NIHON #MON"
    line "LIGA."

    para "Das ist großartig!"

    para "Ich bin sicher, du"
    line "du hast das Zeug,"
    cont "um Großes zu"
    cont "erreichen!"
	done


OakGiveMasterBallText1:
	text "EICH: Hi, <PLAYER>!"
	line "Dank dir komme ich"
	para "mit meinen For-"
	line "schungen hervor-"
	cont "ragend voran!"

	para "Nimm dies als"
	line "Zeichen meiner"
	cont "Dankbarkeit!"
	done

OakGiveMasterBallText2:
	text "Der MEISTERBALL"
	line "ist der Beste von"
	cont "allen!"

	para "Er ist der ultima-"
	line "tive BALL! Ihm"
	para "kann kein #MON"
	line "entwischen."

	para "Er wird nur aner-"
	line "kannten #MON-"
	cont "Forschern"
	cont "überreicht."

	para "Aber ich glaube,"
	line "du hast bessere"
	para "Verwendung dafür"
	line "als ich, <PLAY_G>!"
	done

OakGiveTicketText:
    text "Am Hafen von PORT"
    line "ABANISHI kannst du"
    para "mit dem Schiff zu"
    line "den SÜDWESTINSELN"
    cont "NIHONs fahren."

    para "Dort gibt es viele"
    line "seltene #MON,"
    para "die du auf dem"
    line "Festland nicht"
    cont "finden kannst."

    para "Du solltest mal"
    line "vorbeischauen,"
    para "wenn du die"
    line "Gelegenheit dazu"
    cont "hast."
	done

AideText_AlwaysBusy:
	text "Wir schätzen deine"
	line "Hilfe sehr!"
	done

OaksLabTrashcanText:
	text "Die Verpackung"
	line "des Snacks, den"
	cont "PROF. EICH geges-"
	cont "sen hat, befindet"
	cont "sich hier…"
	done

OakRocketsReturnedText:
    text "Ich befürchte,"
    line "dass TEAM ROCKET"
    para "etwas wirklich"
    line "Schreckliches"
    cont "plant…"
	done
	
OakYoureBasicallyAHeroText:
    text "Unglaublich, dass"
    line "du und <RIVAL> es"
    para "mit TEAM ROCKET"
    line "aufgenommen habt!"

    para "Ihr seid Helden"
    line "für alle #MON!"

    para "Macht weiter so"
    line "und kämpft euch"
    cont "zum KOROKANIABERG!"
	done
	
OakAfterLeagueInPersonText:
    text "Glückwunsch zu"
    line "deinem Sieg über"
    cont "die #MON LIGA!"

    para "Das ist eine"
    line "große Leistung!"

    para "Vielen Dank auch"
    line "für deine Unter-"
    para "stützung bei"
    line "meiner Forschung."

    para "Mit dem, was du"
    line "schon geschafft"
    para "hast, liegt eine"
    line "großartige Zukunft"
    cont "vor dir!"
	done

OaksLab_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  7, OAKS_LAB_ENTRANCE, 3
	warp_event  4,  7, OAKS_LAB_ENTRANCE, 3


	db 2 ; coord events
	coord_event  3,  7, SCENE_OAKSLAB_CANT_LEAVE, LabTryToLeaveScript
	coord_event  4,  7, SCENE_OAKSLAB_CANT_LEAVE, LabTryToLeaveScript

	db 7 ; bg events
	bg_event  0,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event  1,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event  2,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event  3,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event  0,  0, BGEVENT_READ, OaksLabBookshelf
	bg_event  1,  0, BGEVENT_READ, OaksLabBookshelf
	bg_event  9,  3, BGEVENT_READ, OaksLabTrashcan

	db 7 ; object events
	object_event  4,  2, SPRITE_OAK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ProfOakScript, -1
	object_event  6,  6, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OaksAideScript, EVENT_OAKS_AIDE_IN_LAB
	object_event  5,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FlambearPokeBallScript, EVENT_FLAMBEAR_POKEBALL_IN_OAKS_LAB
	object_event  6,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CruisePokeBallScript, EVENT_CRUIZE_POKEBALL_IN_OAKS_LAB
	object_event  7,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CHIKORITAPokeBallScript, EVENT_CHIKORITA_POKEBALL_IN_OAKS_LAB
	object_event  2,  3, SPRITE_BLUE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OaksLabBlueScript, EVENT_BLUE_IN_OAKS_LAB
	object_event  4,  5, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OaksLabSilverScript, EVENT_SILVER_IN_OAKS_LAB
