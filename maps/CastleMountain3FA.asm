	const_def 2
	const CM3A_NUGGET1
	const CM3A_NUGGET2
	const CM3A_NUGGET3
	const CM3A_NUGGET4
	const CM3A_NUGGET5
	const CM3A_NUGGET6
	const CM3A_NUGGET7
	const CM3A_NUGGET8
	const CM3A_GRUNT1
	const CM3A_GRUNT2
	const CM3A_GRUNT3
	const CM3A_GRUNT4
	const CM3A_GRUNT5
	const CM3A_DESERTER

CastleMountain3FA_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CM3ANugget1:
	itemball NUGGET

TrainerGruntM37:
	trainer GRUNTM, GRUNTM_37, EVENT_BEAT_ROCKET_GRUNTM_37, GruntM37SeenText, GruntM37BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM37AfterBattleText
	waitbutton
	closetext
	end
	
GruntM37SeenText:
	text "Mind your own and"
	line "turn back now!"
	done
	
GruntM37BeatenText:
	text "I've got a"
	line "lot on my mind."
	done
	
GruntM37AfterBattleText:
	text "Well it's like"
	line "they say, mind"
	cont "over matter."
	done

TrainerGruntM38:
	trainer GRUNTM, GRUNTM_38, EVENT_BEAT_ROCKET_GRUNTM_38, GruntM38SeenText, GruntM38BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM38AfterBattleText
	waitbutton
	closetext
	end
	
GruntM38SeenText:
    text "Ich bin der linke"
    line "Rüpel! Glaub dem"
    cont "rechten nicht ein"
    cont "Wort über mich!"
	done
	
GruntM38BeatenText:
	text "Im Staub zurück-"     ; evtl. irgendein Wortspiel mit links
	line "gelassen…"
	done
	
GruntM38AfterBattleText:
    text "Sag mir nicht, du"
    line "hast eine Rechts-"
    cont "Links-Schwäche!"

    para "Ooh, wie ich das"
    line "hasse!"
	done

TrainerGruntM39:
	trainer GRUNTM, GRUNTM_39, EVENT_BEAT_ROCKET_GRUNTM_39, GruntM39SeenText, GruntM39BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM39AfterBattleText
	waitbutton
	closetext
	end
	
GruntM39SeenText:
    text "Ich bin der rechte"
    line "Rüpel! Ich bringe"
    cont "dich auf den"
    cont "rechten Weg hier"
    cont "raus!"
	done
	
GruntM39BeatenText:
	text "Genau ins Herz!"      ; evtl. irgendein Wortspiel mit rechts
	done
	
GruntM39AfterBattleText:
    text "Ich bin auf jeden"
    line "Fall stärker als"
    cont "der linke Rüpel"
    cont "da drüben!"
	done

TrainerGruntF12:
	trainer GRUNTF, GRUNTF_12, EVENT_BEAT_ROCKET_GRUNTF_12, GruntF12SeenText, GruntF12BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntF12AfterBattleText
	waitbutton
	closetext
	end
	
GruntF12SeenText:
    text "Hier gibt's nichts"
    line "zu sehen!"

    para "Du gehst aber auch"
    line "in die falsche"
    cont "Richtung…"
	done
	
GruntF12BeatenText:
    text "Geh weiter. Ich"
    line "versichere dir, du"
    cont "wirst hier nichts"
    cont "finden!"

    para "Vor allem keinen"
    line "riesigen Schatz"
    cont "oder so!"
	done
	
GruntF12AfterBattleText:
	text "Ups…"
	done


TrainerGruntF13:
	trainer GRUNTF, GRUNTF_13, EVENT_BEAT_ROCKET_GRUNTF_13, GruntF13SeenText, GruntF13BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntF13AfterBattleText
	waitbutton
	closetext
	end
	
GruntF13SeenText:
    text "Da hinten ist"
    line "wirklich nichts!"

    para "Ich FLEHE dich an,"
    line "dreh jetzt um!"
	done
	
GruntF13BeatenText:
	text "Drehst du endlich"
	line "um?"
	done
	
GruntF13AfterBattleText:
	text "Umdrehen, habe ich"
	line "gesagt!"
	done

DeserterScript:
	jumptextfaceplayer DeserterText
	
DeserterText:
    text "Suchst du Ärger?"

    para "Tja, den kriegst"
    line "du aber nicht."

    para "Ich hab die Nase"
    line "voll von all den"
    cont "Verbrechen und"
    cont "das rote R auf"
    cont "meiner Brust"
    cont "zu tragen!"

    para "Ich habe hier ein"
    line "Bett und eine"
    cont "ganze Insel, auf"
    cont "der niemand mich"
    cont "oder meine Vor-"
    cont "strafen kennt!"

    para "Also lass mich in"
    line "Ruhe! Ich lebe"
    cont "jetzt ein besseres"
    cont "Leben."

    para "Hier gibt's keinen"
    line "großen Schatz, die"
    cont "haben schon alles"
    cont "hier mitgenommen."
	done

CM3FABed:
	opentext
	writetext CM3FABedText1
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	special StubbedTrainerRankings_Healings
	special HealParty
	playmusic MUSIC_HEAL
	pause 60
	special RestartMapMusic
	special FadeInQuickly
	opentext
	writetext CM3FABedText2
	waitbutton
	closetext
	end

CM3FABedText1:
	text "Ein weiches Bett!"
	line "Schlafenszeit…"
	done

CM3FABedText2:
	text "Ah, ausgeruht und"
	line "frisch!"
	done

CastleMountain3FA_MapEvents:
	db 0, 0 ; filler

	db 19 ; warp events
	warp_event 11, 56, CASTLE_MOUNTAIN_2F, 4
	warp_event 11, 69, CASTLE_MOUNTAIN_3FA, 3
	
	warp_event 11, 49, CASTLE_MOUNTAIN_3FA, 2
	warp_event 11, 36, CASTLE_MOUNTAIN_3FA, 5
	
	warp_event 11, 16, CASTLE_MOUNTAIN_3FA, 4
	warp_event 11, 29, CASTLE_MOUNTAIN_3FA, 7
	
	warp_event 11,  9, CASTLE_MOUNTAIN_3FA, 6
	
	;drop holes
	warp_event  2,  7, CASTLE_MOUNTAIN_3FA, 10  ;8
	warp_event  3,  7, CASTLE_MOUNTAIN_3FA, 11 ;9
	warp_event  2, 22, CASTLE_MOUNTAIN_3FA, 0 ;10
	warp_event  3, 22, CASTLE_MOUNTAIN_3FA, 0  ; 11
	warp_event  2, 23, CASTLE_MOUNTAIN_3FA, 14 ; 12
	warp_event  3, 23, CASTLE_MOUNTAIN_3FA, 15 ; 13
	warp_event  2, 44, CASTLE_MOUNTAIN_3FA, 0 ; 14
	warp_event  3, 44, CASTLE_MOUNTAIN_3FA, 0 ; 15
	warp_event  2, 45, CASTLE_MOUNTAIN_3FA, 18 ; 16
	warp_event  3, 45, CASTLE_MOUNTAIN_3FA, 19 ; 17
	warp_event  4, 57, CASTLE_MOUNTAIN_3FA, 0 ; 18
	warp_event  5, 57, CASTLE_MOUNTAIN_3FA, 0  ; 19

	db 0 ; coord events

	db 2 ; bg events
	bg_event 17,  4, BGEVENT_READ, CM3FABed
	bg_event 17,  5, BGEVENT_READ, CM3FABed

	db 14 ; object events
	object_event 10,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CM3ANugget1, EVENT_CM3A_NUGGET1
	object_event 10,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CM3ANugget1, EVENT_CM3A_NUGGET2
	object_event 11,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CM3ANugget1, EVENT_CM3A_NUGGET3
	object_event 10,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CM3ANugget1, EVENT_CM3A_NUGGET4
	object_event  9,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CM3ANugget1, EVENT_CM3A_NUGGET5
	object_event  9,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CM3ANugget1, EVENT_CM3A_NUGGET6
	object_event  8,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CM3ANugget1, EVENT_CM3A_NUGGET7
	object_event  9,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CM3ANugget1, EVENT_CM3A_NUGGET8
	object_event 14, 63, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerGruntM37, EVENT_CASTLE_MTN_EVENTS_COMPLETE
	object_event  5, 41, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerGruntM38, EVENT_CASTLE_MTN_EVENTS_COMPLETE
	object_event 16, 41, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerGruntM39, EVENT_CASTLE_MTN_EVENTS_COMPLETE
	object_event  9, 24, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerGruntF12, EVENT_CASTLE_MTN_EVENTS_COMPLETE
	object_event 12, 20, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerGruntF13, EVENT_CASTLE_MTN_EVENTS_COMPLETE
	object_event 16,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, DeserterScript, EVENT_DESERTER_ROCKET_GRUNT
