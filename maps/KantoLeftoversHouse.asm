	const_def 2 ; object constants
	const KANTO_LEFTOVERS_HOUSE_SUPER_NERD
	const KANTO_LEFTOVERS_HOUSE_FISHER1

KantoLeftoversHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KantoLeftoversHouseChef:
	checkevent EVENT_KANTO_LEFTOVERS_HOUSE_GOT_LEFTOVERES
	iftrue .NoMoreLeftovers
	faceplayer
	opentext
	writetext KantoLeftoversHouseChefText1
	waitbutton
	verbosegiveitem LEFTOVERS
	iffalse .PackFull
	closetext
	setevent EVENT_KANTO_LEFTOVERS_HOUSE_GOT_LEFTOVERES
	end

.PackFull:
	closetext
	end

.NoMoreLeftovers:
	faceplayer
	opentext
	writetext AlreadyGotLeftovers
	waitbutton
	closetext
	end
	
KantoLeftoversHouseFisher1:
	jumptextfaceplayer KantoLeftoversHouseFisher1Text
	
KantoLeftoversHouseFisher1Text:
    text "Mir gehört die"
    line "SPIELHALLE."

    para "Versuche dein"
    line "Glück, du könntest"
    para "ein großer"
    line "Gewinner sein!"
	done
	
KantoLeftoversHouseChefText1:
    text "Ich habe mein"
    line "Mittagessen nicht"
    cont "geschafft."

    para "Vielleicht möchte"
    line "dein #MON es ja"
    cont "haben?"
	done

AlreadyGotLeftovers:
    text "Ich habe sonst"
    line "nichts, was ich"
    cont "dir geben könnte."
	done

FoundLeftoversText:
	text "<PLAYER> hat"
	line "@"
	text_ram wStringBuffer3
	text_start
	cont "gefunden."
	done

NoRoomForLeftoversText:
	text "Aber <PLAYER> kann"
	line "kein weiteres Item"
	cont "aufnehmen…"
	done

KantoLeftoversHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, KANTO_REGION, 9
	warp_event  5,  7, KANTO_REGION, 9

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  8,  3, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, KantoLeftoversHouseChef, -1
	object_event  6,  5, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoLeftoversHouseFisher1, -1
	