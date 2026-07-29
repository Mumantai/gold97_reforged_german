	const_def 2 ; object constants
	const MAHOGANYREDGYARADOSSPEECHHOUSE_BLACK_BELT

SanskritCoinCaseSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


SanskritCoinCaseSpeechHouseBlackBeltScript:
	faceplayer
	opentext
	checkevent EVENT_GOLDENROD_UNDERGROUND_COIN_CASE
	iftrue .GotCoinCase
	writetext SanskritCoinCaseSpeechHouseBlackBeltText_Question
	yesorno
	iffalse .Refused
	writetext SanskritCoinCaseSpeechHouseBlackBeltText_Yes
	buttonsound
	verbosegiveitem COIN_CASE
	writetext SanskritCoinCaseSpeechHouseBlackBeltText_GiveCoinCase
	waitbutton
	closetext
	setevent EVENT_GOLDENROD_UNDERGROUND_COIN_CASE
	end

.Refused:
	writetext SanskritCoinCaseSpeechHouseBlackBeltText_No
	waitbutton
	closetext
	end

.GotCoinCase:
	writetext SanskritCoinCaseSpeechHouseBlackBeltText_After
	waitbutton
	closetext
	end


SanskritCoinCaseSpeechHouseBlackBeltText_Question:
	text "In GLYPHONTIA gab"
	line "es nie einen Ort"
	cont "zur Unterhaltung."

	para "Zumindest, bis die"
	line "SPIELHALLE hier in"
	cont "der Nähe eröffnet"
	cont "wurde."

	para "Ich habe da schon"
	line "viel zu viel Zeit"
    cont "verbracht."

    para "Das wird langsam"
    line "ein richtiges"
    cont "Problem für mich."

    para "Hier! Du solltest"
    line "mir das abnehmen!"
	done

SanskritCoinCaseSpeechHouseBlackBeltText_Yes:
	text "Super! Vielleicht"
	line "gehst du damit ja"
	cont "besser um als ich."
	done

SanskritCoinCaseSpeechHouseBlackBeltText_GiveCoinCase:
    text "Die SPIELHALLE"
    line "macht wirklich"
    cont "so viel Spaß!"

    para "Aber pass auf,"
    line "dass der Spaß"
    cont "nicht zu einem"
    cont "Problem wird."
	done

SanskritCoinCaseSpeechHouseBlackBeltText_No:
	text "Oh. Ich sollte"
	line "wohl an meiner"
	cont "Selbstdisziplin"
	cont "arbeiten…"
	done

SanskritCoinCaseSpeechHouseBlackBeltText_After:
    text "Ah, du nimmst eine"
    line "Last von meinen"
    cont "Schultern."
	done


SanskritCoinCaseSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, SANSKRIT_TOWN, 2
	warp_event  5,  7, SANSKRIT_TOWN, 2

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  8,  3, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SanskritCoinCaseSpeechHouseBlackBeltScript, -1
