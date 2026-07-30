	const_def 2 ; object constants
	const SunpointPhotoStudio_FISHING_GURU

SunpointPhotoStudio_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
SunpointPhotoStudioFishingGuruScript:
	jumptextfaceplayer CianwoodFishGuruText

SunpointPhotoStudioFishingGuruScriptbackup:
	faceplayer
	opentext
	writetext SunpointPhotoStudioFishingGuruText_Question
	yesorno
	iffalse .Refused
	writetext SunpointPhotoStudioFishingGuruText_Yes
	waitbutton
	special PhotoStudio
	waitbutton
	closetext
	end

.Refused:
	writetext SunpointPhotoStudioFishingGuruText_No
	waitbutton
	closetext
	end

SunpointPhotoStudioFishingGuruText_Question:
	text "Deine #MON sind"
	line "großartig!"

	para "Wie wär's mit ei-"
	line "nem Foto als Sou-"
	cont "venir?"
	done

SunpointPhotoStudioFishingGuruText_Yes:
	text "O.K.! Und jetzt"
	line "sag: CHEESE!"
	done

SunpointPhotoStudioFishingGuruText_No:
	text "Oh, schade. Ich"
	line "dachte, das wäre"

	para "ein schönes Anden-"
	line "ken…"
	done

CianwoodFishGuruText:
    text "Im MAGMA-SCHACHT"
    line "im Westen der"
    cont "Stadt ist es echt"
    cont "brütend heiß."

    para "Feuer-#MON"
    line "sollen sich davon"
    cont "angezogen fühlen."
	done

SunpointPhotoStudio_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, SUNPOINT_CITY, 4
	warp_event  5,  7, SUNPOINT_CITY, 4

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  1,  2, SPRITE_FISHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SunpointPhotoStudioFishingGuruScript, -1
