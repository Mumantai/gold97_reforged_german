	const_def 2
	const PLANT_SURGE
	const PP_VOLTORB1
	const PP_VOLTORB2
	const PP_VOLTORB3
	const PP_VOLTORB4
	const PP_VOLTORB5
	const PP_VOLTORB6
	const PP_VOLTORB7
	const PP_VOLTORB8
	const PP_ITEM1
	const PP_ITEM2
	const PP_ITEM3
	const PP_ITEM4

KantoPowerPlant_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SurgeScript:
	faceplayer
	checkevent EVENT_WON_SURGE_BATTLE
	iftrue Surge_afterbattle
	opentext
	writetext Surge_beforebattletext
	waitbutton
	closetext
	winlosstext Surge_beatentext, 0
	loadtrainer LT_SURGE, LT_SURGE1
	startbattle
	reloadmapafterbattle
	setevent EVENT_WON_SURGE_BATTLE
	;fallthrough

Surge_afterbattle:
	checkevent EVENT_TOOK_THE_PICHU
	iftrue Surge_afterpichu
	opentext
	writetext SurgeTakeThisPichuText
	waitbutton
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFullSurge
	writetext SurgePlayerReceivedPichuText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke PICHU, 15
	special GivePichu
	setevent EVENT_TOOK_THE_PICHU
	writetext SurgeExplainPichuMetronomeText
	waitbutton
	closetext
	end

.PartyFullSurge:
	writetext SurgePartyFullText
	waitbutton
	closetext
	end

Surge_afterpichu:
	opentext
	writetext SurgeFinalText
	waitbutton
	closetext
	end

Surge_beforebattletext:
    text "MAJOR BOB: Hey, du"
    line "kleiner Wicht!"

    para "Was bringt ein"
    line "Kind wie dich zu"
    cont "diesem verlassenen"
    cont "Schrottplatz?"

    para "Hier trainiere"
    line "ich meine starken"
    cont "ELEKTRO-#MON!"

    para "Wenn du auf der"
    line "Suche nach einer"
    cont "Herausforderung"
    cont "bist, hast du"
    cont "eine gefunden!"

    para "Ich knips dir"
    line "die Lichter aus,"
    cont "wie einst meinen"
    cont "Feinden im Krieg!"
	done

Surge_beatentext:
    text "MAJOR BOB: Arrrgh!"
    line "Du bist stark!"

    para "Du bist kein"
    line "gewöhnliches Kind,"
    cont "so viel steht"
    cont "fest!"
	done

SurgeTakeThisPichuText:
    text "Also, was ist los?"

    para "An diesem alten"
    line "Ort gibt es außer"
    cont "VLOTOBAL nichts zu"
    cont "finden!"

    para "…"

    para "Du bist wegen der"
    line "ARENAORDEN hier?"

    para "Hah! Tut mir leid,"
    line "Knirps, aber ich"
    cont "bin außer Dienst,"
    cont "seit die LIGA sich"
    cont "auf das ganze Land"
    cont "ausgedehnt hat!"

    para "Ich habe zwar"
    line "keinen DONNERORDEN"
    cont "zu vergeben, aber"
    cont "vielleicht wärst"
    cont "du ein passender"
    cont "Trainer für dieses"
    cont "PICHU, das ich"
    cont "ausgebrütet habe!"

    para "Ich kann nicht"
    line "gut mit Kindern,"
    cont "also pass du gut"
    cont "darauf auf!"
	done

SurgeExplainPichuMetronomeText:
    text "Dieses PICHU kennt"
    line "eine besondere"
    cont "Attacke!"

    para "#MON aus dem Ei"
    line "können das oft!"
	done


SurgePlayerReceivedPichuText:
	text "<PLAYER> erhält"
	line "PICHU!"
	done

SurgePartyFullText:
    text "Vielleicht"
    line "solltest du erst"
    cont "Platz in deinem"
    cont "Team machen!"
	done

SurgeFinalText:
    text "Viel Glück in"
    line "der INDIGO-ARENA!"

    para "Du wirst es"
    line "brauchen!"
	done

;----------------------------------------------------------------------------------------

Voltorb1:
	faceplayer
	opentext
	writetext VoltorbText
	cry VOLTORB
	pause 15
	closetext
	setevent EVENT_PP_VOLTORB1
	loadwildmon VOLTORB, 40
	startbattle
	disappear PP_VOLTORB1
	reloadmapafterbattle
	end

Voltorb2:
	faceplayer
	opentext
	writetext VoltorbText
	cry VOLTORB
	pause 15
	closetext
	setevent EVENT_PP_VOLTORB2
	loadwildmon VOLTORB, 40
	startbattle
	disappear PP_VOLTORB2
	reloadmapafterbattle
	end

Voltorb3:
	faceplayer
	opentext
	writetext VoltorbText
	cry VOLTORB
	pause 15
	closetext
	setevent EVENT_PP_VOLTORB3
	loadwildmon VOLTORB, 40
	startbattle
	disappear PP_VOLTORB3
	reloadmapafterbattle
	end

Voltorb4:
	faceplayer
	opentext
	writetext VoltorbText
	cry ELECTRODE
	pause 15
	closetext
	setevent EVENT_PP_VOLTORB4
	loadwildmon ELECTRODE, 43
	startbattle
	disappear PP_VOLTORB4
	reloadmapafterbattle
	end

Voltorb5:
	faceplayer
	opentext
	writetext VoltorbText
	cry VOLTORB
	pause 15
	closetext
	setevent EVENT_PP_VOLTORB5
	loadwildmon VOLTORB, 40
	startbattle
	disappear PP_VOLTORB5
	reloadmapafterbattle
	end

Voltorb6:
	faceplayer
	opentext
	writetext VoltorbText
	cry VOLTORB
	pause 15
	closetext
	setevent EVENT_PP_VOLTORB6
	loadwildmon VOLTORB, 40
	startbattle
	disappear PP_VOLTORB6
	reloadmapafterbattle
	end

Voltorb7:
	faceplayer
	opentext
	writetext VoltorbText
	cry ELECTRODE
	pause 15
	closetext
	setevent EVENT_PP_VOLTORB7
	loadwildmon ELECTRODE, 43
	startbattle
	disappear PP_VOLTORB7
	reloadmapafterbattle
	end

Voltorb8:
	faceplayer
	opentext
	writetext VoltorbText
	cry VOLTORB
	pause 15
	closetext
	setevent EVENT_PP_VOLTORB8
	loadwildmon VOLTORB, 40
	startbattle
	disappear PP_VOLTORB8
	reloadmapafterbattle
	end

VoltorbText:
	text "Bzzzt!"
	done

PPItem1:
	itemball CARBOS

PPItem2:
	itemball HP_UP

PPItem3:
	itemball RARE_CANDY

PPItem4:
	itemball TM_THUNDERPUNCH


KantoPowerPlant_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  4, 35, KANTO_REGION, 36
	warp_event  0, 10, KANTO_REGION, 36
	warp_event  5, 35, KANTO_REGION, 36

	db 0 ; coord events

	db 0 ; bg events

	db 13 ; object events
	object_event  4,  8, SPRITE_SURGE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SurgeScript, -1
	object_event  9, 18, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Voltorb1, -1
	object_event 34, 19, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Voltorb2, -1
	object_event 17, 24, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Voltorb3, -1
	object_event 32,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Voltorb4, -1
	object_event 18, 31, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Voltorb5, -1
	object_event 25, 28, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Voltorb6, -1
	object_event 21, 19, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Voltorb7, -1
	object_event 36, 31, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Voltorb8, -1
	object_event  7, 27, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PPItem1, EVENT_PP_ITEM1
	object_event 27, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PPItem2, EVENT_PP_ITEM2
	object_event 34,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PPItem3, EVENT_PP_ITEM3
	object_event 26,  32, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PPItem4, EVENT_PP_ITEM4
	