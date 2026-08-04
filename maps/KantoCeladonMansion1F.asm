	const_def 2 ; object constants
	const CELADONMANSION1F_GRANNY
	const CELADONMANSION1F_GROWLITHE1
	const CELADONMANSION1F_CLEFAIRY
	const CELADONMANSION1F_GROWLITHE2

KantoCeladonMansion1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KantoCeladonMansionManager:
	jumptextfaceplayer KantoCeladonMansionManagerText

KantoCeladonMansion1FMeowth:
	faceplayer
	opentext
	writetext KantoCeladonMansion1FMeowthText
	cry PIDGEY
	waitbutton
	closetext
	end

KantoCeladonMansion1FClefairy:
	faceplayer
	opentext
	writetext KantoCeladonMansion1FClefairyText
	cry CLEFAIRY
	waitbutton
	closetext
	end

KantoCeladonMansion1FNidoranF:
	faceplayer
	opentext
	writetext KantoCeladonMansion1FNidoranFText
	cry NIDORAN_F
	waitbutton
	closetext
	end

KantoCeladonMansionManagersSuiteSign:
	jumptext KantoCeladonMansionManagersSuiteSignText

KantoCeladonMansion1FBookshelf:
	jumpstd picturebookshelf

KantoCeladonMansionManagerText:
	text "Meine süßen #-"
	line "MON sind meine"

	para "Begleiter. Mit"
	line "ihnen fühle ich"
	cont "mich nie allein."
	done

KantoCeladonMansion1FMeowthText:
	text "TAUBSI: Pii!"
	done

KantoCeladonMansion1FClefairyText:
	text "PIEPI: Piep piep"
	line "piep!"
	done

KantoCeladonMansion1FNidoranFText:
	text "NIDORAN: Nido"
	line "nido!"
	done

KantoCeladonMansionManagersSuiteSignText:
	text "PRISMANIA-VILLA"
	line "SUITE des MANAGERs"
	done

KantoCeladonMansion1F_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  4, 11, KANTO_REGION, 2
	warp_event  5, 11, KANTO_REGION, 2
	warp_event  4,  0, KANTO_REGION, 3
	warp_event  2,  0, KANTO_CELADON_MANSION_2F, 1
	warp_event  7,  0, KANTO_CELADON_MANSION_2F, 4

	db 0 ; coord events

	db 3 ; bg events
	bg_event  4,  9, BGEVENT_UP, KantoCeladonMansionManagersSuiteSign
	bg_event  3,  3, BGEVENT_READ, KantoCeladonMansion1FBookshelf
	bg_event  2,  3, BGEVENT_READ, KantoCeladonMansion1FBookshelf

	db 4 ; object events
	object_event  1,  5, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoCeladonMansionManager, -1
	object_event  2,  7, SPRITE_BIRD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, KantoCeladonMansion1FMeowth, -1
	object_event  4,  5, SPRITE_MONSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, KantoCeladonMansion1FNidoranF, -1
	object_event  0,  8, SPRITE_FAIRY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, KantoCeladonMansion1FClefairy, -1
