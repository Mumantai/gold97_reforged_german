	const_def 2 ; object constants
	const ENDONCAVE1F_POKEFAN_M
	const ENDONCAVE1F_POKEMANIAC
	const ENDONCAVE1F_ITEM_1

EndonCave1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


EndonCave1FTMDynamicpunch:
	itemball TM_DYNAMICPUNCH

EndonCave1FHiddenMaxRevive:
	hiddenitem MAX_REVIVE, EVENT_ENDON_CAVE_1F_HIDDEN_MAX_REVIVE


EndonCave1FNuggetGuyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_NUGGET_FROM_ENDON_CAVE_NUGGET_GUY
	iftrue .GotNugget
	writetext EndonCave1FNuggetGuyText
	buttonsound
	verbosegiveitem NUGGET
	iffalse .NoRoom
	setevent EVENT_GOT_NUGGET_FROM_ENDON_CAVE_NUGGET_GUY
.GotNugget:
	writetext EndonCave1FNuggetGuyText_GotNugget
	waitbutton
.NoRoom:
	closetext
	end

TrainerPokemaniacCalvin:
	trainer POKEMANIAC, CALVIN, EVENT_BEAT_POKEMANIAC_CALVIN, PokemaniacCalvinSeenText, PokemaniacCalvinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacCalvinAfterBattleText
	waitbutton
	closetext
	end

EndonCave1FNuggetGuyText:
    text "Hallo!"

    para "Ich sehe zwar"
    line "nicht danach aus,"
    cont "aber ich bin echt"
    cont "stinkreich."

    para "Doch der Reichtum"
    line "langweilt mich."

    para "Deshalb suche ich"
    line "ständig nach"
    cont "Abwechslung."

    para "Zuletzt habe ich"
    line "beschlossen, Höh-"
    cont "len zu erforschen!"

    para "Höhlen sind so"
    line "faszinierend!"

    para "Man kann sich in"
    line "ihnen so leicht"
    cont "verlaufen!"

    para "Hinter jeder Ecke"
    line "wartet etwas Neues"
    cont "auf einen!"

    para "Oh und danke dir"
    line "für's Zuhören!"

    para "Hier, nimm das!"
	done

EndonCave1FNuggetGuyText_GotNugget:
    text "Das ist ein echtes"
    line "NUGGET!"

    para "Es ist äußerst"
    line "wertvoll."

    para "Es ist tatsächlich"
    line "nicht Teil meines"
    cont "Vermögens!"

    para "Ich habe es hier"
    line "in dieser Höhle"
    cont "gefunden!"

    para "Ahahahahah!"
	done
	
PokemaniacCalvinSeenText:
    text "Ich habe die ganze"
    line "Zeit lang meine"
    cont "#MON in dieser"
    cont "Höhle trainiert."

    para "Ich würde gerne"
    line "mit dir kämpfen."
	done

PokemaniacCalvinBeatenText:
	text "…seufz… Ich muss"
	line "mehr trainieren…"
	done

PokemaniacCalvinAfterBattleText:
    text "Warst du schon mal"
    line "in GLYPHONTIA?"

    para "Es ist ein geheim-"
    line "nisvoller Ort."
	done

EndonCave1F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  6, 15, ROUTE_117, 1
	warp_event 56, 15, ROUTE_117, 2
	warp_event 25,  5, ENDON_CAVE_B1F, 1
	warp_event 51, 11, ENDON_CAVE_B1F, 2

	db 0 ; coord events

	db 1 ; bg events
	bg_event  7, 10, BGEVENT_ITEM, EndonCave1FHiddenMaxRevive

	db 3 ; object events
	object_event 16,  7, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EndonCave1FNuggetGuyScript, -1
	object_event 14, 12, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPokemaniacCalvin, -1
	object_event  4,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, EndonCave1FTMDynamicpunch, EVENT_GOT_TM01_DYNAMICPUNCH

