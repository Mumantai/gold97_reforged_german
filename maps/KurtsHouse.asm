	const_def 2 ; object constants
	const KURTSHOUSE_KURT1
	const KURTSHOUSE_FALKNER

KurtsHouse_MapScripts:
	db 2 ; scene scripts
	scene_script .SceneFalknerVisit1 ; SCENE_DEFAULT
	scene_script .SceneKurtsHouseNothing ;

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .KurtCallback
	
.SceneFalknerVisit1:
	priorityjump .SceneFalknerVisit2
	end
	
.SceneFalknerApproves
	priorityjump .Falknerapproves
	end
	
.SceneFalknerVisit2
	checkevent EVENT_GOT_5F_SAGE_BLESSING
	iftrue .SceneFalknerApproves
	checkevent EVENT_FALKNER_AT_GYM
	iftrue .SceneKurtsHouseNothing
	checkevent EVENT_TALKED_TO_KURT_AND_FALKNER
	iftrue .SceneKurtsHouseNothing
	setevent EVENT_TALKED_TO_KURT_AND_FALKNER
	pause 5
	applymovement PLAYER, WalkUpToKurt
	pause 15
	opentext
	writetext KurtTalks
	waitbutton
	closetext
	turnobject KURTSHOUSE_KURT1, RIGHT
	opentext
	writetext KurttoFalkner
	waitbutton
	closetext
	turnobject KURTSHOUSE_FALKNER, LEFT
	pause 15
	applymovement KURTSHOUSE_FALKNER, FalknerWalksToYou
	turnobject PLAYER, RIGHT
	turnobject KURTSHOUSE_KURT1, DOWN
	faceplayer
	opentext
	writetext FalknerTalks
	waitbutton
	closetext
	applymovement KURTSHOUSE_FALKNER, FalknerWalksBack
	pause 15
	end
	
.Falknerapproves
	pause 5
	applymovement PLAYER, WalkUpToKurt
	pause 15
	turnobject KURTSHOUSE_FALKNER, DOWN
	showemote EMOTE_SHOCK, KURTSHOUSE_FALKNER, 15
	applymovement KURTSHOUSE_FALKNER, FalknerWalksToYou
	turnobject PLAYER, RIGHT
	opentext
	writetext FalknerTalks2
	waitbutton
	closetext	
	turnobject PLAYER, DOWN
	applymovement KURTSHOUSE_FALKNER, FalknerLeaves
	playsound SFX_EXIT_BUILDING
	disappear KURTSHOUSE_FALKNER
	setevent EVENT_FALKNER_AT_GYM
	pause 15
	turnobject PLAYER, UP
	opentext
	writetext KurtICanMakeBalls
	waitbutton
	verbosegiveitem LURE_BALL
	iffalse .NoRoomForLureBall
	closetext
	setevent EVENT_KURT_GAVE_YOU_LURE_BALL
	setevent EVENT_BRASS_TOWER_BLESSING_QUEST_COMPLETE
	end
	
.NoRoomForLureBall:
	closetext
	end
	
.SceneKurtsHouseNothing:
	checkevent EVENT_BRASS_TOWER_BLESSING_QUEST_COMPLETE
	iftrue .endofscene
	checkevent EVENT_GOT_5F_SAGE_BLESSING
	iftrue .SceneFalknerApproves
.endofscene:
	setmapscene KURTS_HOUSE, 1
	end

.KurtCallback:
	checkevent EVENT_FALKNER_AT_GYM
	iftrue .Falknergone
	return

.Falknergone:
	disappear KURTSHOUSE_FALKNER
	return


Kurt1:
	faceplayer
	opentext
	checkevent EVENT_GOT_5F_SAGE_BLESSING
	iffalse .notdonetower
.GotLureBall:
	checkevent EVENT_GAVE_KURT_RED_APRICORN
	iftrue .GiveLevelBall
	checkevent EVENT_GAVE_KURT_BLU_APRICORN
	iftrue .GiveLureBall
	checkevent EVENT_GAVE_KURT_YLW_APRICORN
	iftrue .GiveMoonBall
	checkevent EVENT_GAVE_KURT_GRN_APRICORN
	iftrue .GiveFriendBall
	checkevent EVENT_GAVE_KURT_WHT_APRICORN
	iftrue .GiveFastBall
	checkevent EVENT_GAVE_KURT_BLK_APRICORN
	iftrue .GiveHeavyBall
	checkevent EVENT_GAVE_KURT_PNK_APRICORN
	iftrue .GiveLoveBall
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue .CheckApricorns
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	iftrue .CheckApricorns
	writetext UnknownText_0x18e6c9
	waitbutton
.CheckApricorns:
	checkitem RED_APRICORN
	iftrue .AskApricorn
	checkitem BLU_APRICORN
	iftrue .AskApricorn
	checkitem YLW_APRICORN
	iftrue .AskApricorn
	checkitem GRN_APRICORN
	iftrue .AskApricorn
	checkitem WHT_APRICORN
	iftrue .AskApricorn
	checkitem BLK_APRICORN
	iftrue .AskApricorn
	checkitem PNK_APRICORN
	iftrue .AskApricorn
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue .ThatTurnedOutGreat
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	iftrue .IMakeBallsFromApricorns
	closetext
	end
	
.notdonetower
	writetext KurtHeadToTower
	waitbutton
	closetext
	end

.IMakeBallsFromApricorns:
	writetext UnknownText_0x18e6c9
	waitbutton
	closetext
	end

.AskApricorn:
	writetext UnknownText_0x18e736
	buttonsound
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	special SelectApricornForKurt
	ifequal FALSE, .Cancel
	ifequal BLU_APRICORN, .Blu
	ifequal YLW_APRICORN, .Ylw
	ifequal GRN_APRICORN, .Grn
	ifequal WHT_APRICORN, .Wht
	ifequal BLK_APRICORN, .Blk
	ifequal PNK_APRICORN, .Pnk
; .Red
	setevent EVENT_GAVE_KURT_RED_APRICORN
	jump .GaveKurtApricorns

.Blu:
	setevent EVENT_GAVE_KURT_BLU_APRICORN
	jump .GaveKurtApricorns

.Ylw:
	setevent EVENT_GAVE_KURT_YLW_APRICORN
	jump .GaveKurtApricorns

.Grn:
	setevent EVENT_GAVE_KURT_GRN_APRICORN
	jump .GaveKurtApricorns

.Wht:
	setevent EVENT_GAVE_KURT_WHT_APRICORN
	jump .GaveKurtApricorns

.Blk:
	setevent EVENT_GAVE_KURT_BLK_APRICORN
	jump .GaveKurtApricorns

.Pnk:
	setevent EVENT_GAVE_KURT_PNK_APRICORN
	jump .GaveKurtApricorns

.GaveKurtApricorns:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
.WaitForApricorns:
	writetext UnknownText_0x18e779
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	pause 15
	special FadeInQuickly
	opentext
	jump .GotLureBall
	end

.Cancel:
	writetext UnknownText_0x18e7bc
	waitbutton
	closetext
	end

.ThatTurnedOutGreat:
	writetext UnknownText_0x18e82a
	waitbutton
.NoRoomForBall:
	closetext
	end

.GiveLevelBall:
	writetext UnknownText_0x18e7fb
	buttonsound
	verbosegiveitem2 LEVEL_BALL, VAR_KURT_APRICORNS
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_RED_APRICORN
	jump .ThatTurnedOutGreat

.GiveLureBall:
	writetext UnknownText_0x18e7fb
	buttonsound
	verbosegiveitem2 LURE_BALL, VAR_KURT_APRICORNS
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_BLU_APRICORN
	jump .ThatTurnedOutGreat

.GiveMoonBall:
	writetext UnknownText_0x18e7fb
	buttonsound
	verbosegiveitem2 MOON_BALL, VAR_KURT_APRICORNS
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_YLW_APRICORN
	jump .ThatTurnedOutGreat

.GiveFriendBall:
	writetext UnknownText_0x18e7fb
	buttonsound
	verbosegiveitem2 FRIEND_BALL, VAR_KURT_APRICORNS
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_GRN_APRICORN
	jump .ThatTurnedOutGreat

.GiveFastBall:
	writetext UnknownText_0x18e7fb
	buttonsound
	verbosegiveitem2 FAST_BALL, VAR_KURT_APRICORNS
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_WHT_APRICORN
	jump .ThatTurnedOutGreat

.GiveHeavyBall:
	writetext UnknownText_0x18e7fb
	buttonsound
	verbosegiveitem2 HEAVY_BALL, VAR_KURT_APRICORNS
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_BLK_APRICORN
	jump .ThatTurnedOutGreat

.GiveLoveBall:
	writetext UnknownText_0x18e7fb
	buttonsound
	verbosegiveitem2 LOVE_BALL, VAR_KURT_APRICORNS
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_PNK_APRICORN
	jump .ThatTurnedOutGreat

Falkner:
	faceplayer
	opentext
	writetext FalknerNotDoneTower
	waitbutton
	closetext
	end

KurtsHouseOakPhoto:
	jumptext KurtsHouseOakPhotoText

KurtsHouseLeafeonStatue:
	jumptext KurtsHouseLeafeonStatueText

KurtsHouseBookshelf:
	jumpstd difficultbookshelf

KurtsHouseRadio:
	jumpstd radio2
	
WalkUpToKurt:
	step UP
	step UP
	step RIGHT
	step UP
	step UP
	step_end
	
FalknerWalksToYou:
	step DOWN
	step LEFT
	step_end
	
FalknerWalksBack:
	step RIGHT
	step UP
	step_end
	
FalknerLeaves:
	step DOWN
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step_end

UnknownText_0x18e6c9:
	text "KURT: Ich mache"
	line "BÄLLE aus APRIKO-"
	cont "KOS."

	para "Pflücke sie von"
	line "Bäumen und bring"
	cont "sie zu mir."

	para "Ich fertige daraus"
	line "BÄLLE an."
	done

UnknownText_0x18e736:
	text "KURT: Hast du eine"
	line "APRIKOKO für mich?"

	para "Schön! Ich werde"
	line "einen BALL daraus"
	cont "machen."
	done

UnknownText_0x18e779:
	text "KURT: Großartig!"

	para "Ich fange gleich"
	line "mit der Arbeit an."
	done

UnknownText_0x18e7bc:
	text "KURT: Oh…"
	line "Du lässt mich im"
	cont "Stich?"
	done

UnknownText_0x18e7fb:
	text "KURT: Ah, <PLAYER>!"
	line "Ich bin gerade"
	cont "fertig geworden."
	cont "Hier hast du den"
	cont "BALL!"
	done

UnknownText_0x18e82a:
	text "KURT: Er ist groß-"
	line "artig geworden."

	para "Versuche, ein"
	line "#MON damit"
	cont "zu fangen."
	done


KurtsHouseOakPhotoText:
    text "KURT, wie er mit"
    line "einem WEISEN und"
    para "einem Mann mit"
    line "KAPITÄNSMÜTZE im"
    cont "TURM steht."
	done

KurtsHouseLeafeonStatueText:
	text "Eine Statue des"
	line "Waldpatrons."
	done
	
FalknerNotDoneTower:
    text "Erhalte den Segen"
    line "des ÄLTESTEN, dann"
    para "werde ich deine"
    line "Herausforderung"
    cont "akzeptieren."
	done
	
KurtTalks:
	text "KURT: Hmm?"
	para "<PLAY_G>,"
	line "nehme ich an?"

	para "PROF. EICH sagte,"
	line "dass du vorbei-"
	cont "kommen würdest."

    para "Dieser alte Kauz"
    line "handelt immer,"
    cont "bevor er denkt…"

    para "Wie auch immer,"
    line "EICH hat nur Gutes"
    cont "über dich erzählt…"

    para "Das ist alles, was"
    line "ich wissen muss."

    para "Der beste Weg, um"
    line "deinen #DEX zu"
    para "vervollständigen,"
    line "wäre, alle ORDEN"
    para "der #MON LIGA"
    line "zu sammeln."

    para "Es gibt viele"
    line "ARENEN in NIHON"
    para "und in jeder von"
    line "ihnen zu gewinnen,"
    para "wird eine schwere"
    line "Aufgabe sein."
	done
	
KurttoFalkner:
    text "FALK hier gehört"
    line "zufälligerweise"
    para "die ARENA in"
    line "dieser Stadt."
	done
	
FalknerTalks:
    text "FALK: Oh, wer bist"
    line "du denn?"

    para "<PLAY_G>, hm?"
    line "Was führt dich"
    cont "hierher?"

    para "…"

    para "Ah, du kämpfst um"
    line "die ARENA-ORDEN."

    para "Mein Name ist"
    line "FALK."

    para "Ich bin der ARENA-"
    line "LEITER dieser"
    cont "Stadt."

    para "Wenn du mich"
    line "herausfordern"
    para "möchtest, musst du"
    line "dich zuerst im"
    cont "MESSINGTURM"
    cont "beweisen."

    para "Wenn du den SEGEN"
    line "des ÄLTESTEN"
    cont "erhältst, nehme"
    cont "ich deine Heraus-"
    cont "forderung an."
	done
	
FalknerTalks2:
    text "FALK: Oh gut."

    para "Der ÄLTESTE hat"
    line "dir seinen Segen"
    cont "gegeben."

    para "Nun gut, dann"
    line "akzeptiere ich"
    cont "deine Heraus-"
    cont "forderung."

    para "Ich werde zurück"
    line "in die ARENA gehen"
    cont "und auf deine"
    cont "Ankunft warten."
	done
	
KurtHeadToTower:
    text "Gehe zum TURM."

    para "Er ist nördlich"
    line "von hier."
	done

	
KurtICanMakeBalls:
    text "Du hast dich im"
    line "TURM bewiesen."

    para "EICH hatte Recht,"
    line "was dich angeht…"

    para "Also werde ich dir"
    line "spezielle #-"
    para "BÄLLE anfertigen,"
    line "wenn du mir"
    cont "APRIKOKOS bringst."

    para "Hier, ich gebe dir"
    line "jetzt schon einen."
	done

KurtsHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  7, PAGOTA_CITY, 10
	warp_event  4,  7, PAGOTA_CITY, 10

	db 0 ; coord events

	db 1 ; bg events
	bg_event  5,  1, BGEVENT_READ, KurtsHouseBookshelf

	db 2 ; object events
	object_event  4,  2, SPRITE_KURT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Kurt1, EVENT_KURTS_HOUSE_KURT_1
	object_event  6,  2, SPRITE_FALKNER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Falkner, EVENT_KURTS_HOUSE_FALKNER
