	const_def 2 ; object constants
	const LAVENDERNAMERATER_NAME_RATER

LavenderNameRater_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene

	db 0 ; callbacks

.DummyScene:
	end

LavenderNameRater:
	jumptextfaceplayer LavenderNameRaterText
	end
	
LavenderNameRaterText:
	text "NORTH ISLAND is"
	line "cold and remote."
	para "We don't get many"
	line "visitors."
	para "But those who live"
	line "here are a close"
	cont "community."
	done


LavenderNameRaterRadio:
	jumpstd radio2

LavenderNameRater_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, CINNABAR_ISLAND, 5
	warp_event  5,  7, CINNABAR_ISLAND, 5

	db 0 ; coord events


	db 1 ; bg events
	bg_event  4,  1, BGEVENT_READ, LavenderNameRaterRadio

	db 1 ; object events
	object_event  2,  3, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LavenderNameRater, -1
