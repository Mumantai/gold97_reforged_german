	const_def 2 ; object constants
	const ROUTE102_YOUNGSTER1
	const ROUTE102_YOUNGSTER2
	const ROUTE102_LASS1
	const ROUTE102_FRUIT_TREE
	const ROUTE102_ARTHUR
	const ROUTE102_SILVER
	const ROUTE102_YOUNGSTER3
	const ROUTE102_YOUNGSTER4
	const ROUTE102_BUG_CATCHER
	const ROUTE102_FISHER1
	const ROUTE102_FISHER2


Route102_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_ROUTE102_NOTHING
	scene_script .DummyScene1 ; SCENE_ROUTE102_SILVER

	db 3 ; callbacks
	callback MAPCALLBACK_OBJECTS, .ArthurCallback
	callback MAPCALLBACK_NEWMAP, .CheckMomCall
	callback MAPCALLBACK_TILES, .Route35ClearTree
	
.Route35ClearTree
	checkevent EVENT_ROUTE36_GARDENER
	iftrue .Done
	changeblock  33, 07, $07 ; tree
.Done:
	return

.CheckMomCall:
	checkevent EVENT_TALKED_TO_MOM_AFTER_GETTING_POKEDEX
	iffalse .DoMomCall
	return

.DoMomCall:
	specialphonecall SPECIALCALL_WORRIED
	return

.DummyScene0:
	end

.DummyScene1:
	end

.ArthurCallback:
	checkcode VAR_WEEKDAY
	ifequal THURSDAY, .ArthurAppears
	disappear ROUTE102_ARTHUR
	return

.ArthurAppears:
	appear ROUTE102_ARTHUR
	return
	
GardenerScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HM01_CUT
	iftrue .chopped
	writetext GardenerTreeText
	waitbutton
	closetext
	turnobject ROUTE102_FISHER1, UP
	end
	
.chopped
    checkflag ENGINE_PLAYER_IS_FEMALE
    iftrue .FemaleChopped
	writetext GardenerTreeChoppedText
	waitbutton
	closetext
	applymovement ROUTE102_FISHER2, GardenerWalkAway
	setevent EVENT_ROUTE36_TREE_CHOPPED
	disappear ROUTE102_FISHER2
	end

.FemaleChopped
    writetext GardenerTreeChoppedText_F
    waitbutton
    closetext
    applymovement ROUTE102_FISHER2, GardenerWalkAway
    setevent EVENT_ROUTE36_TREE_CHOPPED
    disappear ROUTE102_FISHER2
    end

TrainerCamperSamuel:
	trainer CAMPER, SAMUEL, EVENT_BEAT_YOUNGSTER_SAMUEL, CamperSamuelSeenText, CamperSamuelBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperSamuelAfterText
	waitbutton
	closetext
	end

TrainerYoungsterIan:
	trainer YOUNGSTER, IAN, EVENT_BEAT_YOUNGSTER_IAN, YoungsterIanSeenText, YoungsterIanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterIanAfterText
	waitbutton
	closetext
	end


Route102LassScript:
	faceplayer
	opentext
	writetext Route102LassText
	waitbutton
	closetext
	end


TrainerSchoolboyAlan:
	trainer SCHOOLBOY, ALAN, EVENT_BEAT_SCHOOLBOY_ALAN, SchoolboyAlanSeenText, SchoolboyAlanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyAlanAfterBattleText
	waitbutton
	closetext
	end

TrainerPsychicMark:
	trainer PSYCHIC_T, MARK, EVENT_BEAT_PSYCHIC_MARK, PsychicMarkSeenText, PsychicMarkBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicMarkAfterBattleText
	waitbutton
	closetext
	end
	
TrainerFledglingJohnny:
	trainer FLEDGLING, JOHNNY, EVENT_BEAT_FLEDGLING_JOHNNY, FledglingJohnnySeenText, FledglingJohnnyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FledglingJohnnyAfterBattleText
	waitbutton
	closetext
	end

ArthurScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HARD_STONE_FROM_ARTHUR
	iftrue .AlreadyGotStone
	checkcode VAR_WEEKDAY
	ifnotequal THURSDAY, ArthurNotThursdayScript
	checkevent EVENT_MET_ARTHUR_OF_THURSDAY
	iftrue .MetArthur
	writetext MeetArthurText
	buttonsound
	setevent EVENT_MET_ARTHUR_OF_THURSDAY
.MetArthur:
	writetext ArthurGivesGiftText
	buttonsound
	verbosegiveitem HARD_STONE
	iffalse .BagFull
	setevent EVENT_GOT_HARD_STONE_FROM_ARTHUR
	writetext ArthurGaveGiftText
	waitbutton
	closetext
	end

.AlreadyGotStone:
	writetext ArthurThursdayText
	waitbutton
.BagFull:
	closetext
	end

ArthurNotThursdayScript:
	writetext ArthurNotThursdayText
	waitbutton
	closetext
	end

Route102SilverScript:
	applymovement PLAYER, Movement_102DownOne
	playsound SFX_EXIT_BUILDING
	moveobject ROUTE102_SILVER, 6, 5
	appear ROUTE102_SILVER
	applymovement ROUTE102_SILVER, Movement_102SilverDownOne
	special FadeOutMusic
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext Route102RivalBeforeText
	waitbutton
	closetext
	checkevent EVENT_GOT_CRUIZE_FROM_OAK
	iftrue .Cruise
	checkevent EVENT_GOT_CHIKORITA_FROM_OAK
	iftrue .CHIKORITA
	winlosstext Route102SilverWinText, Route102SilverLossText
	loadtrainer RIVAL1, RIVAL1_2_CRUIZE
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .AfterBattle

.Cruise:
	winlosstext Route102SilverWinText, Route102SilverLossText
	loadtrainer RIVAL1, RIVAL1_2_CHIKORITA
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .AfterBattle

.CHIKORITA:
	winlosstext Route102SilverWinText, Route102SilverLossText
	loadtrainer RIVAL1, RIVAL1_2_FLAMBEAR
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .AfterBattle

.AfterBattle:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext Route102RivalAfterText
	waitbutton
	closetext
	turnobject ROUTE102_SILVER, UP
	pause 20
	showemote EMOTE_SHOCK, ROUTE102_SILVER, 15
	turnobject ROUTE102_SILVER, DOWN
	opentext
	writetext Route102RivalRadioCardText
	waitbutton
	closetext
	applymovement ROUTE102_SILVER, Route102RivalBattleExitMovement
	playsound SFX_ENTER_DOOR
	disappear ROUTE102_SILVER
	setscene SCENE_ROUTE36_NOTHING
	waitsfx
	playmapmusic
	setevent EVENT_ROUTE_102_SILVER
	end

Route102SilverTalkScript:
	end

Route102Sign:
	jumptext Route102SignText

RuinsOfAlphNorthSign:
	jumptext RuinsOfAlphNorthSignText

Route102TrainerTips1:
	jumptext Route102TrainerTips1Text

Route102TrainerTips2:
	jumptext Route102TrainerTips2Text
	
Route102GameHouse:
	jumptext Route102GameHouseText

Route102FruitTree:
	fruittree FRUITTREE_ROUTE_102

BipetalShakeMovement:
	tree_shake ; shake
	step_end

WeirdTreeMovement_Flee:
	fast_jump_step UP
	fast_jump_step UP
	step_end
	
Movement_102DownOne:
	step DOWN
	turn_head UP
	step_end
	
Movement_102SilverDownOne:
	step DOWN
	step_end

FloriaMovement1:
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

FloriaMovement2:
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

Route102SuicuneMovement:
	set_sliding
	fast_jump_step DOWN
	fast_jump_step DOWN
	fast_jump_step DOWN
	fast_jump_step RIGHT
	fast_jump_step RIGHT
	fast_jump_step RIGHT
	remove_sliding
	step_end
	
Route102Greatball:
	itemball GREAT_BALL
	
Route102RivalBattleExitMovement:
	step UP
	step_end
	
GardenerWalkAway:
	step UP
	fast_jump_step LEFT
	fast_jump_step LEFT
	fast_jump_step LEFT
	step DOWN
	fast_jump_step LEFT
	step_end
	
Route102SilverWinText:
    text "Wow! Du hast ja"
    line "hart gearbeitet"
    para "und deine #MON"
    line "gut trainiert!"
	done
	
Route102SilverLossText:
	text "Mein Team ist"
	line "das beste!"
	done
	
Route102RivalBeforeText:
	text "<PLAY_G>!"

	para "Ich habe angefang-"
	line "en, die ARENA-"
	cont "ORDEN zu sammeln!"

	para "Ich habe gehört,"
	line "du auch!"

	para "Das wird meine"
	line "Gelegenheit, der"
	para "Welt zu zeigen,"
	line "dass mein Team das"
	cont "stärkste ist!"

	para "Lass uns kämpfen,"
	line "um zu sehen, wer"
	para "von uns beiden"
	line "besser ist!"
	done
	
Route102RivalAfterText:
    text "Puh! Es war schön,"
    line "dich wieder zu"
    cont "treffen, <PLAY_G>!"
	done

Route102RivalRadioCardText:
	text "Oh!"
	line "Fast hätte ich es"
	cont "vergessen!"

	para "Guck dir auf jeden"
	line "Fall mal den JOPM"
	cont "RADIOTURM an."

	para "Ich hörte, sie"
	line "verteilen gratis"
	cont "RADIO-MODULE!"
	
    para "Ich gehe zurück"
    line "in die Stadt!"

    para "Wir sehen uns!"
	done

Route102LassText:
	text "Ein Baum versperrt"
	line "den Weg nach"
	cont "PORT ABANISHI."

	para "Wenn du durch"
	line "möchtest, kann"
	para "ein #MON den"
	line "Baum vielleicht"
	cont "ZERSCHNEIDEN."
	done

PsychicMarkSeenText:
	text "Ich werde jetzt"
	line "deine Gedanken"
	cont "lesen!"
	done

PsychicMarkBeatenText:
	text "Ich habe mich wohl"
	line "bei dir verlesen!"
	done

PsychicMarkAfterBattleText:
	text "Ich wäre wirklich"
	line "stark, wenn ich "
	para "wüsste, was mein"
	line "Gegner denkt."
	done

SchoolboyAlanSeenText:
	text "Dank meiner"
	line "Studien bin ich"
	cont "für jedes #MON"
	cont "bereit!"
	done

SchoolboyAlanBeatenText:
	text "Ups! Ein Fehler"
	line "in der Berechnung?"
	done

SchoolboyAlanAfterBattleText:
	text "Mist! Ich lerne"
	line "auch fünf Stunden"
	cont "am Tag."

	para "Es gibt vieles,"
	line "das du nicht aus"
	cont "Büchern lernen"
	cont "kannst."
	done

MeetArthurText:
	text "DONATUS: Wer bist"
	line "du?"

	para "Ich bin DONATUS"
	line "von Donnerstag."
	done

ArthurGivesGiftText:
	text "Hier bitte. Das"
	line "kannst du haben."
	done

ArthurGaveGiftText:
	text "DONATUS: Ein"
	line "#MON, das"
	para "Gestein-Attacken"
	line "benutzt, sollte"
	cont "dies mit sich"
	cont "tragen."

	para "Es verstärkt"
	line "Gestein-Attacken."
	done

ArthurThursdayText:
	text "DONATUS: Ich bin"
	line "DONATUS von"
	para "Donnerstag. Ich"
	line "bin der zweite"
	para "Sohn von"
	line "sieben Kindern."
	done

ArthurNotThursdayText:
	text "DONATUS: Heute ist"
	line "nicht Donnerstag."
	cont "Wie bedauerlich!"
	done

Route102SignText:
	text "ROUTE 102"
	para "PAGETIA CITY -"
	line "PORT ABANISHI"
	done

RuinsOfAlphNorthSignText:
	text "ALPH-RUINEN"
	line "NORDEINGANG"
	done

Route102TrainerTips1Text:
	text "TIPPS für TRAINER"

	para "Der Status der"
	line "#MON ist unter-"
	para "schiedlich, sogar"
	line "innerhalb der-"
	cont "selben Spezies."

	para "Zu Beginn ist er"
	line "vielleicht noch"
	cont "ähnlich."

	para "Doch die Unter-"
	line "schiede werden "
	para "deutlicher, wenn"
	line "die #MON"
	cont "heranwachsen."
	done

Route102TrainerTips2Text:
	text "TIPPS für TRAINER"

	para "Setze den"
	line "SCHAUFLER ein, um"
	para "an den Eingang"
	line "eines Ortes"
	cont "zurückzugelangen."

	para "Das ist sehr nütz-"
	line "lich beim Erkunden"
	para "von Höhlen und an-"
	line "deren Umgebungen."
	done
	
Route102GameHouseText:
	text "Mach eine Pause!"

	para "SPIELHÜTTE"
	done
	
CamperSamuelSeenText:
	text "Hier trainiere"
	line "ich!"
	done

CamperSamuelBeatenText:
	text "Besiegt von einem"
	line "Passanten!"
	done

CamperSamuelAfterText:
	text "Ich werde noch"
	line "härter trainieren."

	para "Ich möchte doch"
	line "ein ARENALEITER"
	cont "werden."
	done

YoungsterIanSeenText:
	text "Ich bin der"
	line "#MON-Experte"
	cont "in meiner Klasse."
	done

YoungsterIanBeatenText:
	text "Nein! Es gibt noch"
	line "bessere Trainer…"
	done

YoungsterIanAfterText:
	text "Ich muss mich wohl"
	line "mehr anstregen."
	done
	
FledglingJohnnySeenText:
    text "Magst du Vogel-"
	line "#MON?"
	done

FledglingJohnnyBeatenText:
    text "Du bist verdammt"
	line "hart im Nehmen!"
	done

FledglingJohnnyAfterBattleText:
    text "Ich habe das"
    line "Training satt."
    para "Zeit, mir eine"
    line "Pause zu nehmen."
	done
	
GardenerTreeText:
	text "Bah!"

	para "Dieser Baum"
	line "versperrt den Weg!"

	para "Ich glaube, ich"
	line "kann ihn fällen,"
	cont "aber das wird eine"
	cont "Weile dauern…"
	done
	
GardenerTreeChoppedText:
	text "Ha!"

	para "Endlich habe ich"
	line "diesen Baum"
	cont "gefällt."

	para "Jetzt kann ich"
	line "endlich nach"
	cont "PORT ABANISHI!"

	para "Wir sehen uns,"
    line "Kleiner und viel"
    cont "Glück!"
	done

GardenerTreeChoppedText_F:
    text "Ha!"

    para "Endlich habe ich"
    line "diesen Baum"
    cont "gefällt."

    para "Jetzt kann ich"
    line "endlich nach"
    cont "PORT ABANISHI!"

    para "Wir sehen uns,"
    line "Kleine und viel"
    cont "Glück!"
    done


Route102_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  6,  5, ROUTE_102_WESTPORT_GATE, 4
	warp_event 16,  4, ROUTE_102_N64_HOUSE, 1

	db 1 ; coord events
	coord_event  6,  6, SCENE_ROUTE102_SILVER, Route102SilverScript

	db 4 ; bg events
	bg_event 22, 10, BGEVENT_READ, Route102TrainerTips2
	bg_event 50, 10, BGEVENT_READ, Route102Sign
	bg_event 32, 10, BGEVENT_READ, Route102TrainerTips1
	bg_event 18,  4, BGEVENT_READ, Route102GameHouse

	db 12 ; object events
	object_event  8, 9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerPsychicMark, -1
	object_event 29,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 5, TrainerSchoolboyAlan, -1
	object_event 50,  7, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route102LassScript, -1
	object_event 39,  5, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route102FruitTree, -1
	object_event 40,  8, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ArthurScript, EVENT_ROUTE_36_ARTHUR_OF_THURSDAY
	object_event  1,  1, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route102SilverTalkScript, EVENT_ROUTE_102_SILVER
	object_event 12, 11, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerCamperSamuel, -1
	object_event 20,  8, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerYoungsterIan, -1
	object_event 34,  9, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINCLOCKWISE, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerFledglingJohnny, -1
	object_event 33,  7, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GardenerScript, EVENT_ROUTE36_GARDENER
	object_event 33,  6, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GardenerScript, EVENT_ROUTE36_GARDENER_CHOPPED
	object_event 33,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route102Greatball, EVENT_ROUTE_36_GREATBALL	
