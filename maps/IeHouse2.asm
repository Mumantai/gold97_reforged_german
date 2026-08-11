	const_def 2
	const IENPCHOUSE2

IeHouse2_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Ie2NPCScript:
	jumptextfaceplayer Ie2NPCText
	
Ie2NPCText:
    text "Es gibt eine alte"
    line "Geschichte hier im"
    cont "Dorf über eine"
    cont "traurige Frau, die"
    cont "auf den Gipfel des"
    cont "SCHLOSSBERGs stieg"
    cont "und dort ihr Ende"
    cont "fand."

    para "Manche sagen, dass"
    line "ihr Geist noch"
    cont "heute die Gegend"
    cont "um das SCHLOSS"
    cont "heimsucht."
	done

IeHouse2_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, IE_TOWN, 5
	warp_event  5,  7, IE_TOWN, 5

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  4,  3, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Ie2NPCScript, -1
