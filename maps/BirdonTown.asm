	const_def 2 ; object constants
	const BIRDONTOWN_GRAMPS
	const BIRDONTOWN_TEACHER
	const BIRDONTOWN_YOUNGSTER

BirdonTown_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .Flypoint

.Flypoint:
	setflag ENGINE_FLYPOINT_BIRDON
	return

BirdonTownGrampsScript:
	jumptextfaceplayer BirdonTownGrampsTextBefore

BirdonTownTeacherScript:
	jumptextfaceplayer BirdonTownTeacherText

BirdonTownYoungsterScript:
	jumptextfaceplayer BirdonTownYoungsterText


BirdonTownSign:
	jumptext BirdonTownSignText


BirdonGymSign:
	jumptext BirdonGymSignText

SlowpokeWellSign:
	jumptext SlowpokeWellSignText


BirdonTownIlextForestSign:
	jumptext BirdonTownIlexForestSignText

BirdonTownPokecenterSign:
	jumpstd pokecentersign

BirdonTownMartSign:
	jumpstd martsign

WhiteApricornTree:
	fruittree FRUITTREE_BIRDON_TOWN

BirdonTownHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_BIRDON_TOWN_HIDDEN_FULL_HEAL


BirdonTownGrampsTextBefore:
    text "JENS, der örtliche"
    line "ARENALEITER, ist"
    cont "ein mysteriöser"
    cont "Mann."

    para "Es ist nicht viel"
    line "über ihn bekannt."

    para "Es ist jedoch be-"
    line "bekannt, dass er"
    cont "die Mythen und"
    cont "Legenden von NIHON"
    cont "erforscht."

    para "Er ist natürlich"
    line "auch ein ausge-"
    cont "zeichnter Trainer."
	done

BirdonTownTeacherText:
    text "Wir kriegen hier"
    line "kaum Regena ab."

    para "Der FLEGMON-"
    line "BRUNNEN ist daher"
    cont "ein wichtiger Teil"
    cont "des Ökosystems."
	done

BirdonTownYoungsterText:
    text "Östlich von hier,"
    line "weit die Straße"
    cont "runter, ist der"
    cont "JADEWALD."

    para "Dahinter liegt"
    line "GENEOS CITY."

    para "Die Reise dorthin"
    line "ist lang."

    para "Ruh dich hier aus,"
    line "wenn du vorhast,"
    cont "dorthin zu gehen."
	done

BirdonTownSlowpokeText1:
	text "FLEGMON: …"

	para "<……> <……> <……>"
	done

BirdonTownSlowpokeText2:
	text "<……> <……>Gähn?"
	done


BirdonTownSignText:
	text "TOTOMONIA"

	para "Karg an Pflanzen,"
    line "aber nicht an"
    cont "Freundschaft"
	done


BirdonGymSignText:
	text "PKMN-ARENA von"
	line "TOTOMONIA"
	cont "LEITUNG: JENS"

	para "Der mystische Se-"
	line "her der Zukunft"
	done

SlowpokeWellSignText:
	text "FLEGMON-BRUNNEN"

	para "Eine Oase Für"
	line "FLEGMON in einer"
	cont "dürren Umgebung"
	done


BirdonTownIlexForestSignText:
	text "JADEWALD"

	para "Tritt durch das"
	line "Tor"
	done

BirdonTown_MapEvents:
	db 0, 0 ; filler

	db 10 ; warp events
	warp_event 15,  4, BIRDON_POKECENTER_1F, 1
	warp_event  3, 13, BIRDON_CAFE, 1
	warp_event  3,  4, BIRDON_MART, 1
	warp_event  4,  9, BIRDON_ELDERS_HOUSE, 1
	warp_event 14, 15, BIRDON_GYM, 1
	warp_event  9,  9, SLOWPOKE_WELL_B1F, 1
	warp_event  8,  5, ROUTE_116_GATE, 3
	warp_event  9,  5, ROUTE_116_GATE, 4
	warp_event 15, 15, BIRDON_GYM, 2
	warp_event  9, 13, BIRDON_SPEECH_HOUSE, 1

	db 0 ; coord events

	db 7 ; bg events
	bg_event  6, 14, BGEVENT_READ, BirdonTownSign
	bg_event 13, 14, BGEVENT_READ, BirdonGymSign
	bg_event 11, 10, BGEVENT_READ, SlowpokeWellSign
	bg_event 16,  4, BGEVENT_READ, BirdonTownPokecenterSign
	bg_event  4,  4, BGEVENT_READ, BirdonTownMartSign
	bg_event  0,  0, BGEVENT_READ, BirdonTownIlextForestSign
	bg_event  2,  7, BGEVENT_ITEM, BirdonTownHiddenFullHeal

	db 4 ; object events
	object_event 14, 11, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BirdonTownGrampsScript, -1
	object_event  6,  6, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, 1, 1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BirdonTownTeacherScript, -1
	object_event  3, 11, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BirdonTownYoungsterScript, -1
	object_event 13,  7, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WhiteApricornTree, -1
