	const_def 2 ; object constants
	const BILLSFAMILYSHOUSE_BILL
	const BILLSFAMILYSHOUSE_POKEFAN_F
	const BILLSFAMILYSHOUSE_TWIN

BillsFamilysHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BillScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HM01_CUT
	iftrue .GotCut
	writetext BillTakeThisCutText
	waitbutton
	verbosegiveitem HM_CUT
	setevent EVENT_GOT_HM01_CUT
	setevent EVENT_ROUTE36_GARDENER
	clearevent EVENT_ROUTE36_GARDENER_CHOPPED
	writetext BillGoodLuckText
	waitbutton
	closetext
	end

.GotCut:
	writetext BillAdventuresGoingWellText
	waitbutton
	closetext
	end

BillsMomScript:
	faceplayer
	opentext
	checkevent EVENT_MET_BILL
	iffalse .HaventMetBill
	writetext BillsMomText
	waitbutton
	closetext
	end

.HaventMetBill:
	writetext BillsMomText
	waitbutton
	closetext
	end

BillsSisterScript:
	faceplayer
	opentext
	checkcellnum PHONE_BILL
	iftrue .GotBillsNumber
	writetext BillsSisterUsefulNumberText
	askforphonenumber PHONE_BILL
	ifequal PHONE_CONTACTS_FULL, .NoRoom
	ifequal PHONE_CONTACT_REFUSED, .Refused
	waitsfx
	addcellnum PHONE_BILL
	writetext RecordedBillsNumberText
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	buttonsound
.GotBillsNumber:
	writetext BillsSisterStorageSystemText
	waitbutton
	closetext
	end

.Refused:
	writetext BillsSisterRefusedNumberText
	waitbutton
	closetext
	end

.NoRoom:
	writetext BillsSisterPhoneFullText
	buttonsound
	jump .Refused

BillsHouseBookshelf1:
	jumpstd picturebookshelf

BillsHouseBookshelf2:
	jumpstd magazinebookshelf

BillsHouseRadio:
	jumpstd radio2

BillTakeThisCutText:
    text "BILL: Hallo!"
    line "Erlaube mir, mich"
    cont "vorzustellen!"

    para "Ich bin BILL! Ich"
    line "habe das PC-"
    para "#MON-LAGERUNGS-"
    line "SYSTEM erfunden!"

    para "Ich hoffe, du fin-"
    line "dest es nützlich."

    para "Wenn du vorhast,"
    line "zu reisen, habe"
    para "ich noch etwas,"
    line "das du vielleicht"
    cont "nützlich findest."

    para "Bitte nimm dies."
	done

BillGoodLuckText:
    text "Mit ZERSCHNEIDER"
    line "können deine #-"
    para "MON kleine Bäume"
    line "fällen!"

    para "Er wird dir sicher"
    line "weiterhelfen!"

    para "Und denk daran,"
    line "dass du VMs so oft"
    para "benutzen kannst,"
    line "wie du willst!"

    para "Viel Glück auf"
    line "deinen Reisen!"

    para "Ich bin hier, wenn"
    line "es etwas gibt."
	done

BillAdventuresGoingWellText:
	text "BILL: Hi, <PLAYER>!"
	line "Ich hoffe, deine"
	para "Reise verläuft"
	line "gut!"
	done

BillsMomText:
	text "Mein Mann war als"
	line "#MANIAC "
	para "bekannt. BILL"
	line "muss nach seinem"
	cont "Vater kommen."
	done

BillsSisterUsefulNumberText:
	text "Bist du ein"
	line "Trainer?"

	para "Ich habe eine"
	line "nützliche Telefon-"
	cont "nummer für dich."
	done

RecordedBillsNumberText:
	text "<PLAYER> speichert"
	line "BILLs Nummer."
	done

BillsSisterRefusedNumberText:
	text "Mein Bruder hat"
	line "das PC-#MON-"
	cont "LAGERUNGS-SYSTEM"
	cont "erfunden."

	para "Ich wollte dir ge-"
	line "rade BILLs Nummer"
	cont "geben…"
	done

BillsSisterPhoneFullText:
	text "Du kannst keine"
	line "Nummern mehr spei-"
	cont "chern."
	done

BillsSisterStorageSystemText:
	text "Mein großer Bruder"
	line "BILL hat das PC-"
	cont "#MON-LAGERUNGS-"
	cont "SYSTEM erfunden."
	done

BillsFamilysHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  7, PAGOTA_CITY, 14
	warp_event  4,  7, PAGOTA_CITY, 14

	db 0 ; coord events

	db 3 ; bg events
	bg_event  2,  1, BGEVENT_READ, BillsHouseBookshelf2
	bg_event  3,  1, BGEVENT_READ, BillsHouseBookshelf1
	bg_event  6,  1, BGEVENT_READ, BillsHouseRadio

	db 3 ; object events
	object_event  5,  4, SPRITE_BILL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BillScript, EVENT_MET_BILL
	object_event  2,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BillsMomScript, -1
	object_event  7,  4, SPRITE_TWIN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BillsSisterScript, -1
