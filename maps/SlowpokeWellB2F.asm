	const_def 2 ; object constants
	const SLOWPOKEB2F_SILVER
	const SLOWPOKEB2F_BLUE
	const SLOWPOKEB2F_OAK
	const SLOWPOKEB2F_ROCKET1
	const SLOWPOKEB2F_ROCKET2
	const SLOWPOKEB2F_ROCKET3
	const SLOWPOKEB2F_GYM_GUY
	const SLOWPOKEB2F_ELDER

SlowpokeWellB2F_MapScripts:
	db 2 ; scene scripts
	scene_script .SceneSlowpoke2Rockets ; SCENE_DEFAULT
	scene_script .SceneSlowpoke2Nothing ; SCENE_SLOWPOKE2_NOTHING

	db 0 ; callbacks
	
.SceneSlowpoke2Rockets
	end
	
.SceneSlowpoke2Nothing
	end

RocketEncounterScript:
	turnobject SLOWPOKEB2F_BLUE, DOWN
	showemote EMOTE_SHOCK, SLOWPOKEB2F_BLUE, 15
	opentext
	writetext BlueProblemText
	waitbutton
	closetext
	applymovement PLAYER, TwoStepsUpMovement
	turnobject SLOWPOKEB2F_BLUE, UP
	applymovement SLOWPOKEB2F_OAK, OakStepUpMovement
	opentext
	writetext OakStopThisText
	waitbutton
	closetext
	applymovement SLOWPOKEB2F_OAK, OakStepBackMovement
	showemote EMOTE_SHOCK, SLOWPOKEB2F_ROCKET2, 15
	opentext
	writetext WeDoWhatWeWantText
	waitbutton
	closetext
	showemote EMOTE_SHOCK, SLOWPOKEB2F_SILVER, 15
	opentext
	writetext WeAreAllTrainersText
	waitbutton
	closetext
	showemote EMOTE_SHOCK, SLOWPOKEB2F_ROCKET3, 15
	opentext
	writetext WellSeeText
	waitbutton
	closetext
	applymovement SLOWPOKEB2F_ROCKET1, RocketWalksToBlue
	applymovement SLOWPOKEB2F_ROCKET2, RocketWalksToMe
	applymovement SLOWPOKEB2F_ROCKET3, RocketWalksToSilver
	winlosstext GruntM4SeenText, GruntM4BeatenText
	loadtrainer GRUNTM, GRUNTM_4
	startbattle
	reloadmapafterbattle
	jump .returnfrombattle

.returnfrombattle
	opentext
	writetext RocketsPlan
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear SLOWPOKEB2F_ROCKET1
	disappear SLOWPOKEB2F_ROCKET2
	disappear SLOWPOKEB2F_ROCKET3
	pause 15
	special FadeInQuickly
	pause 15
	applymovement SLOWPOKEB2F_OAK, OakSteptoSpeech
	pause 30
	applymovement SLOWPOKEB2F_OAK, OakReadyForSpeech
	opentext
	writetext OakSpeechText
	waitbutton
	closetext
	applymovement SLOWPOKEB2F_OAK, OakLeavesMovement
	turnobject SLOWPOKEB2F_BLUE, RIGHT
	turnobject PLAYER, LEFT
	turnobject SLOWPOKEB2F_SILVER, LEFT
	opentext
	writetext BlueOutText
	waitbutton
	closetext
	turnobject PLAYER, DOWN
	turnobject SLOWPOKEB2F_SILVER, DOWN
	applymovement SLOWPOKEB2F_BLUE, BlueLeavesMovement
	turnobject SLOWPOKEB2F_SILVER, LEFT
	turnobject PLAYER, RIGHT
	opentext
	writetext SilverOutText
	waitbutton
	closetext
	turnobject PLAYER, DOWN
	applymovement SLOWPOKEB2F_SILVER, SilverLeavesMovement
	disappear SLOWPOKEB2F_BLUE
	disappear SLOWPOKEB2F_OAK
	disappear SLOWPOKEB2F_SILVER
	applymovement SLOWPOKEB2F_ELDER, EldertoPlayerMovement
	turnobject PLAYER, UP
	opentext
	writetext ElderThisSurfText
	waitbutton
	verbosegiveitem HM_SURF
	setevent EVENT_GOT_HM03_SURF
	writetext ElderThisSurfText2
	waitbutton
	closetext
	applymovement SLOWPOKEB2F_ELDER, EldertExitMovement
	disappear SLOWPOKEB2F_ELDER
	turnobject PLAYER, DOWN
	setevent EVENT_RIVAL_BURNED_TOWER
	setevent EVENT_TEKNOS_BRIDGE_REPAIRED
	setscene SCENE_SLOWPOKE2_NOTHING
	setmapscene OAKS_LAB_ENTRANCE, SCENE_OAK_ENTRANCE_NOTHING
	clearevent EVENT_EXPLODING_TRAP_21
	clearevent EVENT_BIRDON_AIDE_HIDDEN
	end
	
OakLeavesMovement:
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end
	
SilverLeavesMovement:
	step DOWN
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end
	
BlueLeavesMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

OakSteptoSpeech:
	step UP
	step UP
	step_end

OakReadyForSpeech:
	step RIGHT
	step RIGHT
	turn_head DOWN
	step_end

TwoStepsUpMovement:
	step UP
	step RIGHT
	step UP
	step_end

OakStepUpMovement:
	step UP
	step_end
	
OakStepBackMovement:
	fix_facing
	step DOWN
	remove_fixed_facing
	step_end
	
RocketWalksToSilver:
	step DOWN
	step DOWN
	step_end
	
RocketWalksToBlue:
	step DOWN
	step RIGHT
	step DOWN
	step_end
	
RocketWalksToMe:
	step DOWN
	step LEFT
	step DOWN
	step_end
	
OneStepUp:
	step UP
	step_end
	
EldertoPlayerMovement:
	slow_step DOWN
	slow_step DOWN
	slow_step DOWN
	slow_step DOWN
	step_end
	
EldertExitMovement:
	slow_step LEFT
	slow_step DOWN
	slow_step DOWN
	slow_step DOWN
	slow_step DOWN
	slow_step DOWN
	slow_step DOWN
	slow_step DOWN
	step_end

SlowpokeWellB2FGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_KINGS_ROCK_IN_SLOWPOKE_WELL
	iftrue .GotKingsRock
	writetext SlowpokeWellB2FGymGuyText
	buttonsound
	verbosegiveitem KINGS_ROCK
	iffalse .NoRoom
	setevent EVENT_GOT_KINGS_ROCK_IN_SLOWPOKE_WELL
.NoRoom:
	closetext
	end

.GotKingsRock:
	writetext SlowpokeWellB2FGymGuyText_GotKingsRock
	waitbutton
	closetext
	end

SlowpokeWellB2FGymGuyText:
	text "Ich warte darauf,"
	line "dass sich FLEGMON"
	cont "entwickelt."

	para "Aufgrund meiner"
	line "Beobachtungen"
	cont "habe ich eine"
	cont "neue Entdeckung"
	cont "gemacht."

	para "Trägt FLEGMON"
	line "einen KING-STEIN"
	cont "wird es oft von"
	cont "einem BISTURBAN"
	cont "gebissen."

	para "Hier, ich gebe"
	line "dir einen von"
	cont "meinen."
	done

SlowpokeWellB2FGymGuyText_GotKingsRock:
	text "Ich werde mich wie"
	line "FLEGMON verhalten."

	para "Ich werde geduldig"
	line "abwarten, bis es"
	cont "sich entwickelt."
	done
	
OakSpeechText:
    text "EICH: Tja…"

    para "Dieser Forschungs-"
    line "ausflug lief nicht"
    cont "wie geplant…"

    para "Wie dem auch sei…"

    para "Wir haben die"
    line "FLEGMON gerettet."

    para "Jetzt können sie"
    line "leben, ohne dass"
    cont "TEAM ROCKET ihnen"
    cont "an die RUTEN will."

    para "Aber dass TEAM"
    line "ROCKET wieder"
    cont "zurück ist…"

    para "Was können sie nur"
    line "im Schilde führen?"

    para "BLAU, wir sollten"
    line "am besten zurück"
    cont "ins Labor um mehr"
    cont "darüber herauszu-"
    cont "finden."
	
	para "<PLAY_G>, <RIVAL>!"
    line "Ihr beiden solltet"
    cont "weitermachen und"
    cont "eure Reise fort-"
    cont "setzen."

    para "Wenn ihr mich"
    line "braucht, wisst ihr"
    cont "ja, wo ihr mich"
    cont "finden könnt."
	done
	
BlueOutText:
    text "BLAU: Danke für"
    line "eure Hilfe heute,"
    cont "Leute."

    para "Hoffentlich können"
    line "Opa und ich zusam-"
    cont "men herausfinden,"
    cont "was diese Leute"
    cont "Übles planen."
	done
	
SilverOutText:
    text "<RIVAL>: Bis dann,"
	line "<PLAY_G>!"
	
    para "Lass dich nicht"
    line "abhängen!"
	done

RocketsPlan:
	text "Hmpf!"
	
	para "Das ist nicht"
    line "weiter schlimm."

    para "Wir sind mit unse-"
    line "rem Plan schon so"
    cont "weit, da macht ein"
    cont "kleiner Rückschlag"
    cont "nichts mehr aus!"

    para "Schon bald werden"
    line "alle die Früchte"
    cont "unserer Arbeit"
    cont "sehen, wenn alle"
    cont "#MON unter der"
    cont "Kontrolle von TEAM"
    cont "ROCKET stehen!"

    para "Team, Rückzug!"
	done

GruntM4SeenText:
    text "ARGH! Besiegt von"
    line "ein paar Kindern?!"
	done

GruntM4BeatenText:
    text "Ha! Hab's dir"
    line "doch gesagt!"
	done

WeDoWhatWeWantText:
    text "TEAM ROCKET wird"
    line "tun, was es will!"

    para "Ihr könnt uns"
    line "nicht aufhalten!"
	done
	
WeAreAllTrainersText:
    text "<RIVAL>: BLAU,"
    line "<PLAY_G> und ich"
    cont "sind Trainer!"

    para "Wie könnten euch"
    line "auf jeden Fall"
    cont "aufhalten!"

    para "Mein #MON sind"
    line "stärker als alle"
    cont "anderen!"
	done
	
WellSeeText:
    text "Ha!"

    para "Das werden wir ja"
    line "sehen!"
	done

BlueProblemText:
    text "BLAU: <PLAY_G>!"
    line "Zum Glück sind du"
    cont "und <RIVAL> noch"
    cont "aufgetaucht!"

    para "Wir haben hier"
    line "ein Problem!"
	done

OakStopThisText:
    text "EICH: Ihr tut"
    line "diesen unschuldi-"
    cont "gen FLEGMON weh!"

    para "Es ist nicht in"
    line "Ordnung, ihnen die"
    cont "RUTEN abzuschnei-"
    cont "den, um sie dann"
    cont "zu verkaufen!"
	done
	
ElderThisSurfText:
	text "Ah!"
	
	para "Danke, dass du die"
	line "FLEGMON gerettet"
	cont "hast!"

	para "Ich bin der Dorf-"
	line "vorsteher."

	para "Ich war gerade"
	line "dabei, den FLEGMON"
	cont "einen Besuch abzu-"
    cont "statten, als diese"
    cont "drei Schläger auf-"
    cont "getaucht sind."

    para "Sie haben damit"
    line "begonnen, den"
    cont "FLEGMON die RUTEN"
    cont "abzuschneiden!"

    para "Ich wollte sie"
    line "gerade verjagen,"
    cont "aber dann kamst du"
    cont "und hast mir die"
    cont "Arbeit abgenommen."

    para "Ich muss mich bei"
    line "dir bedanken…"

    para "Bitte nimm dies,"
    line "keine Widerrede."
	done
	
ElderThisSurfText2:
    text "Diese VM enthält"
    line "SURFER."

	para "Sie erlaubt deinen"
	line "#MON, jedes"
	cont "Gewässer zu"
	cont "überqueren."

	para "Möge sie dir gute"
	line "Dienste leisten."

	para "Ich werde jetzt"
    line "zurück nach Hause"
    cont "gehen."

    para "Auf Wiedersehen."
	done

SlowpokeWellB2F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  8, 15, SLOWPOKE_WELL_B1F, 2

	db 1 ; coord events
	coord_event  9, 10, SCENE_DEFAULT, RocketEncounterScript
	

	db 0 ; bg events

	db 9 ; object events
	object_event 11,  8, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_BURNED_TOWER
	object_event  9,  8, SPRITE_BLUE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_BURNED_TOWER
	object_event  8,  8, SPRITE_OAK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_BURNED_TOWER
	object_event  8,  5, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_BURNED_TOWER
	object_event 12,  5, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_BURNED_TOWER
	object_event 10,  5, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_BURNED_TOWER
	object_event  4,  2, SPRITE_GYM_GUY, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SlowpokeWellB2FGymGuyScript, EVENT_EXPLODING_TRAP_21
	object_event 10,  3, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_GOT_HM03_SURF