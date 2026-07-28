	const_def 2 ; object constants
	const AQUA1F_RECEPTIONIST
	const AQUA1F_ROCKET2
	const AQUA1F_ROCKETF1
	const AQUA1F_YOUNGSTER
	const AQUA1F_LASS
	const AQUA1F_WHITNEY
	const AQUA1F_ROCKET3
	const AQUA1F_ROCKETF2
	const AQUA1F_ROCKET4
	const AQUA1F_ROCKETF22 ;fighting whitney
	const AQUA1F_ROCKET42 ;fighting whitney
	const AQUA1F_TEST ;fighting whitney

TeknosAquarium1F_MapScripts:
	db 1 ; scene scripts
	scene_script .SceneWhitneyEnters 

	db 0 ; callbacks
	

.SceneWhitneyEnters:
	priorityjump .WhitneyEntersEvent
	end	


.WhitneyEntersEvent
	pause 15
	playsound SFX_ENTER_DOOR
	moveobject AQUA1F_WHITNEY, 13, 7
	appear AQUA1F_WHITNEY
	turnobject AQUA1F_WHITNEY, UP
	applymovement AQUA1F_WHITNEY, WhitneyDummyMovement
	pause 15
	applymovement AQUA1F_WHITNEY, WhitneyToCenter
	opentext
	writetext WhitneyThisisTerribleText
	waitbutton
	closetext
	pause 6
	turnobject AQUA1F_WHITNEY, RIGHT
	pause 6
	turnobject AQUA1F_WHITNEY, UP
	pause 6
	turnobject AQUA1F_WHITNEY, DOWN
	pause 6
	showemote EMOTE_SHOCK, AQUA1F_WHITNEY, 15
	applymovement AQUA1F_WHITNEY, WhitneyToPlayer
	opentext
	writetext WhitneyIRememberYouText
	waitbutton
	closetext
	applymovement AQUA1F_WHITNEY, WhitneyToRockets
	showemote EMOTE_SHOCK, AQUA1F_ROCKET3, 15
	turnobject AQUA1F_WHITNEY, UP
	applymovement AQUA1F_ROCKET4, RocketMtoWhitney
	turnobject AQUA1F_ROCKET4, UP
	turnobject AQUA1F_WHITNEY, DOWN
	applymovement AQUA1F_ROCKETF2, RocketFtoWhitney
	turnobject AQUA1F_WHITNEY, LEFT
	opentext
	writetext WhitneyWontGoEasyOnYouText
	waitbutton
	closetext
	appear AQUA1F_ROCKETF22
	appear AQUA1F_ROCKET42
	appear AQUA1F_TEST
	disappear AQUA1F_ROCKETF2
	disappear AQUA1F_ROCKET4
	disappear AQUA1F_WHITNEY
	setscene SCENE_AQUARIUM_ROCKET_TAKEOVER_1F_NOTHING
	clearevent WHITNEY_FIGHTING_ROCKETS
	setevent EVENT_AQUARIUM_ROCKETS_IDLE
	end

	
WhitneyDummyMovement:
	step_end
	
	
WhitneyToCenter:
	step UP
	step UP
	step LEFT
	step_end
	
WhitneyToPlayer:
	step DOWN
	step_end
	
WhitneyToRockets:
	step UP
	step LEFT
	step LEFT
	step_end
	
RocketMtoWhitney:
	big_step RIGHT
	big_step RIGHT
	step RIGHT
	step_end
	
RocketFtoWhitney:
	big_step RIGHT
	big_step RIGHT
	step_end

TrainerGruntM2:
	trainer GRUNTM, GRUNTM_2, EVENT_BEAT_ROCKET_GRUNTM_2, GruntM2SeenText, GruntM2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM2AfterBattleText
	waitbutton
	closetext
	end
	
TrainerGruntF1:
	trainer GRUNTF, GRUNTF_1, EVENT_BEAT_ROCKET_GRUNTF_1, GruntF1SeenText, GruntF1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntF1AfterBattleText
	waitbutton
	closetext
	end
	
AquaReceptionistScript:
	faceplayer
	opentext
	checkevent EVENT_AQUARIUM_ROCKET_TAKEOVER_ACTIVE
	iftrue .ReceptionistNoRockets
	writetext AquaReceptionistRocketsText
	waitbutton
	closetext
	end

.ReceptionistNoRockets:
	writetext AquaReceptionistNoRocketsText
	waitbutton
	closetext
	end
	
AquaYoungsterScript:
	faceplayer
	opentext
	checkevent EVENT_AQUARIUM_ROCKET_TAKEOVER_ACTIVE
	iftrue .YoungsterNoRockets
	writetext AquaYoungsterRocketsText
	waitbutton
	closetext
	end

.YoungsterNoRockets:
	writetext AquaYoungsterNoRocketsText
	waitbutton
	closetext
	end
	
AquaLassScript:
	faceplayer
	opentext
	checkevent EVENT_AQUARIUM_ROCKET_TAKEOVER_ACTIVE
	iftrue .LassNoRockets
	writetext AquaLassRocketsText
	waitbutton
	closetext
	end

.LassNoRockets:
	writetext AquaLassNoRocketsText
	waitbutton
	closetext
	end
	
Aqua1FExhibit1Script:
	jumptext Aqua1FExhibit1Text
	
Aqua1FExhibit2Script:
	jumptext Aqua1FExhibit2Text
	
Aqua1FExhibit3Script:
	jumptext Aqua1FExhibit3Text
	
Aqua1FExhibit4Script:
	jumptext Aqua1FExhibit4Text
	
WhitneyAquariumScript:
	jumptext WhitneyIwillHandlethisText
	
RocketGruntWhitney1Script:
	jumptext RocketGruntWhitney1Text
	
RocketGruntWhitney2Script:
	jumptext RocketGruntWhitney2Text
	
RocketGruntWhitney3Script:
	jumptext RocketGruntWhitney3Text
	
Aqua1FExhibit1Text:
	text "KRABBY verstecken"
	line "sich gerne im"
	cont "Sand."

	para "Sieh genau hin,"
	line "um das vergrabene"
	cont "#MON zu finden."
	done
	
Aqua1FExhibit2Text:
	text "NEUE AUSSTELLUNG"
	line "DEMNÄCHST"
	done

Aqua1FExhibit3Text:
	text "MOLAMBINO und"
	line "KARPADOR teilen"
	cont "sich friedlich"
	cont "ihren Lebensraum."

	para "Diese #MON"
	line "wohnen oft in den"
	cont "gleichen Wässern."
	done
	
GruntM2SeenText:
	text "Wir kommen hier"
	line "rein, nehmen uns,"
	cont "was wir wollen,"
	cont "und verkaufen es!"

	para "Wir brauchen das"
	line "Geld für unsere"
	cont "großen Pläne!"
	done

GruntM2BeatenText:
	text "Einfach…"
	line "Zu stark…"
	done

GruntM2AfterBattleText:
    text "Du wirst noch mehr"
    line "von uns zu sehen!"
	done

Aqua1FExhibit4Text:
	text "LAPRAS-STATUE"

	para "Es gibt Berichte,"
	line "dass LAPRAS tief"
	cont "in den MINEN im"
	cont "Westen der Stadt"
	cont "leben sollen."
	done

AquaReceptionistRocketsText:
	text "Vorsicht! Kinder"
	line "sollten jetzt"
	cont "nicht hier sein."

	para "Wir haben gerade"
	line "ein Problem mit"
	cont "gefährlichen"
	cont "Kriminellen."
	done

AquaReceptionistNoRocketsText:
	text "Willkommen im"
	line "AQUARIUM von"
	cont "TEKNOPIA CITY!"

	para "Sieh dich gerne"
	line "um."
	done

GruntF1SeenText:
	text "Hier gibt es"
	line "seltene #MON,"
	cont "die wir stehlen"
	cont "und verkaufen"
	cont "können!"

	para "Steh uns nicht im"
	line "Weg, Kind!"
	done

GruntF1BeatenText:
	text "Verdammtes Balg!"
	done

GruntF1AfterBattleText:
	text "TEAM ROCKET wird"
	line "das nicht"
	cont "vergessen!"
	done

WhitneyThisisTerribleText:
	text "Oh nein! Das ist"
	line "schrecklich!"
	done

WhitneyIRememberYouText:
    text "Hey! Wir kennen"
    line "uns doch aus den"
    cont "MINEN!"

    para "Hör zu…"

    para "TEAM ROCKET"
    line "versucht, das"
    cont "AQUARIUM zu"
    cont "übernehmen!"

    para "Diese Fieslinge!"

    para "Als ARENALEITERIN"
    line "kann ich das nicht"
    cont "zulassen."

    para "Hilfst du mir, sie"
    line "zu vertreiben?"

    para "Ihr Anführer ist"
    line "bestimmt im"
    cont "Obergeschoss…"

    para "Machen wir sie"
    line "fertig!"
	done

WhitneyWontGoEasyOnYouText:
	text "…kicher…"

	para "Erwartet nicht,"
	line "dass ich es euch"
    cont "leicht mache, nur"
    cont "weil ich süß bin!"
	done

WhitneyIwillHandlethisText:
    text "Ich kümmere mich"
    line "um diese Typen…"

    para "Hol du dir den"
    line "Anführer!"
	done

AquaYoungsterRocketsText:
	text "Hmm… Ich glaube"
	line "nicht, dass diese"
	cont "Typen in Schwarz"
	cont "hier sein sollten…"
	done

AquaYoungsterNoRocketsText:
    text "Ich habe gehofft,"
    line "hier ein echtes"
    cont "ANKORASCH sehen zu"
    cont "können, aber es"
    cont "gibt hier keins."
	done
	
AquaLassRocketsText:
	text "Huch!"

	para "Oh, du gehörst"
	line "nicht zu denen."

	para "Diese Leute machen"
	line "mir Angst."

	para "Ich sollte wohl"
	line "besser gehen."
	done

AquaLassNoRocketsText:
	text "Dieses AQUARIUM"
	line "ist noch relativ"
	cont "neu, deshalb gibt"
	cont "es hier auch noch"
	cont "nicht so viele"
	cont "Exponate."
	done
	
RocketGruntWhitney1Text:
	text "Verzieh dich,"
	line "du Göre!"
	done
	
RocketGruntWhitney2Text:
    text "Für wen hälst du"
    line "dich eigentlich?"

    para "Such dir 'nen"
    line "anderen Ort zum"
    cont "Ausrauben!"
	done
	
RocketGruntWhitney3Text:
	text "Aah!"

	para "Sie ist süß, aber"
	line "auch knallhart!"

	para "Vor allem dieses"
	line "MILTANK."
	done

TeknosAquarium1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 12,  7, TEKNOS_CITY, 5
	warp_event 13,  7, TEKNOS_CITY, 6
	warp_event  0,  7, TEKNOS_AQUARIUM_2F, 1

	db 0 ; coord events

	db 4 ; bg events
	bg_event  1,  3, BGEVENT_READ, Aqua1FExhibit1Script
	bg_event  7,  3, BGEVENT_READ, Aqua1FExhibit2Script
	bg_event 10,  3, BGEVENT_READ, Aqua1FExhibit3Script
	bg_event  4,  1, BGEVENT_READ, Aqua1FExhibit4Script


	db 12 ; object events
	object_event 15,  5, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AquaReceptionistScript, -1
	object_event  7,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM2, EVENT_AQUARIUM_ROCKET_TAKEOVER_ACTIVE
	object_event  5,  7, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerGruntF1, EVENT_AQUARIUM_ROCKET_TAKEOVER_ACTIVE
	object_event 13,  2, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AquaYoungsterScript, -1
	object_event  3,  5, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AquaLassScript, -1
	object_event 10,  5, SPRITE_WHITNEY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, WhitneyAquariumScript, WHITNEY_FIGHTING_ROCKETS
	object_event 10,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RocketGruntWhitney1Script, EVENT_AQUARIUM_ROCKET_TAKEOVER_ACTIVE
	object_event  7,  5, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RocketGruntWhitney2Script, EVENT_AQUARIUM_ROCKETS_IDLE
	object_event  7,  6, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RocketGruntWhitney3Script, EVENT_AQUARIUM_ROCKETS_IDLE
	object_event  9,  5, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RocketGruntWhitney2Script, WHITNEY_FIGHTING_ROCKETS
	object_event 10,  6, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RocketGruntWhitney3Script, WHITNEY_FIGHTING_ROCKETS
	object_event 10,  5, SPRITE_WHITNEY, SPRITEMOVEDATA_STANDING_LEFT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, WhitneyAquariumScript, WHITNEY_FIGHTING_ROCKETS
