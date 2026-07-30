	const_def 2 ; object constants
	const SHIP_ROCKET_1
	const SHIP_ROCKET_2
	const SHIP_ENTRANCE_1
	const SHIP_ROCKET_3
	const SHIP_CAPTAIN_R
	const SHIP_ROCKET_4
	const SHIP_ROCKET_5
	const SHIP_BURGLAR
	const SHIP_ITEMBALL
	const SHIP_IMPOSTER
	const SHIP_ITEMBALL_2

RocketShipBase_MapScripts:
	db 2 ; scene scripts
	scene_script .SceneRocketShipBaseGreetings ; SCENE_DEFAULT
	scene_script .SceneRocketShipBaseImposter ;

	db 1 ; callbacks	
	callback MAPCALLBACK_TILES, .CheckBasementKey


.CheckBasementKey:
	checkevent EVENT_USED_BASEMENT_KEY
	iffalse .LockBasementDoor
	return

.LockBasementDoor:
	changeblock 28,28, $28 ; locked door
	return

.SceneRocketShipBaseGreetings
	end

.SceneRocketShipBaseImposter
	end

RocketGreetingsScript:
	moveobject SHIP_ENTRANCE_1, 3, 7
	appear SHIP_ENTRANCE_1
	applymovement SHIP_ENTRANCE_1, Movement_StepUpToMeShip
	showemote EMOTE_SHOCK, SHIP_ENTRANCE_1, 25
	applymovement SHIP_ENTRANCE_1, Movement_StepUpToMeShip2
	opentext
	writetext NotGonnaStandByText
	waitbutton
	closetext
	winlosstext RocketEntranceShip_WinText, RocketEntranceShip_LossText
	loadtrainer GRUNTF, GRUNTF_2
	startbattle
	reloadmapafterbattle
	jump .returnfrombattleshipentrance
	
.returnfrombattleshipentrance
	opentext
	writetext RocketEntranceShip_AfterText
	waitbutton
	closetext
	applymovement SHIP_ENTRANCE_1, Movement_StepDownFromMeShip
	disappear SHIP_ENTRANCE_1
	setscene SCENE_VIRIDIAN_GYM_IMPOSTER
	end
	
ImposterAndCaptainScript:
	showemote EMOTE_SHOCK, SHIP_IMPOSTER, 15
	turnobject SHIP_IMPOSTER, DOWN
	opentext
	writetext ImposterGreetingText
	waitbutton
	closetext
	applymovement SHIP_IMPOSTER, ImposterWalksToMe
	opentext
	writetext ImposterGreetingText2
	waitbutton
	closetext
	turnobject SHIP_IMPOSTER, UP
	pause 15
	opentext
	writetext ImposterTellsCaptainText
	waitbutton
	closetext
	pause 15
	applymovement SHIP_IMPOSTER, ImposterWalksToCaptain
	opentext
	writetext CaptainBeckons
	waitbutton
	closetext
	pause 15
	applymovement PLAYER, PlayerWalksToCaptain
	jump CaptainRocketScript
	

BasementDoorScript::
	opentext
	checkevent EVENT_USED_BASEMENT_KEY
	iftrue .Open
	checkitem BASEMENT_KEY
	iftrue .Unlock
	writetext UnknownText_0x7c5b0
	waitbutton
	closetext
	end

.Unlock:
	playsound SFX_TRANSACTION
	writetext UnknownText_0x7c5d6
	waitbutton
	closetext
	changeblock 28, 28, $2b ; unlocked door
	reloadmappart
	closetext
	setevent EVENT_USED_BASEMENT_KEY
	end

.Open:
	writetext UnknownText_0x7c5c3
	waitbutton
	closetext
	end

TrainerGruntM11:
	trainer GRUNTM, GRUNTM_11, EVENT_BEAT_ROCKET_GRUNTM_11, GruntM11SeenText, GruntM11BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM11AfterBattleText
	waitbutton
	closetext
	end
	

TrainerGruntM13:
	trainer GRUNTM, GRUNTM_13, EVENT_BEAT_ROCKET_GRUNTM_13, GruntM13SeenText, GruntM13BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM13AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM22:
	trainer GRUNTM, GRUNTM_22, EVENT_BEAT_ROCKET_GRUNTM_22, GruntM22SeenText, GruntM22BeatenText, 0, .Script


.Script:
	setevent EVENT_ROCKET_KEY_DIALOGUE
	checkevent EVENT_USED_BASEMENT_KEY
	iftrue .HowdYouGetThat
	opentext
	writetext GruntM22AfterBattleText
	waitbutton
	closetext
	end

.HowdYouGetThat
	opentext
	writetext GruntM22HowdGetKey
	waitbutton
	closetext
	end


CaptainRocketScript:
	pause 15
	faceplayer
	opentext
	writetext CaptainRBeforeText
	waitbutton
	closetext
	pause 10
	turnobject SHIP_CAPTAIN_R, LEFT
	opentext
	writetext CaptainRTellsImposterOff
	waitbutton
	closetext
	showemote EMOTE_SHOCK, SHIP_IMPOSTER, 15
	turnobject SHIP_IMPOSTER, RIGHT
	opentext
	writetext ImposterOakIsShocked
	waitbutton
	closetext
	pause 15
	opentext
	writetext CaptainRTellsImposterOff2
	waitbutton
	closetext
	pause 15
	opentext
	writetext ImposterOakIsShocked2
	waitbutton
	closetext
	applymovement SHIP_IMPOSTER, ImposterLeavesRoom
	playsound SFX_EXIT_BUILDING
	disappear SHIP_IMPOSTER
	pause 5
	turnobject SHIP_CAPTAIN_R, DOWN
	opentext
	writetext CaptainRFinishesSpeech
	waitbutton
	closetext
	winlosstext CaptainRWinText, CaptainRLossText
	loadtrainer EXECUTIVEM, EXECUTIVEM_1
	startbattle
	reloadmapafterbattle
	opentext
	writetext CaptainRAfterText
	waitbutton
	closetext
	special FadeOutPalettes
	special HealParty
	pause 15
	setevent EVENT_ROUTE_5_6_POKEFAN_M_BLOCKS_UNDERGROUND_PATH
	clearevent EVENT_FLORIA_AT_FLOWER_SHOP
	setevent EVENT_PRYCE_IN_GYM
	setevent EVENT_HIDE_FROSTPOINT_PRYCE
	setmapscene ROUTE_104, SCENE_ROUTE33_NOTHING
	warp SUNPOINT_DOCKS, 13, 3
	end
	

TrainerGruntM25:
	trainer GRUNTM, GRUNTM_25, EVENT_BEAT_ROCKET_GRUNTM_25, GruntM25SeenText, GruntM25BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM25AfterBattleText
	waitbutton
	closetext
	end
	
TrainerGruntF3:
	trainer GRUNTF, GRUNTF_3, EVENT_BEAT_ROCKET_GRUNTF_3, GruntF3SeenText, GruntF3BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntF3AfterBattleText
	waitbutton
	closetext
	end
	

TrainerBurglarEddie:
	trainer BURGLAR, EDDIE, EVENT_BEAT_BURGLAR_EDDIE, BurglarEddieSeenText, BurglarEddieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BurglarEddieAfterBattleText
	waitbutton
	closetext
	end
	
RocketShipBaseSmokeBall:
	itemball SMOKE_BALL
	
RocketShipBaseAmuletCoin:
	itemball AMULET_COIN
	
TrashCanBoatScript:
	jumptext TrashCanBoatText

	
Movement_StepUpToMeShip:
	step UP
	step_end
	
Movement_StepUpToMeShip2:
	step UP
	step UP
	step UP
	step_end
	
Movement_StepDownFromMeShip:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end
	
ImposterWalksToMe:
	step DOWN
	;step LEFT
	;turn_head DOWN
	step_end
	
ImposterWalksToCaptain:
	step UP
	step UP
	step LEFT
	step LEFT
	step UP
	step UP
	step UP
	turn_head DOWN
	step_end
	
PlayerWalksToCaptain:
	step UP
	step UP
	step UP
	step_end
	
ImposterLeavesRoom:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step DOWN
	step_end
	
TrashCanBoatText:
	text "Hier gibt es"
	line "nichts…"
	done

GruntM22SeenText:
	text "Du bist weit ins"
	line "Schiff gekommen."

	para "Aber weiter"
	line "kommst du nicht!"
	done

GruntM22BeatenText:
	text "Das wird dem"
	line "KÄPT'N nicht"
	cont "gefallen…"
	done

GruntM22AfterBattleText:
    text "Du hast zwar"
    line "gewonnen, aber"
    cont "ohne SCHIFFÖFFNER"
    cont "kommst du nicht in"
    line "die KABINE des"
    cont "KÄPT'N!"

    para "Irgend ein anderes"
    line "Mitglied hat noch"
    cont "eventuell einen."

    para "Vielleicht hier"
    line "auf dem SCHIFF…"
    cont "oder auch nicht…"
    cont "…wer weiß?"

    para "Sobald der Rest"
    line "der Crew aus"
    cont "GLYPHONTIA zurück"
    cont "ist, sind wir weg!"
	done

GruntM11SeenText:
	text "Was machst du"
	line "hier?"

	para "Geh mir aus"
	line "dem Weg!"
	done

GruntM11BeatenText:
	text "Du stehst mir"
	line "im Weg!"
	done

GruntM11AfterBattleText:
    text "Ich mache hier"
    line "eigentlich nichts"
    cont "Wichtiges."

    para "Ich fahre einfach"
    line "nur gerne mit dem"
    cont "Schiff!"
	done

GruntM25SeenText:
    text "Ha! Ich wette, du"
    line "hast nicht mit mir"
    cont "hier gerechnet!"

    para "Pech gehabt, denn"
    line "hier bin ich!"
	done

GruntM25BeatenText:
    text "Ich bleibe wohl"
    line "lieber hier in"
    cont "diesem Schrank…"
	done

GruntM25AfterBattleText:
	text "Hier hinten nervt"
	line "mich niemand."
	done

GruntM13SeenText:
	text "Es ist mir egal,"
	line "wenn du dich"
	cont "verläufst."

	para "Du tauchst hier"
	line "auf, also bist du"
	cont "nur ein Opfer!"
	done

GruntM13BeatenText:
	text "Urk! Du glaubst,"
	line "du bist cool, häh?"
	done

GruntM13AfterBattleText:
    text "Du bist echt"
    line "eiskalt, TEAM"
    cont "ROCKET einfach zu"
    cont "beleidigen."
	done

UnknownText_0x7c5b0:
    text "Die Tür ist"
    line "verschlossen…"
	done

UnknownText_0x7c5c3:
	text "Die Tür ist offen."
	done

UnknownText_0x7c5d6:
	text "Der SCHIFFÖFFNER"
	line "öffnet die Tür."
	done

CaptainRBeforeText:
    text "Ich bin beein-"
    line "druckt, dass du es"
    cont "bis zu mir ge-"
    cont "schafft hast."

    para "Anscheinend konnte"
    line "meine Crew dich"
    cont "nicht aufhalten."

    para "Nutzlosr Haufen…"

    para "Unser Vorhaben"
    line "hier ist jedoch"
    cont "abgeschlossen."

    para "Unsere Operation"
    line "wird wie geplant"
    cont "weitergehen."
	done
	
CaptainRTellsImposterOff:
	text "PROF. EICH!"
	done
	
ImposterOakIsShocked:
	text "BETRÜGER EICH:"
	line "Jawohl, Sir!"
	done
	
CaptainRTellsImposterOff2:
    text "KÄPT'N: Du hast"
    line "deine Befehle."

    para "Lass uns allein."
	done
	
ImposterOakIsShocked2:
	text "BETRÜGER EICH:"
	line "Aye aye KÄPT'N!"
	done
	
CaptainRFinishesSpeech:
	text "…"

	para "Ich sehe, du hast"
	line "unseren BETRÜGER"
	para "EICH bereits"
	line "kennengelernt."

	para "Mir war klar, dass"
	line "du dich nicht"
	cont "von ihm täuschen"
	cont "lassen würdest."

	para "Aber dich brauchen"
	line "wir auch nicht zu"
	cont "überzeugen."

	para "Unsere Pläne gehen"
	line "dich nichts an."

	para "Vorlaute Kinder"
	line "müssen bestraft"
    cont "werden!"
	done

CaptainRWinText:
	text "Hmm…"
	para "Beeindruckend, für"
	line "ein Kind."
	done
	
CaptainRLossText:
	text "Ha!"
	done
	
CaptainRAfterText:
	text "Deine #MON sind"
	line "ziemlich stark…"

    para "Doch unsere"
    line "Lieferungen sind"
    cont "abgeschlossen."
	
	para "Wir haben alle"
	line "Materialien für"
	para "unsere ultimative"
	line "Waffe!"

	para "Bald werden wir"
	lien "die Kontrolle über"
	cont "alle #MON auf"
	cont "der Welt haben!"

	para "Lebwohl, Kind."

	para "Unsere Wege werden"
	line "sich sicher wieder"
	cont "kreuzen."
	done


NotGonnaStandByText:
	text "Ich sehe, du hast"
	line "unseren Türsteher"
	cont "vertrieben."


	para "Aber du bist"
	line "dümmer, als du"
	para "aussiehst, wenn du"
	line "denkst, ich lasse"
	para "dich einfach an"
	line "mir vorbei!"

	para "Versuch doch,"
	line "durchzuzukommen!"
	done
	
RocketEntranceShip_WinText:
	text "Du bist zäher, als"
	line "du aussiehst!"
	done
	
RocketEntranceShip_LossText:
	text "Ha!"
	done
	
RocketEntranceShip_AfterText:
	text "Argh!"

	para "Ich sollte den"
	line "KÄPT'N vor dir"
	cont "warnen."

	para "Er wird dafür"
	line "sorgen, dass du"
	para "dich nicht mehr in"
	line "unseren Angelegen-"
	cont "heiten einmischst!"
	done

GruntF3SeenText:
    text "Was hast du gegen"
    line "TEAM ROCKET?"
	done

GruntF3BeatenText:
    text "Unsere Pläne sind"
    line "immer noch größer,"
    cont "als du denkst!"
	done

GruntF3AfterBattleText:
    text "Wir sind eh gerade"
    line "dabei, von hier zu"
    cont "verschwinden."
	done


BurglarEddieSeenText:
    text "Psst! Ich gehöre"
    line "nicht zu TEAM"
    cont "ROCKET!"

    para "Ich suche nur"
    line "nach Beute."
	done

BurglarEddieBeatenText:
	text "Völlig drüber!"
	done

BurglarEddieAfterBattleText:
    text "Wenn ich von Bösen"
    line "klaue, macht mich"
    para "das dann zu einem"
    line "der Guten?"
	done
	
;Text_EndDemo:
;	text "Also, thanks a ton"
;	line "for playing!"
;	para "This point is"
;	line "where the demo"
;	cont "ends."
;	para "You've completed"
;	line "what's available"
;	cont "of the story."
;	para "But feel free to"
;	line "spend time"
;	para "exploring and"
;	line "catching #MON!"
;	para "I've got a few"
;	line "things for you"
;	para "that will make"
;	line "exploring easier."
;	para "HM02 FLY and the"
;	line "badge you need to"
;	cont "use it!"
;	done
	
;Text_ReceivedMineralBadgeDemo:
;	text "<PLAYER> received"
;	line "MINERALBADGE."
;	done
	
;Text_EndDemo2:
;	text "Alright, see ya!"
;	done
	
GruntM22HowdGetKey:
	text "Wie bist du an"
	line "den Schlüssel"
	line "gekommen?!"
	done
	
ImposterGreetingText:
	text "Na, wen haben wir"
	line "denn da?"
	done
	
ImposterGreetingText2:
    text "Erkennst du mich"
    line "denn nicht?"

    para "Ich bin es,"
    line "PROF. EICH!"

    para "Ich arbeite jetzt"
    line "mit TEAM ROCKET!"

    para "… Jaa, ich weiß,"
    line "du kaufst es mir"
    cont "nicht ab."
	done
	
ImposterTellsCaptainText:
    text "Hey, KÄPT'N!"
    line "Wir haben hier"
    cont "so 'nen Knirps!"

    para "Ich wette das ist"
    line "der, von dem wir"
    cont "ständig hören!"
	done
	
CaptainBeckons:
    text "KÄPT'N: Komm"
    line "her, du Wicht!"
	done

RocketShipBase_MapEvents:
	db 0, 0 ; filler

	db 17 ; warp events
	warp_event  3,  1, SUNPOINT_DOCKS, 3
	warp_event  3,  8, ROCKET_SHIP_BASE, 3
	warp_event 13,  1, ROCKET_SHIP_BASE, 2
	warp_event 13, 12, ROCKET_SHIP_BASE, 5
	warp_event 29,  1, ROCKET_SHIP_BASE, 4
	warp_event 33,  3, ROCKET_SHIP_BASE, 7
	warp_event  3, 18, ROCKET_SHIP_BASE, 6
	warp_event 35,  3, ROCKET_SHIP_BASE, 9
	warp_event 13, 24, ROCKET_SHIP_BASE, 8
	warp_event 19, 19, ROCKET_SHIP_BASE, 11
	warp_event  3, 34, ROCKET_SHIP_BASE, 10
	warp_event 25, 19, ROCKET_SHIP_BASE, 13
	warp_event 13, 34, ROCKET_SHIP_BASE, 12
	warp_event 29, 29, ROCKET_SHIP_BASE, 15
	warp_event 35, 22, ROCKET_SHIP_BASE, 14
	warp_event 39, 22, ROCKET_SHIP_BASE, 14
	warp_event  2, 18, ROCKET_SHIP_BASE, 6

	db 2 ; coord events
	coord_event  3,  2, SCENE_DEFAULT, RocketGreetingsScript
	coord_event 35, 21, SCENE_VIRIDIAN_GYM_IMPOSTER, ImposterAndCaptainScript

	db 2 ; bg events
	bg_event 29, 29, BGEVENT_READ, BasementDoorScript
	bg_event 29,  7, BGEVENT_READ, TrashCanBoatScript


	db 11 ; object events
	object_event 11,  3, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM11, -1
	object_event 31,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM13, -1
	object_event -6,  2, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 28, 30, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM22, -1
	object_event 35, 15, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CaptainRocketScript, -1
	object_event  3, 16, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM25, -1
	object_event  1, 26, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerGruntF3, -1
	object_event 26, 23, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerBurglarEddie, -1
	object_event  4, 26, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RocketShipBaseSmokeBall, EVENT_GOLDENROD_UNDERGROUND_SWITCH_ROOM_ENTRANCES_SMOKE_BALL
	object_event 35, 19, SPRITE_IMPOSTER_OAK, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  1, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RocketShipBaseAmuletCoin, EVENT_OLIVINE_LIGHTHOUSE_6F_SUPER_POTION



