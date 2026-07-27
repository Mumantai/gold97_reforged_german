	const_def 2 ; object constants
	const EARLSARTHOUSE_FISHER
	const EARLSARTHOUSE_BIRD
	const EARLSARTHOUSE_DRAGON
	const EARLSARTHOUSE_LASS
	const EARLSARTHOUSE_POKEFAN_M

EarlsArtHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
BirdScript:
	opentext
	writetext BirdText
	waitbutton
	closetext
	end

DragonScript:
	opentext
	writetext DragonText
	waitbutton
	closetext
	end

EarlScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .JustShowedSomething
	checkevent EVENT_MET_EARL
	iftrue .MetEarl
	writetext EarlIntroText
	buttonsound
	setevent EVENT_MET_EARL
.MetEarl:
	checkevent EVENT_SHOWED_DRATINI_TO_EARL
	iftrue .ShowedDratini
	checkevent EVENT_SHOWED_FARFETCHD_TO_EARL
	iftrue .ShowedFarfetchd
	writetext EarlFarfetchdText
	buttonsound
	writetext EarlAskToSeeMonText
	yesorno
	iffalse .SaidNo
	scall .ExcitedToSee
	special BillsGrandfather
	iffalse .SaidNo
	ifnotequal FARFETCH_D, .WrongPokemon
	writetext EarlShownPokemonText
	buttonsound
	setevent EVENT_SHOWED_FARFETCHD_TO_EARL
	jump .ShowedFarfetchd

.GotExpShare:
	writetext EarlDratiniText
	buttonsound
	writetext EarlAskToSeeMonText
	yesorno
	iffalse .SaidNo
	scall .ExcitedToSee
	special BillsGrandfather
	iffalse .SaidNo
	ifnotequal DRATINI, .WrongPokemon
	writetext EarlShownPokemonText
	buttonsound
	setevent EVENT_SHOWED_DRATINI_TO_EARL
	jump .ShowedDratini


.ShowedDratini:
	checkevent EVENT_GOT_LUCKY_EGG_FROM_EARL
	iftrue .GotLuckyEgg
	scall .ReceiveItem
	verbosegiveitem LUCKY_EGG
	iffalse .BagFull
	setevent EVENT_GOT_LUCKY_EGG_FROM_EARL
	clearevent EVENT_EARL_DRATINI_STATUE_GONE
	closetext
	end

.ShowedFarfetchd:
	checkevent EVENT_GOT_EXP_SHARE_FROM_EARL
	iftrue .GotExpShare
	scall .ReceiveItem
	verbosegiveitem EXP_SHARE
	iffalse .BagFull
	setevent EVENT_GOT_EXP_SHARE_FROM_EARL
	clearevent EVENT_EARL_BIRD_STATUE_GONE
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	closetext
	end
	
.GotLuckyEgg
	writetext EarlShownAllThePokemonText
	waitbutton
	closetext
	end

.ExcitedToSee:
	writetext EarlExcitedToSeeText
	buttonsound
	end

.SaidNo:
	writetext EarlYouDontHaveItTextText
	waitbutton
	closetext
	end

.ReceiveItem:
	writetext EarlTokenOfAppreciationText
	buttonsound
	end

.JustShowedSomething:
	writetext EarlComeAgainText
	waitbutton
	closetext
	end

.WrongPokemon:
	writetext EarlWrongPokemonText
	waitbutton
	closetext
	end

.BagFull:
	closetext
	end

EggStatue:
	jumptext EggStatueText

ArtSign:
	jumptext ArtSignText

ArtHouseLassScript:
	jumptextfaceplayer ArtHouseLassText

ArtHousePokefanMScript:
	jumptextfaceplayer ArtHousePokefanMText

ArtHousePokefanMText:
	text "Die Werke von"
	line "diesem Kerl sind"
	cont "beeindruckend!"
	done

ArtHouseLassText:
	text "Weißt du, ich mag"
	line "dieses EI am"
	cont "liebsten."
	done

EggStatueText:
	text "#MON-EI-STATUE"
	line "von EARL"
	done

ArtSignText:
	text "EARLs KUNSTGALERIE"

	para "Nur gucken,"
	line "nicht anfassen."
	done

EarlIntroText:
    text "Ach, verdammt."

    para "Ich bin eine"
    line "Enttäuschung."

    para "Mein Name ist EARL"
    line "und ich bin ein"
    cont "Künstler."

	para "Aber mich hat die"
	line "Inspiration"
	cont "verlassen…"

	para "Ich habe bisher"
    line "nur eine einzige"
    cont "Skulptur von einem"
    cont "#MON-EI"
    cont "fertiggestellt."

	para "Ich muss etwas"
    line "Beeindruckendes"
    cont "erschaffen!"

    para "Ich arbeite an"
    line "einer Statue vom"
    cont "#MON PORENTA."

    para "Aber sie ist noch"
    line "nicht ganz fertig."
	done

EarlAskToSeeMonText:
    text "Falls du dieses"
    line "#MON hast,"
    para "könntest du es mir"
    line "bitte zeigen?"
	done

EarlExcitedToSeeText:
    text "Du zeigst es mir?"
    line "Das ist großartig!"
	done

EarlYouDontHaveItTextText:
    text "Oh, du hast keins?"
    line "Das ist schade…"
	done

EarlShownPokemonText:
    text "Ah, ja! Das ist"
    line "@"
    text_ram wStringBuffer3
    text "!"

    para "Ich fühle mich von"
    line "der Muse geküsst!"
	done

EarlTokenOfAppreciationText:
    text "Hier, nimm dies"
    line "als Zeichen meiner"
    cont "Dankbarkeit."
	done

EarlComeAgainText:
    text "Komm doch mal"
    line "wieder vorbei."
	done

EarlShownAllThePokemonText:
    text "Danke, dass du mir"
    line "diese #MON"
    cont "gezeigt hast!"

    para "Dank deiner Hilfe,"
    line "bin ich meinem"
    para "Traum ein großes"
    line "Stück näher"
    cont "gekommen!"
	done

EarlWrongPokemonText:
	text "Hm?"

	para "Das ist nicht das"
	line "#MON, an das"
	cont "ich gedacht habe."
	done

EarlFarfetchdText:
    text "Ein PORENTA aus"
    line "der Nähe zu sehen,"
    para "könnte mich dazu"
    line "inspirieren, meine"
    para "Statue endlich zu"
    line "vollenden."
	done

EarlDratiniText:
    text "Ich habe meine"
    line "PORENTA-Statue"
    cont "vollendet!"

    para "Jetzt möchte ich"
    line "eine Statue von"
    para "einem DRATINI"
    line "anfertigen."

    para "Wenn ich nur ein"
    line "echtes DRATINI"
    para "sehen könnte, um"
    line "mich anzuspornen,"
    para "die Statue fertig-"
    line "zustellen."
	done

BirdText:
	text "PORENTA-STATUE"
	line "von EARL"
	done

DragonText:
	text "DRATINI-STATUE"
	line "von EARL"
	done

EarlsArtHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, PAGOTA_CITY, 12
	warp_event  3,  7, PAGOTA_CITY, 13

	db 0 ; coord events

	db 2 ; bg events
	bg_event 13, 4, BGEVENT_READ, EggStatue
	bg_event 2, 3, BGEVENT_READ, ArtSign

	db 5 ; object events
	object_event  1,  5, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, EarlScript, -1
	object_event  5,  4, SPRITE_BIRD, SPRITEMOVEDATA_STANDING_DOWN, 0, 2, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BirdScript, EVENT_EARL_BIRD_STATUE_GONE
	object_event  9,  4, SPRITE_EKANS, SPRITEMOVEDATA_STANDING_DOWN, 0, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, DragonScript, EVENT_EARL_DRATINI_STATUE_GONE
	object_event 13,  7, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ArtHouseLassScript, EVENT_EARL_DRATINI_STATUE_GONE
	object_event  5,  2, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ArtHousePokefanMScript, EVENT_EARL_DRATINI_STATUE_GONE
