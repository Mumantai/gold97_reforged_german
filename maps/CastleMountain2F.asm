	const_def 2
	const CM2F_ITEMBALL1
	const CM2F_ITEMBALL2
	const CM2F_GRUNT1
	const CM2F_GRUNT2
	const CM2F_GRUNT3
	const CM2F_GRUNT4

CastleMountain2F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .UnblockStairs
	
.UnblockStairs:
	checkevent EVENT_UNBLOCK_STAIRS_ROOM
	iffalse .Done
	changeblock $E, $12, $70
.Done:
	return

CM2FItemball1:
	itemball ULTRA_BALL

CM2FItemball2:
	itemball STEEL_SHELL


TrainerGruntM35:
	trainer GRUNTM, GRUNTM_35, EVENT_BEAT_ROCKET_GRUNTM_35, GruntM35SeenText, GruntM35BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM35AfterBattleText
	waitbutton
	closetext
	end
	
GruntM35SeenText:
    text "Schön dunkel und"
    line "schmuddelig. Ich"
    cont "hätte mir kein"
    cont "besseres Versteck"
    cont "aussuchen können!"
	done
	
GruntM35BeatenText:
    text "Jetzt bin ich"
    line "voller Staub!"

    para "Ich liebe es!"
	done
	
GruntM35AfterBattleText:
    text "Die Dame vom"
    line "VORSTAND plant die"
    cont "besten Missionen."

    para "…Auch wenn diese"
    line "Mission bloß als"
    cont "Ziel hat, sich so"
    cont "weit wie möglich"
    cont "vor den Behörden"
    cont "aus NIHON zu"
    cont "verstecken."
	done


TrainerGruntM36:
	trainer GRUNTM, GRUNTM_36, EVENT_BEAT_ROCKET_GRUNTM_36, GruntM36SeenText, GruntM36BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM36AfterBattleText
	waitbutton
	closetext
	end
	
GruntM36SeenText:
    text "Wir sind eine"
    line "TEAM ROCKET"
    cont "Eliteeinheit!"
	done
	
GruntM36BeatenText:
    text "D-du musst auch"
    line "elitär sein!"
	done
	
GruntM36AfterBattleText:
    text "Dieses Schloss"
    line "gibt mir das"
    cont "Gefühl, dass wir"
    cont "uns einen besseren"
    cont "Namen, als einfach"
    cont "nur TEAM ROCKET,"
    cont "geben sollten."

    para "Vielleicht…"
	
	para "TEAM GREAT ROCKET!"
	done


TrainerGruntF10:
	trainer GRUNTF, GRUNTF_10, EVENT_BEAT_ROCKET_GRUNTF_10, GruntF10SeenText, GruntF10BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntF10AfterBattleText
	waitbutton
	closetext
	end
	
GruntF10SeenText:
    text "Die Dame vom"
    line "VORSTAND ist zu"
    cont "gut, um gegen 'nen"
    cont "Knirps wie dich zu"
    cont "kämpfen, also muss"
    cont "ich jetzt ran!"
	done
	
GruntF10BeatenText:
    text "Du machst keine"
    line "halben Sachen!"
	done
	
GruntF10AfterBattleText:
    text "In unserer Einheit"
    line "gibt es mehr Mäd-"
    cont "chen als in den"
    cont "anderen Einheiten."

    para "Das liegt daran,"
    line "dass die Dame vom"
    cont "VORSTAND selbst"
    cont "die härtesten"
    cont "Mädels aus TEAM"
    cont "ROCKET aussucht,"
    cont "um sie persönlich"
    cont "zu trainieren!"
	done

TrainerGruntF11:
	trainer GRUNTF, GRUNTF_11, EVENT_BEAT_ROCKET_GRUNTF_11, GruntF11SeenText, GruntF11BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntF11AfterBattleText
	waitbutton
	closetext
	end
	
GruntF11SeenText:
    text "Ich hörte, dieses"
    line "alte SCHLOSS sei"
    cont "verflucht! Als ob"
    cont "ich an so etwas"
    cont "Dummes glauben"
    cont "würde!"
	done
	
GruntF11BeatenText:
	text "Verflucht!"
	done
	
GruntF11AfterBattleText:
    text "Die ganze Stadt"
    line "hat Angst, hier"
    cont "herzukommen, wegen"
    cont "einem traurigen"
    cont "Geist und einem"
    cont "GRÜNEN DRACHEN."

    para "Gut! Das bedeutet,"
    line "dass uns niemand"
    cont "hier stören wird!"
	done

HiddenDebris1:
	hiddenitem BRICK_PIECE, EVENT_CM_HIDDENITEM1
	
HiddenDebris2:
	hiddenitem STAR_PIECE, EVENT_CM_HIDDENITEM2
	
HiddenDebris3:
	hiddenitem BRICK_PIECE, EVENT_CM_HIDDENITEM3
	
HiddenDebris4:
	hiddenitem BRICK_PIECE, EVENT_CM_HIDDENITEM4

CastleMountain2F_MapEvents:
	db 0, 0 ; filler

	db 7 ; warp events
	warp_event  5, 13, CASTLE_MOUNTAIN_1F_CAVE, 2
	warp_event 14, 19, CASTLE_MOUNTAIN_1F_STAIRS, 3
	warp_event 15, 19, CASTLE_MOUNTAIN_1F_STAIRS, 4
	warp_event  6,  1, CASTLE_MOUNTAIN_3FA, 1
	warp_event  7,  1, CASTLE_MOUNTAIN_3FA, 1
	warp_event 22,  1, CASTLE_MOUNTAIN_3FB, 1
	warp_event 23,  1, CASTLE_MOUNTAIN_3FB, 1

	db 0 ; coord events

	db 4 ; bg events
	bg_event 20, 14, BGEVENT_ITEM, HiddenDebris1
	bg_event 24,  9, BGEVENT_ITEM, HiddenDebris2
	bg_event 19,  2, BGEVENT_ITEM, HiddenDebris3
	bg_event 10,  9, BGEVENT_ITEM, HiddenDebris4

	db 6 ; object events
	object_event 14,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CM2FItemball1, EVENT_CM_2F_ITEMBALL1
	object_event 23, 13, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CM2FItemball2, EVENT_CM_2F_ITEMBALL2
	object_event 19, 11, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerGruntM35, EVENT_CASTLE_MTN_EVENTS_COMPLETE
	object_event  6,  6, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerGruntM36, EVENT_CASTLE_MTN_EVENTS_COMPLETE
	object_event 24,  3, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerGruntF10, EVENT_CASTLE_MTN_EVENTS_COMPLETE
	object_event 23,  6, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerGruntF11, EVENT_CASTLE_MTN_EVENTS_COMPLETE
