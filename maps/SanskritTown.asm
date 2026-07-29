	const_def 2 ; object constants
	const HONTO_COOLTRAINER
	const HONTO_MONSTER
	const HONTO_YOUNGSTER
	const HONTO_LASS

SanskritTown_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.DummyScene0:
	end

.DummyScene1:
	end

.FlyPoint:
	setflag ENGINE_FLYPOINT_MAHOGANY
	return


HontoTownCooltrainermScript:
	faceplayer
	opentext
	writetext HontoTownCooltrainermText
	waitbutton
	closetext
	turnobject HONTO_COOLTRAINER, DOWN
	end

HontoTownLassScript:
	jumptextfaceplayer HontoTownLassText

HontoTownMonsterScript:
	faceplayer
	opentext
	writetext HontoTownMonsterText
	cry DONPHAN
	waitbutton
	closetext
	turnobject HONTO_MONSTER, UP
	end

HontoTownYoungsterScript:
	jumptextfaceplayer HontoTownYoungsterText

SanskritTownSign:
	jumptext SanskritTownSignText

SanskritTownRagecandybarSign:
	jumpstd martsign

MahoganyGymSign:
	jumptext MahoganyGymSignText

SanskritTownPokecenterSign:
	jumpstd pokecentersign
	
HontoTownLassText:
    text "Ich liebe die"
    line "Atmosphäre dieser"
    cont "Stadt."

    para "Ich fühle mich"
    line "fast schon, in"
    cont "der Zeit zurück-"
    cont "versetzt."
	done
	
HontoTownYoungsterText:
    text "Dieser Brunnen ist"
    line "so geheimnisvoll."

    para "Niemand weiß, wer"
    line "ihn gebaut hat."

    para "Aber er stammt"
    line "eindeutig aus der"
    cont "gleichen Zeit wie"
    cont "die RUINEN nörd-"
    cont "lich der Stadt."
	done

HontoTownMonsterText:
	text "DONPHAN: PHYUUU!"
	done

HontoTownCooltrainermText:
    text "Mein DONPHAN hört"
    line "nicht auf mich."

    para "Ich habe es in"
    line "einem Tausch von"
    cont "einem Kumpel be-"
    cont "kommen, aber ich"
    cont "habe nicht genug"
    cont "ORDEN, damit es"
    cont "mir gehorcht."
	done

SanskritTownSignText:
	text "GLYPHONTIA"

	para "Eine Verbindung"
	line "zu NIHONs"
	cont "Vergangenheit"
	done

SanskritTownRagecandybarSignText:
    text "Versuchen Sie"
    line "einen WUTKEKS,"
    cont "während Sie in"
    cont "GLYPHONTIA sind!"
	done

MahoganyGymSignText:
	text "GLYPHTONTIA"
	line "RUINENFORSCHUNGS-"
	cont "ZENTRUM"
	done
	
SanskritWaterfall:
	opentext
	writetext ItsAWaterfallText
	buttonsound
	checkevent EVENT_GOT_HM07_WATERFALL
	iffalse .no
	writetext AttemptToClimbText
	yesorno
	iffalse .no
	closetext
	playsound SFX_BUBBLEBEAM
	applymovement PLAYER, CimbWaterfallMove
	playsound SFX_ENTER_DOOR
	special FadeOutPalettes
	warpfacing UP, TIDAL_GROTTO_1F, 2, 5
	end
.no
	closetext
	end
	
CimbWaterfallMove:
	turn_waterfall UP
	turn_waterfall UP
	turn_waterfall UP	
	step_end
	
ItsAWaterfallText:
	text "It's a mysterious"
	line "waterfall…"
	done
	
AttemptToClimbText:
	text "A strange power is"
	line "emanating from it."
	
	para "Will you try to"
	line "climb it?"
	done

SanskritTown_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 15,  4, SANSKRIT_MART, 1
	warp_event  1,  7, SANSKRIT_COIN_CASE_SPEECH_HOUSE, 1
	warp_event 16, 11, RUINS_OF_ALPH_RESEARCH_CENTER, 1
	warp_event  3, 12, SANSKRIT_POKECENTER_1F, 1
	warp_event  4,  3, SANSKRIT_ROCKET_HOUSE, 1

	db 0 ; coord events

	db 5 ; bg events
	bg_event  6, 12, BGEVENT_READ, SanskritTownSign
	bg_event 16,  4, BGEVENT_READ, SanskritTownRagecandybarSign
	bg_event 14, 12, BGEVENT_READ, MahoganyGymSign
	bg_event  4, 12, BGEVENT_READ, SanskritTownPokecenterSign
	bg_event 10,  8, BGEVENT_READ, SanskritWaterfall

	db 4 ; object events
	object_event  2,  4, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, HontoTownCooltrainermScript, -1
	object_event  2,  5, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, HontoTownMonsterScript, -1
	object_event 11, 11, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, HontoTownYoungsterScript, -1
	object_event 14,  8, SPRITE_LASS, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, HontoTownLassScript, -1
