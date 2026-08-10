	const_def 2 ; object constants
	const SAFFRON_MAGNET_TRAIN_STATION_BULBASAUR_LADY
	const SAFFRON_MAGNET_TRAIN_STATION_ODDISH
	const SAFFRON_MAGNET_TRAIN_STATION_BULBASAUR
	const SAFFRON_MAGNET_TRAIN_STATION_PARAS
	const SAFFRON_MAGNET_TRAIN_STATION_YOUNGSTER
RyukyuArboretum_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


SaffronMagnetTrainSpeechHouseCooltrainer:
	faceplayer
	opentext
	checkevent EVENT_EXPLODING_TRAP_14
	iftrue .AlreadyGotBulbasaur
	writetext ILoveBulbasaurText
	yesorno
	iffalse .DontTakeBulbasaur
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFullBulbasaur
	writetext UnknownText_0x7e355ab
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke BULBASAUR, 5
	writetext GiveBulbasaurText
	waitbutton
	closetext
	disappear SAFFRON_MAGNET_TRAIN_STATION_BULBASAUR
	setevent EVENT_EXPLODING_TRAP_14
	end
	
.AlreadyGotBulbasaur
	writetext AlreadyGotBulbasaurText
	waitbutton
	closetext
	end
	
.DontTakeBulbasaur
	writetext NoBulbasaurText
	waitbutton
	closetext
	end
	
.PartyFullBulbasaur
	writetext PartyFullBulbasaurText
	waitbutton
	closetext
	end
	
SaffronMagnetTrainOddishScript:
	faceplayer
	opentext
	writetext SaffronMagnetTrainOddishText
	cry ODDISH
	waitbutton
	closetext
	end
	
SaffronMagnetTrainBulbasaurScript:
	faceplayer
	opentext
	writetext SaffronMagnetTrainBulbasaurText
	cry BULBASAUR
	waitbutton
	closetext
	end
	
SaffronMagnetTrainParasScript:
	faceplayer
	opentext
	writetext SaffronMagnetTrainParasText
	cry PARAS
	waitbutton
	closetext
	end
	
SaffronMagnetTrainSpeechHouseYoungsterScript:
	jumptextfaceplayer SaffronMagnetTrainSpeechHouseYoungsterText
	
SaffronMagnetTrainSpeechHouseYoungsterText:
    text "Dieser Ort ist"
    line "klasse!"

    para "Pflanzen-#MON"
    line "fühlen sich hier"
    cont "besonders wohl!"
	done
	
SaffronMagnetTrainParasText:
	text "PARAS:"
	line "Paraa…"
	done
	
SaffronMagnetTrainBulbasaurText:
	text "BISASAM:"
	line "Bisa!"
	done
	
SaffronMagnetTrainOddishText:
	text "MYRAPLA:"
	line "Myyy?"
	done
	
UnknownText_0x7e355ab:
	text "<PLAYER> erhält"
	line "BISASAM."
	done

AlreadyGotBulbasaurText:
	text "Ich habe viele"
	line "Baumarten aus"
	cont "ganz NIHON!"
	done

PartyFullBulbasaurText:
    text "Du trägst zu viele"
    line "#MON mit dir!"
	done

NoBulbasaurText:
	text "Ich verstehe."

	para "Ich warte hier,"
	line "falls du es dir"
	cont "anders überlegst!"
	done


ILoveBulbasaurText:
    text "Hallo!"

    para "Ich betreibe"
    line "dieses Arboretum."

    para "Das heißt, ich"
    line "kümmere mich um"
    cont "Bäume!"

    para "Dieses Gebäude ist"
    line "voller Fenster,"
    para "die Licht für die"
    line "Bäume reinlassen."

    para "Hier leben auch"
    line "viele Pflanzen-"
    para "#MON, um die"
    line "ich mich kümmere!"

    para "Leider habe ich"
    line "nur begrenzt Platz"
    cont "für #MON hier."

    para "Ich suche gerade"
    line "nach einem guten"
    para "Zuhause für ein"
    line "BISASAM."

    para "Würdest du es"
    line "vielleicht bei"
    cont "dir aufnehmen?"
	done

GiveBulbasaurText:
	text "Ich bin sicher,"
	line "du kümmerst dich"
	cont "gut darum!"
	done


RyukyuArboretum_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  8, 17, RYUKYU_CITY, 8
	warp_event  9, 17, RYUKYU_CITY, 9
	
	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event  7,  4, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SaffronMagnetTrainSpeechHouseCooltrainer, -1
	object_event  5, 13, SPRITE_ODDISH, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SaffronMagnetTrainOddishScript, -1
	object_event 14,  8, SPRITE_BULBASAUR, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SaffronMagnetTrainBulbasaurScript, EVENT_EXPLODING_TRAP_14
	object_event  6,  7, SPRITE_PARAS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SaffronMagnetTrainParasScript, -1
	object_event 12, 11, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SaffronMagnetTrainSpeechHouseYoungsterScript, -1
