	const_def 2 ; object constants
	const HONDO_ROCKETBASE_KEY_GRUNT
	const LAVRADIOTOWER1F_OFFICER
	const LAVRADIOTOWER1F_SUPER_NERD1
	const LAVRADIOTOWER1F_GENTLEMAN
	const LAVRADIOTOWER1F_SUPER_NERD2
	const HONDO_ROCKETBASE_POKEBALL

SanskritRocketHouse_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .Key
	
.Key
	checkevent EVENT_HONDO_ROCKET_RUNS_AWAY
	iftrue .keydropped
	disappear HONDO_ROCKETBASE_POKEBALL
	return
	
.keydropped
	checkevent EVENT_HONDO_ROCKET_SHIP_KEY
	iftrue .keyobtained
	appear HONDO_ROCKETBASE_POKEBALL
	return
	
.keyobtained
	disappear HONDO_ROCKETBASE_POKEBALL
	return

SanskritRocketHouseReceptionistScript:
	faceplayer
	opentext
	checkevent EVENT_ROCKET_KEY_DIALOGUE
	iftrue .GiveKey
	writetext SanskritRocketHouseReceptionistText
	waitbutton
	closetext
	end

.GiveKey:
	writetext SanskritRocketHouseReceptionistTextKeyTime
	waitbutton
	closetext
	winlosstext RocketKey_WinText, RocketKey_LossText
	loadtrainer GRUNTM, GRUNTM_23
	startbattle
	reloadmapafterbattle
	jump .returnfrombattlerocketkey
	
	
.returnfrombattlerocketkey
	opentext
	writetext RocketKey_AfterText
	waitbutton
	closetext
	setevent EVENT_HONDO_ROCKET_RUNS_AWAY
	appear HONDO_ROCKETBASE_POKEBALL
	applymovement HONDO_ROCKETBASE_KEY_GRUNT, Runforyourlife
	disappear HONDO_ROCKETBASE_KEY_GRUNT
	end
	
Runforyourlife:
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step DOWN
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	step_end
	
HondoBaseKey:
	itemball BASEMENT_KEY

SanskritRocketHouseOfficerScript:
	faceplayer
	opentext
	writetext SanskritRocketHouseOfficerText
	cry MURKROW
	waitbutton
	closetext
	end

SanskritRocketHouseSuperNerd1Script:
	faceplayer
	opentext
	checkevent EVENT_ROCKET_KEY_DIALOGUE
	iftrue .SN1KeyScript
	writetext SanskritRocketHouseSuperNerd1Text
	waitbutton
	closetext
	end

.SN1KeyScript:
	writetext SanskritRocketHouseSuperNerd1TextKey
	waitbutton
	closetext
	end

SanskritRocketHouseGentlemanScript:
	faceplayer
	opentext
	checkevent EVENT_ROCKET_KEY_DIALOGUE
	iftrue .GMKeyScript
	writetext SanskritRocketHouseGentlemanText
	waitbutton
	closetext
	end

.GMKeyScript:
	writetext SanskritRocketHouseGentlemanTextKey
	waitbutton
	closetext
	end


SanskritRocketHouseSuperNerd2Script:
	faceplayer
	opentext
	checkevent EVENT_ROCKET_KEY_DIALOGUE
	iftrue .SN2KeyScript
	writetext SanskritRocketHouseSuperNerd2Text
	waitbutton
	closetext
	end

.SN2KeyScript:
	writetext SanskritRocketHouseSuperNerd2TextKey
	waitbutton
	closetext
	end


SanskritRocketHouseDirectory:
	jumptext SanskritRocketHouseDirectoryText

SanskritRocketHousePokeFluteSign:
	jumptext SanskritRocketHousePokeFluteSignText

SanskritRocketHouseReferenceLibrary:
; unreferenced
	jumptext SanskritRocketHouseReferenceLibraryText

SanskritRocketHouseReceptionistText:
	text "Ha!"

	para "Nachschub kommt"
	line "bei den KAZANAMI"
	cont "DOCKS rasch an!"

	para "Fast alles ist"
	line "bereit für die"
	cont "nächste Phase"
	cont "unseres Plans!"

	para "Das Team in"
	line "SENDESTIA CITY"
	cont "wird über unsere"
	cont "Arbeit hier sicher"
	cont "beeindruckt sein!"
	done

SanskritRocketHouseOfficerText:
	text "KRAMURX: KRAWW!"
	done

SanskritRocketHouseSuperNerd1Text:
	text "SPIELHALLEN sind"
	line "stets sichere"
	cont "Geldquellen!"

	para "Merk dir das!"
	done
	
SanskritRocketHouseSuperNerd1TextKey:
	text "Hm? Ein Schlüssel?"

	para "Nee, den hab ich"
	line "nicht."

	para "Aber wozu willst"
	line "du ihn überhaupt?"

	para "Stell dich TEAM"
	line "ROCKET nicht in"
	cont "den Weg!"
	done

SanskritRocketHouseGentlemanText:
	text "Ein Kind funkt"
	line "uns immer wieder"
	cont "dazwischen."

	para "Erst das AQUARIUM,"
	line "dann der FLEGMON-"
	cont "BRUNNEN…"

	para "Aber egal!"

	para "Das sind nur klei-"
	line "ne Rückschläge!"

	para "HA!"
	done

SanskritRocketHouseGentlemanTextKey:
	text "Welcher Schlüssel?"
	line "Ich hab keine."
	cont "Schlüssel."

	para "Hey!"

	para "Du bist doch nicht"
	line "das Kind, das uns"
	cont "ständig die Pläne"
	cont "durchkreuzt?!"

	para "Hör auf damit,"
	line "wenn dir dein"
	cont "Leben lieb ist!"
	done


SanskritRocketHouseSuperNerd2Text:
	text "Nicht mehr lange,"
	line "dann wird die Welt"
	cont "endlich Zeuge von"
	cont "TEAM ROCKETs"
	cont "wahrer Stärke!"
	done

SanskritRocketHouseSuperNerd2TextKey:
	text "Nee, ich hab"
	line "keinen Schlüssel."

	para "Der KÄPT'N"
	line "traut mir so was"
	cont "nicht an."
	done

SanskritRocketHouseSuperNerd2Text_GotExpnCard:
	text "Hey du!"

	para "Ich bin der super"
	line "MUSIKDIREKTOR!"

	para "Ich bin für die"
	line "wunderschönen"
	cont "Meldoien im Radio"
	cont "verantwortlich."

	para "Sei kein"
	line "Miesepeter."

	para "Hol dir Musik"
	line "aus dem Äther!"
	done

SanskritRocketHouseDirectoryText:
	text "Alle #MON leben"
	line "nur für den Ruhm"
	cont "von TEAM ROCKET!"
	done

SanskritRocketHousePokeFluteSignText:
	text "Es läuft eine"
	line "Wiederholung…"
	done

SanskritRocketHouseReferenceLibraryText:
	text "Wow! Ein Regal"
	line "voller CDs und"
	cont "Videos über"
	cont "#MON!"

	para "Das ist wohl die"
	line "Präsenzbibliothek"
	cont "von TEAM ROCKET."
	done
	
SanskritRocketHouseReceptionistTextKeyTime:
	text "Ein SCHIFFÖFFNER?"

	para "Vielleicht habe"
	line "ich so einen."

	para "Warum fragst du?"
	done

RocketKey_WinText:
	text "Was!?"
	done
	
RocketKey_LossText:
	text "Ha!"
	done
	
RocketKey_AfterText:
    text "Oh nein, der"
    line "KÄPT'N wird mich"
    cont "dafür einen Kopf"
    cont "kürzer machen!"
	done
	
RocketKey_Afterwards:
	text "Sprich mich"
	line "nicht an!"
	done

SanskritRocketHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 16,  7, SANSKRIT_TOWN, 5
	warp_event 17,  7, SANSKRIT_TOWN, 5

	db 0 ; coord events

	db 2 ; bg events
	bg_event 16,  2, BGEVENT_READ, SanskritRocketHouseDirectory
	bg_event  6,  1, BGEVENT_READ, SanskritRocketHousePokeFluteSign

	db 6 ; object events
	object_event  9,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SanskritRocketHouseReceptionistScript, EVENT_HONDO_ROCKET_RUNS_AWAY
	object_event 17,  4, SPRITE_BIRD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SanskritRocketHouseOfficerScript, EVENT_ROUTE_5_6_POKEFAN_M_BLOCKS_UNDERGROUND_PATH
	object_event 11,  2, SPRITE_ROCKET, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SanskritRocketHouseSuperNerd1Script, EVENT_ROUTE_5_6_POKEFAN_M_BLOCKS_UNDERGROUND_PATH
	object_event 19,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SanskritRocketHouseGentlemanScript, EVENT_ROUTE_5_6_POKEFAN_M_BLOCKS_UNDERGROUND_PATH
	object_event 15,  4, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SanskritRocketHouseSuperNerd2Script,EVENT_ROUTE_5_6_POKEFAN_M_BLOCKS_UNDERGROUND_PATH
	object_event  9, 4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, HondoBaseKey, EVENT_HONDO_ROCKET_SHIP_KEY
