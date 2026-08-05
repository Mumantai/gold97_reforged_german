	const_def 2 ; object constants
	const MUSEUM_NPC_1
	const MUSEUM_NPC_2
	const MUSEUM_NPC_3
	const MUSEUM_NPC_4
	const MUSEUM_NPC_5

KantoMuseum1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

MuseumCounterScientist:
	turnobject MUSEUM_NPC_1, LEFT
	jumptext MuseumCounterScientistText
	
MuseumCounterScientistBottom:
	turnobject MUSEUM_NPC_1, DOWN
	jumptext MuseumCounterScientistText
	
MuseumCounterScientistText:
    text "Willkommen im"
    line "MARMORIA CITY"
    cont "WISSENSCHAFTS-"
    cont "MUSEUM! Genieße"
    cont "deinen Besuch!"
	done
	
MuseumCounterScientistBehind:
	jumptextfaceplayer MuseumCounterScientistBehindText
	
MuseumCounterScientistBehindText:
    text "Ähm… ich fände es"
    line "besser, wenn du"
    cont "den Haupteingang"
    cont "benutzen würdest."
	done
	
MuseumGramps:
	jumptextfaceplayer MuseumGrampsText
	
MuseumGrampsText:
    text "Ich bin hier bloß"
    line "der Hausmeister,"
    cont "aber ich verbringe"
    cont "so viel Zeit mit"
    cont "Knochen, dass ich"
    cont "ebenso gut ein"
    cont "Paläontologe sein"
    cont "könnte!"
	done

MuseumScientistAmber:
	checkevent EVENT_PICKED_UP_OLD_AMBER
	iftrue .aftertext
	jumptextfaceplayer MuseumScientistAmberText
.aftertext
	jumptextfaceplayer ScientistAfterAmberTakenText
	
MuseumScientistAmberText:
    text "Hey! Ein #MON-"
    line "Trainer!"

    para "Heute ist dein"
    line "Glückstag!"

    para "Ich bin gerade"
    line "fertig mit der"
    cont "Forschung an"
    cont "diesem Stück"
    cont "ALTBERNSTEIN und"
    cont "es enthält mit"
    cont "Sicherheit uralte"
    cont "#MON-DNS!"

    para "Wenn du das zu"
    line "den Jungs im"
    cont "#MON LABOR"
    cont "bringst, bekommst"
    cont "du ein AERODACTYL!"

    para "Woher ich das"
    line "weiß? Ich hab's"
    cont "entdeckt!"
	done

ScientistAfterAmberTakenText:
	text "Du nimmst es also?"

	para "Dann viel Glück."
	line "Ich hörte, die"
    cont "die Aufzucht von"
    cont "AERODACTYL sei"
    cont "kein Kinderspiel!"

    para "Sie sollen sehr"
    line "wild sein!"
	done

MuseumOtherScientist:
	jumptextfaceplayer MuseumOtherScientistText
	
MuseumOtherScientistText:
    text "Was ist mit den"
    line "Kindern los, dass"
    cont "sie hier immer"
    cont "herumschleichen?"

    para "Na gut! Aber mach"
    line "nichts kaputt und"
    cont "lass die Finger"
    cont "von den Exponaten."   ; alt. "und klau nichts, klar?"
	done

OldAmberItemSprite:
	itemball OLD_AMBER

KabutopsFossil:
	jumptext KabutopsFossilText
	
KabutopsFossilText:
    text "Woah!"

    para "Ein vollständiges"
    line "KABUTOPS-Skelett!"
	done
	
AerodactylFossil:
	jumptext AerodactylFossilText
	
AerodactylFossilText:
    text "Wow! Ein voll-"
    line "ständiges Skelett"
    cont "eines AERODACTYL!"
	done


KantoMuseum1F_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 10,  7, KANTO_REGION, 39
	warp_event 11,  7, KANTO_REGION, 39
	warp_event 16,  7, KANTO_REGION, 40
	warp_event 17,  7, KANTO_REGION, 40
	warp_event  7,  7, KANTO_MUSEUM_2F,1

	db 0 ; coord events

	db 4 ; bg events
	bg_event 2,  3, BGEVENT_READ, KabutopsFossil
	bg_event 2,  6, BGEVENT_READ, AerodactylFossil
	bg_event 11,  4, BGEVENT_READ, MuseumCounterScientist
	bg_event 12,  5, BGEVENT_READ, MuseumCounterScientistBottom

	db 5 ; object events
	object_event  $c, $4, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MuseumCounterScientistBehind, -1
	object_event  $1, $4, SPRITE_GRAMPS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MuseumGramps, -1
	object_event  $f, $2, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MuseumScientistAmber, -1
	object_event  $11, $4, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MuseumOtherScientist, -1
	object_event  $10, $2, SPRITE_OLD_AMBER, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, OldAmberItemSprite, EVENT_PICKED_UP_OLD_AMBER

