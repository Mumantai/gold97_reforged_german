	const_def 2 ; object constants
	const ROUTE6SAFFRONGATE_OFFICER

Route6SaffronGate_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene

	db 0 ; callbacks

.DummyScene:
	end

Route6SaffronGuardScript:
	jumptextfaceplayer Route6SaffronGuardWelcomeText


Route6SaffronGuardWelcomeText:
	text "Somedays I wish"
	line "I could leave my"
	para "guard post and go"
	line "relax out on the"
	cont "beach."
	done


Route6SaffronGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, SAFFRON_CITY, 4
	warp_event  5,  0, SAFFRON_CITY, 5
	warp_event  4,  7, ROUTE_10_SOUTH, 1
	warp_event  5,  7, ROUTE_10_SOUTH, 2

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route6SaffronGuardScript, -1
