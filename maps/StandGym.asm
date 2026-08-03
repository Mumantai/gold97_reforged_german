	const_def 2 ; object constants
	const STANDGYM_OKERA
	const STANDGYM_GYMGUY2
	const STANDGYM_COOLTRAINER

StandGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
StandGymOkeraScript:
	faceplayer
	checkevent EVENT_REMATCH_AVAILABLE_OKERA
	iftrue rematchscriptOkera
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue postrematchscriptOkera
	
	opentext
	checkevent EVENT_BEAT_OKERA
	iftrue .FightDone
	writetext OkeraIntroText1
	waitbutton
	closetext
	winlosstext OkeraLossText, 0
	loadtrainer OKERA, OKERA1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_OKERA
	opentext
	writetext GetStormBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_STORMBADGE
	setmapscene STAND_CITY, SCENE_FUCHSIA_CITY_IMPOSTER
	checkcode VAR_BADGES
.FightDone:
	checkevent EVENT_GOT_TM46_THIEF
	iftrue .AlreadyGotTM
	writetext OkeraExplainBadgeText
	buttonsound
	verbosegiveitem TM_THIEF
	iffalse .BagFull
	setevent EVENT_GOT_TM46_THIEF
	writetext OkeraExplainTMText
	waitbutton
	closetext
	end

.AlreadyGotTM:
	writetext OkeraAfterText
	waitbutton
.BagFull:
	closetext
	end

rematchscriptOkera:
	opentext
	writetext OkeraRematchText
	waitbutton
	closetext
	winlosstext OkeraRematchWinText, 0
	loadtrainer OKERA, OKERA2
	startbattle
	reloadmapafterbattle
	clearevent EVENT_REMATCH_AVAILABLE_OKERA
	opentext
	writetext OkeraAfterRematchText
	waitbutton
	closetext
	end

postrematchscriptOkera:
	opentext
	writetext OkeraAfterRematchText
	waitbutton
	closetext
	end

OkeraRematchText:
    text "Was willst du?"

    para "Bist du jetzt"
    line "nicht der CHAMP?"

    para "Willst du jetzt"
    line "'nen zweiten ORDEN"
    cont "von mir, oder was?"

    para "Glaub nicht, dass"
    line "ich vor so einer"
    para "Herausforderung"
    line "zurückschrecke!"
	done

OkeraRematchWinText:
	text "Heh."
	done

OkeraAfterRematchText:
    text "Ich hab nicht"
    line "erwartet zu ge-"
    para "winnen, aber ich"
    line "drücke mich nie"
    cont "vor einem Kampf."

    para "Auch nicht, wenn"
    line "alles gegen mich"
    cont "sprechen sollte."

    para "Du bist genauso,"
    line "nicht wahr?"
	done

.GoldenrodRockets:
	jumpstd goldenrodrockets

.RadioTowerRockets:
	jumpstd radiotowerrockets


StandGymStatue:
	checkflag ENGINE_STORMBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	trainertotext OKERA, OKERA1, MEM_BUFFER_1
	jumpstd gymstatue2
	

StandGymGuyScript2:
	faceplayer
	checkevent EVENT_BEAT_OKERA
	iftrue .StandGymGuyWinScript2
	opentext
	writetext StandGymGuyText2
	waitbutton
	closetext
	end

.StandGymGuyWinScript2:
	opentext
	writetext StandGymGuyWinText2
	waitbutton
	closetext
	end
	

TrainerCooltrainermAaron:
	trainer COOLTRAINERM, AARON, EVENT_BEAT_COOLTRAINERM_AARON, CooltrainermAaronSeenText, CooltrainermAaronBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermAaronAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfKelly:
	trainer COOLTRAINERF, KELLY, EVENT_BEAT_COOLTRAINERF_KELLY, CooltrainerfKellySeenText, CooltrainerfKellyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfKellyAfterBattleText
	waitbutton
	closetext
	end
	
TrainerCooltrainerfIrene:
	trainer COOLTRAINERF, IRENE, EVENT_BEAT_COOLTRAINERF_IRENE, CooltrainerfIreneSeenText, CooltrainerfIreneBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfIreneAfterText
	waitbutton
	closetext
	end
	
TrainerCooltrainerfJulia:
	trainer COOLTRAINERF, JULIA, EVENT_BEAT_COOLTRAINERF_JULIA, CooltrainerfJuliaSeenText, CooltrainerfJuliaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfJuliaAfterText
	waitbutton
	closetext
	end
	
TrainerCooltrainermBen:
	trainer COOLTRAINERM, BEN, EVENT_BEAT_COOLTRAINERM_BEN, CooltrainermBenSeenText, CooltrainermBenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermBenAfterBattleText
	waitbutton
	closetext
	end
	
TrainerCooltrainermRob:
	trainer COOLTRAINERM, ROB, EVENT_BEAT_COOLTRAINERM_ROB, CooltrainermRobSeenText, CooltrainermRobBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermRobAfterBattleText
	waitbutton
	closetext
	end
	
LightSwitch:
	opentext
	writetext ItsASwitch
	yesorno
	iffalse .no
	closetext
	special FadeOutPalettes
	special FadeInPalettes
	special FadeOutPalettes
	special FadeInPalettes
	end
.no
	closetext
	end


CooltrainerfKellySeenText:
    text "Was siehst du,"
    line "wenn du deine"
    para "Augen im Dunkeln"
    line "öffnest?"
	done

CooltrainerfKellyBeatenText:
	text "Gut. Dann habe ich"
	line "eben verloren."
	done

CooltrainerfKellyAfterBattleText:
    text "Wo der ARENALEITER"
    line "ist? Er lebt in"
    para "den Schatten,"
    line "jenseits dem, was"
    cont "man sehen kann."
	done

CooltrainermAaronSeenText:
    text "Hast du Angst vor"
    line "der Dunkelheit?"
	done

CooltrainermAaronBeatenText:
	text "Wow…"
	line "Toller Kampf!"
	done

CooltrainermAaronAfterBattleText:
    text "Diese ARENA ist"
    line "nicht wirklich so"
    cont "gruselig."

    para "Das Licht ist nur"
    line "ausgeschaltet."
	done

StandGymGuyText2:
    text "Hey, CHAMP in spe!"

    para "Hier drinnen ist"
    line "es echt dunkel!"

    para "RABAN kann ein"
    line "bisschen launisch"
    para "sein und er mag"
    line "die Dunkelheit."

    para "Aber lass dich von"
    line "seinem Alter und"
    para "seinem Verhalten"
    line "nicht täuschen."

    para "Er ist ein echt"
    line "harter Trainer!"
	done

StandGymGuyWinText2:
    text "Ich wusste, du"
    line "hast keine Angst"
    cont "im Dunkeln!"
	done

OkeraIntroText1:
	text "Tss…"

	para "Noch ein Trainer,"
	line "der Schmerzen"
	cont "leiden will?"

	para "Na gut!"

	para "Ich wurde nur"
    line "ARENALEITER, weil"
    cont "mein alter Herr"
    cont "in Rente ging."

    para "Unlicht-#MON"
    line "haben einen miesen"
    cont "Ruf, der mich ein-"
    cont "fach anspricht,"
    cont "weißt du?"

    para "Also, willst du es"
    line "immer noch drauf"
    cont "anlegen, du Punk?"

    para "Dann zeig mir, was"
    line "du drauf hast!"
	done


OkeraLossText:
	text "Tss!"
	para "Verloren."

	para "Bist echt kein"
	line "Schwächling."

	para "Dann kriegst du"
	line "wohl meinen"
	cont "FINSTERNORDEN."
	done

GetStormBadgeText:
	text "<PLAYER> erhält"
	line "FINSTERORDEN."
	done

OkeraExplainBadgeText:
	text "Durch den FINSTER-"
	line "ORDEN unterjochst"
	para "du alle #MON"
	line "bis LV 70…"
	
	para "Sonst…"

	para "Außerdem können"
	line "deine #MON"
	para "ZERTRÜMMERER auch"
	line "außerhalb eines"
	cont "Kampfes einsetzen."

	para "Hab heute gute"
	line "Laune, also"
	para "kannst du das hier"
	line "auch noch haben."
	done

OkeraExplainTMText:
    text "Das ist RAUB."

    para "Diese Attacke fügt"
    line "Schaden zu und sie"
    cont "kann auch das"
    para "getragene Item des"
    line "Gegners stehlen."

    para "Nimm, was rechtmä-"
    line "ßig dir gehört."

    para "Das sage ich"
    line "zumindest immer."
	done

OkeraAfterText:
    text "Das war ein"
    line "guter Kampf."

    para "Deine Herausfor-"
    line "derung war meine"
    cont "Zeit wert."
	done
	
CooltrainerfIreneSeenText:
	text "Uargh! Ich"
	line "wurde entdeckt!"
	done

CooltrainerfIreneBeatenText:
	text "Ohhh!"
	line "Zu stark!"
	done

CooltrainerfIreneAfterText:
    text "Die Dunkelheit"
    line "kann einem Angst"
    cont "einjagen."

    para "Aber sie kann auch"
    line "Sicherheit bieten."
	done
	
CooltrainerfJuliaSeenText:
    text "Glaubst du an"
    line "das Pech?"
	done

CooltrainerfJuliaBeatenText:
    text "Ich habe auf jeden"
    line "Fall Pech!"
	done

CooltrainerfJuliaAfterText:
    text "Diese Schalter"
    line "haben noch nie"
    para "so richtig"
    line "funktioniert."
	done
	
CooltrainermBenSeenText:
    text "Du musst die"
    line "Dunkelheit über-"
    cont "winden, um in"
    cont "dieser ARENA zu"
    cont "bestehen!"
	done

CooltrainermBenBeatenText:
	text "Zu hell!"
	done

CooltrainermBenAfterBattleText:
    text "Wäre toll, würden"
    line "die Lichter hier"
    cont "funktionieren…"
	done
	
CooltrainermRobSeenText:
    text "Wusstest du, dass"
    line "Licht und Schatten"
    cont "zwei Seiten der"
    cont "gleichen Medaille"
    cont "sind?"
	done

CooltrainermRobBeatenText:
	text "Ich sehe nichts…"
	done

CooltrainermRobAfterBattleText:
	text "Was magst du"
	line "lieber?"
	
	para "Licht oder"
	line "Schatten?"
	done
	
ItsASwitch:
    text "Sieht wie ein"
    line "LICHTSCHALTER aus…"

    para "Es steht"
    line "'DEFEKT' drauf."

    para "Trotdzem drücken?"
	done

StandGym_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 10, 23, STAND_CITY, 3
	warp_event 11, 23, STAND_CITY, 10
	warp_event  8, 13, STAND_GYM, 1

	db 0 ; coord events

	db 8 ; bg events
	bg_event  9, 21, BGEVENT_READ, StandGymStatue
	bg_event 12, 21, BGEVENT_READ, StandGymStatue
	bg_event 11, 18, BGEVENT_READ, LightSwitch
	bg_event  9,  0, BGEVENT_READ, LightSwitch
	bg_event 21,  2, BGEVENT_READ, LightSwitch
	bg_event 17,  8, BGEVENT_READ, LightSwitch
	bg_event  1, 12, BGEVENT_READ, LightSwitch
	bg_event 21, 12, BGEVENT_READ, LightSwitch

	db 8 ; object events
	object_event 10, 11, SPRITE_OKERA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, StandGymOkeraScript, EVENT_OKERA_AT_BASE
	object_event  8, 21, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, StandGymGuyScript2, -1
	object_event 20, 14, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainermAaron, -1
	object_event 23,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainerfKelly, -1
	object_event  5, 11, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainerfIrene, -1
	object_event  7,  1, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainerfJulia, -1
	object_event 15,  7, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainermBen, -1
	object_event  3, 17, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainermRob, -1

