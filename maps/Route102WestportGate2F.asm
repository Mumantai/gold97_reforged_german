	const_def 2 ; object constants
	const NEWVIOLETGATENORTH2F_FISHER

Route102WestportGate2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

	
Route102WestportGate2FFisherScript:
	faceplayer
	opentext
	checkflag ENGINE_HIVEBADGE
	iftrue .DocksOpen
	writetext DocksClosedText
	waitbutton
	closetext
	end
	
.DocksOpen
	writetext Route102WestportGate2FFisherText
	waitbutton
	closetext
	end

Route102WestportGate2FFisherText:
    text "Die Fähre von PORT"
    line "ABANISHI nach"
    para "TEKNOPIA CITY ist"
    line "wieder in Betrieb."

    para "Du solltest sie"
    line "bei Gelegenheit"
    cont "ausprobieren."
	done
	
DocksClosedText:
    text "Am Hafen von PORT"
    line "ABANISHI legt"
    para "die Fähre nach"
    line "TEKNOPIA CITY ab,"
    para "aber er ist zur"
    line "Zeit geschlossen."
	done
	
	
Route102WestportGate2FSign:
	jumptext Route102WestportGate2FSignText
	
Route102WestportGate2FSignText:
	text "<PLAY_G> schaut"
    line "durch das"
    cont "Fernrohr!"

    para "Im Norden ist eine"
    line "kleine Wüstenstadt"
    cont "zu sehen!"
	done

Route102WestportGate2FSign2:
	jumptext Route102WestportGate2FSign2Text
	
Route102WestportGate2FSign2Text:
	text "<PLAY_G> schaut"
    line "durch das"
    cont "Fernrohr!"

    para "Da ist der"
    line "RADIOTURM!"
	done
	
Route102WestportGate2F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  5,  0, ROUTE_102_WESTPORT_GATE, 5

	db 0 ; coord events

	db 2 ; bg events
	bg_event 1,  0, BGEVENT_READ, Route102WestportGate2FSign
	bg_event 3,  0, BGEVENT_READ, Route102WestportGate2FSign2

	db 1 ; object events
	object_event  3,  3, SPRITE_FISHER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route102WestportGate2FFisherScript, -1
	