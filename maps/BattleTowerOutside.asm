	const_def 2 ; object constants
	const BATTLETOWEROUTSIDE_STANDING_YOUNGSTER
	const BATTLETOWEROUTSIDE_BUENA
	const BATTLETOWEROUTSIDE_SAILOR
	const BATTLETOWEROUTSIDE_LASS

BattleTowerOutside_MapScripts:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_TILES, .Callback1
	callback MAPCALLBACK_OBJECTS, .Callback2

.Callback1:
	return

.Callback2:
	clearevent EVENT_BATTLE_TOWER_OUTSIDE_SAILOR
	return

BattleTowerOutsideYoungsterScript:
	jumptextfaceplayer BattleTowerOutsideYoungsterText

BattleTowerOutsideBuenaScript:
	jumptextfaceplayer BattleTowerOutsideBuenaText

BattleTowerOutsideSailorScript:
	jumptextfaceplayer BattleTowerOutsideSailorText

BattleTowerOutsideSign:
	jumptext BattleTowerOutsideSignText
	
TatsugoPathSign:
	jumptext TatsugoPathSignText
	
ThiefNewBTScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_EXTRA_THIEF_TM
	iftrue .afterwards
	writetext ThiefManIntroText
	waitbutton
	verbosegiveitem TM_THIEF
	setevent EVENT_GOT_EXTRA_THIEF_TM
.afterwards:
	writetext ThiefManSecondText
	waitbutton
	closetext
	end
	
ThiefManIntroText:
	text "Psst…"
	line "Hey Knirps…"

	para "Willst du wissen,"
	line "wie man im DUELL-"
	cont "TURM gewinnt?"

	para "Du brauchst Items,"
	line "die du deinen"
	cont "#MON zu tragen"
	cont "gibst!"

	para "An die kommt man"
	line "aber nur schwer"
	cont "ran, nicht wahr?"

	para "Tja, ich habe hier"
	line "etwas, das es dir"
	cont "leichter macht,"
	cont "welche zu kriegen!"
	done

ThiefManSecondText:
    text "Mit RAUB kannst du"
    line "deinem Gegner das"
    cont "getragene Item"
    cont "einfach wegnehmen!"

    para "Wenn du das mal"
    line "bei ARENALEITERN"
    cont "ausprobierst,"
    cont "kannst du aller-"
    cont "hand guter Items"
    cont "abstauben…"
	done


BattleTowerOutsideYoungsterText:
	text "Wow, der DUELLTURM"
	line "ist riesig!"

	para "Es muss dort viele"
	line "#MON geben!"
	done

BattleTowerOutsideBuenaText:
	text "Du darfst nur drei"
	line "#MON einsetzen."

	para "Es fällt einem"
	line "nicht leicht, drei"

	para "#MON für den"
	line "Kampf auszuwählen…"
	done

BattleTowerOutsideSailorText:
	text "Hehehe, ich drücke"
	line "mich vor der Ar-"
	cont "beit. Ich kann"

	para "nicht zurück, bis"
	line "ich siege. Ich"

	para "muss alles gewin-"
	line "nen. Es ist ein"
	cont "Zwang!"
	done

BattleTowerOutsideSignText:
	text "DUELLTURM"

	para "Die ultimative"
	line "Herausforderung!"
	done

TatsugoPathSignText:
	text "TATSUGO PFAD"
	
	para "AMAMIA  -"
	line "KIKAITANI"
	done

BattleTowerOutside_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event  8,  9, BATTLE_TOWER_1F, 1
	warp_event  9,  9, BATTLE_TOWER_1F, 2
	warp_event 10, 21, AMAMI_BATTLE_TOWER_GATE, 3
	warp_event 11, 21, AMAMI_BATTLE_TOWER_GATE, 4
	warp_event 12, 24, AMAMI_BATTLE_TOWER_GATE, 5
	warp_event 12, 25, AMAMI_BATTLE_TOWER_GATE, 6
	
	db 0 ; coord events

	db 2 ; bg events
	bg_event 12, 10, BGEVENT_READ, BattleTowerOutsideSign
	bg_event 18, 22, BGEVENT_READ, TatsugoPathSign

	db 4 ; object events
	object_event  6, 12, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BattleTowerOutsideYoungsterScript, -1
	object_event 13, 13, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BattleTowerOutsideBuenaScript, -1
	object_event 12, 18, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleTowerOutsideSailorScript, EVENT_BATTLE_TOWER_OUTSIDE_SAILOR_NEW
	object_event  5, 17, SPRITE_PHARMACIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ThiefNewBTScript, -1
