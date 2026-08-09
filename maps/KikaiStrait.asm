	const_def 2
	const KIKAISTRAIT_SWIMMER1
	const KIKAISTRAIT_SWIMMER2

KikaiStrait_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerSwimmerfDenise:
	trainer SWIMMERF, DENISE, EVENT_BEAT_SWIMMERF_DENISE, SwimmerfDeniseSeenText, SwimmerfDeniseBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfDeniseAfterBattleText
	waitbutton
	closetext
	end


TrainerSwimmerfWendy:
	trainer SWIMMERF, WENDY, EVENT_BEAT_SWIMMERF_WENDY, SwimmerfWendySeenText, SwimmerfWendyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfWendyAfterBattleText
	waitbutton
	closetext
	end

SwimmerfDeniseSeenText:
	text "Das Wetter ist so"
	line "herrlich. Ich bin"
	cont "richtig benommen!"
	done

SwimmerfDeniseBeatenText:
	text "Ohhh!"
	done

SwimmerfDeniseAfterBattleText:
	text "Ein Sonnenbrand"
	line "ist sehr schlecht"
	cont "für die Haut."

	para "Aber ich benutze"
	line "keine Sonnencreme."

	para "Ich möchte das"
	line "Wasser nicht"
	cont "verschmutzen."
	done


SwimmerfWendySeenText:
	text "NACHTs sammeln"
	line "sich STERNDU"
	cont "nahe der Wasser-"
	cont "oberfläche."
	done

SwimmerfWendyBeatenText:
	text "Oje…"
	done

SwimmerfWendyAfterBattleText:
	text "In der Gruppe"
	line "fangen"
	cont "STERNDU an"
	cont "zu leuchten."

	para "Das ist"
	line "wunderschön und"
	cont "beängstigend"
	cont "zugleich."
	done


KikaiStrait_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  8,  9, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfDenise, -1
	object_event 11, 14, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfWendy, -1
