	const_def 2 ; object constants
	const ECRUTEAKCITY_GRAMPS1
	const ECRUTEAKCITY_GRAMPS2
	const ECRUTEAKCITY_LASS1
	const ECRUTEAKCITY_LASS2
	const ECRUTEAKCITY_FISHER
	const ECRUTEAKCITY_YOUNGSTER
	const ECRUTEAKCITY_GRAMPS3
	const ECRUTEAKCITY_ROCKET1
	const ECRUTEAKCITY_ROCKET2
	const ECRUTEAKCITY_ROCKET3
	const ECRUTEAKCITY_ROCKET4
	const ECRUTEAKCITY_LASS3
	const ECRUTEAKCITY_WORKER1
	const ECRUTEAKCITY_WORKER2

TeknosCity_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_ROUTE8_NOTHING
	scene_script SceneRocketTakeOverScript ; SCENE_ROUTE8_GIRL

	db 3 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint
	callback MAPCALLBACK_TILES, .TeknosBridgeRepair
	callback MAPCALLBACK_OBJECTS, .rockets
	
.rockets
	checkevent EVENT_WHITNEY_IN_BOULDER_MINES
	iffalse .canfight
	return
	
.canfight
	disappear ECRUTEAKCITY_ROCKET1
	disappear ECRUTEAKCITY_ROCKET1
	return
	
.TeknosBridgeRepair:
	checkevent EVENT_TEKNOS_BRIDGE_REPAIRED
	iftrue .Done
	changeblock 23,  5, $80 ; water
.Done:
	return

.FlyPoint:
	setflag ENGINE_FLYPOINT_ECRUTEAK
	return
	
.DummyScene0:
	end
	
SceneRocketTakeOverScript:
	checkevent EVENT_AQUARIUM_ROCKET_TAKEOVER_ACTIVE
	iftrue .SceneEcruteakNothing
	checkevent EVENT_ECRUTEAK_SCARED_LASS
	iftrue .SceneEcruteakNothing
	opentext
	writetext RocketsAreCommin
	waitbutton
	closetext
	showemote EMOTE_SHOCK, PLAYER, 15
	turnobject PLAYER, RIGHT
	applymovement PLAYER, WalkToCenter
	applymovement ECRUTEAKCITY_LASS3, LassRun1
	pause 6
	turnobject ECRUTEAKCITY_LASS3, RIGHT
	pause 6
	turnobject ECRUTEAKCITY_LASS3, LEFT
	pause 6
	turnobject ECRUTEAKCITY_LASS3, RIGHT
	pause 6
	turnobject ECRUTEAKCITY_LASS3, LEFT
	pause 6
	turnobject ECRUTEAKCITY_LASS3, DOWN
	pause 6
	turnobject ECRUTEAKCITY_LASS3, UP
	pause 6
	opentext
	writetext RocketsAreCommin2
	waitbutton
	closetext
	applymovement ECRUTEAKCITY_LASS3, LassRun2
	disappear ECRUTEAKCITY_LASS3
	setevent EVENT_ECRUTEAK_SCARED_LASS
	setmapscene TEKNOS_AQUARIUM_1F, SCENE_DEFAULT
	end
	
.SceneEcruteakNothing:
	end

WorkerScript:
	faceplayer
	opentext
	writetext WorkerText
	waitbutton
	closetext
	turnobject ECRUTEAKCITY_WORKER2, UP
	turnobject ECRUTEAKCITY_WORKER1, UP
	end
	

TeknosCityGramps1Script:
	jumptextfaceplayer TeknosCityGramps1Text

TeknosCityGramps2Script:
	faceplayer
	opentext
	checkevent EVENT_TEKNOS_BRIDGE_REPAIRED
	iftrue .Gramps2Script2
	writetext TeknosCityGramps2Text
	waitbutton
	closetext
	end
	
.Gramps2Script2:
	writetext TeknosCityGramps2Text2
	waitbutton
	closetext
	end

TeknosCityGramps3Script:
	jumptextfaceplayer TeknosCityGramps3Text

TeknosCityLass1Script:
	jumptextfaceplayer TeknosCityLass1Text

TeknosCityLass2Script:
	jumptextfaceplayer TeknosCityLass2Text

	
TeknosCityFisherScript:
	faceplayer
	opentext
	checkevent EVENT_AQUARIUM_ROCKET_TAKEOVER_ACTIVE
	iftrue .NoRockets
	writetext TeknosCityFisherText_TheresRockets
	waitbutton
	closetext
	end

.NoRockets:
	writetext TeknosCityFisherText
	waitbutton
	closetext
	end


TeknosCityRocket1Script:
	jumptextfaceplayer TeknosCityRocket1Text
	
TeknosCityRocket2Script:
	jumptextfaceplayer TeknosCityRocket2Text

TeknosCityYoungsterScript:
	jumptextfaceplayer TeknosCityYoungsterText

TeknosCitySign:
	jumptext TeknosCitySignText

TinTowerSign:
	jumptext TinTowerSignText

EcruteakGymSign:
	jumptext EcruteakGymSignText
	
TekuCityDocksSign:
	jumptext TekuCityDocksText

EcruteakDanceTheaterSign:
	jumptext EcruteakDanceTheaterSignText

BurnedTowerSign:
	jumptext BurnedTowerSignText

TeknosCityPokecenterSign:
	jumpstd pokecentersign

TeknosCityMartSign:
	jumpstd martsign

TeknosCityHiddenHyperPotion:
	hiddenitem HYPER_POTION, EVENT_ECRUTEAK_CITY_HIDDEN_HYPER_POTION
	
TeknosCityRocketTrainer1Script:
	trainer GRUNTM, GRUNTM_32, EVENT_BEAT_TEKU_CITY_GRUNT1, TeknosCityRocket1SeenText, TeknosCityRocket1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TeknosCityRocket1AfterBattleText
	waitbutton
	closetext
	end
	
TeknosCityRocketTrainer2Script:
	trainer GRUNTM, GRUNTM_33, EVENT_BEAT_TEKU_CITY_GRUNT2, TeknosCityRocket2SeenText, TeknosCityRocket2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TeknosCityRocket2AfterBattleText
	waitbutton
	closetext
	end
	
TeknosCityRocket1SeenText:
    text "Hey Kind!"

    para "Was denkst du,"
    line "machst du da?"

    para "Dieser Ort ist"
    line "gesperrt!"
	done

TeknosCityRocket1BeatenText:
	text "Was ist passiert?"
	done

TeknosCityRocket1AfterBattleText:
    text "Geh da am besten"
    line "nicht rein."

    para "Ein Kind wie du,"
    line "kann da eh nichts"
    cont "ausrichten."
	done
	
TeknosCityRocket2SeenText:
    text "Hey, du!"

    para "Kinder sollten"
    line "sich besser nicht"
    cont "in unseren Weg"
    cont "stellen!"
	done

TeknosCityRocket2BeatenText:
	text "W-wer bist du?"
	done

TeknosCityRocket2AfterBattleText:
    text "Das AQUARIUM hat"
    line "bestimmt viele"
    cont "#MON, die wir"
    cont "verkaufen können!"
	done

TeknosCityRocket1Text:
    text "Ich soll zur"
    line "Seite gehen?"

    para "Sorry, Kind, aber"
    line "wir Erwachsenen"
    cont "haben hier etwas"
    cont "Wichtiges zu tun!"
	done
	
TeknosCityRocket2Text:
    text "Was willst du?"

    para "Geh in den MINEN"
    line "spielen oder so…"
	done

TeknosCityGramps1Text:
    text "Ich lebe schon"
    line "mein ganzes Leben"
    cont "hier in TEKNOPIA."

    para "Heutzutage ist die"
    line "Stadt so viel"
    cont "lebehafter, als zu"
    cont "meiner Jugend."
	done

TeknosCityGramps2Text:
    text "Jetzt, wo die"
    line "PROMENADE kaputt"
    cont "ist, kommen hier"
    cont "viel weniger"
    cont "Touristen vorbei…"
	done
	
TeknosCityGramps2Text2:
	text "Ich muss zugeben,"
	line "ich bin ein Fan"
	cont "der neuen SPIEL-"
	cont "HALLE im Norden."
	done

TeknosCityLass1Text:
    text "TENKNOPIA war mal"
    line "ein ruhiger Ort."

    para "Aber die Stadt ist"
    line "so schnell gewach-"
    cont "sen. Ich glaube,"
    cont "daran hat sich"
    cont "noch keiner so"
    cont "richtig gewöhnt."
	done

TeknosCityLass2Text:
    text "BIANKA ist unsere"
    line "ARENALEITERIN!"

    para "Sie ist immer eine"
    line "große Hilfe für"
    cont "die Stadt gewesen!"

    para "Manchmal ist es"
    line "schwer, sie in der"
    cont "ARENA zu treffen,"
    cont "weil sie immer"
    cont "unterwegs ist, und"
    cont "den Leuten bei"
    cont "ihren Problemen"
    cont "hilft."
	done

TeknosCityLass2Text_ReleasedBeasts:
	text "Drei große #MON"
	line "sind in verschie-"
	cont "dene Richtungen"
	cont "davongelaufen!"

	para "Was waren das für"
	line "welche?"
	done

TeknosCityFisherText:
	text "Das AQUARIUM ist"
	line "für MATROSEN wie"
	cont "mich eher öde."

	para "Wir sehen diese"
	line "#MON ja ständig"
	cont "auf hoher See!"

	para "Yohohoho!"
	done

TeknosCityFisherText_TheresRockets:
    text "Diese Typen sehen"
    line "echt wie TEAM"
    cont "ROCKET aus."

    para "Ich dachte, die"
    line "würde es nicht"
    cont "mehr geben?"
	done

TeknosCityYoungsterText:
	text "Ich habe es oft"
	line "probiert, aber"
	cont "ich kann BIANKA"
	cont "einfach nicht"
	cont "besiegen…"
	done

TeknosCityGramps3Text:
    text "TEKNOPIA wächst zu"
    line "einer richtigen"
    cont "Hafenstadt heran."

    para "Ich kam ja schon"
    line "immer gerne zu"
    cont "Besuch hierher."

    para "Ich hoffe nur, es"
    line "wird hier nicht zu"
    cont "überrannt!"
	done

TeknosCitySignText:
	text "TEKNOPIA CITY"
	para "Eine Stadt, die"
	line "die Zukunft"
	para "begrüßt."
	done

TinTowerSignText:
	text "Nördlich zur"
	line "PROMENADE und"
	cont "SPIELHALLE!"

	para "Spiel, Spaß und"
	line "große Preise!"
	done

EcruteakGymSignText:
	text "PKMN-ARENA von"
	line "TEKNOPIA CITY"
	cont "LEITUNG: BIANKA"

	para "Die energische"
	line "Macherin!"
	done

EcruteakDanceTheaterSignText:
	text "TEKNOPIA CITY"
	line "AQUARIUM"
	done

BurnedTowerSignText:
	text "HAUS DES"
	line "PROFIANGLERS"
	done
	
TekuCityDocksText:
	text "TEKNOPIA CITY"
	line "HAFEN"
	done
	
RocketsAreCommin:
	text "…Ieeeeek!"
	done
	
RocketsAreCommin2:
	text "Hilfe!"

	para "TEAM ROCKET will"
	line "das AQUARIUM"
    cont "übernehmen!"
	done
	
WorkerText:
    text "Diese Rüpel von"
    line "TEAM ROCKET haben"
    cont "die Brücke zum"
    cont "Durchgangshaus"
    cont "beschädigt…"

    para "Wir brauchen noch"
    line "etwas Zeit, um sie"
    cont "zu reparieren."
	done
	
WalkToCenter:
	step RIGHT
	step_end
	
LassRun1:
	big_step LEFT
	big_step LEFT
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step LEFT
	step_end
	
LassRun2:
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	step_end

TeknosCity_MapEvents:
	db 0, 0 ; filler

	db 13 ; warp events
	warp_event 22, 31, TEKNOS_PORT_PASSAGE, 1
	warp_event 23, 31, TEKNOS_PORT_PASSAGE, 2
	warp_event 31, 10, TEKNOS_POKECENTER_1F, 1
	warp_event  7, 17, TEKNOS_OLD_ROD_HOUSE, 1
	warp_event  6, 27, TEKNOS_AQUARIUM_1F, 1
	warp_event  7, 27, TEKNOS_AQUARIUM_1F, 1
	warp_event 31, 16, TEKNOS_MART, 1
	warp_event 15, 17, TEKNOS_GRAMPS_ITEMFINDER_HOUSE, 1
	warp_event 22,  1, BOARDWALK_TEKNOS_GATE, 3
	warp_event 23,  1, BOARDWALK_TEKNOS_GATE, 4
	warp_event 10, 11, TEKNOS_GYM, 1
	warp_event 11, 11, TEKNOS_GYM, 2
	warp_event 33, 20, TEKNOS_KYLES_HOUSE, 1

	db 1 ; coord events
	coord_event 15, 18, SCENE_ECRUTEAK_ROCKET_TAKEOVER, SceneRocketTakeOverScript

	db 9 ; bg events
	bg_event 18, 21, BGEVENT_READ, TeknosCitySign
	bg_event 24,  8, BGEVENT_READ, TinTowerSign
	bg_event 12, 12, BGEVENT_READ, EcruteakGymSign
	bg_event 10, 27, BGEVENT_READ, EcruteakDanceTheaterSign
	bg_event 10, 17, BGEVENT_READ, BurnedTowerSign
	bg_event 32, 10, BGEVENT_READ, TeknosCityPokecenterSign
	bg_event 32, 16, BGEVENT_READ, TeknosCityMartSign
	bg_event 33, 13, BGEVENT_ITEM, TeknosCityHiddenHyperPotion
	bg_event 24, 29, BGEVENT_READ, TekuCityDocksSign

	db 14 ; object events
	object_event 14, 21, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TeknosCityGramps1Script, -1
	object_event 19,  9, SPRITE_GRAMPS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TeknosCityGramps2Script, -1
	object_event 28, 27, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TeknosCityLass1Script, -1
	object_event 23, 14, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TeknosCityLass2Script, -1
	object_event  9, 30, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TeknosCityFisherScript, -1
	object_event 10, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TeknosCityYoungsterScript, -1
	object_event 22, 13, SPRITE_SAILOR, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TeknosCityGramps3Script, -1
	object_event  5, 28, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TeknosCityRocketTrainer1Script, EVENT_AQUARIUM_ROCKET_TAKEOVER_ACTIVE
	object_event  8, 28, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 1, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TeknosCityRocketTrainer2Script, EVENT_AQUARIUM_ROCKET_TAKEOVER_ACTIVE
	object_event  6, 28, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TeknosCityRocket1Script, EVENT_WHITNEY_IN_BOULDER_MINES
	object_event  7, 28, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TeknosCityRocket2Script, EVENT_WHITNEY_IN_BOULDER_MINES
	object_event  22, 22, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ECRUTEAK_SCARED_LASS
	object_event 22,  6, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, WorkerScript, EVENT_TEKNOS_BRIDGE_REPAIRED
	object_event 23,  6, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, WorkerScript, EVENT_TEKNOS_BRIDGE_REPAIRED

	