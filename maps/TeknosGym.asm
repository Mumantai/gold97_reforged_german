	const_def 2 ; object constants
	const GOLDENRODGYM_WHITNEY
	const GOLDENRODGYM_LASS1
	const GOLDENRODGYM_LASS2
	const GOLDENRODGYM_BUENA1
	const GOLDENRODGYM_GYM_GUY

TeknosGym_MapScripts:
	db 0 ; scene scripts
	
	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .whitneynothere
	
.whitneynothere
	checkevent EVENT_WHITNEY_BACK_IN_GYM
	iffalse .gone
	return
	
.gone
	disappear GOLDENRODGYM_WHITNEY
	disappear GOLDENRODGYM_LASS1
	disappear GOLDENRODGYM_LASS2
	disappear GOLDENRODGYM_BUENA1
	return


TeknosGymWhitneyScript:
	faceplayer
	checkevent EVENT_REMATCH_AVAILABLE_WHITNEY
	iftrue rematchscriptWhitney
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue postrematchscriptWhitney
	
	opentext
	checkevent EVENT_BEAT_WHITNEY
	iftrue .FightDone
	writetext WhitneyBeforeText
	waitbutton
	closetext
	winlosstext WhitneyShouldntBeSoSeriousText, 0
	loadtrainer WHITNEY, WHITNEY1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_WHITNEY
	setevent EVENT_BEAT_LASS_CARRIE
	setevent EVENT_BEAT_LASS_BRIDGET
	setevent EVENT_BEAT_BEAUTY_SAMANTHA
	specialphonecall SPECIALCALL_ROBBED
	setmapscene OAKS_LAB_ENTRANCE, SCENE_DEFAULT
	opentext
	writetext PlayerReceivedPlainBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_PLAINBADGE
	checkcode VAR_BADGES
	scall TeknosGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM45_ATTRACT
	iftrue .GotAttract
	writetext Whitney_BadgeSpeech
	buttonsound
	verbosegiveitem TM_ATTRACT
	iffalse .NoRoomForAttract
	setevent EVENT_GOT_TM45_ATTRACT
	writetext WhitneyAttractText
	waitbutton
	closetext
	end

.GotAttract:
	writetext Whitney_GoodLuck
	waitbutton
.NoRoomForAttract
	closetext
	end

rematchscriptWhitney:
	opentext
	writetext WhitneyRematchText
	waitbutton
	closetext
	winlosstext WhitneyRematchWinText, 0
	loadtrainer WHITNEY, WHITNEY2
	startbattle
	reloadmapafterbattle
	clearevent EVENT_REMATCH_AVAILABLE_WHITNEY
	opentext
	writetext WhitneyAfterRematchText
	waitbutton
	closetext
	end

postrematchscriptWhitney:
	opentext
	writetext WhitneyAfterRematchText
	waitbutton
	closetext
	end

WhitneyRematchText:
    text "Bist du den ganzen"
    line "Weg hierher"
    cont "zurück gekommen,"
    cont "um mich zu sehen?"

    para "Oder bist du für"
    line "einen weiteren"
    cont "Kampf hier?"

    para "Wie auch immer,"
    line "du kannst beides"
    cont "haben!"
	done

WhitneyRematchWinText:
	text "Waaaaah! Du bist"
	line "immer noch gemein!"
	done

WhitneyAfterRematchText:
    text "Ich habe gehört,"
    line "TEAM ROCKET sei"
    cont "dank dir endgültig"
    cont "weg vom Fenster!"

    para "Das freut mich!"

    para "Ich habe seit dem"
    line "Vorfall beim"
    cont "AQUARIUM keinen"
    cont "ihrer Rüpel mehr"
    cont "gesehen."
	done



TeknosGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd goldenrodrockets

.RadioTowerRockets:
	jumpstd radiotowerrockets

TrainerLassCarrie:
	trainer LASS, CARRIE, EVENT_BEAT_LASS_CARRIE, LassCarrieSeenText, LassCarrieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassCarrieAfterBattleText
	waitbutton
	closetext
	end



TrainerLassBridget:
	trainer LASS, BRIDGET, EVENT_BEAT_LASS_BRIDGET, LassBridgetSeenText, LassBridgetBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassBridgetAfterBattleText
	waitbutton
	closetext
	end



TrainerBeautySamantha:
	trainer BEAUTY, SAMANTHA, EVENT_BEAT_BEAUTY_SAMANTHA, BeautySamanthaSeenText, BeautySamanthaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BeautySamanthaAfterBattleText
	waitbutton
	closetext
	end



TeknosGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_WHITNEY_BACK_IN_GYM
	iffalse .whitneynothere
	checkevent EVENT_BEAT_WHITNEY
	iftrue .TeknosGymGuyWinScript
	writetext TeknosGymGuyText
	waitbutton
	closetext
	end
	
.whitneynothere
	writetext TeknosGymGuyTextNotHere
	waitbutton
	closetext
	end
	
.TeknosGymGuyWinScript:
	writetext TeknosGymGuyWinText
	waitbutton
	closetext
	end

TeknosGymStatue:
;	setmapscene OAKS_LAB_ENTRANCE, SCENE_DEFAULT
;	specialphonecall SPECIALCALL_ROBBED
	checkflag ENGINE_PLAINBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	trainertotext WHITNEY, WHITNEY1, MEM_BUFFER_1
	jumpstd gymstatue2

BridgetWalksUpMovement:
	step LEFT
	turn_head UP
	step_end

BridgetWalksAwayMovement:
	step RIGHT
	turn_head LEFT
	step_end

Whitney_GoodLuck:
    text "Viel Glück bei"
    line "der #MON LIGA!"
	done

WhitneyBeforeText:
    text "Jippie!"

    para "Du bist endlich"
    line "hierher gekommen!"

    para "Danke nochmal, für"
    line "deine Hilfe beim"
    cont "AQUARIUM."

    para "Aber genug davon!"

    para "Also…"

    para "Ähem…"

    para "Ich bin BIANKA."

    para "Alle waren ganz"
    line "heiß auf #MON,"
    cont "also habe ich mir"
    cont "eigene zugelegt!"

    para "Meine zuckersüßen"
    line "#MON werden"
    cont "dich platt machen!"

    para "…kicher…"

    para "Meinst du, du"
    line "kannst mich"
    cont "besiegen?"
	done

WhitneyShouldntBeSoSeriousText:
	text "Wowie!"

	para "Du bist ja noch"
	line "stärker als ich"
    cont "gedacht habe!"
	done

PlayerReceivedPlainBadgeText:
	text "<PLAYER> erhält"
	line "BASISORDEN."
	done

Whitney_BadgeSpeech:
    text "Der BASISORDEN"
    line "erhöht die INIT"
    cont "deiner #MON."

	para "Oh, das hier"
	line "kannst du auch"
	cont "haben!"
	done

WhitneyAttractText:
	text "Es ist ANZIEHUNG!"
	line "Es bringt den"

	para "Charme eines"
	line "#MON voll zur"
	cont "Geltung."

	para "Passt das nicht"
	line "perfekt zu einem"
	cont "süßen Ding wie"
	cont "mir?"
	done

LassCarrieSeenText:
	text "Lass dich nicht"
	line "von dem netten"
	cont "Äußeren meiner"
	cont "#MON täuschen."

	para "Sie können dich"
	line "platt machen."
	done

LassCarrieBeatenText:
	text "Verflixt… Ich"
	line "dachte, du wärest"
	cont "schwach…"
	done

LassCarrieAfterBattleText:
	text "Denken meine #-"
	line "MON, dass ich"
	cont "niedlich bin?"
	done

LassBridgetSeenText:
	text "Ich mag niedliche"
	line "#MON lieber"
	cont "als starke."

	para "Aber ich habe"
	line "starke und nied-"
	cont "liche #MON!"
	done

LassBridgetBeatenText:
	text "Oh, nein, nein!"
	done

LassBridgetAfterBattleText:
	text "Ich trainiere, um"
	line "BIANKA zu besie-"
	cont "gen… aber es ist"
	cont "hoffnungslos."

	para "Wenn ich verliere,"
	line "werde ich einfach"
	cont "härter trainieren!"
	done

BridgetWhitneyCriesText:
	text "Oh nein. Du hast"
	line "BIANKA zum Weinen"
	cont "gebracht."

	para "Keine Sorge. Sie"
	line "beruhigt sich bald"
	cont "wieder. Sie weint"
	cont "immer, wenn sie"
	cont "verloren hat."
	done

BeautySamanthaSeenText:
	text "Schlag ordentlich"
	line "zu, sonst werde"
	cont "ich es tun!"
	done

BeautySamanthaBeatenText:
	text "Nein! Oh, MAUZI,"
	line "es tut mir Leid!"
	done

BeautySamanthaAfterBattleText:
	text "Ich habe MAUZI die"
	line "unterschiedlich-"
	cont "sten Attacken bei-"
	cont "gebracht…"
	done
	
TeknosGymGuyTextNotHere:
	text "Yo! CHAMP in spe!"

	para "BIANKA ist gerade"
	line "nicht da."

	para "Sie ist bekannt"
	line "dafür, dass sie"
	cont "bei Problemen in"
	cont "der Stadt immer"
	cont "aushilift."

	para "Irgendetwas muss"
    line "in der Stadt vor"
    cont "sich gehen."
	done

TeknosGymGuyText:
	text "Yo! CHAMP in spe!"

	para "In dieser PKMN-"
	line "ARENA warten Trai-"
	cont "ner mit #MON"
	cont "des Typs Normal"
	cont "auf dich. Ich rate"
	cont "dir, Kampf-#MON"
	cont "einzusetzen."
	done

TeknosGymGuyWinText:
	text "Du hast gewonnen?"
	line "Toll! Ich war da-"
	cont "mit beschäftigt,"
	cont "die hübschen Damen"
	cont "hier zu bewundern."
	done

TeknosGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2, 17, TEKNOS_CITY, 11
	warp_event  3, 17, TEKNOS_CITY, 12

	db 0 ; coord events

	db 1 ; bg events
	bg_event  4, 15, BGEVENT_READ, TeknosGymStatue

	db 5 ; object events
	object_event 16, 13, SPRITE_WHITNEY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TeknosGymWhitneyScript, 0
	object_event  4,  8, SPRITE_LASS, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerLassCarrie, 0
	object_event 11,  3, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerLassBridget, 0
	object_event 17,  8, SPRITE_BUENA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBeautySamantha, 0
	object_event  5, 15, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TeknosGymGuyScript, -1
