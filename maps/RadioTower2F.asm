DEF BLUE_CARD_POINT_CAP EQU 30

	const_def 2 ; object constants
	const RADIOTOWER2F_JIGGLYPUFF
	const RADIOTOWER2F_BUENA
	const RADIOTOWER2F_RECEPTIONIST
	const RADIOTOWER2F_ROCKER
	const RADIOTOWER2F_GRUNTM24
	const RADIOTOWER2F_GRUNTM26
;	const RADIOTOWER2F_LILY

RadioTower2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RadioTower2FUnusedDummyScene:
; unused
	end


RadioTowerJigglypuff:
	opentext
	writetext RadioTowerJigglypuffText
	cry JIGGLYPUFF
	waitbutton
	closetext
	end

Buena:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .MidRocketTakeover
	checkevent EVENT_MET_BUENA
	iffalse .Introduction
	checkflag ENGINE_BUENAS_PASSWORD_2
	iftrue .PlayedAlready
	checkcode VAR_HOUR
	ifless 18, .TooEarly
	checkflag ENGINE_BUENAS_PASSWORD
	iffalse .TuneIn
	checkitem BLUE_CARD
	iffalse .NoBlueCard
	checkcode VAR_BLUECARDBALANCE
	ifequal 30, .BlueCardCapped0
	playmusic MUSIC_BUENAS_PASSWORD
	writetext UnknownText_0x5de35
	special AskRememberPassword
	iffalse .ForgotPassword
	writetext UnknownText_0x5de84
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	checkcode VAR_FACING
	ifnotequal RIGHT, .DontNeedToMove
	applymovement PLAYER, MovementData_0x5d921
.DontNeedToMove:
	turnobject PLAYER, RIGHT
	opentext
	writetext UnknownText_0x5dedd
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, DOWN
	refreshscreen
	special BuenasPassword
	closetext
	iffalse .WrongAnswer
	opentext
	writetext UnknownText_0x5dfc1
	waitbutton
	closetext
	checkcode VAR_BLUECARDBALANCE
	addvar 1
	writevarcode VAR_BLUECARDBALANCE
	waitsfx
	playsound SFX_TRANSACTION
	setflag ENGINE_BUENAS_PASSWORD_2
	pause 20
	turnobject RADIOTOWER2F_BUENA, RIGHT
	opentext
	writetext UnknownText_0x5e054
	waitbutton
	closetext
	special FadeOutMusic
	pause 20
	special RestartMapMusic
	checkcode VAR_BLUECARDBALANCE
	ifequal 30, .BlueCardCapped1
	end

.Introduction:
	writetext UnknownText_0x5dcf4
	buttonsound
	setevent EVENT_MET_BUENA
	verbosegiveitem BLUE_CARD
.TuneIn:
	writetext UnknownText_0x5de10
	waitbutton
	closetext
	checkcellnum PHONE_BUENA
	iftrue .Registered0
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER
	iftrue .OfferedNumberBefore
.Registered0:
	turnobject RADIOTOWER2F_BUENA, RIGHT
	end

.ForgotPassword:
	writetext UnknownText_0x5df29
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	special FadeOutMusic
	pause 20
	special RestartMapMusic
	end

.PlayedAlready:
	writetext UnknownText_0x5df6c
	waitbutton
	closetext
	checkcellnum PHONE_BUENA
	iftrue .Registered1
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER
	iftrue .OfferedNumberBefore
.Registered1:
	turnobject RADIOTOWER2F_BUENA, RIGHT
	pause 10
	end

.WrongAnswer:
	setflag ENGINE_BUENAS_PASSWORD_2
	opentext
	writetext UnknownText_0x5e01c
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	pause 20
	opentext
	writetext UnknownText_0x5e054
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	special FadeOutMusic
	pause 20
	special RestartMapMusic
	end

.MidRocketTakeover:
	writetext UnknownText_0x5e0c2
	waitbutton
	closetext
	end

.NoBlueCard:
	writetext UnknownText_0x5e192
	waitbutton
	closetext
	checkcellnum PHONE_BUENA
	iftrue .Registered2
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER_NO_BLUE_CARD
	iftrue .OfferedNumberBefore
.Registered2:
	turnobject RADIOTOWER2F_BUENA, RIGHT
	end

.BlueCardCapped0:
	writetext UnknownText_0x5e0f1
	waitbutton
	closetext
	checkcellnum PHONE_BUENA
	iftrue .Registered3
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER_NO_BLUE_CARD
	iftrue .OfferedNumberBefore
.Registered3:
	turnobject RADIOTOWER2F_BUENA, RIGHT
	end

.TooEarly:
	writetext UnknownText_0x5e131
	waitbutton
	closetext
	checkcellnum PHONE_BUENA
	iftrue .Registered4
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER
	iftrue .OfferedNumberBefore
.Registered4:
	end

.BlueCardCapped1:
	checkcellnum PHONE_BUENA
	iftrue .HasNumber
	pause 20
	turnobject RADIOTOWER2F_BUENA, DOWN
	pause 15
	turnobject PLAYER, UP
	pause 15
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER_NO_BLUE_CARD
	iftrue .OfferedNumberBefore
	showemote EMOTE_SHOCK, RADIOTOWER2F_BUENA, 15
	setevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER_NO_BLUE_CARD
	setevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER
	opentext
	writetext UnknownText_0x5e1ee
	jump .AskForNumber

.OfferedNumberBefore:
	opentext
	writetext UnknownText_0x5e2bf
.AskForNumber:
	askforphonenumber PHONE_BUENA
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	writetext UnknownText_0x5e2f3
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	buttonsound
	writetext UnknownText_0x5e310
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	addcellnum PHONE_BUENA
	end

.NumberDeclined:
	writetext UnknownText_0x5e33c
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	end

.PhoneFull:
	writetext UnknownText_0x5e35e
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
.HasNumber:
	end

RadioTowerBuenaPrizeReceptionist:
	faceplayer
	opentext
	checkitem BLUE_CARD
	iffalse .NoCard
	writetext UnknownText_0x5e392
	buttonsound
	special BuenaPrize
	closetext
	end

.NoCard:
	writetext UnknownText_0x5e3d8
	buttonsound
	closetext
	end

RadioTower2FSalesSign:
	jumptext RadioTower2FSalesSignText

RadioTower2FOaksPKMNTalkSign:
	jumptext RadioTower2FOaksPKMNTalkSignText

RadioTower2FPokemonRadioSign:
	jumptext RadioTower2FPokemonRadioSignText
	
RadioTower2fRocker:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .MidRocketTakeover2fRocker
	writetext RadioTower2fRockerText
	waitbutton
	closetext
	end
.MidRocketTakeover2fRocker
	writetext RadioTower2fRockerTextTakeover
	waitbutton
	closetext
	end
	
TrainerGruntM24:
	trainer GRUNTF, GRUNTF_8, EVENT_BEAT_ROCKET_GRUNTM_24, GruntM24SeenText, GruntM24BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM24AfterBattleText
	waitbutton
	closetext
	end
	
TrainerGruntM26:
	trainer GRUNTM, GRUNTM_26, EVENT_BEAT_ROCKET_GRUNTM_26, GruntM26SeenText, GruntM26BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM26AfterBattleText
	waitbutton
	closetext
	end
	
;RadioTower2fLily:
;	faceplayer
;	opentext
;	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
;	iftrue .MidRocketTakeover2fLily
;	writetext RadioTower2fLilyText
;	waitbutton
;	closetext
;	end
;.MidRocketTakeover2fLily
;	writetext RadioTower2fLilyTextTakeover
;	waitbutton
;;	closetext
;	end
	
;RadioTower2fLilyText:
;	text "LILY: Be sure to"
;	line "tune in to hear me"
;	para "talk about all of"
;	line "my favorite people"
;	cont "and locations!"
;	done
;	
;RadioTower2fLilyTextTakeover:
;	text "LILY: TEAM ROCKET"
;	line "members are my"
;	cont "least favorite!"
;	done
	
GruntM24SeenText:
    text "TEAM ROCKET arbei-"
    line "tet normalerweise"
    cont "in geheimen"
    cont "Unterschlupfen."

    para "Wir haben aber"
    line "auch kein Problem,"
    cont "reinzustürmen und"
    cont "uns zu nehmen, was"
    cont "wir wollen!"
	done
	
GruntM24BeatenText:
    text "Und du hattest"
    line "kein Problem, mich"
    cont "zu besiegen!"
	done
	
GruntM24AfterBattleText:
    text "Hast du unseren"
    line "Anführer schon"
    cont "getroffen?"

    para "Ich glaube, ihr"
    line "würdet euch gar"
    cont "nicht verstehen."
	done

GruntM26SeenText:
    text "Warum wir hier"
    line "sind?"

    para "Weil du und dein"
    line "Freund unsere"
    cont "Antenne zerstört"
    cont "habt!"

    para "Warum eine neue"
    line "bauen, wenn wir"
    cont "uns einfach diese"
    cont "nehmen können?"
	done
	
GruntM26BeatenText:
	text "Autsch!"
	done
	
GruntM26AfterBattleText:
    text "Du bist Schuld,"
    line "an all unseren"
    cont "Problemen!"
	done

	
RadioTower2fRockerTextTakeover:
	text "Jeder Sender be-"
	line "richtet nur noch"
	cont "über TEAM ROCKET!"
	done

RadioTower2fRockerText:
	text "Hast du schon den"
	line "#MON-Marsch"
	cont "gehört?"

	para "Er lässt wilde"
	line "#MON häufiger"
	cont "erscheinen."
	done

MovementData_0x5d921:
;	slow_step DOWN
;	slow_step RIGHT
	step_end


RadioTowerJigglypuffText:
	text "PUMMELUFF:"
    line "Pummel…"
	done

UnknownText_0x5dcf4:
	text "BUENA: Hi! Ich bin"
	line "BUENA!"

	para "Hast du schon von"
	line "der Radiosendung"
	cont "PASSWORT gehört?"

	para "Wenn du mir das"
	line "Passwort aus der"

	para "Sendung nennen"
	line "kannst, erhältst"
	cont "du Punkte."

	para "Sammle die Punkte"
	line "und tausche sie"

	para "bei diesem netten"
	line "Mädchen da drüben"

	para "gegen einen Preis"
	line "deiner Wahl ein!"

	para "Bitte schön!"

	para "Das ist deine ei-"
	line "gene Punktekarte!"
	done

UnknownText_0x5de10:
	text "BUENA: Höre dir"
	line "meine PASSWORT-"
	cont "SENDUNG an!"
	done

UnknownText_0x5de35:
	text "BUENA: Hi!"
	line "Hast du meine Sen-"
	cont "dung gehört?"

	para "Kannst du dich an"
	line "das Passwort von"
	cont "heute erinnern?"
	done

UnknownText_0x5de84:
	text "BUENA: Oh, wow!"
	line "Danke!"

	para "Wie war dein Name"
	line "doch gleich?"

	para "…<PLAY_G>, O.K.!"

	para "Auf, <PLAY_G>."
	line "Mach bei der"
	cont "Sendung mit!"
	done

UnknownText_0x5dedd:
	text "BUENA: Alle"
	line "fertig?"

	para "Schreit das heuti-"
	line "ge Passwort für"

	para "<PLAY_G>"
	line "laut heraus!"
	done

UnknownText_0x5df29:
	text "BUENA: Hör dir die"
	line "Sendung an und"

	para "komme dann wieder!"
	line "Bis später!"
	done

UnknownText_0x5df6c:
	text "BUENA: Sorry…"

	para "Du hast pro Tag"
	line "nur einen Versuch."

	para "Probiere morgen"
	line "wieder dein Glück!"
	done

UnknownText_0x5dfc1:
	text "BUENA: Juhuu!"
	line "Das ist richtig!"

	para "Du hast zugehört!"
	line "Ich bin glücklich!"

	para "Du hast dir einen"
	line "Punkt verdient!"
	done

UnknownText_0x5e01c:
	text "BUENA: Argh…"
	line "Das ist falsch…"

	para "Hast du das Pass-"
	line "wort vergessen?"
	done

UnknownText_0x5e054:
	text "BUENA: Yo!"
	line "<PLAY_G>"

	para "hat teilgenommen."
	line "Danke dafür!"

	para "Ich hoffe, dass"
	line "alle Zuhörer auch"

	para "teilnehmen!"
	line "Ich warte!"
	done

UnknownText_0x5e0c2:
	text "BUENA: Huh? Das"
	line "heutige Passwort?"

	para "HILFE, natürlich!"
	done

UnknownText_0x5e0f1:
	text "BUENA: Deine BLAUE"
	line "KARTE ist voll."

	para "Hol dir einen fan-"
	line "tastischen Preis!"
	done

UnknownText_0x5e131:
	text "BUENA: Hört die"
	line "PASSWORTSENDUNG"

	para "täglich von sechs"
	line "bis Mitternacht!"

	para "Hört zu und"
	line "besucht mich dann!"
	done

UnknownText_0x5e192:
	text "BUENA: Oh? Du hast"
	line "deine BLAUE KARTE"
	cont "vergessen?"

	para "Ich kann dir keine"
	line "Punkte geben, wenn"
	cont "du sie nicht hast."
	done

UnknownText_0x5e1ee:
	text "BUENA: Oh! Du hast"
	line "{d:BLUE_CARD_POINT_CAP} Punkte auf dei-"
	cont "ner BLAUEN KARTE!"
	cont "Das ist toll!"

	para "Hmm… Es gibt zwar"
	line "keinen Preis für"
	cont "das Erreichen von"
	cont "{d:BLUE_CARD_POINT_CAP} Punkten, aber…"

	para "Du hast mich so"
	line "oft besucht,"

	para "<PLAY_G>. Ich"
	line "mache dir ein spe-"
	cont "zielles Angebot!"

	para "Möchtest du meine"
	line "Telefonnummer?"
	done

UnknownText_0x5e2bf:
	text "BUENA: <PLAY_G>,"
	line "möchtest du meine"

	para "Telefonnummer"
	line "haben?"
	done

UnknownText_0x5e2f3:
	text "<PLAYER> speichert"
	line "BUENAs Nummer."
	done

UnknownText_0x5e310:
	text "BUENA: Ich freue"
	line "mich auf deinen"
	cont "Anruf!"
	done

UnknownText_0x5e33c:
	text "BUENA: Argh… Ein"
	line "Spezialpreis…"
	done

UnknownText_0x5e35e:
	text "BUENA: <PLAY_G>,"
	line "In deinem Nummern-"
	cont "speicher ist kein"
	cont "Platz für mich…"
	done

UnknownText_0x5e392:
	text "Du kannst deine"
	line "gesammelten Punkte"

	para "gegen einen Preis"
	line "deiner Wahl"
	cont "eintauschen!"
	done

UnknownText_0x5e3d8:
	text "Ohne deine BLAUE"
	line "KARTE kannst du"
	cont "keine Punkte"
	cont "eintauschen."

	para "Vergiss deine"
	line "BLAUE KARTE nicht!"
	done

RadioTower2FSalesSignText:
	text "1S STUDIO 1"
	done

RadioTower2FOaksPKMNTalkSignText:
	text "PROF. EICHs #-"
    line "MON-TALK"

    para "Die beste Show"
    line "am Äther!"
	done

RadioTower2FPokemonRadioSignText:
	text "Überall, jederzeit"
    line "#MON Radio"
	done

RadioTower2F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  0,  0, RADIO_TOWER_3F, 1
	warp_event  7,  0, RADIO_TOWER_1F, 3

	db 0 ; coord events

	db 3 ; bg events
	bg_event  5,  0, BGEVENT_READ, RadioTower2FSalesSign
	bg_event  6, -1, BGEVENT_READ, RadioTower2FOaksPKMNTalkSign
	bg_event  3,  0, BGEVENT_READ, RadioTower2FPokemonRadioSign

	db 6 ; object events
;	object_event  0,  1, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RadioTower2FBlackBelt1Script, EVENT_RADIO_TOWER_BLACKBELT_BLOCKS_STAIRS
;	object_event  1,  1, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RadioTower2FBlackBelt2Script, EVENT_RADIO_TOWER_CIVILIANS_AFTER
	object_event  4,  1, SPRITE_JIGGLYPUFF, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RadioTowerJigglypuff, -1
	object_event  0,  5, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Buena, -1
	object_event  4,  6, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTowerBuenaPrizeReceptionist, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event  6,  5, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower2fRocker, -1
	object_event  2,  1, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerGruntM24, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  6,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerGruntM26, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
;	object_event  6,  5, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RadioTower2fLily, -1
