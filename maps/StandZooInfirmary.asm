	const_def 2 ; object constants
	const STANDPOKE_NURSE1
	const STANDPOKE_FAIRY
	const STANDPOKE_NURSE2

StandZooInfirmary_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

StandZooInfirmaryNurse1Script:
	faceplayer
	opentext
	writetext StandZooInfirmaryNurse1Text
	waitbutton
	closetext
	turnobject STANDPOKE_NURSE1, RIGHT
	end
	

StandZooInfirmaryClefairyScript:
	opentext
	writetext ClefairyWeakText
	writebyte CLEFAIRY
	special PlaySlowCry
	buttonsound
	writetext StandZooInfirmaryItsCryIsWeakText
	waitbutton
	closetext
	end
	
StandZooInfirmaryNurse2Script:
	jumptextfaceplayer StandZooInfirmaryNurse2Text
	
StandZooInfirmaryNurse2Text:
    text "Das ist das"
    line "#MON-Klinikum des"
    para "ZOOs von SENDESTIA"
    line "CITY."

    para "Zum Glück geht es"
    line "all unseren"
    cont "#MON gut!"
	done
	
	
ClefairyWeakText:
	text "PIEPI: …Pi…"
	done
	
StandZooInfirmaryItsCryIsWeakText:
	text "Sein Ruf ist"
	line "schwach…"
	done


StandZooInfirmaryNurse1Text:
    text "Dieses PIEPI"
    line "fühlt sich unwohl."

    para "Wir haben die"
    line "anderen #MON"
    para "aus dem ZOO hinten"
    line "zur Behandlung."

    para "Hoffentlich geht"
    line "es ihnen bald"
    cont "wieder besser."
	done

StandZooInfirmary_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  7, STAND_CITY, 11
	warp_event  4,  7, STAND_CITY, 11

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event 2,  3, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, StandZooInfirmaryNurse1Script, EVENT_CLEARED_RADIO_TOWER
	object_event 3,  3, SPRITE_FAIRY, SPRITEMOVEDATA_STANDING_LEFT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, StandZooInfirmaryClefairyScript, EVENT_CLEARED_RADIO_TOWER
	object_event 2,  3, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, StandZooInfirmaryNurse2Script, EVENT_STAND_CITY_ZOO_MONS_GONE

