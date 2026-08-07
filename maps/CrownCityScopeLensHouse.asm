	const_def 2 ; object constants
	const CROWN_SCOPE_LENS_HOUSE_GRANNY

CrownCityScopeLensHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
CrownCityScopeLensHouseGrannyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SCOPE_LENS_IN_CROWN_CITY
	iftrue .alreadygavescopelens
	writetext CrownCityScopeLensHouseGrannyText1
	waitbutton
	verbosegiveitem SCOPE_LENS
	iffalse .Done
	setevent EVENT_GOT_SCOPE_LENS_IN_CROWN_CITY
	jump .alreadygavescopelens
	end
	
.alreadygavescopelens
	writetext CrownCityScopeLensHouseGrannyText2
	waitbutton
	closetext
	end
	
.Done
	closetext
	end
	
CrownCityScopeLensHouseGrannyText1:
    text "Früher habe ich"
    line "auch die LIGA"
    cont "herausgefordert."

    para "Weißt du, was das"
    line "Geheimnis ist?"

    para "Strategie."

    para "Du musst wissen,"
    line "Items richtig"
    cont "einzusetzen."

    para "Hier, ich habe ein"
    line "gutes für dich."
	done
	
CrownCityScopeLensHouseGrannyText2:
    text "Eine SCOPE-LINSE"
    line "erlaubt es deinen"
    para "#MON öfter"
    line "Volltreffer zu"
    cont "landen."

    para "Deine Gegner"
    line "werden nicht"
    para "wissen, wie ihnen"
    line "geschieht!"
	done

CrownCityScopeLensHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, CROWN_CITY, 6
	warp_event  5,  7, CROWN_CITY, 6

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  7,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CrownCityScopeLensHouseGrannyScript, -1
