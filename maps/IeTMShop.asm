	const_def 2 
	const IETMSHOP_CLERK1
	const IETMSHOP_CLERK2
	const IETMSHOP_NPC1
	const IETMSHOP_NPC2
	const IETMSHOP_NPC3

IeTMShop_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

IeMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_AMAMI
	closetext
	end

IeTMClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_IE_TM_SHOP
	closetext
	end

IeShopNPC1Script:
	jumptextfaceplayer IeShopNPC1Text

IeShopNPC1Text:
    text "Die TMs, die hier"
    line "verkauft werden,"
    cont "sind im DUELLTURM"
    cont "am beliebtesten!"

    para "Jeder Trainer, der"
    line "etwas auf sich"
    cont "hält, sollte diese"
    cont "Attacken kennen!"
	done

IeShopNPC2Script:
	jumptextfaceplayer IeShopNPC2Text
	
IeShopNPC2Text:
    text "ERHOLUNG und"
    line "SCHLAFREDE sind"
    cont "ein bekanntes Paar"
    cont "von Attacken, um"
    cont "ein #MON gesund"
    cont "und angriffsbereit"
    cont "zu halten."
	done
	
	
IeShopNPC3Script:
	jumptextfaceplayer IeShopNPC3Text

IeShopNPC3Text:
    text "FLUCH ist eine"
    line "sehr eigenartige"
    cont "Attacke, die sich"
    cont "besonders gut mit"
    cont "langsamen #MON"
    cont "einsetzen lässt."

    para "Sie können davon"
    line "nur profitieren!"
	done



IeTMShop_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  7, 11, IE_TOWN, 2
	warp_event  8, 11, IE_TOWN, 3

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event  6,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IeMartClerkScript, -1
	object_event  9,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IeTMClerkScript, -1
	object_event 14,  2, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, IeShopNPC1Script, -1
	object_event  4,  6, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, IeShopNPC2Script, -1
	object_event 10,  8, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, IeShopNPC3Script, -1
