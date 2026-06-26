	const_def 2 ; object constants
	const GOLDENRODCITY_YOUNGSTER1
	const GOLDENRODCITY_COOLTRAINER_F
	const GOLDENRODCITY_ROCKER
	const GOLDENRODCITY_YOUNGSTER2
	const GOLDENRODCITY_LASS
	const GOLDENRODCITY_GRAMPS
	const GOLDENRODCITY_ROCKET1
	const GOLDENRODCITY_ROCKET2
	const GOLDENRODCITY_ROCKET3
	const GOLDENRODCITY_ROCKET4
	const GOLDENRODCITY_ROCKET5
	const GOLDENRODCITY_ROCKET6
	const GOLDENRODCITY_FAIRY
	const GOLDENRODCITY_SILVER

WestportCity_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_GOLDENROD
	setflag ENGINE_REACHED_GOLDENROD
	return


WestportCityYoungster1Script:
	jumptextfaceplayer WestportCityYoungster1Text

WestportCityCooltrainerF1Script:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .ClearedRadioTower
	writetext WestportCityCooltrainerF1Text
	waitbutton
	closetext
	end

.ClearedRadioTower:
	writetext WestportCityCooltrainerF1Text_ClearedRadioTower
	waitbutton
	closetext
	end

WestportCityCooltrainerF2Script:
	faceplayer
	opentext
	checkflag ENGINE_RADIO_CARD
	iftrue .GotRadioCard
	writetext WestportCityCooltrainerF2Text
	waitbutton
	closetext
	end

.GotRadioCard:
	writetext WestportCityCooltrainerF2Text_GotRadioCard
	waitbutton
	closetext
	end

WestportCityYoungster2Script:
	jumptextfaceplayer WestportCityYoungster2Text

WestportCityLassScript:
	jumptextfaceplayer WestportCityLassText

WestportCityGrampsScript:
	jumptextfaceplayer WestportCityGrampsText

WestportCityRocketScoutScript:
	opentext
	writetext WestportCityRocketScoutText1
	buttonsound
	faceplayer
	writetext WestportCityRocketScoutText2
	waitbutton
	closetext
	end

WestportCityRocket1Script:
	jumptextfaceplayer WestportCityRocket1Text

WestportCityRocket2Script:
	jumptextfaceplayer WestportCityRocket2Text

WestportCityRocket3Script:
	jumptextfaceplayer WestportCityRocket3Text

WestportCityRocket4Script:
	jumptextfaceplayer WestportCityRocket4Text

WestportCityRocket5Script:
	jumptextfaceplayer WestportCityRocket5Text

WestportCityRocket6Script:
	jumptextfaceplayer WestportCityRocket6Text


WestportCityRadioTowerSign:
	jumptext WestportCityRadioTowerSignText

GoldenrodDeptStoreSign:
	jumptext GoldenrodDeptStoreSignText

GoldenrodGymSign:
	jumptext GoldenrodGymSignText

WestportCitySign:
	jumptext WestportCitySignText


WestportCityNameRaterSign:
;	setevent EVENT_BEAT_ELITE_FOUR
;	giveitem S_S_TICKET
;	setevent EVENT_FAST_SHIP_FIRST_TIME
;	setevent EVENT_WESTPORT_PORT_SPRITES_BEFORE_HALL_OF_FAME
;	clearevent EVENT_WESTPORT_PORT_SPRITES_AFTER_HALL_OF_FAME
	jumptext WestportCityNameRaterSignText


WestportCityPokecenterSign:
	jumpstd pokecentersign
	
WestportCityDocksSign:
	jumptext WestportCityDocksSignText
	
GoldenrodUndergroundSign:
	jumptext GoldenrodUndergroundSignText
	
WestportCityMonScript:
	faceplayer
	opentext
	writetext WestportCityMonText
	cry BLISSEY
	waitbutton
	closetext
	end
	
RivalAfterRadioTower1:
	playmusic MUSIC_RIVAL_ENCOUNTER
	moveobject GOLDENRODCITY_SILVER, 31, 13
	appear GOLDENRODCITY_SILVER
	applymovement GOLDENRODCITY_SILVER, GoldenrodSilverWalksUp1
	jump RivalAfterRadioTowerMain
	end
	
RivalAfterRadioTower2:
	playmusic MUSIC_RIVAL_ENCOUNTER
	moveobject GOLDENRODCITY_SILVER, 31, 13
	appear GOLDENRODCITY_SILVER
	applymovement GOLDENRODCITY_SILVER, GoldenrodSilverWalksUp2
	jump RivalAfterRadioTowerMain
	end
	
RivalAfterRadioTowerMain:
	opentext
	writetext SilverHasItFiguredOut
	waitbutton
	closetext
	showemote EMOTE_SHOCK, GOLDENRODCITY_SILVER, 15
	opentext
	writetext SilverHasItFiguredOut2
	waitbutton
	closetext
	applymovement GOLDENRODCITY_SILVER, GoldenrodSilverGetsOutOfHere
	setscene SCENE_DEFAULT
	special RestartMapMusic
	disappear GOLDENRODCITY_SILVER
	end

GoldenrodSilverGetsOutOfHere:
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end
	
GoldenrodSilverWalksUp1:
	step UP
;	step UP
	step UP
	step UP
	step UP
	step_end
	
GoldenrodSilverWalksUp2:
	step UP
;	step UP
	step UP
	step UP
	step RIGHT
	step UP
	step_end

MovementData_0x198a5f:
	step RIGHT
	step RIGHT
	step UP
	step_end

MovementData_0x198a63:
	step DOWN
	step RIGHT
	step RIGHT
	step UP
	step UP
	step_end
	
SilverHasItFiguredOut:
	text "<RIVAL>: <PLAY_G>!"

    para "Ich glaube ich"
    line "weiß, was los ist!"

    para "TEAM ROCKET will"
    line "den RADIOTURM als"
    para "Ersatz für die"
    line "Antenne benutzen,"
    para "die wir zerstört"
    line "haben!"
	done
	
SilverHasItFiguredOut2:
    text "Was?"

    para "Ich hatte Recht!"

    para "Aber du hast sie"
    line "schon erledigt?"

    para "Mann, ich habe"
    line "den ganzen Spaß"
    cont "verpasst!"

    para "Na ja, ich gehe,"
    line "besser weiter"
    cont "trainieren!"

    para "Ich brauche nur"
    line "noch einen ORDEN,"
    para "um den KOROKANIA-"
    line "BERG zu besteigen"
    para "und die TOP VIER"
    line "herausfordern zu"
    cont "dürfen!"

    para "Ich wette, ich bin"
    line "schneller als du!"

    para "Eine Sache noch…"

    para "In GENEOS CITY"
    line "gibt es einen"
    cont "alten Seemann."

    para "Er hat ein paar"
    line "sehr interessante"
    cont "Geschichten zu"
    cont "erzählen!"

    para "Hör dir doch mal"
    line "eine davon an."

    para "Na ja, wir sehen"
    line "uns!"
	done
	
WestportCityMonText:
	text "HEITEIRA:"
	line "Heihei!"
	done
	
WestportCityDocksSignText:
	text "PORT ABANISHI"
	line "HAFEN"

	para "Tägliche Fähren"
	line "nach TEKNOPIA CITY"
	done


WestportCityYoungster1Text:
	text "Es gibt einen neu-"
	line "en FAHRRADLADEN,"
	cont "aber ich kann ihn"
	cont "nirgends finden."
	done

WestportCityCooltrainerF1Text:
;	text "The man in this"
;	line "house here will"
;	para "rate the nicknames"
;	line "of your #MON!"
;	para "He'll even let you"
;	line "rename them."
;	para "But know that you"
;	line "cannot rename any"
;	para "#MON you got"
;	line "in trades."
;	done

WestportCityCooltrainerF1Text_ClearedRadioTower:
	text "Der Mann in diesem"
	line "Haus bewertet dei-"
	cont "ne #MON-Namen."

	para "Er kann deine"
	line "#MON auch"
	cont "umbenennen."

    para "#MON, die du"
    line "durch Tausch"
    para "erhalten hast,"
    line "kannst du aber"
    cont "nicht umbenennen."
	done

WestportCityCooltrainerF2Text:
	text "Der RADIOTURM in"
	line "PORT ABANISHI ist"
	cont "ein Wahrzeichen."

	para "Zurzeit läuft ge-"
	line "rade eine Werbe-"
	cont "kampagne."

	para "Sie können deinen"
	line "#COM modifi-"
	para "zieren, so dass er"
	line "auch als Radio"
	para "verwendet werden"
	line "kann."
	done

WestportCityCooltrainerF2Text_GotRadioCard:
	text "Oh, dein #COM"
	line "ist auch ein"
	cont "Radio!"
	done

WestportCityYoungster2Text:
	text "E-he-he-he…"

	para "Ich habe Ärger be-"
	line "kommen, weil ich"
	para "im Keller des"
	line "KAUFHAUSes ge-"
	cont "spielt habe."
	done

WestportCityLassText:
    text "Mein HEITEIRA kann"
    line "#MON mit einer"
    cont "Attacke heilen!"

    para "Einige #MON"
    line "haben spezielle"
    para "Attacken, die sie"
    line "auch außerhalb von"
    para "Kämpfen einsetzen"
    line "können."
	done

WestportCityGrampsText:
	text "Wow! Das ist eine"
	line "große Stadt. Ich"
	para "finde mich noch"
	line "gar nicht zurecht."
	done

WestportCityRocketScoutText1:
	text "Das ist also der"
	line "RADIOTURM…"
	done

WestportCityRocketScoutText2:
	text "Was willst du, du"
	line "Nervensäge?"

	para "Hau ab!"
	done

WestportCityRocket1Text:
	text "Aus dem Weg!"
	line "Verschwinde!"
	done

WestportCityRocket2Text:
	text "Den RADIOTURM ein-"
	line "nehmen…"

	para "Was? Das geht dich"
	line "nichts an!"
	done

WestportCityRocket3Text:
	text "#MON? Die sind"
	line "nicht mehr als"
	para "Werkzeuge zum"
	line "Geldscheffeln!"
	done

WestportCityRocket4Text:
	text "Bald wird sich"
	line "unser Traum"
	cont "erfüllen…"

	para "So lange haben wir"
	line "darauf gewartet…"
	done

WestportCityRocket5Text:
	text "Hey, Grünschnabel!"
	line "Du hast hier"
	cont "nichts zu suchen!"
	done

WestportCityRocket6Text:
	text "Komm und werde"
	line "Zeuge der Macht"
	cont "von TEAM ROCKET!"
	done


WestportCityRadioTowerSignText:
	text "PORT ABANISHI"
	line "RADIOTURM"
	para "JOPM-Zentrale"
	done

GoldenrodDeptStoreSignText:
	text "Große Auswahl an"
	line "#MON-Artikeln!"

	para "PORT ABANISHI"
	line "KAUFHAUS"
	done

GoldenrodGymSignText:
	text "PKMN-ARENA von"
	line "PORT ABANISHI"
	cont "LEITUNG: KAI"

	para "Die lebende Käfer-"
	line "#MON-Enzyklo-"
	cont "pädie"
	done

WestportCitySignText:
	text "PORT ABANISHI"

	para "NIHONs Strahlende"
	line "Küstenmetropole"
	done


WestportCityNameRaterSignText:
	text "NAMEN-BEWERTER"

	para "Möchtest du deine"
	line "Spitznamen bewer-"
	cont "ten lassen?"
	done

GoldenrodUndergroundSignText:
	text "PORT ABANISHI"
	line "UNTERGRUND Eingang"
	done

WestportCity_MapEvents:
	db 0, 0 ; filler

	db 16 ; warp events
	warp_event 14, 19, WESTPORT_GYM, 1
	warp_event 32, 19, WESTPORT_HAPPINESS_RATER, 1
	warp_event 35, 15, ROUTE_102_WESTPORT_GATE, 1
	warp_event 26, 19, WESTPORT_NAME_RATER, 1
	warp_event 13,  5, WESTPORT_DEPT_STORE_1F, 1
	warp_event 31,  7, RADIO_TOWER_1F, 1
	warp_event 22,  5, ROUTE_103_WESTPORT_GATE, 3
	warp_event 25, 14, WESTPORT_POKECENTER_1F, 1
	warp_event 14,  5, WESTPORT_DEPT_STORE_1F, 2
	warp_event 23,  5, ROUTE_103_WESTPORT_GATE, 4
	warp_event 32,  7, RADIO_TOWER_1F, 2
	warp_event 15, 19, WESTPORT_GYM, 2
	warp_event 18, 12, WESTPORT_PP_SPEECH_HOUSE, 1
	warp_event  4,  8, WESTPORT_PORT_PASSAGE, 1
	warp_event  4,  9, WESTPORT_PORT_PASSAGE, 2
	warp_event 11, 14, WESTPORT_UNDERGROUND, 12

	db 2 ; coord events
	coord_event 31,  8, SCENE_GOLDENROD_CITY_RIVAL, RivalAfterRadioTower1
	coord_event 32,  8, SCENE_GOLDENROD_CITY_RIVAL, RivalAfterRadioTower2

	db 8 ; bg events

	bg_event 28,  9, BGEVENT_READ, WestportCityRadioTowerSign
	bg_event 16,  7, BGEVENT_READ, GoldenrodDeptStoreSign
	bg_event 18, 20, BGEVENT_READ, GoldenrodGymSign
	bg_event 32, 12, BGEVENT_READ, WestportCitySign
	bg_event 24, 20, BGEVENT_READ, WestportCityNameRaterSign
	bg_event 26, 14, BGEVENT_UP, WestportCityPokecenterSign
	bg_event 10,  7, BGEVENT_READ, WestportCityDocksSign
	bg_event 14, 14, BGEVENT_READ, GoldenrodUndergroundSign

	db 14 ; object events
	object_event 21, 21, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportCityYoungster1Script, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 23, 16, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, WestportCityCooltrainerF1Script, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 27, 10, SPRITE_ROCKER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, WestportCityCooltrainerF2Script, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 12,  7, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, WestportCityYoungster2Script, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 29, 14, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, WestportCityLassScript, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 21,  8, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportCityGrampsScript, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 24, 21, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportCityRocket1Script, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 30,  8, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportCityRocket2Script, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 28, 18, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportCityRocket3Script, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 18, 14, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportCityRocket4Script, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 19, 14, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportCityRocket5Script, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 29, 18, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportCityRocket6Script, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 28, 14, SPRITE_FAIRY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, WestportCityMonScript, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event -5, -5, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
