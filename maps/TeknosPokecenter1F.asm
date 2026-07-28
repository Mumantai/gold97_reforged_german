	const_def 2 ; object constants
	const ECRUTEAKPOKECENTER1F_NURSE
	const ECRUTEAKPOKECENTER1F_POKEFAN_M
	const ECRUTEAKPOKECENTER1F_COOLTRAINER_F
	const ECRUTEAKPOKECENTER1F_GYM_GUY
	const ECRUTEAKPOKECENTER1F_BILL

TeknosPokecenter1F_MapScripts:
	db 2 ; scene scripts
	scene_script .MeetBill ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 0 ; callbacks

.MeetBill:
	priorityjump .BillActivatesTimeCapsule
	end

.DummyScene:
	end

.BillActivatesTimeCapsule:
	pause 30
	appear ECRUTEAKPOKECENTER1F_BILL
	applymovement ECRUTEAKPOKECENTER1F_BILL, TeknosPokecenter1FBillMovement1
	opentext
	writetext TeknosPokecenter1F_BillText1
	waitbutton
	closetext
	applymovement ECRUTEAKPOKECENTER1F_BILL, TeknosPokecenter1FBillMovement2
	playsound SFX_EXIT_BUILDING
	disappear ECRUTEAKPOKECENTER1F_BILL
	setflag ENGINE_TIME_CAPSULE
	clearevent EVENT_TEKNOS_GRAMPA_LOOKING_FOR_LITTLE_GIRL
	clearevent EVENT_LITTLE_GIRL_IN_BOULDER_MINES
	clearevent EVENT_WHITNEY_IN_BOULDER_MINES
	setscene SCENE_FINISHED
	waitsfx
	end

TeknosPokecenter1FNurseScript:
	jumpstd pokecenternurse

TeknosPokecenter1FPokefanMScript:
	special Mobile_DummyReturnFalse
	iftrue .mobile
	jumptextfaceplayer TeknosPokecenter1FPokefanMText

.mobile
	jumptextfaceplayer TeknosPokecenter1FPokefanMTextMobile

TeknosPokecenter1FCooltrainerFScript:
	jumptextfaceplayer TeknosPokecenter1FCooltrainerFText

TeknosPokecenter1FGymGuyScript:
	jumptextfaceplayer TeknosPokecenter1FGymGuyText

TeknosPokecenter1FBillMovement1:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step UP
	step RIGHT
	step LEFT
	step UP
	step RIGHT
	step DOWN
	step LEFT
	step DOWN
	step_end

TeknosPokecenter1FBillMovement2:
	step RIGHT
	step DOWN
	step_end

TeknosPokecenter1FPlayerMovement1:
	step UP
	step UP
	step UP
	step_end

TeknosPokecenter1F_BillText1:
    text "Oje, oje."

    para "Hier ist sie auch"
    line "nicht!"

    para "Oje, oje."

    para "Du hast nicht zu-"
    line "fällig ein junges"
    cont "Mädchen hier in"
    cont "der Nähe gesehen?"

    para "Es geht um meine"
    line "Enkeltochter."

    para "Ich kann sie"
    line "nirgendwo finden!"

    para "Oh nein."
    line "Hoffentlich ist"
    cont "sie nicht in diese"
    cont "unheilvolle MINE"
    cont "gegangen…"

    para "Könntest du dort"
    line "nachsehen?"

    para "Es gibt eine alte"
    line "MINE gleich außer-"
    cont "halb der Stadt."

    para "Ich bete, dass sie"
    line "nicht dorthin"
    cont "gegangen ist…"

    para "Oje, oje."
	done

TeknosPokecenter1FPokefanMText:
	text "Behandelst du"
	line "deine #MON gut,"
	cont "werden sie dich"
	cont "regelrecht lieben."
	done

TeknosPokecenter1FPokefanMTextMobile:
	text "Du hoffst, hier"
	line "mehr Kämpfe zu er-"
	cont "leben, nicht wahr?"

	para "Es gibt offen-"
	line "sichtlich einen"
	cont "Ort, an dem sich"
	cont "Trainer treffen."

	para "Wo, fragst du?"

	para "Etwas hinter"
	line "GENEOS CITY."
	done

TeknosPokecenter1FCooltrainerFText:
    text "Kennen deine #-"
    line "MON VM-Attacken?"

    para "Außerhalb von"
    line "Kämpfen, können"
    cont "sie auch dann"
    cont "eingesetzt werden,"
    cont "wenn das #MON"
    cont "kampfunfähig ist."
	done

TeknosPokecenter1FGymGuyText:
    text "Warst du schon"
    line "am Hafen von"
    cont "KAZANAMI CITY?"

    para "Vergiss die an-"
    line "deren Häfen in"
    cont "NIHON. In KAZANAMI"
    cont "findet der meiste"
    cont "Handel statt."
	done

TeknosPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  7, TEKNOS_CITY, 3
	warp_event  6,  7, TEKNOS_CITY, 3
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TeknosPokecenter1FNurseScript, -1
	object_event 12,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TeknosPokecenter1FPokefanMScript, -1
	object_event  1,  4, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TeknosPokecenter1FCooltrainerFScript, -1
	object_event 10,  1, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TeknosPokecenter1FGymGuyScript, -1
	object_event 11,  4, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ECRUTEAK_POKE_CENTER_BILL
