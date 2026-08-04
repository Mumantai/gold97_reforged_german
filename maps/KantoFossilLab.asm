	const_def 2 ; object constants
	const FOSSIL_LAB_SCIENTIST_1
	const FOSSIL_LAB_SCIENTIST_2
	const FOSSIL_LAB_GENTLEMAN

KantoFossilLab_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KantoFossilLabFossilScientist:
	faceplayer
	opentext
	checkitem HELIX_FOSSIL
	iftrue .GetOmanyte
	checkitem DOME_FOSSIL
	iftrue .GetKabuto
	checkitem OLD_AMBER 
	iftrue .GetAerodactyl
	writetext FossilScientistIntroText
	waitbutton
	closetext
	end
	
.GetOmanyte
	writetext FossilScientistIntroText
	waitbutton
	writetext YouHaveHelixFossilText
	yesorno
	iftrue .GetOmanyte2
	writetext AnotherTimeFossilText
	waitbutton
	closetext
	end
	
.GetOmanyte2
	writetext TimeToGetAFossilmonText
	waitbutton
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFullOmanyte
	closetext
	pause 15
	applymovement FOSSIL_LAB_SCIENTIST_1, ScientistGoesToMachine1
	playsound SFX_POKEBALLS_PLACED_ON_TABLE
	waitsfx
	pause 15
	applymovement FOSSIL_LAB_SCIENTIST_1, ScientistGoesToMachine2
	playsound SFX_BOOT_PC
	waitsfx
	pause 15
	playsound SFX_POTION
	waitsfx
	applymovement FOSSIL_LAB_SCIENTIST_1, ScientistGoesToMachine3
	playsound SFX_POKEBALLS_PLACED_ON_TABLE
	waitsfx
	pause 15
	applymovement FOSSIL_LAB_SCIENTIST_1, ScientistGoesToMachine4
	opentext
	writetext ScientistHereYouGoText
	waitbutton
	writetext PlayerGetsAnOmanyte
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke OMANYTE, 15
	takeitem HELIX_FOSSIL
	writetext IfYouHaveAnyOtherFossilsText
	waitbutton
	closetext
	end
	
.PartyFullOmanyte
	writetext NoRoomForFossilmon
	waitbutton
	closetext
	end
	

.GetKabuto
	writetext FossilScientistIntroText
	waitbutton
	writetext YouHaveDomeFossilText
	yesorno
	iftrue .GetKabuto2
	writetext AnotherTimeFossilText
	waitbutton
	closetext
	end
	
.GetKabuto2
	writetext TimeToGetAFossilmonText
	waitbutton
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFullKabuto
	closetext
	pause 15
	applymovement FOSSIL_LAB_SCIENTIST_1, ScientistGoesToMachine1
	playsound SFX_POKEBALLS_PLACED_ON_TABLE
	waitsfx
	pause 15
	applymovement FOSSIL_LAB_SCIENTIST_1, ScientistGoesToMachine2
	playsound SFX_BOOT_PC
	waitsfx
	pause 15
	playsound SFX_POTION
	waitsfx
	applymovement FOSSIL_LAB_SCIENTIST_1, ScientistGoesToMachine3
	playsound SFX_POKEBALLS_PLACED_ON_TABLE
	waitsfx
	pause 15
	applymovement FOSSIL_LAB_SCIENTIST_1, ScientistGoesToMachine4
	opentext
	writetext ScientistHereYouGoText
	waitbutton
	writetext PlayerGetsAKabuto
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke KABUTO, 15
	takeitem DOME_FOSSIL
	writetext IfYouHaveAnyOtherFossilsText
	waitbutton
	closetext
	end
	
.PartyFullKabuto
	writetext NoRoomForFossilmon
	waitbutton
	closetext
	end
	
	
.GetAerodactyl
	writetext FossilScientistIntroText
	waitbutton
	writetext YouHaveOldAmberText
	yesorno
	iftrue .GetAerodactyl2
	writetext AnotherTimeFossilText
	waitbutton
	closetext
	end
	
.GetAerodactyl2
	writetext TimeToGetAFossilmonText
	waitbutton
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFullAerodactyl
	closetext
	pause 15
	applymovement FOSSIL_LAB_SCIENTIST_1, ScientistGoesToMachine1
	playsound SFX_POKEBALLS_PLACED_ON_TABLE
	waitsfx
	pause 15
	applymovement FOSSIL_LAB_SCIENTIST_1, ScientistGoesToMachine2
	playsound SFX_BOOT_PC
	waitsfx
	pause 15
	playsound SFX_POTION
	waitsfx
	applymovement FOSSIL_LAB_SCIENTIST_1, ScientistGoesToMachine3
	playsound SFX_POKEBALLS_PLACED_ON_TABLE
	waitsfx
	pause 15
	applymovement FOSSIL_LAB_SCIENTIST_1, ScientistGoesToMachine4
	opentext
	writetext ScientistHereYouGoText
	waitbutton
	writetext PlayerGetsAnAerodactyl
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke AERODACTYL, 15
	takeitem OLD_AMBER
	writetext IfYouHaveAnyOtherFossilsText
	waitbutton
	closetext
	end
	
.PartyFullAerodactyl
	writetext NoRoomForFossilmon
	waitbutton
	closetext
	end
	
	
	
KantoFossilLabScientist1Script:
	jumptextfaceplayer KantoFossilLabScientist1Text
	
KantoFossilLabGentlemanScript:
	jumptextfaceplayer KantoFossilLabGentlemanText
	
KantoFossilLabBookshelf:
	jumpstd difficultbookshelf

	
ScientistGoesToMachine1:
	step UP
	step UP
	turn_head LEFT
	step_end
	
ScientistGoesToMachine2:
	step RIGHT
	step DOWN
	step RIGHT
	turn_head UP
	step_end
	
ScientistGoesToMachine3:
	step LEFT
	step UP
	step LEFT
	step_end
	
ScientistGoesToMachine4:
	step DOWN
	step DOWN
	step_end
	
KantoFossilLabGentlemanText:
    text "Dieser Ort ist ein"
    line "Zentrum für NIHONs"
    para "schlaueste"
    line "Forscher."
	done
	
KantoFossilLabScientist1Text:
    text "Wusstest du schon?"

    para "Wir haben große"
    line "Fortschritte in"
    para "Fosiilienforschung"
    line "gemacht!"

    para "Wir können jetzt"
    line "#MON-Fossilien"
    para "innerhalb weniger"
    line "Sekunden wieder-"
    cont "beleben!"
	done

ScientistHereYouGoText:
	text "Schon fertig!"
	para "Hier, bitte!"
	done
	
IfYouHaveAnyOtherFossilsText:
	text "Sag Bescheid, wenn"
	line "du noch andere"
	cont "Fossilien findest!"
	done
	
NoRoomForFossilmon:
	text "Oh, warte! So"
	line "geht das nicht!"

	para "Du hast keinen"
	line "Platz für dieses"
	cont "#MON!"

	para "Komm wieder, wenn"
	line "du Platz in deinem"
	cont "Team hast!"
	done
	
PlayerGetsAnOmanyte:
	text "<PLAY_G> erhält"
	line "AMIONITAS!"
	done
	
PlayerGetsAnAerodactyl:
	text "<PLAY_G> erhält"
	line "AERODACTYL!"
	done
	
PlayerGetsAKabuto:
	text "<PLAY_G> erhält"
	line "KABUTO!"
	done
	
TimeToGetAFossilmonText:
    text "O.K., zeig mir das"
    line "Fossil und ich"
    para "werde es in ein"
    line "paar Sekunden"
    cont "wiederbeleben!"
	done
	
YouHaveHelixFossilText:
	text "Oh, was ist das?"

	para "Du hast ein"
	line "HELIXFOSSIL!"

	para "Soll ich es in"
	line "ein #MON"
	cont "verwandeln?"
	done

YouHaveDomeFossilText:
	text "Oh, was ist das?"

	para "Du hast ein"
	line "DOMFOSSIL!"

	para "Soll ich es in"
	line "ein #MON"
	cont "verwandeln?"
	done

YouHaveOldAmberText:
	text "Oh, was ist das?"

	para "Du hast einen"
	line "ALTBERNSTEIN!"

	para "Soll ich ihn in"
	line "ein #MON"
	cont "verwandeln?"
	done

AnotherTimeFossilText:
	text "Oh, wirklich?"

	para "Sag mir Bescheid,"
	line "wenn du es dir"
	cont "anders überlegst."
	done
	
FossilScientistIntroText:
	text "Hi! Ich bin ein"
	line "Forscher, der sich"
	para "auf die Fossilien"
	line "von #MON"
	cont "spezialisiert hat!"

	para "Sag Bescheid, wenn"
	line "du ein Fossil"
	para "findest, dann kann"
	line "ich daraus wieder"
	para "ein lebendes"
	line "#MON machen!"
	done

KantoFossilLab_MapEvents:
	db 0, 0 ; filler

	db 8 ; warp events
	warp_event  2, 15, KANTO_REGION, 29
	warp_event  3, 15, KANTO_REGION, 29
	warp_event 14, 10, KANTO_FOSSIL_LAB, 4
	warp_event  2,  7, KANTO_FOSSIL_LAB, 3
	warp_event  3,  7, KANTO_FOSSIL_LAB, 3
	warp_event 10, 10, KANTO_FOSSIL_LAB, 7
	warp_event 14,  5, KANTO_FOSSIL_LAB, 6
	warp_event 15,  5, KANTO_FOSSIL_LAB, 6

	db 0 ; coord events

	db 8 ; bg events
	bg_event 15,  1, BGEVENT_READ, KantoFossilLabBookshelf
	bg_event 14,  1, BGEVENT_READ, KantoFossilLabBookshelf
	bg_event 13,  1, BGEVENT_READ, KantoFossilLabBookshelf
	bg_event 12,  1, BGEVENT_READ, KantoFossilLabBookshelf
	bg_event  7, 13, BGEVENT_READ, KantoFossilLabBookshelf
	bg_event  6, 13, BGEVENT_READ, KantoFossilLabBookshelf
	bg_event  5, 13, BGEVENT_READ, KantoFossilLabBookshelf
	bg_event  4, 13, BGEVENT_READ, KantoFossilLabBookshelf

	db 3 ; object events
	object_event  2,  3, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoFossilLabFossilScientist, -1
	object_event 13,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoFossilLabScientist1Script, -1
	object_event 16, 14, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoFossilLabGentlemanScript, -1
