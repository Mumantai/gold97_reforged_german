PokemonTower3F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PokemonTower3F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  3,  9, POKEMON_TOWER_2F, 2

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events