	const_def 2
	const TOWER1RECEPTIONIST
	const TOWER1WOMAN
	const TOWER1BALDMAN
	const TOWER1GIRL
	const TOWER1MEDIUM

PokemonTower1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Tower1Receptionist:
	checkevent EVENT_BEAT_TOWER_GENGAR
	iftrue Tower1ReceptionistAfter
	jumptextfaceplayer Tower1ReceptionistScaredText
	
Tower1ReceptionistAfter:
	jumptextfaceplayer Tower1ReceptionistAfterText
	
Tower1ReceptionistScaredText:
    text "Momentan gibt es"
    line "Störungen im TURM."

    para "Bitte meide die"
    cont "oberen Stockwerke."
	done
	
Tower1ReceptionistAfterText:
    text "Der #MON TURM"
    line "wurde zum Gedenken"
    cont "an verstorbene"
    cont "#MON errichtet."
	done

Tower1Teacher:
	checkevent EVENT_BEAT_TOWER_GENGAR
	iftrue Tower1TeacherAfter
	jumptextfaceplayer Tower1TeacherScaredText
	
Tower1TeacherAfter:
	jumptextfaceplayer Tower1TeacherAfterText
	
Tower1TeacherScaredText:
    text "Ich kam, um für"
    line "mein verstorbenes"
    cont "#MON zu beten,"
    cont "aber die oberen"
    cont "Etagen werden"
    cont "angegriffen."

    para "Bitte tu doch"
    line "etwas!"
	done
	
Tower1TeacherAfterText:
    text "Jetzt kann ich"
    line "in Ruhe beten,"
    cont "vielen Dank."
	done


Tower1Pokefan:
	checkevent EVENT_BEAT_TOWER_GENGAR
	iftrue Tower1PokefanAfter
	jumptextfaceplayer Tower1PokefanScaredText
	
Tower1PokefanAfter:
	jumptextfaceplayer Tower1PokefanAfterText
	
Tower1PokefanScaredText:
    text "W-was geht hier"
    line "vor? Ist es hier"
    cont "wirklich sicher"
    cont "hier drinnen?"
	done
	
Tower1PokefanAfterText:
    text "Puh! Was für eine"
    line "Erleichterung!"

    para "Jetzt kann ich"
    cont "endlich in Würde"
    cont "Abschied nehmen."
	done


Tower1Lass:
	checkevent EVENT_BEAT_TOWER_GENGAR
	iftrue Tower1LassAfter
	jumptextfaceplayer Tower1LassScaredText
	
Tower1LassAfter:
	jumptextfaceplayer Tower1LassAfterText
	
Tower1LassScaredText:
    text "Iiih! Ich will"
    line "raus, doch ich"
    cont "bin so starr vor"
    cont "Angst, dass ich"
    cont "nicht kann!"
	done
	
Tower1LassAfterText:
    text "Vielen Dank,"
    line "dass du diesen"
    cont "Poltergeist"
    cont "vertrieben hast!"
	done


Tower1Medium:
	checkevent EVENT_BEAT_TOWER_GENGAR
	iftrue Tower1MediumAfter
	jumptextfaceplayer Tower1MediumScaredText
	
Tower1MediumAfter:
	jumptextfaceplayer Tower1MediumAfterText
	
Tower1MediumScaredText:
    text "Ich bin ein"
    line "MEDIUM! Geister"
    cont "treiben wieder"
    cont "ihr Unwesen!"
	done
	
Tower1MediumAfterText:
    text "Die Geister haben"
    line "sich beruhigt!"
	done

PokemonTower1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 10, 17, KANTO_REGION, 41
	warp_event 11, 17, KANTO_REGION, 41
	warp_event 18,  9, POKEMON_TOWER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event 14, 14, SPRITE_LINK_RECEPTIONIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Tower1Receptionist, -1
	object_event 12,  4, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Tower1Teacher, -1
	object_event  5,  8, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Tower1Pokefan, -1
	object_event  8, 13, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Tower1Lass, -1
	object_event 18,  8, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Tower1Medium, -1
