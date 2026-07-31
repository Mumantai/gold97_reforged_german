	const_def 2 ; object constants
	const KOBANCLAIRHOUSE_1_CLAIR

KobanClairsHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KobanClairsHouseClairScript:
	faceplayer
	checkevent EVENT_GOT_DRATINI
	iftrue .AfterDratiniGift
	checkitem DRAGON_ORB
	iffalse .NoOrbYet
	opentext
	writetext ClairTakeThisDratiniText
	waitbutton
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFullClair
	writetext ClairPlayerReceivedDratiniText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke DRATINI, 15
	special GiveDratini
	setevent EVENT_GOT_DRATINI
	takeitem DRAGON_ORB
	writetext ClairSymbolicDragonText
	waitbutton
	closetext
	end

.AfterDratiniGift
	checkevent EVENT_BATTLE_AVAILABLE_CLAIR
	iftrue rematchscriptClair
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue postrematchscriptClair
	opentext
	writetext DragonsAreGreatText
	waitbutton
	closetext
	end

.NoOrbYet
	opentext
	writetext GoGetTheOrbText
	waitbutton
	closetext
	end

.PartyFullClair:
	writetext DragonShrinePartyFullTextClair
	waitbutton
	closetext
	end

rematchscriptClair:
	opentext
	writetext ClairRematchText
	waitbutton
	closetext
	winlosstext ClairRematchWinText, 0
	loadtrainer CLAIR, CLAIR1
	startbattle
	reloadmapafterbattle
	clearevent EVENT_BATTLE_AVAILABLE_CLAIR
	opentext
	writetext ClairAfterRematchText
	waitbutton
	closetext
	end

postrematchscriptClair:
	opentext
	writetext ClairAfterRematchText
	waitbutton
	closetext
	end

ClairRematchText:
    text "Du hast also"
    line "meinen Cousin,"
    cont "SIEGFRIED, kennen-"
    cont "gelernt."

    para "Und das bedeutet,"
    line "dass du die"
    cont "#MON LIGA"
    cont "geschlagen hast!"

    para "Sowohl SIEGFRIED"
    line "als auch ich"
    cont "stammen aus einer"
    cont "langen Reihe von"
    cont "mächtigen DRACHEN-"
    cont "Trainern."

    para "Erwiese mir die"
    line "Ehre, dir meine"
    cont "Fähigkeiten zeigen"
    cont "zu dürfen!"
	done

ClairRematchWinText:
    text "Ich habe verloren?"

    para "Nun, ich kann"
    line "nicht behaupten,"
    cont "ich sei sonderlich"
    cont "überrascht!"

    para "Du trägst den"
    line "Titel des CHAMPs"
    cont "mit Ehre!"
	done

ClairAfterRematchText:
    text "Wären meine Ver-"
    line "pflichtungen hier"
    cont "auf der SATORIA-"
    cont "INSEL nicht, hätte"
    cont "ich ebenfalls eine"
    cont "ARENALEITERIN sein"
    cont "können."

    para "Vielleicht denke"
    line "ich darüber nach,"
    cont "wenn die LIGA"
    cont "beschließt, hier"
    cont "eine ARENA zu"
    cont "errichten."

    para "Das nächste Mal,"
    line "wenn du SIEGFRIED"
    cont "triffst, verpass"
    cont "ihm eine Abreibung"
    cont "für mich!"
	done

ClairPlayerReceivedDratiniText:
	text "<PLAYER> erhält"
	line "DRATINI!"
	done

ClairSymbolicDragonText:
    text "Drachen-#MON"
    line "sind schwer zu"
    para "erziehen, aber"
    line "ihre Anmut und"
    para "Stärke sind die"
    line "Anstrengung wert."

    para "Ich glaube, du"
    line "kannst dieses"
    para "DRATINI richtig"
    line "aufziehen."
	done

DragonShrinePartyFullTextClair:
	text "Hm? Dein #MON-"
	line "Team ist voll."
	done

ClairTakeThisDratiniText:
    text "Ah, der"
    line "DRACHEN ORB!"

    para "Du hast also die"
    line "Macht von Drachen-"
    cont "#MON erfahren!"

    para "Ich möchte dich"
    line "mit einem spezi-"
    cont "#MON belohnen,"
    para "das es verdient,"
    line "von einem würdigen"
    para "Trainer aufgezogen"
    line "zu werden!"
	done

GoGetTheOrbText:
    text "Beschaffe den"
    line "DRACHEN ORB von"
    para "einem Trainer in"
    line "der Höhle und"
    cont "bring ihn zu mir."
	done

DragonsAreGreatText:
    text "Ein Drachen-"
    line "Trainer zu sein,"
    para "erfordert mehr"
    line "Hingabe als bei"
    para "den meisten"
    line "anderen Typen."

    para "Es ist viel mehr"
    line "eine Lebensweise."
	done

KobanClairsHouseClairText:
	text "Was geht?"
	done

KobanClairsHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, KOBAN_ISLAND, 1
	warp_event  5,  7, KOBAN_ISLAND, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  7, 4, SPRITE_CLAIR, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, KobanClairsHouseClairScript, EVENT_CLAIRS_HOUSE_HIDE_CLAIR
