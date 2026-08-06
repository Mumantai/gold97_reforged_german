	const_def 2 
	const SAFARIFATMAN
	const SAFARIPOKEFAN1
	const SAFARIPOKEFAN2
	const SAFARITRAINER
	const SAFARIITEM

SafariZoneBeta_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


SafariFatman:
	jumptextfaceplayer SafariFatmanText
	
SafariFatmanText:
    text "Jetzt, wo unser"
    line "Zuchtprogramm"
    cont "abgeschlossen ist,"
    cont "ist der Park für"
    cont "alle komplett"
    cont "frei zugänglich."

    para "Das Programm hat"
    line "dabei geholfen,"
    cont "einige #MON,"
    cont "wie RIHORN und"
    cont "OWEI zurück in"
    cont "ihre natürlichen"
    cont "Lebensräume zu"
    cont "bringen."
	done

SafariPokefan1:
	jumptextfaceplayer SafariPokefan1Text
	
SafariPokefan1Text:
    text "Ich hörte, dieses"
    line "FLEGMON von WÄRTER"
    cont "investiert jetzt"
    cont "in andere Unter-"
    cont "nehmen in ganz"
    cont "NIHON."

    para "Der ZOO von"
    line "SENDESTIA CITY ist"
    cont "wohl sein neuester"
    cont "Investitionsplan."
	done

SafariPokefan2:
	jumptextfaceplayer SafariPokefan2Text
	
SafariPokefan2Text:
    text "KOKOWEI ist mein"
    line "Lieblings-#MON!"

    para "Ich hoffe, ich"
    line "kann eines so groß"
    cont "züchten, dass es"
    cont "meinem kompletten"
    cont "Garten Schatten"
    cont "spenden kann!"
	done


SafariCooltrainer:
	jumptextfaceplayer SafariCooltrainerText
	
SafariCooltrainerText:
    text "In der SAFARI ZONE"
    line "kann man viele"
    cont "starke #MON für"
    cont "sein Team finden."
	done
	
SafariItem:
	itemball ULTRA_BALL
	
SafarizoneSign:
	jumptext SafarizoneSignText
	
SafarizoneSignText:
    text "WILLKOMMEN IN DER"
    line "SAFARI ZONE!"

    para "BITTE HABT ETWAS"
    line "RESPEKT: NEHMT"
    cont "EUREN MÜLL WIEDER"
    cont "MIT NACH DRAUẞEN!"
	done

SafariTrash:
	jumptext SafariTrashtext
	
SafariTrashtext:
    text "Der Mülleimer ist"
    line "zum Glück nicht"
    cont "leer."
	done

SafariZoneBeta_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 10, 31, SAFARI_ZONE_FUCHSIA_GATE_BETA, 1
	warp_event 11, 31, SAFARI_ZONE_FUCHSIA_GATE_BETA, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event 11, 19, BGEVENT_READ, SafarizoneSign
	bg_event  8, 26, BGEVENT_READ, SafariTrash

	db 5 ; object events
	object_event  4, 20, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SafariFatman, -1
	object_event 11, 11, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SafariPokefan1, -1
	object_event  3, 16, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SafariPokefan2, -1
	object_event  6,  9, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SafariCooltrainer, -1
	object_event 17, 25, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SafariItem, EVENT_SAFARI_ITEMBALL
