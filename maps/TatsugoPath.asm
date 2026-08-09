	const_def 2
	const TP_TEACHER
	const TP_INSTR
	const TP_SNERD
	const TP_SAILOR
	const TP_ITEMBALL

TatsugoPath_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerSailorEugene:
	trainer SAILOR, EUGENE, EVENT_BEAT_SAILOR_EUGENE, SailorEugeneSeenText, SailorEugeneBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorEugeneAfterBattleText
	waitbutton
	closetext
	end
	

SailorEugeneSeenText:
	text "Ich bin gerade"
	line "von der See"
	cont "zurückgekommen."

	para "Wie steht es nun"
	line "mit dem #MON-"
	cont "Kampf?"
	done

SailorEugeneBeatenText:
	text "Aah!"
	done

SailorEugeneAfterBattleText:
	text "Meine #MON"
	line "sin im Ausland"
	cont "eingefangen und"
	cont "aufgezogen worden."

	para "Sie begleiten mich"
	line "auf meinen langen"
	cont "Reisen."
	done


TrainerTeacherHolly:
	trainer TEACHER, HOLLY, EVENT_BEAT_TEACHER_HOLLY, TeacherHollySeenText, TeacherHollyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TeacherHollyAfterBattleText
	waitbutton
	closetext
	end
	

TeacherHollySeenText:
    text "Äh, entschuldigung"
    line "aber das ist ein"
    cont "privates Treffen!"
	done

TeacherHollyBeatenText:
	text "Hau ab, du"
	line "Schwachkopf!"
	done

TeacherHollyAfterBattleText:
    text "Als ob ich nicht"
    line "auf Arbeit schon"
    para "genug mit Kindern"
    line "zu tun hätte!"
	done


TrainerInstrMoshe:
	trainer INSTRUCTOR, MOSHE, EVENT_BEAT_INSTRUCTOR_MOSHE, InstrMosheSeenText, InstrMosheBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext InstrMosheAfterBattleText
	waitbutton
	closetext
	end
	

InstrMosheSeenText:
    text "Falls du Nachhilfe"
    line "wolltest, bist du"
    para "zur falschen Zeit"
    line "gekommen!"
	done

InstrMosheBeatenText:
	text "Ach, komm schon!"
	done

InstrMosheAfterBattleText:
    text "Es ist so typisch,"
    line "dass ich nicht mal"
    para "auf ein Rendezvous"
    line "gehen kann, ohne"
    para "von irgendeinem"
    line "Kind belästigt"
    cont "zu werden!"
	done

TrainerSNNorton:
	trainer SUPER_NERD, NORTON, EVENT_BEAT_SUPERNERD_NORTON, SNNortonSeenText, SNNortonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SNNortonAfterBattleText
	waitbutton
	closetext
	end
	

SNNortonSeenText:
    text "Ich hänge jeden"
    line "Tag am HERZTEICH"
    cont "rum!"

    para "Also warum finde"
    line "ich dann keine"
    cont "Freundin?"
	done

SNNortonBeatenText:
    text "Das Leben eines"
    line "STREBERs ist hart."
	done

SNNortonAfterBattleText:
    text "Hätte ich bessere"
    line "Chancen, wenn ich"
    para "im HERZTEICH baden"
    line "würde?"
	done

TPItemball:
	itemball ULTRA_BALL

HeartPondSign:
	jumptext HeartPondSignText
	
HeartPondSignText:
	text "HERZTEICH"

	para "Ein Treffpunkt"
	line "für Liebende"
	done

KikaiStraitSign:
	jumptext KikaiStraitSignText
	
KikaiStraitSignText:
	text "TATSUGO PFAD -"
	line "STRAẞE VON KIKAI"
	
	para "KIKAITANI"
	line "VORAUS"
	done

TatsugoPath_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 2 ; bg events
	bg_event 20,  6, BGEVENT_READ, HeartPondSign
	bg_event 54,  6, BGEVENT_READ, KikaiStraitSign

	db 5 ; object events
	object_event 19,  9, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerTeacherHolly, -1
	object_event 19, 10, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerInstrMoshe, -1
	object_event 27,  7, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerSNNorton, -1
	object_event 52,  9, SPRITE_SAILOR, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSailorEugene, -1
	object_event 51, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TPItemball, EVENT_TATSUGO_PATH_ITEMBALL
