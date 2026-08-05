	const_def 2 ; object constants
	const KANTO_FISHER
	const KANTO_COOLTRAINER_M
	const KANTO_TEACHER
	const KANTO_POKEFAN_M
	const KANTO_LASS
	const KANTO_SUPER_NERD
	const KANTO_YOUNGSTER
	const KANTO_FISHER_2
	const KANTO_LASS_2
	const KANTO_ITEMBALL
	const KANTO_BIKER1
	const KANTO_BIKER2
	const KANTO_PSYCHIC
	const KANTO_FISHERTR

KantoRegion_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_KANTO
	return

KantoRegionTMDetect:
	itemball TM_ROCK_HEAD

KantoFisherScript:
	jumptextfaceplayer KantoFisherText

KantoSign:
	jumptext KantoSignText

KantoPokecenterSign:
	jumpstd pokecentersign

KantoGymSign:
	jumptext KantoGymSignText

PalletTownSign2:
	jumptext PalletTownSignText2

RedsHouseSign2:
	jumptext RedsHouseSignText2

BluesHouseSign2:
	jumptext BluesHouseSignText2

OaksLabSign2:
	jumptext OaksLabSign2Text

KantoDeptSign:
	jumptext KantoDeptSignText

KantoMansionSign:
	jumptext KantoMansionSignText

KantoBattleClubSign:
	jumptext KantoBattleClubSignText

PokemonTowerSign:
	jumptext PokemonTowerSignText

KantoCooltrainerMScript:
	jumptextfaceplayer KantoCooltrainerMText

KantoTeacherScript:
	jumptextfaceplayer KantoTeacherText

KantoPokefanMScript:
	jumptextfaceplayer KantoPokefanMText

KantoLassScript:
	jumptextfaceplayer KantoLassText

KantoSuperNerdScript:
	jumptextfaceplayer KantoSuperNerdText

KantoYoungsterScript:
	jumptextfaceplayer KantoYoungsterText

KantoFisher2Script:
	jumptextfaceplayer KantoFisher2Text
	
KantoLass2Script:
	jumptextfaceplayer KantoLass2Text

;----------------------------------------------------------

TrainerKBiker1:
	trainer BIKER, ZEKE, EVENT_BEAT_KR_TRAINER1, BikerZekeSeenText, BikerZekeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerZekeAfterBattleText
	waitbutton
	closetext
	end

TrainerKBiker2:
	trainer BIKER, CHARLES, EVENT_BEAT_KR_TRAINER2, BikerCharlesSeenText, BikerCharlesBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerCharlesAfterBattleText
	waitbutton
	closetext
	end

TrainerKPsychic:
	trainer PSYCHIC_T, PHIL, EVENT_BEAT_KR_TRAINER3, PsychicPhilSeenText, PsychicPhilBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicPhilAfterBattleText
	waitbutton
	closetext
	end

TrainerKFisher:
	trainer FISHER, ANDRE, EVENT_BEAT_KR_TRAINER4, FisherAndreSeenText, FisherAndreBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherAndreAfterBattleText
	waitbutton
	closetext
	end

;----------------------------------------------------------

BikerZekeSeenText:
    text "Hey! Das ist der"
    line "weltberühmte"
    cont "RADWEG!"

    para "Respektiere die"
    line "Regeln und steig"
    cont "auf dein Rad!"
	done

BikerZekeBeatenText:
	text "Hey komm schon!"
	done

BikerZekeAfterBattleText:
    text "Durch KANTO kommt"
    line "man am besten mit"
    cont "dem Fahrrad!"
	done

BikerCharlesSeenText:
    text "Du solltest dir"
    line "gut überlegen,"
    cont "mit wem du dich"
    cont "anlegst, bevor"
    cont "du dich in unser"
    cont "Revier wagst!"
	done

BikerCharlesBeatenText:
	text "Hälst dich wohl"
	line "für ganz schlau?"
	done

BikerCharlesAfterBattleText:
    text "Mit wem ich mich"
    cont "anlege?"

    para "Naja, ich kämpfe"
    line "dafür, dass man"
    cont "Windräer entlang"
    cont "dieser Straße"
    cont "aufstellt!"

    para "Denk an all die"
    line "saubere Energie!"
	done

PsychicPhilSeenText:
    text "Mein alter Mentor"
    line "hat deine Ankunft"
    cont "vorausgesehen,"
    cont "deshalb habe ich"
    cont "hier auf dich"
    cont "gewartet!"
	done

PsychicPhilBeatenText:
    text "Wie das Schicksal"
    line "es wollte!"
	done

PsychicPhilAfterBattleText:
    text "Mein Mentor ist"
    line "auf Trainingsreise"
    cont "gegangen, also"
    cont "versuche ich so"
    cont "gut wie möglich,"
    cont "die psychischen"
    cont "Künste in KANTO am"
    cont "Leben zu erhalten."
	done

FisherAndreSeenText:
    text "Was ist bloß los"
    line "mit dieser Stelle?"

    para "Ich habe in letz-"
    line "ter Zeit einfach"
    cont "kein Glück!"
	done

FisherAndreBeatenText:
	text "Gah! Kein Glück!"
	done

FisherAndreAfterBattleText:
    text "Angeblich sollen"
    line "Fische sich kurz"
    cont "vor einem Vulkan-"
    cont "ausbruch seltsam"
    cont "verhalten."

    para "Vielleicht sollte"
    line "ich die ZINNOBER-"
    cont "INSEL für eine"
    cont "Weile meiden…"
	done

;----------------------------------------------------------
KantoLass2Text:
	text "Die FORSCHER in"
	line "diesem Labor sind"
	cont "unglaublich!"

	para "Sie machten aus"
	line "meinem Fossil"
	para "ein lebendes"
	line "#MON!"
	done

KantoFisher2Text:
    text "Oh Junge, ich"
    line "angle wirklich"
    cont "gerne!"

    para "Und das ist auch"
    line "so ein ruhiger Ort"
    cont "um das zu tun!"
	done

KantoYoungsterText:
	text "Eines Tages will"
	line "ich so stark wie"
	cont "ROT sein."

	para "Ich weiß nur"
	line "nicht, ob das"
	cont "klappt."

	para "Nur wenige sind"
	line "so gut wie er."
	done

KantoSuperNerdText:
	text "Der Besitzer der"
	line "SPIELHALLE hat vor"
	para "kurzem auch die"
	line "neue bei TEKNOPIAs"
	cont "PROMENADE gekauft."
	done

KantoLassText:
    text "Kennst du die"
    line "SILPH CO.?"

    para "Das solltest du."

    para "Die Chancen sind"
    line "groß, dass sie die"
    para "#BÄLLE gemacht"
    line "haben, in denen"
    para "deine #MON"
    line "sind!"
	done

KantoPokefanMText:
    text "Ich war nie ein"
    line "ernsthafter Trainer."

    para "Ich meine, ich"
    line "trainiere #MON"
    cont "und kämpfe auch."

    para "Aber es war immer"
    line "eher ein Hobby."

    para "Der Typ im KANTO"
    line "KAMPFCLUB wollte"
    para "mich nicht herein-"
    line "lassen…"
	done

KantoFisherText:
	text "Die Technik ist"
	line "unglaublich!"

	para "Du kannst jetzt"
	line "#MON durch die"
	cont "Zeit senden!"
	done

KantoSignText:
    text "WILLKOMMEN IN DER"
    line "KANTO REGION -"
    cont "NIHONs Zentrum des"
    cont "urbanen Wohlstands."
	done

KantoGymSignText:
	text "INDIGO PLATEAU"
	line "PKMN-ARENA"
	cont "LEITUNG: ROT"

	para "Der erfahrene"
	line "Trainer-Veteran"
	done

PalletTownSignText2:
	text "ALABASTIA"

	para "Eine Stätte des"
	line "Friedens und der"
	cont "Reinheit"
	done

RedsHouseSignText2:
	text "HAUS von ROT"
	done

BluesHouseSignText2:
	text "HAUS von BLAU"
	done

OaksLabSign2Text:
	text "PROF. EICHs"
	line "#MON LABOR"

	para "HINWEIS:"
	line "PROF. EICH ist"
	para "zur Forschung in"
	line "SILENITIA."
	done

KantoDeptSignText:
	text "Riesige Auswahl"
	line "an #MON-Waren!"

	para "EINKAUFSZENTRUM"
	line "von PRISMANIA CITY"
	done

KantoMansionSignText:
	text "PRISMANIA-VILLA"
	done

KantoBattleClubSignText:
	text "KANTO KAMPFCLUB"

	para "Ein Club für"
	line "ernsthafte Trainer"

	para "Nur für Mitglieder"
	done

PokemonTowerSignText:
	text "#MON TURM"

	para "Ein Monument für"
	line "alle gefallenen"
	cont "#MON."
	done

FossilLabSign:
	jumptext FossilLabSignText

FossilLabSignText:
	text "ZINNOBERINSEL"
	line "#MON LABOR"
	done

SeafoamSign:
	jumptext SeafoamSignText

SeafoamSignText:
	text "SEESCHAUMINSELN"
	done

SafariZoneSign:
	jumptext SafariZoneSignText

SafariZoneSignText:
	text "SAFARI ZONE"

	para "Für die Öffent-"
	line "lichkeit geöffnet."
	done

FujiHouseSign:
	jumptext FujiHouseSignText

FujiHouseSignText:
	text "HAUS von MR. FUJI"
	done

DocksSign:
	jumptext DocksSignText

DocksSignText:
	text "HAFEN von"
	line "ORANIA CITY"
	done

PowerPlantSign:
	jumptext PowerPlantSignText

PowerPlantSignText:
	text "KRAFTWERK"
	done

SilphCoSign:
	jumptext SilphCoSignText

SilphCoSignText:
	text "SILPH CO."
	done

GameCornerSign:
	jumptext GameCornerSignText

GameCornerSignText:
	text "SPIELHALLE"

	para "Löse deine Münzen"
	line "nebenan ein!"

TrainerHouseSign:
	jumptext TrainerHouseSignText

TrainerHouseSignText:
	text "TRAINER-HAUS"

	para "Der Club, in dem"
	line "Top-Trainer"
	cont "kämpfen"
	done

VictoryRoadKSign:
	jumptext VictoryRoadKSignText

VictoryRoadKSignText:
	text "INDIGO PLATEAU"
	line "durch die Höhle"

	para "Ehemaliger Ort der"
	line "SIEGESSTRAẞE."
	done

PewterMuseumSign:
	jumptext PewterMuseumSignText

PewterMuseumSignText:
	text "MARMORIA CITY"
	line "WISSENSCHAFTS-"
	cont "MUSEUM"
	done

PewterGardenSign:
	jumptext PewterGardenSignText

PewterGardenSignText:
    text "Bitte nicht auf"
    line "die Blumen treten."

    para "MARMORIA CITY"
    line "GÄRTNERVEREIN"
	done

MtMoonSign:
	jumptext MtMoonSignText

MtMoonSignText:
	text "MONDBERG"

	para "Besuch unseren"
	line "Souvenirladen auf"
	cont "dem Weg nach oben!"
	done

SeaCottageSign:
	jumptext SeaCottageSignText

SeaCottageSignText:
	text "KÜSTENHAUS"

	para "Ferienhaus zu"
	line "vermieten!"

	para "Bei Interesse BILL"
	line "kontaktieren."
	done

DiglettsCaveSign:
	jumptext DiglettsCaveSignText

DiglettsCaveSignText:
	text "DIGDAs Höhle"
	done

KantoCooltrainerMText:
	text "Im Restaurant"
	line "läuft gerade ein"
	cont "Wettessen."

	para "Schon vom Zusehen"
	line "wird mir übel…"
	done

KantoTeacherText:
	text "Das KANTO KAUFHAUS"
	line "hat die beste"
	cont "Auswahl."

	para "Wenn es etwas dort"
	line "nicht gibt, dann"
	para "gibt es das"
	line "nirgendwo!"

	para "…Mensch, ich"
	line "klinge ja wie"
	cont "eine Verkäuferin."
	done

KantoRegion_MapEvents:
	db 0, 0 ; filler

	db 45 ; warp events
	warp_event 24, 21, KANTO_DEPT_STORE_1F, 1
	warp_event 29, 21, KANTO_CELADON_MANSION_1F, 1
	warp_event 30, 15, KANTO_CELADON_MANSION_1F, 3
	warp_event 38, 35, DIGLETTS_CAVE,1
	warp_event 29, 33, KANTO_POKECENTER_1F, 1
	warp_event 23, 27, KANTO_GAME_CORNER, 1
	warp_event 27, 27, KANTO_GAME_CORNER_PRIZE_ROOM, 1
	warp_event  6,  5, KANTO_GYM, 1
	warp_event 35, 13, KANTO_LEFTOVERS_HOUSE, 1
	warp_event  4, 24, ROUTE_115_KANTO_GATE, 3
	warp_event  4, 25, ROUTE_115_KANTO_GATE, 4
	warp_event 37, 29, SILPH_CO_1F, 1
	warp_event 20, 19, DIGLETTS_CAVE,3
	warp_event 25, 21, KANTO_DEPT_STORE_1F, 2
	warp_event 48, 29, ROCK_TUNNEL_1F,2
	warp_event  7,  5, KANTO_GYM, 2
	warp_event 46, 17, ROCK_TUNNEL_1F,1
	warp_event 14, 45, OAKS_KANTO_LAB, 1
	warp_event 15, 45, OAKS_KANTO_LAB, 2
	warp_event 15, 39, BLUES_HOUSE, 1
	warp_event  9, 39, REDS_HOUSE_1F,1
	warp_event 28,  7, MOUNT_MOON, 1
	warp_event 32,  7, MOUNT_MOON, 2
	warp_event 47, 53, KANTO_BATTLE_CLUB_1F, 1
	warp_event 37,  7, KANTO_HOUSE_1, 1
	warp_event 13, 11, KANTO_HOUSE_2, 1
	warp_event 17, 23, KANTO_HOUSE_3, 1
	warp_event 49,  5, KANTO_HOUSE_4, 1
	warp_event  8, 55, KANTO_FOSSIL_LAB, 1
	warp_event  6, 15, KANTO_VICTORY_ROAD,1
	warp_event 37, 17, KANTO_CAFE, 1
	warp_event  0,  0, KANTO_CAFE, 2 ; daycare house
	warp_event  6,  9, KANTO_VICTORY_ROAD,10
	warp_event  7,  9, KANTO_VICTORY_ROAD,10
	warp_event 35, 45, SAFARI_ZONE_FUCHSIA_GATE_BETA,3
	warp_event 47, 23, KANTO_POWER_PLANT,1
	warp_event 20, 55, SEAFOAM_ISLANDS_1F,1
	warp_event 26, 55, SEAFOAM_ISLANDS_1F,2
	warp_event 16,  7, KANTO_MUSEUM_1F, 1
	warp_event 21,  5, KANTO_MUSEUM_1F, 3
	warp_event 54, 31, POKEMON_TOWER_1F, 1
	warp_event 15, 29, TRAINER_HOUSE_1F,1
	warp_event 51, 33, KANTO_FUJI_HOUSE, 1
	warp_event 31, 35, KANTO_DOCK, 1
	warp_event 32, 35, KANTO_DOCK, 1

	db 0 ; coord events

	db 26 ; bg events
	bg_event 58, 36, BGEVENT_READ, KantoSign
	bg_event 30, 33, BGEVENT_READ, KantoPokecenterSign
	bg_event  8,  6, BGEVENT_READ, KantoGymSign
	bg_event  9, 43, BGEVENT_READ, PalletTownSign2
	bg_event 10, 40, BGEVENT_READ, RedsHouseSign2
	bg_event 16, 40, BGEVENT_READ, BluesHouseSign2
	bg_event 15, 47, BGEVENT_READ, OaksLabSign2
	bg_event 26, 21, BGEVENT_READ, KantoDeptSign
	bg_event 28, 22, BGEVENT_READ, KantoMansionSign
	bg_event 46, 54, BGEVENT_READ, KantoBattleClubSign
	bg_event 55, 32, BGEVENT_READ, PokemonTowerSign
	bg_event  7, 56, BGEVENT_READ, FossilLabSign
	bg_event 23, 55, BGEVENT_READ, SeafoamSign
	bg_event 33, 46, BGEVENT_READ, SafariZoneSign
	bg_event 29, 37, BGEVENT_READ, DocksSign
	bg_event 49, 24, BGEVENT_READ, PowerPlantSign
	bg_event 38, 30, BGEVENT_READ, SilphCoSign
	bg_event 24, 28, BGEVENT_READ, GameCornerSign
	bg_event 13, 29, BGEVENT_READ, TrainerHouseSign
	bg_event  7, 16, BGEVENT_READ, VictoryRoadKSign
	bg_event 15,  8, BGEVENT_READ, PewterMuseumSign
	bg_event 19,  9, BGEVENT_READ, PewterGardenSign
	bg_event 29,  8, BGEVENT_READ, MtMoonSign
	bg_event 47,  5, BGEVENT_READ, SeaCottageSign
	bg_event 19, 20, BGEVENT_READ, DiglettsCaveSign
	bg_event 53, 34, BGEVENT_READ, FujiHouseSign

	db 14 ; object events
	object_event  9, 46, SPRITE_FISHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoFisherScript, -1
	object_event 38, 19, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoCooltrainerMScript, -1
	object_event 23, 23, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoTeacherScript, -1
	object_event 16, 13, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoPokefanMScript, -1
	object_event 34, 30, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoLassScript, -1
	object_event 22, 29, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoSuperNerdScript, -1
	object_event  5, 17, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoYoungsterScript, -1
	object_event 37, 53, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoFisher2Script, -1
	object_event 10, 57, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoLass2Script, -1
	object_event 29, 42, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, KantoRegionTMDetect, EVENT_LAKE_OF_RAGE_TM_DETECT
	object_event 25, 39, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerKBiker1, -1
	object_event 24, 43, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerKBiker2, -1
	object_event 43, 35, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerKPsychic, -1
	object_event 22, 57, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerKFisher, -1
