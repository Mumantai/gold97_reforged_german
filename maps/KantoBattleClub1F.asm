	const_def 2 ; object constants
	const BATTLECLUB_BOUNCER

KantoBattleClub1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
EntranceCheckClub:
	checkevent EVENT_GOT_BATTLE_CLUB_PASS
	iffalse .GivePass
	checkitem PASS
	iffalse .NoPass
	checkflag ENGINE_MT_MOON_SQUARE_CLEFAIRY
	iftrue .AlreadyApproved
	turnobject PLAYER, LEFT
	turnobject BATTLECLUB_BOUNCER, RIGHT
	jump BouncerScript2
	end
	
.AlreadyApproved
	end
	
.NoPass
	turnobject PLAYER, LEFT
	turnobject BATTLECLUB_BOUNCER, RIGHT
	opentext
	writetext NoPassText
	waitbutton
	closetext
	applymovement PLAYER, NoEntryAllowed
	end
	
.GivePass
	turnobject PLAYER, LEFT
	turnobject BATTLECLUB_BOUNCER, RIGHT
	jump GivePassFullScript
	
GivePassFullScript:
	faceplayer
	opentext
	writetext PassGiveText
	waitbutton
	verbosegiveitem PASS
	closetext
	setevent EVENT_GOT_BATTLE_CLUB_PASS
	checkcode VAR_FACING
	ifequal LEFT, .FullSceneTime
	end
	
.FullSceneTime
	jump EntranceCheckClub
	end

BouncerScript:
	checkevent EVENT_GOT_BATTLE_CLUB_PASS
	iffalse .GivePass2
	checkitem PASS
	iffalse .NoPass2
	checkflag ENGINE_MT_MOON_SQUARE_CLEFAIRY
	iftrue .AlreadyApproved2
	faceplayer
	jump BouncerScript2
	end
	
.GivePass2
	jump GivePassFullScript
	
.NoPass2
	faceplayer
	opentext
	writetext NoPassText
	waitbutton
	closetext
	end
	
.AlreadyApproved2
	faceplayer
	opentext
	writetext AlreadyApprovedText
	waitbutton
	closetext
	end
	
BouncerScript2:
	opentext
	writetext BouncerChecksYou
	waitbutton
	closetext
	setflag ENGINE_MT_MOON_SQUARE_CLEFAIRY
	checkcode VAR_WEEKDAY
	ifequal MONDAY, .MondayBC
	ifequal TUESDAY, .TuesdayBC
	ifequal WEDNESDAY, .WednesdayBC
	ifequal THURSDAY, .ThursdayBC
	ifequal FRIDAY, .FridayBC
	ifequal SATURDAY, .SaturdayBC
.SundayBC
	clearevent EVENT_BATTLE_CLUB_SUNDAY
	setevent EVENT_BATTLE_CLUB_MONDAY
	setevent EVENT_BATTLE_CLUB_TUESDAY
	setevent EVENT_BATTLE_CLUB_WEDNESDAY
	setevent EVENT_BATTLE_CLUB_THURSDAY
	setevent EVENT_BATTLE_CLUB_FRIDAY
	setevent EVENT_BATTLE_CLUB_SATURDAY
	end
	
.MondayBC
	setevent EVENT_BATTLE_CLUB_SUNDAY
	clearevent EVENT_BATTLE_CLUB_MONDAY
	setevent EVENT_BATTLE_CLUB_TUESDAY
	setevent EVENT_BATTLE_CLUB_WEDNESDAY
	setevent EVENT_BATTLE_CLUB_THURSDAY
	setevent EVENT_BATTLE_CLUB_FRIDAY
	setevent EVENT_BATTLE_CLUB_SATURDAY
	end
	
.TuesdayBC
	setevent EVENT_BATTLE_CLUB_SUNDAY
	setevent EVENT_BATTLE_CLUB_MONDAY
	clearevent EVENT_BATTLE_CLUB_TUESDAY
	setevent EVENT_BATTLE_CLUB_WEDNESDAY
	setevent EVENT_BATTLE_CLUB_THURSDAY
	setevent EVENT_BATTLE_CLUB_FRIDAY
	setevent EVENT_BATTLE_CLUB_SATURDAY
	end
	
.WednesdayBC
	setevent EVENT_BATTLE_CLUB_SUNDAY
	setevent EVENT_BATTLE_CLUB_MONDAY
	setevent EVENT_BATTLE_CLUB_TUESDAY
	clearevent EVENT_BATTLE_CLUB_WEDNESDAY
	setevent EVENT_BATTLE_CLUB_THURSDAY
	setevent EVENT_BATTLE_CLUB_FRIDAY
	setevent EVENT_BATTLE_CLUB_SATURDAY
	end
	
.ThursdayBC
	setevent EVENT_BATTLE_CLUB_SUNDAY
	setevent EVENT_BATTLE_CLUB_MONDAY
	setevent EVENT_BATTLE_CLUB_TUESDAY
	setevent EVENT_BATTLE_CLUB_WEDNESDAY
	clearevent EVENT_BATTLE_CLUB_THURSDAY
	setevent EVENT_BATTLE_CLUB_FRIDAY
	setevent EVENT_BATTLE_CLUB_SATURDAY
	end
	
.FridayBC
	setevent EVENT_BATTLE_CLUB_SUNDAY
	setevent EVENT_BATTLE_CLUB_MONDAY
	setevent EVENT_BATTLE_CLUB_TUESDAY
	setevent EVENT_BATTLE_CLUB_WEDNESDAY
	setevent EVENT_BATTLE_CLUB_THURSDAY
	clearevent EVENT_BATTLE_CLUB_FRIDAY
	setevent EVENT_BATTLE_CLUB_SATURDAY
	end
	
.SaturdayBC
	setevent EVENT_BATTLE_CLUB_SUNDAY
	setevent EVENT_BATTLE_CLUB_MONDAY
	setevent EVENT_BATTLE_CLUB_TUESDAY
	setevent EVENT_BATTLE_CLUB_WEDNESDAY
	setevent EVENT_BATTLE_CLUB_THURSDAY
	setevent EVENT_BATTLE_CLUB_FRIDAY
	clearevent EVENT_BATTLE_CLUB_SATURDAY
	end
	
NoEntryAllowed:
	step DOWN
	step_end
	
NoPassText:
	text "Es tut mir leid,"
	line "aber ohne einen"
	para "KAMPFPASS darf"
	line "niemand hinein."
	done

PassGiveText:
	text "Willkommen im"
	line "KANTO-KAMPFCLUB!"

	para "Dies ist ein"
	line "Etablissement der"
	para "Extraklasse für"
	line "ernsthafte"
	cont "Trainer!"

	para "An der Zahl deiner"
	line "ORDEN sehe ich,"
	para "dass du ein ziem-"
	line "lich ernsthafter"
    cont "Trainer bist!"

	para "Dieses Etablisse-"
	line "ment ist nur für"
	cont "Mitglieder."

	para "Und ich biete dir"
	line "eine Mitglied-"
	cont "schaft an!"
	done

AlreadyApprovedText:
	text "Du darfst für"
	line "heute herein."
	done

BouncerChecksYou:
	text "Ah, ein KAMPFPASS!"
	line "Willkommen!"
	done

KantoBattleClub1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  4,  7, KANTO_REGION, 24
	warp_event  5,  7, KANTO_REGION, 24
	warp_event  5,  0, KANTO_BATTLE_CLUB_B1F, 1

	db 1 ; coord events
	coord_event  5,  1, SCENE_DEFAULT, EntranceCheckClub

	db 0 ; bg events

	db 1 ; object events
	object_event  4,  1, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BouncerScript, -1
