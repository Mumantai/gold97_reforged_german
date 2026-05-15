	const_def 2 ; object constants
	const BRASSTOWER1F_SAGE1
	const BRASSTOWER1F_SAGE2
	const BRASSTOWER1F_SAGE3
	const BRASSTOWER1F_POKE_BALL

BrassTower1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerSageChow:
	trainer SAGE, CHOW, EVENT_BEAT_SAGE_CHOW, SageChowSeenText, SageChowBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageChowAfterBattleText
	waitbutton
	closetext
	end

BrassTower1FParlyzHeal:
	itemball PARLYZ_HEAL

BrassTower1FStatue:
	jumptext BrassTower1FStatueText

BrassTower1FSign:
	jumptext BrassTower1FSignText

SageChowSeenText:
	text "Wir bewachen"
	line "diesen Turm."

	para "In tiefster Dank-"
	line "barkeit ehren wir"
	cont "hier alle #MON."
	done

SageChowBeatenText:
	text "Da-Danke!"
	done

SageChowAfterBattleText:
	text "Die Basis jeder"
	line "Koexistenz ist"
	cont "Zusammenarbeit."

	para "Lasst uns dies"
	line "nie vergessen!"
	done

TrainerSageNico:
	trainer SAGE, NICO, EVENT_BEAT_SAGE_NICO, SageNicoSeenText, SageNicoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageNicoAfterBattleText
	waitbutton
	closetext
	end


SageNicoSeenText:
    text "Der MESSINGTURM"
    line "wurde vor vielen"
    para "Jahrhunderten"
    line "erbaut."

    para "Es ist uns eine"
    line "Ehre, diesen ge-"
    para "weihten Ort zu"
    line "bewahren."
	done


SageNicoBeatenText:
	text "Vielleicht ver-"
	line "stehst du es."
	done

SageNicoAfterBattleText:
    text "Wir hoffen, dass"
    line "dieser Turm uns"
    para "noch lange erhal-"
    line "ten bleibt."
	done

TrainerSageTroy:
	trainer SAGE, TROY, EVENT_BEAT_SAGE_TROY, SageTroySeenText, SageTroyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageTroyAfterBattleText
	waitbutton
	closetext
	end


SageTroySeenText:
    text "Warum dieser Turm"
    line "gebaut wurde?"

    para "Das weiß niemand."

    para "Aber er diente"
    line "einst als Nest für"
    para "einen legendären"
    line "Vogel."
	done

SageTroyBeatenText:
    text "Halte diesen Ort"
    line "in Ehren."
	done

SageTroyAfterBattleText:
    text "Gehe jeden Schritt"
    line "mit Bedacht."
	done

BrassTower1FStatueText:
	text "Eine PKMN-Statue…"

	para "Sie sieht sehr"
	line "erhaben aus."
	done
	
BrassTower1FSignText:
    text "Dies ist der"
    line "MESSINGTURM."

    para "Ein uraltes"
    line "Monument, das den"
    para "#MON gewidmet"
    line "ist, die das Leben"
    para "der Menschen"
    line "bereichern."

    para "Lies sorgfältig"
    line "die Informationen"
    para "an jeder Statue,"
    line "um zu verstehen,"
    cont "was es uns lehrt."
	done

BrassTower1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5, 11, PAGOTA_CITY, 7
	warp_event  6, 11, PAGOTA_CITY, 11
	warp_event  0,  1, BRASS_TOWER_2F, 1


	db 0 ; coord events

	db 1 ; bg events
	bg_event  4,  1, BGEVENT_READ, BrassTower1FSign
	

	db 4 ; object events
	object_event  0,  2, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSageChow, EVENT_ALLOY_CAPTAIN_AND_TOWER_SAGES_GONE
	object_event  2, 11, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerSageNico, EVENT_ALLOY_CAPTAIN_AND_TOWER_SAGES_GONE
	object_event 10,  6, SPRITE_SAGE, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerSageTroy, EVENT_ALLOY_CAPTAIN_AND_TOWER_SAGES_GONE
	object_event  0,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BrassTower1FParlyzHeal, EVENT_BRASS_TOWER_1F_PARLYZ_HEAL
