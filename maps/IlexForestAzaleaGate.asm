	const_def 2 ; object constants
	const ILEXFORESTAZALEAGATE_OFFICER

IlexForestAzaleaGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

IlexForestAzaleaGateOfficerScript:
	jumptextfaceplayer IlexForestAzaleaGateOfficerText

IlexForestAzaleaGateOfficerText:
	text "ROUTE 115 is a hot"
	line "spot for really"
	cont "tough trainers."
	para "But I'm sure you'd"
	line "be able to take"
	cont "them!"
	done


IlexForestAzaleaGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  7, ROUTE_27, 1
	warp_event  1,  7, ROUTE_27, 1
	warp_event  8,  7, CELADON_CITY, 10
	warp_event  9,  7, CELADON_CITY, 10

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, IlexForestAzaleaGateOfficerScript, -1
