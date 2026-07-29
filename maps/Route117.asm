	const_def 2 ; object constants
	const ROUTE3_FISHER1
	const ROUTE3_YOUNGSTER1
	const ROUTE3_YOUNGSTER2
	const ROUTE26_FRUIT_TREE
	const ROUTE3_ITEMBALL_1
	const ROUTE3_ITEMBALL_2
	const ROUTE3_ITEMBALL_3
Route117_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerFirebreatherOtis:
	trainer FIREBREATHER, OTIS, EVENT_BEAT_FIREBREATHER_OTIS, FirebreatherOtisSeenText, FirebreatherOtisBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FirebreatherOtisAfterBattleText
	waitbutton
	closetext
	end

TrainerYoungsterWarren:
	trainer YOUNGSTER, WARREN, EVENT_BEAT_YOUNGSTER_WARREN, YoungsterWarrenSeenText, YoungsterWarrenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterWarrenAfterBattleText
	waitbutton
	closetext
	end

TrainerYoungsterJimmy:
	trainer YOUNGSTER, JIMMY, EVENT_BEAT_YOUNGSTER_JIMMY, YoungsterJimmySeenText, YoungsterJimmyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterJimmyAfterBattleText
	waitbutton
	closetext
	end

TrainerEngineerHarris:
	trainer ENGINEER, HARRIS, EVENT_BEAT_ENGINEER_HARRIS, EngineerHarrisSeenText, EngineerHarrisBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext EngineerHarrisAfterBattleText
	waitbutton
	closetext
	end

Route117FruitTree:
	fruittree FRUITTREE_ROUTE_117
	
Route2DireHit:
	itemball DIRE_HIT


Route2Carbos:
	itemball CARBOS

Route2Elixer:
	itemball ELIXER
	

Route2HiddenMaxEther:
	hiddenitem MAX_ETHER, EVENT_ROUTE_2_HIDDEN_MAX_ETHER

Route2HiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_ROUTE_2_HIDDEN_FULL_HEAL

Route2HiddenFullRestore:
	hiddenitem FULL_RESTORE, EVENT_ROUTE_2_HIDDEN_FULL_RESTORE

Route2HiddenRevive:
	hiddenitem REVIVE, EVENT_ROUTE_2_HIDDEN_REVIVE


FirebreatherOtisSeenText:
	text "Ah! Das Wetter"
	line "ist so schön"
	cont "wie immer."
	done

FirebreatherOtisBeatenText:
	text "Die Sonne scheint,"
	line "dennoch bin ich"
	cont "nass…"
	done

FirebreatherOtisAfterBattleText:
	text "Bei Regen ist"
	line "eine Zündung sehr"
	cont "schwierig…"
	done

YoungsterWarrenSeenText:
	text "Hmmm… Dieser Baum"
	line "ist merkwürdig…"
	done

YoungsterWarrenBeatenText:
	text "Ich wusste es…"
	done

YoungsterWarrenAfterBattleText:
	text "Du hast gleich"
	line "einen starken"
	cont "Eindruck gemacht."

	para "Ich hatte Angst,"
	line "gegen dich zu"
	cont "kämpfen…"
	done

YoungsterJimmySeenText:
	text "Ich bin schnell"
	line "wie der Wind!"
	done

YoungsterJimmyBeatenText:
	text "Hinfortgeweht!"
	done

YoungsterJimmyAfterBattleText:
	text "Ich trage das"
	line "ganze Jahr Shorts."

	para "Das ist meine"
	line "Auffassung von"
	cont "Mode."
	done

EngineerHarrisSeenText:
    text "Hey!"

    para "Hast du meinen"
    line "Schraubenschlüssel"
    cont "gesehen?"
	done
	
EngineerHarrisBeatenText:
    text "Ich kann ihn ein-"
    line "fach nicht finden…"

    para "Moment…"

    para "Er ist in meiner"
    line "Hand!"
	done

EngineerHarrisAfterBattleText:
	text "Das war peinlich…"
	done


Route117_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 11,  5, ENDON_CAVE_1F, 1
	;warp_event 11,  5, BATTLE_TOWER_1F, 1
	warp_event 21,  5, ENDON_CAVE_1F, 2

	db 0 ; coord events

	db 4 ; bg events
	bg_event  5,  4, BGEVENT_ITEM, Route2HiddenMaxEther
	bg_event 30, 13, BGEVENT_ITEM, Route2HiddenFullHeal
	bg_event 35,  8, BGEVENT_ITEM, Route2HiddenFullRestore
	bg_event 15, 13, BGEVENT_ITEM, Route2HiddenRevive

	db 8 ; object events
	object_event 43, 12, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerFirebreatherOtis, -1
	object_event  8, 13, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerYoungsterWarren, -1
	object_event 12, 11, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerYoungsterJimmy, -1
	object_event 29,  5, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route117FruitTree, -1
	object_event 29,  9, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route2DireHit, EVENT_ROUTE_2_DIRE_HIT
	object_event 24,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route2Carbos, EVENT_ROUTE_2_CARBOS
	object_event 16,  9, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route2Elixer, EVENT_ROUTE_2_ELIXER
	object_event 46,  9, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerEngineerHarris, -1

