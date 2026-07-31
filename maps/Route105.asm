	const_def 2 ; object constants
	const ROUTE105_YOUNGSTER3
	const ROUTE105_YOUNGSTER4
	const ROUTE105_COOLTRAINER_F
	const ROUTE105_POKE_BALL
	const ROUTE105_POKE_BALL2
	const ROUTE105_FRUIT_TREE_1
	const ROUTE105_FRUIT_TREE_2

Route105_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


TrainerYoungsterMikey:
	trainer YOUNGSTER, MIKEY, EVENT_BEAT_YOUNGSTER_MIKEY, YoungsterMikeySeenText, YoungsterMikeyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterMikeyAfterText
	waitbutton
	closetext
	end


Route105YoungsterScript:
	jumptextfaceplayer Route105YoungsterText_DirectionsToMrPokemonsHouse

Route105CooltrainerFScript:
	jumptextfaceplayer Route105CooltrainerFText

Route105Sign:
	jumptext Route105SignText

MrPokemonsHouseDirectionsSign:
	jumptext MrPokemonsHouseDirectionsSignText

MrPokemonsHouseSign:
	jumptext MrPokemonsHouseSignText

Route105TrainerTips:
	jumptext Route105TrainerTipsText

Route105MaxEther:
	itemball MAX_ETHER
	
Route105PoisonStone:
	itemball POISON_STONE

Route105FruitTree1:
	fruittree FRUITTREE_ROUTE_105_1

Route105FruitTree2:
	fruittree FRUITTREE_ROUTE_105_2

Route105HiddenHyperPotion:
	hiddenitem HYPER_POTION, EVENT_ROUTE_30_HIDDEN_HYPER_POTION


YoungsterMikeySeenText:
	text "Du bist ein #-"
	line "MON-Trainer, oder?"

	para "Dann musst du"
	line "kämpfen!"
	done

YoungsterMikeyBeatenText:
	text "Das ist seltsam."
	line "Davor habe ich"
	cont "gewonnen."
	done

YoungsterMikeyAfterText:
	text "Ein guter Trainer"
	line "zu werden ist"
	cont "nicht einfach."

	para "Ich kämpfe gegen"
	line "andere Trainer, um"
	cont "besser zu werden."
	done

Route105YoungsterText_DirectionsToMrPokemonsHouse:
    text "Ich bin müde."

    para "Ich will nicht"
    line "mehr laufen."

    para "Ich wünschte, mein"
    line "#MON könnte"
    para "mich einfach an"
    line "einen anderen Ort"
    cont "FLIEGEN."
	done

Route105CooltrainerFText:
    text "Ich suche nach"
    line "Elektro-#MON."

    para "Ich weiß, dass ei-"
    line "nige Arten hier im"
    cont "hohen Gras leben."
	done

Route105SignText:
	text "ROUTE 105"

	para "JADEWALD"
	line "Immer geradeaus."
	done

MrPokemonsHouseDirectionsSignText:
	text "Das Haus von"
	line "MR. #MON?"
	cont "Immer geradeaus."
	done

MrPokemonsHouseSignText:
	text "Das HAUS von"
	line "MR. #MON"
	done

Route105TrainerTipsText:
	text "TIPPS für TRAINER"

	para "Du sollst keine"
	line "#MON stehlen!"

	para "#BÄLLE dürfen"
	line "nur bei wilden"
	cont "#MON eingesetzt"
	cont "werden!"
	done



Route105_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  8, 31, ROUTE_105_ROUTE_106_GATE, 1
	warp_event  9, 31, ROUTE_105_ROUTE_106_GATE, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event  6, 28, BGEVENT_READ, Route105Sign
	bg_event 19, 28, BGEVENT_ITEM, Route105HiddenHyperPotion

	db 7 ; object events
	object_event  8, 15, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerYoungsterMikey, -1
	object_event  7, 22, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route105YoungsterScript, -1
	object_event 10,  6, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route105CooltrainerFScript, -1
	object_event 14,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route105MaxEther, EVENT_ROUTE_30_MAX_ETHER
	object_event 17, 13, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route105PoisonStone, EVENT_ROUTE_30_POISON_STONE
	object_event 17,  4, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route105FruitTree1, -1
	object_event  5, 14, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route105FruitTree1, -1
