	const_def 2 ; object constants
	const AMAMI_GYM_SQUIRTLE_GIRL
	const AMAMI_GYM_SWIMMER_GUY
	const AMAMI_GYM_SWIMMER_GIRL
	const AMAMI_GYM_GRANNY
	const AMAMI_GYM_BUG_CATCHER
	const AMAMI_GYM_LASS

AmamiSwimmingPool_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

AmamiSwimmingPoolSwimmerSquirtle:
	faceplayer
	opentext
	checkevent EVENT_AMAMI_SWIMMING_POOL_GOT_SQUIRTLE
	iftrue .AlreadyGotSquirtle
	writetext ILoveSquirtleText
	yesorno
	iffalse .DontTakeSquirtle
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFullSquirtle
	writetext ReceiveSquirtleText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke SQUIRTLE, 5
	writetext GiveSquirtleText
	waitbutton
	closetext
	setevent EVENT_AMAMI_SWIMMING_POOL_GOT_SQUIRTLE
	end
	
.AlreadyGotSquirtle
	writetext AlreadyGotSquirtleText
	waitbutton
	closetext
	end
	
.DontTakeSquirtle
	writetext NoSquirtleText
	waitbutton
	closetext
	end
	
.PartyFullSquirtle
	writetext PartyFullSquirtleText
	waitbutton
	closetext
	end
	
AmamiSwimmingPoolSwimmerGuyScript:
	jumptextfaceplayer AmamiSwimmingPoolSwimmerGuyText
	
AmamiSwimmingPoolSwimmerGirlScript:
	jumptextfaceplayer AmamiSwimmingPoolSwimmerGirlText
	
AmamiSwimmingPoolGrannyScript:
	jumptextfaceplayer AmamiSwimmingPoolGrannyText
	
AmamiSwimmingPoolBugCatcherScript:
	jumptextfaceplayer AmamiSwimmingPoolBugCatcherText

AmamiSwimmingPoolLassScript:
	jumptextfaceplayer AmamiSwimmingPoolLassText
	
AmamiSwimmingPoolLassText:
	text "Es ist besser,"
	line "schwächere #MON"
	para "in einem kontrol-"
	line "lierten Umfeld,"
	para "wie etwa einem"
	line "Hallenbad, zu"
	para "trainieren, als im"
	line "offenen Meer."
	done
	
AmamiSwimmingPoolBugCatcherText:
	text "Ich will schwimmen"
	line "gehen!"
	done
	
AmamiSwimmingPoolGrannyText:
	text "Ich kann nicht"
	line "mehr so gut"
	cont "schwimmen."

	para "Aber meine #MON"
	line "lieben das Wasser,"
	para "also bringe ich"
	line "sie oft hierher."
	done
	
AmamiSwimmingPoolSwimmerGirlText:
    text "Wasser-#MON"
    line "lieben es, im"
    cont "Wasser zu sein!"

    para "Ist doch logisch,"
    line "oder?"
	done
	
AmamiSwimmingPoolSwimmerGuyText:
    text "Schwimmen ist eine"
    line "tolle Übung für"
    para "Menschen, sowie"
    line "für #MON!"
	done
	
ReceiveSquirtleText:
	text "<PLAYER> erhält"
	line "SCHIGGY."
	done
	
AlreadyGotSquirtleText:
	text "Ich komme fast"
	line "jeden Tag hierher,"
	para "um mit meinem"
	line "SCHIGGY zu"
	cont "schwimmen!"
	done
	
PartyFullSquirtleText:
	text "Du trägst zu viele"
	line "#MON mit dir!"
	done
	
NoSquirtleText:
	text "Bist du sicher?"

	para "Das sind so"
	line "tolle #MON!"
	done
	
	
ILoveSquirtleText:
    text "SCHIGGY sind tolle"
    line "Schwimmer!"

    para "Warst du schon mal"
    line "mit einem SCHIGGY"
    cont "schwimmen?"

    para "Du solltest es mal"
    line "ausprobieren!"

    para "Sie sind auch"
    line "tolle #MON zum"
    cont "Trainieren!"  ; etvl. ändern

    para "Ich habe ein"
    line "junges SCHIGGY,"
    para "das einen guten"
    line "Trainer braucht."

    para "Hier, du solltest"
    line "ein SCHIGGY"
    cont "aufziehen!"
	done
	
GiveSquirtleText:
	text "Hilf ihm, groß und"
	line "stark zu werden!"
	done
	
AmamiSwimmingPool_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  6, 17, AMAMI_TOWN, 4
	warp_event  7, 17, AMAMI_TOWN, 5

	db 0 ; coord events

	db 0 ; bg events

	db 6 ; object events
	object_event  5,  6, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, AmamiSwimmingPoolSwimmerSquirtle, -1
	object_event  9,  9, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AmamiSwimmingPoolSwimmerGuyScript, -1
	object_event 11, 10, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AmamiSwimmingPoolSwimmerGirlScript, -1
	object_event  7, 13, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, AmamiSwimmingPoolGrannyScript, -1
	object_event  3, 14, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AmamiSwimmingPoolBugCatcherScript, -1
	object_event 18,  3, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, AmamiSwimmingPoolLassScript, -1
