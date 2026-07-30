	const_def 2 ; object constants
	const BOARDWALK_BUG_CATCHER
	const BOARDWALK_SUPER_NERD2
	const BOARDWALK_SUPER_NERD3
	const BOARDWALK_FISHER
	const BOARDWALK_LASS
	const BOARDWALK_YOUNGSTER
	const BOARDWALK_INSTRUCTOR
	const BOARDWALK_POKEFAN_M
	const BOARDWALK_ITEMBALL

Boardwalk_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .MoveTutor

.MoveTutor:
	checkevent EVENT_CLEARED_RADIO_TOWER
	iffalse .MoveTutorDisappear
	checkitem COIN_CASE
	iffalse .MoveTutorDisappear
	appear BOARDWALK_POKEFAN_M
	return

.MoveTutorDisappear:
	disappear BOARDWALK_POKEFAN_M
	return

MoveTutorScript:
	faceplayer
	opentext
	writetext UnknownText_0x199042
	yesorno
	iffalse .Refused
	special DisplayCoinCaseBalance
	writetext UnknownText_0x199090
	yesorno
	iffalse .Refused2
	checkcoins 4000
	ifequal HAVE_LESS, .NotEnoughMoney
	writetext UnknownText_0x1990ce
	loadmenu .MoveMenuHeader
	verticalmenu
	closewindow
	ifequal MOVETUTOR_FLAMETHROWER, .Flamethrower
	ifequal MOVETUTOR_THUNDERBOLT, .Thunderbolt
	ifequal MOVETUTOR_ICE_BEAM, .IceBeam
	jump .Incompatible

.Flamethrower:
	writebyte MOVETUTOR_FLAMETHROWER
	writetext UnknownText_0x1991cf
	special MoveTutor
	ifequal FALSE, .TeachMove
	jump .Incompatible

.Thunderbolt:
	writebyte MOVETUTOR_THUNDERBOLT
	writetext UnknownText_0x1991cf
	special MoveTutor
	ifequal FALSE, .TeachMove
	jump .Incompatible

.IceBeam:
	writebyte MOVETUTOR_ICE_BEAM
	writetext UnknownText_0x1991cf
	special MoveTutor
	ifequal FALSE, .TeachMove
	jump .Incompatible

.MoveMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 15, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "FLAMMENWURF@"
	db "DONNERBLITZ@"
	db "EISSTRAHL@"
	db "ZURÜCK@"

.Refused:
	writetext UnknownText_0x1990b4
	waitbutton
	closetext
	end

.Refused2:
	writetext UnknownText_0x199107
	waitbutton
	closetext
	end

.TeachMove:
	writetext UnknownText_0x19913a
	buttonsound
	takecoins 4000
	waitsfx
	playsound SFX_TRANSACTION
	special DisplayCoinCaseBalance
	writetext UnknownText_0x19918b
	waitbutton
	closetext
	end

.Incompatible:
	writetext UnknownText_0x1991a4
	waitbutton
	closetext
	end

.NotEnoughMoney:
	writetext UnknownText_0x1991ac
	waitbutton
	closetext
	end
	

TrainerCamperSpencer:
	trainer CAMPER, SPENCER, EVENT_BEAT_CAMPER_SPENCER, CamperSpencerSeenText, CamperSpencerBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperSpencerAfterBattleText
	waitbutton
	closetext
	end
	
TrainerInstructorCliff:
	trainer INSTRUCTOR, CLIFF, EVENT_BEAT_INSTRUCTOR_CLIFF, InstructorCliffSeenText, InstructorCliffBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext InstructorCliffAfterBattleText
	waitbutton
	closetext
	end

TrainerPokemaniacBrent:
	trainer POKEMANIAC, BRENT, EVENT_BEAT_POKEMANIAC_BRENT, PokemaniacBrentSeenText, PokemaniacBrentBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacBrentAfterBattleText
	waitbutton
	closetext
	end
	
TrainerFledglingHidalgo:
	trainer FLEDGLING, HIDALGO, EVENT_BEAT_FLEDGLING_HIDALGO, FledglingHidalgoSeenText, FledglingHidalgoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FledglingHidalgoAfterBattleText
	waitbutton
	closetext
	end

TrainerPokemaniacRon:
	trainer POKEMANIAC, RON, EVENT_BEAT_POKEMANIAC_RON, PokemaniacRonSeenText, PokemaniacRonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacRonAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherMarvin:
	trainer FISHER, MARVIN, EVENT_BEAT_FISHER_MARVIN, FisherMarvinSeenText, FisherMarvinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherMarvinAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerTiffany:
	trainer PICNICKER, TIFFANY, EVENT_BEAT_PICNICKER_TIFFANY, PicnickerTiffanySeenText, PicnickerTiffanyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerTiffanyWantsPicnicText
	waitbutton
	closetext
	end

BoardwalkRinringGuyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM12_PAY_DAY
	iftrue .GotPayday
	writetext BoardwalkRinringGuyText
	buttonsound
	verbosegiveitem TM_PAY_DAY
	iffalse .NoRoom
	setevent EVENT_GOT_TM12_PAY_DAY
.GotPayday:
	writetext BoardwalkRinringGuyPaydayText
	waitbutton
.NoRoom:
	closetext
	end

BoardwalkRinringScript:
	opentext
	writetext BoardwalkRinringText
	cry RINRING
	waitbutton
	closetext
	end

BoardwalkSign1:
	jumptext BoardwalkSign1Text

BoardwalkSign2:
	jumptext BoardwalkSign2Text

BoardwalkTrainerTips:
	jumptext BoardwalkTrainerTipsText

BoardwalkAmuletCoin:
	itemball AMULET_COIN


FledglingHidalgoSeenText:
    text "Darf ich auch"
    line "mal einen Kampf"
    cont "versuchen?"
	done

FledglingHidalgoBeatenText:
	text "Das ist hart!"
	done

FledglingHidalgoAfterBattleText:
    text "Ich werde hart an"
    line "mir arbeiten, um"
    cont "besser zu werden!"
	done

InstructorCliffSeenText:
    text "Diese neue SPIEL-"
    line "HALLE ist super!"

    para "Ich spiele dort"
    line "gerne, wenn ich"
    cont "Klausuren benoten"
    cont "muss."
	done

InstructorCliffBeatenText:
    text "Einen Kampf zu"
    line "verlieren ist aber"
    para "nicht so toll…"
	done

InstructorCliffAfterBattleText:
    text "Wenn ich mit dem"
    line "Benoten fertig"
    cont "bin, ist es leider"
    cont "immer schon spät."
	done

PokemaniacBrentSeenText:
	text "Heh! Hast du"
	line "seltene #MON?"
	done

PokemaniacBrentBeatenText:
	text "Meine armen #-"
	line "MON-Lieblinge!"
	done

PokemaniacBrentAfterBattleText:
	text "Ich wäre schon"
	line "froh, wenn ich nur"
	cont "ein einziges"
	cont "seltenes #MON"
	cont "hätte."
	done

PokemaniacRonSeenText:
	text "Stell dir mal vor!"

	para "So ein <RIVAL>"
	line "hat meine #MON"
	cont "besiegt!"

	para "Unverschämtheit!"
	line "Meine #MON"
	cont "sind toll!"

	para "Gegen dich gewinne"
	line "ich bestimmt!"
	done

PokemaniacRonBeatenText:
	text "Mein Team hat sich"
	line "wacker geschlagen!"
	done

PokemaniacRonAfterBattleText:
	text "Für die meisten"
	line "Menschen ist es"

	para "ganz natürlich,"
	line "unterschiedliche"

	para "Arten von #MON"
	line "zu mögen."

	para "Es geht bei"
	line "#MON nicht"

	para "darum, das"
	line "Stärkste von allen"
	cont "zu haben."
	done

FisherMarvinSeenText:
	text "Ich bin gerade"
	line "ziemlich am Boden."

	para "Vielleicht liegt"
	line "das an dem Item,"
	cont "das ich benutze."

	para "Kämpfen wir! Das"
	line "hebt vielleicht"
	cont "meine Laune!"
	done

FisherMarvinBeatenText:
	text "Ich habe verloren,"
	line "aber ich fühle"
	cont "mich trotzdem"
	cont "besser."
	done

FisherMarvinAfterBattleText:
	text "KURTs KÖDERBALL"
	line "eignet sich am"

	para "besten, um #-"
	line "MON, die an der"
	cont "Angel hängen,"
	cont "einzufangen."

	para "Er ist viel"
	line "effektiver als"
	cont "der HYPERBALL."
	done

CamperSpencerSeenText:
	text "Man kann so viel"
	line "unternehmen mit"
	cont "seinen #MON -"
	cont "das macht"
	cont "unheimlich viel"
	cont "Spaß!"
	done

CamperSpencerBeatenText:
	text "Verlieren macht"
	line "überhaupt keinen"
	cont "Spaß…"
	done

CamperSpencerAfterBattleText:
	text "Warst du schonmal"
	line "im JADEWALD?"

	para "Wir wollen dort"
	line "zelten."
	done

PicnickerTiffanySeenText:
	text "Gehst du auch zur"
	line "SPIELHALLE?"

	para "Spielen wir ein"
	line "bisschen!"
	done

PicnickerTiffanyBeatenText:
	text "Ich habe zu lange"
	line "gespielt!"
	done

PicnickerTiffanyWantsPicnicText:
	text "Ich mache ein"
	line "Picknick mit"
	cont "meinen #MON."

	para "Setz dich doch zu"
	line "uns."
	done

PicnickerTiffanyClefairyText:
	text "Ist mein PIEPI"
	line "nicht"
	cont "herzallerliebst?"
	done

BoardwalkSign1Text:
	text "PROMENADE"

	para "GLYPHONTIA -"
	line "GENEOS CITY"
	done

BoardwalkSign2Text:
	text "PROMENADE"
	line "SPIELHALLE"

	para "Dein Quell für"
	line "Spaß!"
	done

BoardwalkTrainerTipsText:
	text "TIPPS für TRAINER"

	para "Alle #MON haben"
	line "Vor- und Nach-"

	para "teile. Das hängt"
	line "ganz davon ab,"
	cont "welchem Element"
	cont "sie angehören."

	para "Sind zwei #MON"
	line "unterschiedlicher"

	para "Elemente, kann"
	line "sogar ein #MON"
	cont "verlieren, das"
	cont "einen höheren"
	cont "Level hat."

	para "Finde heraus,"
	line "welche Elemente"

	para "effektiv oder"
	line "ineffektiv gegen"
	cont "deine #MON"
	cont "sind."
	done
	
	
UnknownText_0x199042:
	text "Wenn du möchtest,"
	line "kann ich deinen"

	para "#MON tolle"
	line "Attacken"
	cont "beibringen."

	para "Soll ich das"
	line "machen?"
	done

UnknownText_0x199090:
	text "Das kostet dich"
	line "4000 Münzen. Okay?"
	done

UnknownText_0x1990b4:
	text "Uah… aber sie sind"
	line "wirklich toll…"
	done

UnknownText_0x1990ce:
	text "Wahahah! Das wirst"
	line "du nicht bereuen!"

	para "Welche Attacke"
	line "erlernen?"
	done

UnknownText_0x199107:
	text "Hm, Mist. Ich muss"
	line "noch Geld von zu"
	cont "Hause holen…"
	done

UnknownText_0x19913a:
	text "Wenn du verstehst,"
	line "was an dieser"

	para "Attacke so toll"
	line "ist, dann hast du"
	para "es als Trainer"
	line "wirklich drauf."
	done

UnknownText_0x19918b:
	text "Wahahah! Mach's"
	line "gut, Wicht!"
	done

UnknownText_0x1991a4:
    text "A-aber…"
	done

UnknownText_0x1991ac:
	text "…Du hast nicht"
	line "genügend Münzen"
	cont "dabei…"
	done

UnknownText_0x1991cf:
	text_start
	done

BoardwalkRinringGuyText:
    text "Ich habe nie"
    line "Langeweilie in der"
    cont "SPIELHALLE."

    para "Jeder Verlust kann"
    line "auf lange Sicht"
    cont "zu einem Gewinn"
    cont "werden…"

    para "Hier, ich verrate"
    line "dir mein kleines"
    cont "Geheimnis!"

    para "…Aber nicht"
    line "weitersagen!"
	done

BoardwalkRinringGuyPaydayText:
    text "Das ist ZAHLTAG."

    para "Du kannst es ein-"
    line "setzen, um Kohle"
    cont "zu scheffeln."

    para "Aber behalte es"
    line "für dich."

    para "Sonst könnte die"
    line "SPIELHALLE noch"
    cont "pleite gehen!"
	done

BoardwalkRinringText:
	text "KATMOBELLE:"
	line "Riririri!"
	done

Boardwalk_MapEvents:
	db 0, 0 ; filler

	db 8 ; warp events
	warp_event  6, 51, BOARDWALK_TEKNOS_GATE, 1
	warp_event  7, 51, BOARDWALK_TEKNOS_GATE, 2
	warp_event 14,  9, BOARDWALK_SANSKRIT_GATE, 3
	warp_event 14,  5, BOARDWALK_SANSKRIT_GATE, 1
	warp_event 15,  5, BOARDWALK_SANSKRIT_GATE, 2
	warp_event 15,  9, BOARDWALK_SANSKRIT_GATE, 4
	warp_event 10, 23, BOARDWALK_GAME_CORNER, 1
	warp_event 11, 23, BOARDWALK_GAME_CORNER, 2

	db 0 ; coord events

	db 3 ; bg events
	bg_event 10, 10, BGEVENT_READ, BoardwalkSign1
	bg_event  8, 24, BGEVENT_READ, BoardwalkSign2
	bg_event 12, 40, BGEVENT_READ, BoardwalkTrainerTips

	db 11 ; object events
	object_event 15, 16, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFledglingHidalgo, -1
	object_event  9, 32, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 5, TrainerPokemaniacBrent, -1
	object_event  8, 11, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPokemaniacRon, -1
	object_event  4, 16, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerFisherMarvin, -1
	object_event  7, 23, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerPicnickerTiffany, -1
	object_event  8, 42, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerCamperSpencer, -1
	object_event 13, 24, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerInstructorCliff, -1
	object_event  9, 24, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MoveTutorScript, -1
	object_event 14, 28, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BoardwalkAmuletCoin, EVENT_BOARDWALK_AMULET_COIN
	object_event  4, 28, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BoardwalkRinringGuyScript, -1
	object_event  5, 28, SPRITE_GROWLITHE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BoardwalkRinringScript, -1
