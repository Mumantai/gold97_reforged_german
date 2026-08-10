	const_def 2 ; object constants
	const KUME_SOCIAL_HOUSE_N64_LASS
	const KUME_SOCIAL_HOUSE_YOUNGSTER
	const KUME_SOCIAL_HOUSE_COOLTRAINER_F
	const KUME_SOCIAL_HOUSE_POKEFAN_F
	const KUME_SOCIAL_HOUSE_FISHER

KumeSocialHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KumeSocialHouseN64LassScript:
	faceplayer
	opentext
	writetext SendN64LassOffText
	waitbutton
	closetext
	checkcode VAR_FACING
	ifequal RIGHT, KumeSocialHouseN64LassRightScript
	jump KumeSocialHouseN64LassUpScript
	end
	
KumeSocialHouseN64LassRightScript:
	applymovement KUME_SOCIAL_HOUSE_N64_LASS, KumeSocialHouseN64LassRightMovement
	playsound SFX_EXIT_BUILDING
	disappear KUME_SOCIAL_HOUSE_N64_LASS
	setevent EVENT_KUME_N64_LASS_AT_SOCIAL_HOUSE
	clearevent EVENT_KUME_LASS_AT_N64_HOUSE
	waitsfx
	end
	
KumeSocialHouseN64LassUpScript:
	applymovement KUME_SOCIAL_HOUSE_N64_LASS, KumeSocialHouseN64LassUpMovement
	playsound SFX_EXIT_BUILDING
	disappear KUME_SOCIAL_HOUSE_N64_LASS
	setevent EVENT_KUME_N64_LASS_AT_SOCIAL_HOUSE
	clearevent EVENT_KUME_LASS_AT_N64_HOUSE
	waitsfx
	end
	
KumeSocialHouseYoungsterScript:
	jumptextfaceplayer KumeSocialHouseYoungsterText
	
KumeSocialHouseCooltrainerfScript:
	jumptextfaceplayer KumeSocialHouseCooltrainerfText
	
KumeSocialHousePokefanfScript:
	jumptextfaceplayer KumeSocialHousePokefanfText
	
KumeSocialHouseFisherScript:
	jumptextfaceplayer KumeSocialHouseFisherText
	
KumeSocialHouseN64LassRightMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end
	
KumeSocialHouseN64LassUpMovement:
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end
	
KumeSocialHouseYoungsterText:
    text "Ich finde KOGA"
    line "ist mit Abstand"
    para "der coolste der"
    line "TOP VIER!"
	done
	
KumeSocialHouseCooltrainerfText:
    text "LORELEI ist ganz"
    line "klar die Coolste!"

    para "Sie hat einfach"
    line "Klasse!"
	done
	
KumeSocialHousePokefanfText:
    text "Ich hörte, dass"
    line "ein paar Kinder"
    para "TEAM ROCKET zer-"
    line "schlagen haben!"

    para "Das klingt ehrlich"
    line "gesagt ziemlich"
    cont "unglaubwürdig."
	done

KumeSocialHouseFisherText:
    text "Hier kommen die"
    line "Leute für Klatsch"
    cont "und Tratsch her."

    para "Ich höre lieber"
    line "bloß zu."
	done
	
SendN64LassOffText:
    text "Ich war schon"
    line "lange nicht mehr"
    cont "auf dem Festland."

    para "Es wäre schön, mal"
    line "wieder eine Reise"
    cont "dahin zu machen."

    para "Ich habe einen"
    line "Freund in PORT"
    cont "ABANISHI, den ich"
    cont "gerne sehen würde."

    para "Es wäre schon, ihn"
    line "zu treffen und"
    para "einfach ein paar"
    line "Videospiele zu"
    para "spielen und uns zu"
    line "unterhalten."

    para "Was?"

    para "Du kennst genau"
    line "den richtigen Ort"
    cont "dafür?"

    para "Tja, dann ist es"
    line "wohl jetzt an der"
    para "Zeit dies Reise"
    line "anzutreten."

    para "Ich fange gleich"
    line "mit der Urlaubs-"
    cont "planung an!"

    para "Danke!"
	done
	
KumeSocialHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, KUME_CITY, 5
	warp_event  3,  7, KUME_CITY, 5

	db 0 ; coord events

	db 0 ; bg events


	db 5 ; object events
	object_event  5,  1, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KumeSocialHouseN64LassScript, EVENT_KUME_N64_LASS_AT_SOCIAL_HOUSE
	object_event  3,  3, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KumeSocialHouseYoungsterScript, -1
	object_event  0,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KumeSocialHouseCooltrainerfScript, -1
	object_event  6,  5, SPRITE_POKEFAN_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KumeSocialHousePokefanfScript, -1
	object_event  7,  3, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KumeSocialHouseFisherScript, -1
