	const_def 2 ; object constants
	const BIRDONPOKECENTER1F_NURSE
	const BIRDONPOKECENTER1F_FISHER
	const BIRDONPOKECENTER1F_POKEFAN_M
	const BIRDONPOKECENTER1F_GENTLEMAN

BirdonPokecenter1F_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene

	db 0 ; callbacks

.DummyScene:
	end

BirdonPokecenter1FNurseScript:
	jumpstd pokecenternurse

BirdonPokecenter1FFisherScript:
	jumptextfaceplayer BirdonPokecenter1FFisherText

BirdonPokecenter1FPokefanMScript:
	jumptextfaceplayer BirdonPokecenter1FPokefanMText

BirdonPokecenter1FGentlemanScript:
	jumptextfaceplayer BirdonPokecenter1FGentlemanText

BirdonPokecenter1FFisherText:
	text "Beherrschen deine"
	line "#MON VM-"
	cont "Attacken?"

	para "Diese Attacken"
	line "können auch einge-"
	cont "setzt werden, wenn"
	cont "dein #MON be-"
	cont "siegt worden ist."
	done

BirdonPokecenter1FPokefanMText:
	text "Auf BILLs PC kön-"
	line "nen bis zu 20"
	cont "#MON pro BOX"
	cont "gelagert werden."
	done

BirdonPokecenter1FGentlemanText:
	text "Weißt du über"
	line "APRIKOKOS Be-"
	cont "scheid?"

	para "Brich eine auf,"
	line "höhle sie aus und"
	cont "verbinde sie mit"
	cont "einer speziellen"
	cont "Vorrichtung."

	para "Dann kannst du"
	line "#MON damit"
	cont "fangen."

	para "Vor der Erfindung"
	line "von #BÄLLEN hat"
	cont "jeder APRIKOKOS"
	cont "verwendet."
	done

BirdonPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  7, BIRDON_TOWN, 1
	warp_event  6,  7, BIRDON_TOWN, 1
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BirdonPokecenter1FNurseScript, -1
	object_event  11,  6, SPRITE_FISHER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BirdonPokecenter1FFisherScript, -1
	object_event  10,  1, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BirdonPokecenter1FPokefanMScript, -1
	object_event  1,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BirdonPokecenter1FGentlemanScript, -1
