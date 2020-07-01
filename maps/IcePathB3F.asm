	const_def 2 ; object constants
	const ICEPATHB3F_POKE_BALL
	const ICEPATHB3F_ROCK

IcePathB3F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

IcePathB3FNevermeltice:
	itemball NEVERMELTICE

IcePathB3FRock:
	jumpstd smashrock

IcePathB3F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  3, 15, DRAGONS_DEN_1F, 4
	warp_event  5,  3, ICE_PATH_1F, 1
	warp_event 15, 15, ICE_PATH_1F, 2
	warp_event 15,  3, DRAGONS_DEN_1F, 5

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event 17,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IcePathB3FNevermeltice, EVENT_ICE_PATH_B3F_NEVERMELTICE
	object_event -6,  1, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IcePathB3FRock, -1
