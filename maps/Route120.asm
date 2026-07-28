	const_def 2 ; object constants
	const ROUTE8_FRUIT_TREE
	const ROUTE8_YOUNGSTER
	const ROUTE8_SCHOOLBOY
	const ROUTE8_LASS
	const ROUTE8_GRAMPS
	const ROUTE8_FISHER
	const ROUTE8_POKEFANM
	const ROUTE8_TWIN

Route120_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_ROUTE8_NOTHING
	scene_script SceneFoundGirlScript ; SCENE_ROUTE8_GIRL
	
	db 0 ; callbacks
	
.DummyScene0:
	end

SceneFoundGirlScript:
	checkevent EVENT_LITTLE_GIRL_AT_BOULDER_MINES_ENTRANCE
	iftrue .SceneRoute120Nothing
	applymovement PLAYER, WalkDown
	turnobject PLAYER, LEFT
	playsound SFX_ENTER_DOOR
	moveobject ROUTE8_TWIN, 9, 5
	appear ROUTE8_TWIN
	showemote EMOTE_SHOCK, ROUTE8_GRAMPS, 15
	applymovement ROUTE8_TWIN, WalkDownGirl
	turnobject ROUTE8_TWIN, LEFT
	applymovement ROUTE8_GRAMPS, WalkUpGramps
	turnobject ROUTE8_GRAMPS, RIGHT
	opentext
	writetext GrampsRelievedText
	waitbutton
	closetext
	opentext
	writetext GirlText
	waitbutton
	closetext
	applymovement ROUTE8_GRAMPS, WalkDownGramps
	turnobject ROUTE8_GRAMPS, RIGHT
	opentext
	writetext GrampsAnnoyedText
	waitbutton
	closetext
	setevent EVENT_TEKNOS_GRAMPA_LOOKING_FOR_LITTLE_GIRL
	setevent EVENT_TEKNOS_GRAMPA_LITTLE_GIRL_SAVED
	setevent EVENT_WHITNEY_IN_BOULDER_MINES
	setevent EVENT_LITTLE_GIRL_AT_BOULDER_MINES_ENTRANCE
	clearevent EVENT_ECRUTEAK_SCARED_LASS
	setmapscene TEKNOS_CITY, SCENE_ECRUTEAK_ROCKET_TAKEOVER
	special FadeOutPalettes
	wait 10
	warpfacing UP, TEKNOS_GRAMPS_ITEMFINDER_HOUSE, 4, 7
	end
	
.SceneRoute120Nothing:
	end
	
TrainerYoungsterJoey:
	trainer YOUNGSTER, JOEY, EVENT_BEAT_YOUNGSTER_JOEY, YoungsterJoey1SeenText, YoungsterJoey1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterJoey1AfterText
	waitbutton
	closetext
	end

TrainerSchoolboyDudley:
	trainer SCHOOLBOY, DUDLEY, EVENT_BEAT_SCHOOLBOY_DUDLEY, SchoolboyDudleySeenText, SchoolboyDudleyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyDudleyAfterBattleText
	waitbutton
	closetext
	end

TrainerLassConnie:
	trainer LASS, CONNIE, EVENT_BEAT_LASS_CONNIE, LassConnie1SeenText, LassConnie1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassConnie1AfterBattleText
	waitbutton
	closetext
	end
	
Route120GrampsScript:
	faceplayer
	opentext
	writetext Route120GrampsText
	waitbutton
	closetext
	end
	
TrainerFisherTully:
	trainer FISHER, TULLY, EVENT_BEAT_FISHER_TULLY, FisherTullySeenText, FisherTullyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherTullyAfterBattleText
	waitbutton
	closetext
	end
	
TrainerHikerParry:
	trainer HIKER, PARRY, EVENT_BEAT_HIKER_PARRY, HikerParry3SeenText, HikerParry3BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerParryAfterBattleText
	waitbutton
	closetext
	end

Route120UndergroundPathSign:
	jumptext Route120UndergroundPathSignText

Route120FruitTree:
	fruittree FRUITTREE_ROUTE_120
	
Route120ParlyzHeal:
	itemball PARLYZ_HEAL
	
Route120GrampsText:
	text "Oh, gut! Du"
	line "bist hier!"

	para "Bitte hilf mir"
	line "doch."

	para "Meine Enkelin"
	line "könnte da drin"
	cont "gefangen sein!"
	done
	

LassConnie1SeenText:
	text "Ich weiß nicht,"
	line "warum ich mit"
	cont "FLAVIO oder JULIAN"
	cont "abhänge."

	para "Du bist sicher"
	line "viel cooler als"
	cont "die beiden!"
	done

LassConnie1BeatenText:
	text "Aaah! Meine"
	line "#MON!"
	done

LassConnie1AfterBattleText:
	text "Na ja, verloren,"
	line "aber der Kampf"
	cont "war lustiger als"
	cont "alles, was die"
	cont "zwei so anstellen."
	done

	
SchoolboyDudleySeenText:
	text "Auf dieser Route"
	line "treffen sich alle"
	cont "meine Freunde nach"
	cont "der Schule!"
	done

SchoolboyDudleyBeatenText:
	text "Wooh! Das war gut."
	done

SchoolboyDudleyAfterBattleText:
	text "Ich hab mein"
	line "Bestes gegeben."

	para "Ich bereue nichts."
	done
	
YoungsterJoey1SeenText:
	text "Es macht Spaß,"
	line "in der MINE zu"
	cont "spielen."

	para "Aber verrate es"
	line "bitte nicht"
	cont "unseren Eltern!"
	done

YoungsterJoey1BeatenText:
	text "Mist! Verloren!"
	line "Verdammich!"
	done

YoungsterJoey1AfterText:
	text "Brauche ich mehr"
	line "#MON, um besser"
	cont "zu kämpfen?"

	para "Nein! Ich bleibe"
	line "bei diesem hier,"
	cont "komme was wolle!"
	done

Route120UndergroundPathSignText:
	text "GERÖLLMINEN"

	para "Gefährliches"
	line "Abbaugebiet!"

	para "Betreten ohne"
	line "#MON zum Schutz"
	cont "verboten."
	done
	
FisherTullySeenText:
	text "Jetzt demonstriere"
	line "ich dir die Kraft"
	cont "des #MON,"
	cont "das ich gefangen"
	cont "habe!"
	done

FisherTullyBeatenText:
	text "Was? Das kann"
	line "nicht sein."
	done

FisherTullyAfterBattleText:
	text "Mit dem #MON,"
	line "das ich gefangen"

	para "habe, möchte ich"
	line "der CHAMP der"
	cont "Trainer werden."

	para "Das ist das Beste"
	line "am Angeln!"
	done
	
HikerParry3SeenText:
	text "Meine #MON"
	line "sind voller"
	cont "Energie!"
	done

HikerParry3BeatenText:
	text "Ojemine! Ich bin"
	line "der große"
	cont "Verlierer!"
	done

HikerParryAfterBattleText:
	text "Ich bin eher"
	line "langsam, was das"
	cont "Denken betrifft,"
	cont "weißt du?"

	para "Deswegen setze ich"
	line "alles auf Kraft."
	done
	
GrampsRelievedText:
    text "Himmel sei Dank!"

    para "Dir geht es gut!"

    para "Wie oft habe ich"
    line "dir schon gesagt…"

    para "Lauf nicht weg,"
    line "wo ich dich nicht"
    cont "finden kann!"
	done
	
GirlText:
    text "Oh Opa…"

    para "Ich habe nur Ver-"
    line "stecken gespielt!"

    para "Ich hatte richtig"
    line "viel Spaß!"
	done
	
GrampsAnnoyedText:
    text "Ernsthaft, dieses"
    line "Mädchen…"

    para "Aber sie ist zum"
    line "Glück wohlauf…"

    para "Dank dir, Trainer."

    para "Lass uns erst mal"
    line "zurück nach Hause"
    cont "gehen…"
	done

WalkDown:
	step DOWN
	step_end
	
WalkDownGirl:
	step DOWN
	step_end
	
WalkUpGramps:
	step UP
	step_end
	
WalkDownGramps:
	step DOWN
	step_end

Route120_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  9,  5, BOULDER_MINES_1F, 1

	db 1 ; coord events
	coord_event  9,  6, SCENE_ROUTE8_GIRL_AND_GRAMPS, SceneFoundGirlScript

	db 1 ; bg events
	bg_event 10,  6, BGEVENT_READ, Route120UndergroundPathSign

	db 9 ; object events
	object_event 40,  6, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route120FruitTree, -1
	object_event 12, 10, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerYoungsterJoey, -1
	object_event 24,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSchoolboyDudley, -1
	object_event 12,  6, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerLassConnie, -1
	object_event  8,  7, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route120GrampsScript, EVENT_TEKNOS_GRAMPA_LOOKING_FOR_LITTLE_GIRL
	object_event 20, 13, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherTully, -1
	object_event 36, 12, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerHikerParry, -1
	object_event  9,  0, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEKNOS_GRAMPA_LITTLE_GIRL_SAVED
	object_event 18,  8, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route120ParlyzHeal, EVENT_ROUTE_8_PARLYZ_HEAL

