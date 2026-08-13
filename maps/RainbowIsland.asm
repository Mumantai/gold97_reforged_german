	const_def 2
	const RI_BLUE1
	const RI_BLUE2

RainbowIsland_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .RainbowIslandRestored
	
.RainbowIslandRestored:
	checkevent EVENT_RAINBOW_ISLE_RESTORED
	iffalse .Done
	changeblock $C, $6, $48 ; the rainbow
	changeblock $C, $4, $44
	changeblock $E, $6, $49
	changeblock $E, $4, $45
	changeblock $10, $2, $52
	changeblock $10, $4, $53
	changeblock $12, $2, $50
	changeblock $12, $4, $51
	changeblock $14, $2, $4E
	changeblock $14, $4, $4F
	changeblock $16, $2, $4E
	changeblock $16, $4, $4F
	changeblock $18, $2, $4D
	changeblock $1A, $2, $4D
	changeblock $1C, $2, $4D
	changeblock $1E, $2, $4D
	changeblock $20, $2, $4D
	changeblock $22, $2, $4D
	changeblock $24, $2, $4D
	changeblock $26, $2, $4D	
	changeblock $28, $2, $4E
	changeblock $28, $4, $4F	
	changeblock $2A, $2, $4E
	changeblock $2A, $4, $4F
	changeblock $2C, $2, $50
	changeblock $2C, $4, $51
	changeblock $2E, $2, $52
	changeblock $2E, $4, $53
	changeblock $30, $4, $46
	changeblock $30, $6, $4A
	changeblock $32, $6, $4B
	changeblock $32, $4, $47
	
	changeblock $1C, $4, $23 ;battle arena at top of map
	changeblock $1C, $6, $22
	changeblock $20, $4, $23
	changeblock $20, $6, $22
	
	changeblock $1E, $12, $8B ; palmtrees
	changeblock $26, $12, $8B
	changeblock $14, $14, $12
	changeblock $C, $18, $12
	changeblock $E, $1A, $12
	changeblock $C, $1C, $12
	changeblock $C, $22, $12
	changeblock $A, $26, $12
	changeblock $C, $26, $12
	changeblock $8, $28, $12
	changeblock $A, $28, $12
	changeblock $C, $28, $12
	changeblock $8, $2A, $12
	changeblock $A, $2A, $12
	changeblock $16, $2A, $12
	changeblock $18, $28, $12
	changeblock $1E, $26, $12
	changeblock $20, $26, $12
	changeblock $26, $28, $12
	changeblock $28, $2A, $12
	changeblock $32, $26, $12
	changeblock $34, $26, $12
	changeblock $32, $28, $12
	changeblock $34, $28, $12
	changeblock $36, $28, $12
	changeblock $34, $2A, $12
	changeblock $36, $2A, $12
	changeblock $34, $1E, $12
	changeblock $32, $1C, $12
	changeblock $30, $1A, $12
	changeblock $2E, $18, $12
	changeblock $2C, $18, $12
	changeblock $22, $1A, $8B
	changeblock $20, $1A, $8B
	
	changeblock $E, $26, $40 ; flowers
	changeblock $E, $28, $40
	changeblock $C, $2A, $40
	changeblock $E, $2A, $40
	changeblock $10, $2C, $40
	changeblock $A, $2C, $40
	changeblock $C, $2C, $40
	changeblock $E, $2C, $40
	changeblock $C, $2E, $40
	changeblock $E, $2E, $40
	changeblock $10, $2E, $40
	changeblock $16, $2C, $40
	changeblock $18, $2A, $40
	changeblock $1A, $28, $40
	changeblock $1C, $28, $40
	changeblock $1E, $28, $40
	changeblock $20, $28, $40
	changeblock $22, $28, $40
	changeblock $24, $28, $40
	changeblock $26, $2A, $40
	changeblock $28, $2C, $40
	changeblock $30, $26, $40
	changeblock $30, $28, $40
	changeblock $30, $2A, $40
	changeblock $32, $2A, $40
	changeblock $2E, $2C, $40
	changeblock $30, $2C, $40
	changeblock $32, $2C, $40
	changeblock $34, $2C, $40
	changeblock $2E, $2E, $40
	changeblock $30, $2E, $40
	changeblock $32, $2E, $40
.Done:
	return

	

BlueFirstScript:
	faceplayer
	opentext
	writetext BluePt1Text
	waitbutton
	closetext
	turnobject RI_BLUE1, UP
	opentext
	writetext BluePt2Text
	waitbutton
	closetext
	faceplayer
	opentext
	writetext BluePt3Text
	waitbutton
	closetext
	special FadeOutPalettes
	disappear RI_BLUE1
	pause 10
	special LoadMapPalettes
	special FadeInPalettes
	;event setting here
	clearevent EVENT_RAINBOW_ISLE_CAVE_BLUE_HIDDEN
	setevent EVENT_RAINBOW_ISLE_BLUE_INTRO_HIDDEN
	end

BluePt1Text:
	text "Hey! <PLAY_G>!"
	line "Ich bin über-"
	cont "rascht, dich hier"
	cont "auf der REGENBO-"
	cont "GENINSEL zu sehen!"

	para "Ich bin hierher"
	line "gekommen, um die"
	cont "#MON hier zu"
	cont "erforschen, aber"
	cont "etwas Anderes hat"
	cont "mich neugierig"
    cont "gemacht…"
	done

BluePt2Text:
    text "Sieh dir diese"
    line "Palmen und das"
    cont "Gras an, sie sind"
    cont "total braun!"

    para "Alten Geschichten"
    line "und Legenden über"
    cont "diese Insel zu-"
    cont "folge, war sie"
    cont "einst ein unglaub-"
    cont "lich farbenfroher"
    cont "Ort…"

    para "Aber jetzt sieht"
    line "es so aus? Was ist"
    cont "hier passiert?"
	done

BluePt3Text:
    text "Ich habe also"
    line "nachgeforscht und"
    cont "ich glaube, ich"
    cont "habe eine Theorie!"

    para "Obwohl…"
    line "Es wäre schon sehr"
    cont "weit hergeholt,"
    cont "muss ich zugeben."

    para "Triff mich in der"
    line "Höhle nordöstlich"
    cont "der Insel und ich"
    cont "werde dir mehr"
    cont "erklären!"

    para "Du wirst KASKADE"
    line "brauchen, um dort"
    cont "hin zu gelangen!"
	done

BlueBattleScript:
	faceplayer
	checkevent EVENT_BEAT_BLUE_ONCE_BEFORE
	iftrue .bluerematch
	opentext
	writetext BlueCommendsText
	waitbutton
	closetext
	special FadeOutMusic
	opentext
	writetext BlueFirstChallengeText
	waitbutton ; added this just now
	winlosstext BlueFirstWinText, 0
	loadtrainer BLUE, BLUE1
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	special FadeOutMusic
	opentext
	writetext BlueFirstAfterText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear RI_BLUE2
	setevent EVENT_BEAT_BLUE_ONCE_BEFORE
	setevent EVENT_RAINBOW_ISLE_BLUE_BATTLE_HIDDEN
	pause 15
	special FadeInQuickly
	pause 30
	special HealParty
	checkevent EVENT_PACKAGE_TAKEN_NO_SHOW
	iffalse .skipPackages1 ; if package is sitting there unopened
	checkevent EVENT_TAKEN_GOLD_TROPHY
	iftrue .skipPackages1
	setevent EVENT_GOLD_TROPHY_IN_PACKAGE
	clearevent EVENT_PACKAGE_TAKEN_NO_SHOW
.skipPackages1:
	refreshscreen
	credits
	end
	
.bluerematch
	opentext
	writetext BlueSecondChallengeText
	waitbutton
	winlosstext BlueSecondWinText, 0
	loadtrainer BLUE, BLUE1
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	special FadeOutMusic
	opentext
	writetext BlueSecondAfterText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear RI_BLUE2
	setevent EVENT_RAINBOW_ISLE_BLUE_BATTLE_HIDDEN
	pause 15
	special FadeInQuickly
	pause 30
	special HealParty
	checkevent EVENT_PACKAGE_TAKEN_NO_SHOW
	iffalse .skipPackages2 ; if package is sitting there unopened
	checkevent EVENT_TAKEN_GOLD_TROPHY
	iftrue .skipPackages2
	setevent EVENT_GOLD_TROPHY_IN_PACKAGE
	clearevent EVENT_PACKAGE_TAKEN_NO_SHOW
.skipPackages2:
	refreshscreen
	credits
	end


BlueCommendsText:
    text "Das ist einfach"
    line "unglaublich…"

    para "<PLAY_G>, du hast"
    line "wirklich ein"
    cont "Talent dafür, das"
    cont "Unmögliche möglich"
    cont "zu machen!"

    para "Du bist seit dem"
    line "Tag, an dem Opa"
    cont "und ich dich aus"
    cont "SILENITIA entsandt"
    cont "haben, als Trainer"
    cont "so sehr gewachsen…"

    para "Aber das hier MUSS"
    line "das wohl unfass-"
    cont "barste sein, was"
    cont "ich jemals gesehen"
    cont "habe!"

    para "Es war mir eine"
    line "Ehre, dich auf"
    cont "deinem Weg zu"
    cont "begleiten."
	done

BlueFirstChallengeText:
	text "Wenn ich dir eine"
	line "Belohnung für so"
    cont "eine Gelegenheit"
    cont "geben würde…"

    para "Tja… Es gibt"
    line "nur eine Sache,"
    para "die du dir wohl"
    line "wünschen könntest!"
	
	para "<PLAY_G>!"
	
    para "Als ehemaliger"
    line "CHAMP der #MON"
    para "LIGA, fordere ich"
    line "dich heraus!"
	done
	
BlueFirstWinText:
    text "Es ist vorbei!"

    para "Das war wirklich"
    line "ein Kampf für die"
    cont "Geschichtsbücher!"
	done

BlueFirstAfterText:
	text "Puh…"

	para "So ins Schwitzen"
	line "gebracht wurde ich"
	para "das zuletzt, als"
    line "ich gegen meinen"
    para "alten Kumpel am"
    line "INDIGO PLATEAU"
    cont "gekämpft habe!"

    para "Mann… Das fühlt"
    line "sich an, als wäre"
    cont "es erst gestern"
    cont "gewesen…"

    para "Naja! Ich denke,"
    line "es ist Zeit für"
    para "mich, meine For-"
    line "schungsreise zu"
    cont "beenden."

    para "Was für eine Zeit"
    line "das doch war!"

    para "<PLAY_G>! Wir…"

    para "Ciao!"
	done


BlueSecondChallengeText:
	text "Hey, <PLAY_G>!"

	para "Zurück für eine"
	line "zweite Runde, was?"

	para "Denk nur nicht,"
	line "ich würde mich"
	cont "zurückhalten."

	para "Du hast mich"
	cont "immerhin schon"
	cont "einmal geschlagen!"

	para "Los geht's!"
	done


BlueSecondAfterText:
    text "Puh! Ich muss wohl"
    line "noch ein Bisschen"
    cont "mehr trainieren!"

    para "Also, bis dann."
    line "Wir sehen uns!"
	done


BlueSecondWinText:
    text "Mit dir ist nicht"
    line "zu spaßen!"

    para "Hör nicht auf,"
    line "stärker zu werden!"
	done


RainbowIsland_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 49, 15, RAINBOW_ISLAND_CAVE, 1

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event 32, 42, SPRITE_BLUE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BlueFirstScript, EVENT_RAINBOW_ISLE_BLUE_INTRO_HIDDEN ; one
	object_event 31,  5, SPRITE_BLUE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BlueBattleScript, EVENT_RAINBOW_ISLE_BLUE_BATTLE_HIDDEN ; two
	