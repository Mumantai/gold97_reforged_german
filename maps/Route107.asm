	const_def 2 ; object constants
	const ROUTE21_SWIMMER_GIRL
	const ROUTE21_SWIMMER_GUY
	const ROUTE21_FISHER
	const ROUTE21_FISHER2
	const ROUTE21_SWIMMER_GUY2
	const ROUTE21_SWIMMER_GIRL2

Route107_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerSwimmermSeth:
	trainer SWIMMERM, SETH, EVENT_BEAT_SWIMMERM_SETH, SwimmermSethSeenText, SwimmermSethBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermSethAfterBattleText
	waitbutton
	closetext
	end
	
TrainerSwimmermBerke:
	trainer SWIMMERM, BERKE, EVENT_BEAT_SWIMMERM_BERKE, SwimmermBerkeSeenText, SwimmermBerkeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermBerkeAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfNikki:
	trainer SWIMMERF, NIKKI, EVENT_BEAT_SWIMMERF_NIKKI, SwimmerfNikkiSeenText, SwimmerfNikkiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfNikkiAfterBattleText
	waitbutton
	closetext
	end
	
TrainerFisherHenry:
	trainer FISHER, HENRY, EVENT_BEAT_FISHER_HENRY, FisherHenrySeenText, FisherHenryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherHenryAfterText
	waitbutton
	closetext
	end
	
TrainerSwimmerfSusie:
	trainer SWIMMERF, SUSIE, EVENT_BEAT_SWIMMERF_SUSIE, SwimmerfSusieSeenText, SwimmerfSusieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfSusieAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherArnold:
	trainer FISHER, ARNOLD, EVENT_BEAT_FISHER_ARNOLD, FisherArnoldSeenText, FisherArnoldBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherArnoldAfterBattleText
	waitbutton
	closetext
	end

SwimmermSethSeenText:
	text "Land in Sicht!"
	line "Mach weiter so!"
	done

SwimmermSethBeatenText:
	text "Gluck…"
	done

SwimmermSethAfterBattleText:
	text "Eines Tages möchte"
	line "ich mit der"
	para "Drachenmeisterin"
	line "auf der SATORIA-"
	cont "INSEL trainieren."
	done

SwimmerfNikkiSeenText:
	text "Falls ich gewinne,"
	line "musst du mich mit"
	cont "der Sonnencreme"
	cont "einreiben!"
	done

SwimmerfNikkiBeatenText:
	text "Ich habe Angst vor"
	line "einem Sonnenbrand…"
	done

SwimmerfNikkiAfterBattleText:
	text "Ich muss mich"
	line "vor Hautreizungen"
	cont "in Acht nehmen."
	done

FisherArnoldSeenText:
	text "Angeln langweilt"
	line "mich. Lass uns"
	cont "kämpfen!"
	done

FisherArnoldBeatenText:
	text "Total versagt…"
	done

FisherArnoldAfterBattleText:
	text "Ich gehe zurück"
	line "zum Angeln…"
	done
	
SwimmermBerkeSeenText:
    text "K-kalt…?"
    line "M-mir?"

    para "K-keine Chance!"
	done

SwimmermBerkeBeatenText:
	text "N-nein…"
	line "N-nicht k-kalt!"
	done

SwimmermBerkeAfterBattleText:
	text "…"

	para "…"

	para "…"
	
	para "N-na gut, m-mir"
	line "ist etwas k-kühl…"
	done
	
FisherHenrySeenText:
	text "Meine #MON?"
	line "Frisch gefangen!"
	done

FisherHenryBeatenText:
	text "PLATSCHER?"
	done

FisherHenryAfterText:
	text "Frisch gefangene"
	line "#MON können"

	para "gut trainierten"
	line "nicht Paroli"
	cont "bieten."
	done
	
SwimmerfSusieSeenText:
	text "Du gleitest so"
	line "elegant auf deinem"
	cont "#MON dahin."
	done

SwimmerfSusieBeatenText:
	text "Ich bin"
	line "geschlagen…"
	done

SwimmerfSusieAfterBattleText:
	text "Gab es da nicht"
	line "einmal einen Hit,"
	cont "der von einem"
	cont "Jungen handelte,"
	cont "der auf einem"
	cont "LAPRAS ritt?"
	done

Route107_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  8, 49, ROUTE_107_ALLOY_GATE, 1
	warp_event  9, 49, ROUTE_107_ALLOY_GATE, 2

	db 0 ; coord events

	db 0 ; bg events

	db 6 ; object events
	object_event 10, 31, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfNikki, -1
	object_event  9, 40, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermSeth, -1
	object_event 12, 26, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherArnold, -1
	object_event  6,  9, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherHenry, -1
	object_event  5, 13, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermBerke, -1
	object_event 11,  5, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfSusie, -1
