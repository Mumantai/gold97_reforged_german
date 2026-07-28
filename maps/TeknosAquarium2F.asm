	const_def 2 ; object constants
	const AQUA2F_ROCKET1
	const AQUA2F_ROCKET3
	const AQUA2F_POKEFAN_M
	const AQUA2F_POKEFAN_F
	const AQUA2F_WHITNEY

TeknosAquarium2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


TrainerGruntM1:
	trainer GRUNTM, GRUNTM_1, EVENT_BEAT_ROCKET_GRUNTM_1, GruntM1SeenText, GruntM1BeatenText, 0, .Script

.Script:
	clearevent WHITNEY_DEFEATS_ROCKETS
	opentext
	writetext TrainerGruntM1WhenTalkText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear AQUA2F_ROCKET1
	disappear AQUA2F_ROCKET3
	pause 15
	special FadeInQuickly
	clearflag ENGINE_ROCKETS_IN_MAHOGANY
	pause 8
	special PlayMapMusic
	setevent EVENT_AQUARIUM_ROCKET_TAKEOVER_ACTIVE
	setevent EVENT_WHITNEY_IN_BOULDER_MINES
	setevent EVENT_WHITNEY_BACK_IN_GYM
	setevent WHITNEY_FIGHTING_ROCKETS
	appear AQUA2F_WHITNEY
	applymovement AQUA2F_WHITNEY, WhitneyToPlayerAfterRocket
	turnobject AQUA2F_WHITNEY, UP
	turnobject PLAYER, DOWN
	opentext
	writetext WhitneyWayToGoText
	waitbutton
	closetext
	applymovement AQUA2F_WHITNEY, WhitneyAwayfromPlayerAfterRocket
	disappear AQUA2F_WHITNEY
	setevent WHITNEY_DEFEATS_ROCKETS
	end
	
	
WhitneyToPlayerAfterRocket:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end
	
WhitneyAwayfromPlayerAfterRocket:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

TrainerGruntM3:
	trainer GRUNTM, GRUNTM_3, EVENT_BEAT_ROCKET_GRUNTM_3, GruntM3SeenText, GruntM3BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM3AfterBattleText
	waitbutton
	closetext
	end

AquaPokefanMScript:
	faceplayer
	opentext
	checkevent EVENT_AQUARIUM_ROCKET_TAKEOVER_ACTIVE
	iftrue .PokefanMNoRockets
	writetext AquaPokefanMRocketsText
	waitbutton
	closetext
	end

.PokefanMNoRockets:
	writetext AquaPokefanMNoRocketsText
	waitbutton
	closetext
	end
	
AquaPokefanFScript:
	faceplayer
	opentext
	checkevent EVENT_AQUARIUM_ROCKET_TAKEOVER_ACTIVE
	iftrue .PokefanFNoRockets
	writetext AquaPokefanFRocketsText
	waitbutton
	closetext
	end

.PokefanFNoRockets:
	writetext AquaPokefanFNoRocketsText
	waitbutton
	closetext
	end
	
Aqua2FExhibit1Script:
	jumptext Aqua2FExhibit1Text

Aqua2FExhibit2Script:
	jumptext Aqua2FExhibit2Text
	
Aqua2FExhibit3Script:
	jumptext Aqua2FExhibit3Text
	
Aqua2FExhibit1Text:
	text "GOLUPPY gehören zu"
	line "den kleinsten"
	cont "Wasser-#MON."
	done

WhitneyWayToGoText:
	text "Gut gemacht,"
	line "<PLAY_G>!"

	para "Du hast es ihnen"
	line "echt gezeigt!"

	para "TEAM ROCKET wird"
	line "diesen Wasser-"
	cont "#MON nichts"
	cont "mehr antun."

	para "Hey…"

	para "Du bist ja echt"
	line "ziemlich stark!"

	para "Schau doch später"
	line "mal in meiner"
	cont "ARENA vorbei!"

	para "Ich würde gerne"
	line "gegen dich"
	cont "kämpfen!"

	para "Wo wir gerade"
	line "dabei sind: Ich"
	cont "sollte langsam"
	cont "mal zurück!"

	para "Wir sehen uns!"
	done
	

Aqua2FExhibit2Text:
	text "NEUE AUSSTELLUNG"
	line "DEMNÄCHST"
	done
	
Aqua2FExhibit3Text:
	text "BISTURBAN können"
	line "an Land und unter"
	cont "Wasser leben."

	para "Sie haben eine"
	line "enge Beziehung zur"
	cont "FLEGMON-Familie."
	done

GruntM1SeenText:
	text "Was willst du?"

	para "Wer uns bei der"
	line "Arbeit stört, kann"
	cont "keine Gnade"
	cont "erwarten!"
	done

GruntM1BeatenText:
    text "Dieses Mal warst"
    line "du OK, aber das"
    cont "nächste Mal, bist"
    cont "du dran!"
	done

TrainerGruntM1WhenTalkText:
    text "Verflixt!"

    para "Ich kann es nicht"
    line "glauben."

    para "Unser Plan wurde"
    line "von einem Kind"
    cont "durchkreuzt!"

    para "Wie peinlich…"

    para "Aber egal."

    para "Es gibt genügend"
    line "Möglichkeiten für"
    cont "uns, Geld zu"
    cont "verdienen."

    para "Du hast uns noch"
    line "nicht zum letzten"
    cont "Mal gesehen!"
	done
	

GruntM3SeenText:
	text "Wir zeigen dir,"
	line "wie furchteinflö-"
	cont "ßend wir sind!"
	done

GruntM3BeatenText:
	text "Zu stark!"

	para "Wir behalten dich"
	line "im Auge…"
	done

GruntM3AfterBattleText:
	text "Du bist zu stark."

	para "Unser Vorhaben"
	line "hier ist eh nicht"
	cont "der wichtigste"
	cont "Teil des Plans."

	para "Du bist lediglich"
	line "ein Stolperstein."
	done
	
AquaPokefanMRocketsText:
	text "Ich finde, diese"
	line "Unruhestifter"
	cont "gehören hier"
	cont "nicht her."
	done
	
AquaPokefanMNoRocketsText:
	text "Gehörten diese"
	line "Leute echt zu"
	cont "TEAM ROCKET?"

	para "Ich dachte, man"
	line "hätte sich letztes"
	cont "Jahr schon um die"
	cont "gekümmert."
	done
	
AquaPokefanFRocketsText:
    text "Oh man, das sollte"
    line "doch ein ruhiger"
    cont "Tag werden."
	done
	
AquaPokefanFNoRocketsText:
	text "Ich mochte Fische"
	line "eh nie besonders."
	done

TeknosAquarium2F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  0,  7, TEKNOS_AQUARIUM_1F, 3

	db 0 ; coord events

	db 3 ; bg events
	bg_event  3,  3, BGEVENT_READ, Aqua2FExhibit1Script
	bg_event  7,  3, BGEVENT_READ, Aqua2FExhibit2Script
	bg_event 11,  3, BGEVENT_READ, Aqua2FExhibit3Script

	db 5 ; object events
	object_event 15,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 0, TrainerGruntM1, EVENT_AQUARIUM_ROCKET_TAKEOVER_ACTIVE
	object_event  5,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 4, TrainerGruntM3, EVENT_AQUARIUM_ROCKET_TAKEOVER_ACTIVE
	object_event  7,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, AquaPokefanMScript, -1
	object_event 10,  4, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AquaPokefanFScript, -1
	object_event  9,  5, SPRITE_WHITNEY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, WhitneyAquariumScript, WHITNEY_DEFEATS_ROCKETS
