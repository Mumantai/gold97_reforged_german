	const_def 2 ; object constants
	const BIRDONCAFE_POKEFAN_M
	const BIRDONCAFE_POKEFAN_F
	const BIRDONCAFE_FISHER
	const BIRDONCAFE_LASS
	const BIRDONCAFE_N64_YOUNGSTER

BirdonCafe_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
BirdonCafeFisherScript:
	jumptextfaceplayer BirdonCafeFisherScriptText
	
BirdonCafeLassScript:
	jumptextfaceplayer BirdonCafeLassScriptText

BirdonCafe_DairyFarmer:
	faceplayer
	opentext
	checkitem MOOMOO_MILK
	iftrue DairyFarmerScript_Milking
	writetext DairyFarmerText_BuyMilk
	special PlaceMoneyTopRight
	yesorno
	iffalse DairyFarmerScript_NoSale
	checkmoney YOUR_MONEY, 500
	ifequal HAVE_LESS, DairyFarmerScript_NoMoney
	giveitem MOOMOO_MILK
	iffalse DairyFarmerScript_NoRoom
	takemoney YOUR_MONEY, 500
	special PlaceMoneyTopRight
	waitsfx
	playsound SFX_TRANSACTION
	writetext DairyFarmerText_GotMilk
	buttonsound
	itemnotify
	closetext
	end

DairyFarmerScript_NoMoney:
	writetext DairyFarmerText_NoMoney
	waitbutton
	closetext
	end

DairyFarmerScript_NoRoom:
	writetext DairyFarmerText_NoRoom
	waitbutton
	closetext
	end

DairyFarmerScript_NoSale:
	writetext DairyFarmerText_NoSale
	waitbutton
	closetext
	end

DairyFarmerScript_Milking:
	writetext DairyFarmerText_Milking
	waitbutton
	closetext
	end

BirdonCafe_PokefanF:
	jumptextfaceplayer BirdonCafe_PokefanFText_SnoreSpeech


FarmhouseBookshelf:
	jumpstd picturebookshelf
	
BirdonCafeN64YoungsterScript:
	faceplayer
	opentext
	checkevent EVENT_N64_HOUSE_LOOKING_FOR_PLAYERS
	iftrue .SendN64YoungsterOff
	writetext BirdonCafeN64YoungsterBoredText
	waitbutton
	closetext
	end

.SendN64YoungsterOff
	writetext BirdonCafeN64YoungsterBoredText
	buttonsound
	writetext SendN64YoungsterOffText
	waitbutton
	closetext
	checkcode VAR_FACING
	ifequal DOWN, BirdonCafeN64YoungsterDownScript
	jump BirdonCafeN64YoungsterLeftScript
	end
	
BirdonCafeN64YoungsterDownScript:
	applymovement BIRDONCAFE_N64_YOUNGSTER, BirdonCafeN64YoungsterDownMovement
	playsound SFX_EXIT_BUILDING
	disappear BIRDONCAFE_N64_YOUNGSTER
	setevent EVENT_BIRDON_N64_YOUNGSTER_LEFT_CAFE
	clearevent EVENT_BIRDON_YOUNGSTER_AT_N64_HOUSE
	clearevent EVENT_KANTO_N64_ROCKER_AT_GAME_CORNER
	waitsfx
	end
	
BirdonCafeN64YoungsterLeftScript:
	applymovement BIRDONCAFE_N64_YOUNGSTER, BirdonCafeN64YoungsterLeftMovement
	playsound SFX_EXIT_BUILDING
	disappear BIRDONCAFE_N64_YOUNGSTER
	setevent EVENT_BIRDON_N64_YOUNGSTER_LEFT_CAFE
	clearevent EVENT_BIRDON_YOUNGSTER_AT_N64_HOUSE
	clearevent EVENT_KANTO_N64_ROCKER_AT_GAME_CORNER
	waitsfx
	end
	
BirdonCafeN64YoungsterLeftMovement:
	step UP
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step_end
	
BirdonCafeN64YoungsterDownMovement:
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step_end
	
BirdonCafeN64YoungsterBoredText:
    text "Mir ist so"
    line "langweilig."

    para "Es gibt hier"
    line "nichts zu tun."

    para "Ich würde gerne"
    line "andere Trainer"
    cont "treffen und mit"
    cont "ihnen abhängen"
    cont "und Videospiele"
    cont "spielen."

    para "Aber ich habe"
    line "keine Ahnung, wo"
    cont "ich das könnte."
	done
	
SendN64YoungsterOffText:
    text "Was?"

    para "Bei PORT ABANISHI"
    line "gibt es genau so"
    cont "einen Ort?"

    para "Ich habe hier eh"
    line "nichts zu tun."

    para "Ich werde mir das"
    line "mal anschauen,"
    cont "danke!"
	done
	
BirdonCafeFisherScriptText:
    text "Ich komme quasi"
    line "jeden Tag hierher."

    para "Ich schwöre, diese"
    line "KUHMUH-MILCH muss"
    cont "süchtig machen."
	done
	
BirdonCafeLassScriptText:
    text "Es gibt in dieser"
    line "Stadt nicht viel"
    cont "zu tun."

    para "Viele von uns"
    line "verbringen ihre"
    cont "Zeit hier mit"
    cont "Milchtrinken."
	done

DairyFarmerText_BuyMilk:
    text "Wie wär's mit"
    line "einem Getränk?"

    para "Wir servieren hier"
    line "KUHMUH-MILCH."

    para "Willst du welche?"
	done

DairyFarmerText_GotMilk:
	text "Bitte sehr!"
	line "Trink aus und"
	cont "genieße es!"
	done

DairyFarmerText_NoMoney:
	text "Sorry, Kind."
	line "Kein Geld, keine"
	cont "Milch für dich."
	done

DairyFarmerText_NoRoom:
	text "Ich schätze,"
	line "dein BEUTEL ist"
	cont "voll."
	done

DairyFarmerText_NoSale:
	text "Du willst nicht?"
	line "Komm aber wieder,"
	cont "hörst du?"
	done

DairyFarmerText_Milking:
    text "Die geht runter"
    line "wie Öl."

    para "#MON stehen"
    line "auch total darauf!"
	done


BirdonCafe_PokefanFText_SnoreSpeech:
	text "KUHMUH-MILCH"
	line "ist einfach"
	cont "köstlich!"
	done

BirdonCafe_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, BIRDON_TOWN, 2
	warp_event  3,  7, BIRDON_TOWN, 2

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event  4,  1, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BirdonCafe_DairyFarmer, -1
	object_event  7,  5, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BirdonCafe_PokefanF, -1
	object_event  3,  3, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BirdonCafeFisherScript, -1
	object_event  2,  3, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BirdonCafeLassScript, -1
	object_event  0,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BirdonCafeN64YoungsterScript, EVENT_BIRDON_N64_YOUNGSTER_LEFT_CAFE
