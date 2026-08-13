	const_def 2
	const RIC_HO_OH
	const RIC_LUGIA
	const RIC_BLUE

RainbowIslandCave_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene ; SCENE_DEFAULT

	db 0 ; callbacks

.DummyScene:
	end


BlueScriptRIC:
	faceplayer
	checkevent EVENT_RAINBOW_ISLE_CAVE_BLUE_TOLD_LEGEND
	iftrue .secondpart
	opentext
	writetext BlueTellsLegendText
	waitbutton
	closetext
	setevent EVENT_RAINBOW_ISLE_CAVE_BLUE_TOLD_LEGEND
.secondpart
	opentext
	writetext BlueTellsYouToGoThereText
	waitbutton
	closetext
	end

StandingOnStartTile:
	checkevent EVENT_RAINBOW_ISLE_RESTORED
	iftrue .end
	checkevent EVENT_RAINBOW_ISLE_CAVE_BLUE_TOLD_LEGEND
	iffalse .end
	turnobject RIC_BLUE, LEFT
	writebyte HO_OH
	special FindPartyMonThatSpecies
	iffalse .notinparty
	writebyte LUGIA
	special FindPartyMonThatSpecies
	iffalse .notinparty
	
	opentext ; at this point it's confirmed you've got both and the event is a go
	writetext BlueHaveThemBothText
	waitbutton
	closetext
	playmusic MUSIC_NONE
	special FadeOutPalettes
	appear RIC_HO_OH
	appear RIC_LUGIA
	playsound SFX_BALL_POOF
	pause 10
	cry HO_OH
	pause 10
	playsound SFX_BALL_POOF
	pause 10
	cry LUGIA
	special LoadMapPalettes
	special FadeInPalettes
	pause 20
	playmusic MUSIC_GS_OPENING_2
	turnobject PLAYER, UP
	turnobject RIC_BLUE, UP
	follow RIC_HO_OH, RIC_LUGIA
	applymovement RIC_HO_OH, LegendsDanceStep1
	playsound SFX_RAIN_DANCE
	pause 20
	applymovement RIC_HO_OH, LegendsDanceStep2
	playsound SFX_EMBER
	pause 20
	applymovement RIC_HO_OH, LegendsDanceStep3
	playsound SFX_RAIN_DANCE
	pause 20
	applymovement RIC_HO_OH, LegendsDanceStep4
	playsound SFX_EMBER
	pause 20
	special FadeOutPalettes
	special LoadMapPalettes
	special FadeInPalettes
	applymovement RIC_HO_OH, LegendsDanceStep5
	stopfollow
	applymovement RIC_LUGIA, LegendsDanceStep6
	follow RIC_HO_OH, RIC_LUGIA
	applymovement RIC_HO_OH, LegendsDanceStep7
	special FadeOutPalettes
	special LoadMapPalettes
	special FadeInPalettes
	playsound SFX_SHINE
	stopfollow
	pause 25
	special FadeOutPalettes
	disappear RIC_HO_OH
	disappear RIC_LUGIA
	pause 10
	playsound SFX_BALL_POOF
	pause 10
	playsound SFX_BALL_POOF
	special LoadMapPalettes
	special FadeInPalettes
	
	setevent EVENT_RAINBOW_ISLE_CAVE_OBJECTS_HIDDEN
	setevent EVENT_RAINBOW_ISLE_RESTORED
	clearevent EVENT_RAINBOW_ISLE_BLUE_BATTLE_HIDDEN
	
	turnobject RIC_BLUE, LEFT
	turnobject PLAYER, RIGHT
	opentext
	writetext BlueAfterEventText
	waitbutton
	closetext
	special FadeOutPalettes
	pause 16
	warpsound
	disappear RIC_BLUE
	setevent EVENT_RAINBOW_ISLE_CAVE_BLUE_HIDDEN
	special LoadMapPalettes
	special FadeInPalettes
.end
	end

.notinparty
	opentext
	writetext BlueDontHaveMonsText
	waitbutton
	closetext
	turnobject RIC_BLUE, UP
	end


LegendsDanceStep1:
	step DOWN
	jump_step DOWN
	step_end

LegendsDanceStep2:
	jump_step RIGHT
	step_end

LegendsDanceStep3:
	step UP
	jump_step UP
	step_end

LegendsDanceStep4:
	jump_step LEFT
	step_end

LegendsDanceStep5:
	step DOWN
	jump_step DOWN
	step_end

LegendsDanceStep6:
	step DOWN
	step_end

LegendsDanceStep7:
	step RIGHT
	step_end


BlueAfterEventText:
    text "Schnell!"
    line "Nach draußen!"

    para "Triff mich im"
    line "Norden der Insel!"
	done

BlueDontHaveMonsText:
    text "Wenn du beide"
    line "LEGENDÄREN #MON"
    cont "irgendwie hier"
    cont "hingestellt"
    cont "bekommen würdest!"
	done

BlueHaveThemBothText:
    text "Was?! Du hast echt"
    line "HO-OH und LUGIA"
    cont "gefangen?!"

    para "Das ist der"
    line "Wahnsinn!"

    para "Alles klar! Lass"
    line "sie raus, dann"
    cont "geht's los!"
	done

BlueTellsLegendText:
    text "Super, du hast es"
    line "hierher geschafft!"

    para "Also, das habe ich"
    line "herausgefunden…"

    para "Diese Insel war"
    line "einst Heimat eines"
    cont "Volkes, das hier"
    cont "ein Ritual durch-"
    cont "führte, um zwei"
    cont "LEGENDÄRE #MON"
    cont "herbeizurufen!"

    para "In den Schriften"
    line "heißt es, dass die"
    cont "Regenbögen, die"
    cont "sich über die"
    cont "Insel erstreckten,"
    cont "entstanden, als"
    cont "LUGIAs Regen von"
    cont "HO-OHs LÄUTERFEUER"
    cont "geklärt wurde!"

    para "Was die Schriften"
    line "nicht enthielten,"
    cont "war eine Beschrei-"
    cont "bung, des Rituals."

    para "Ich weiß also"
    line "nicht, wie man"
    cont "HO-OH und LUGIA"
    cont "hierher bekommt."
	done
	
BlueTellsYouToGoThereText:
    text "Das mag jetzt viel"
    line "verlangt sein,"
    cont "aber solltest du"
    cont "es schaffen, HO-OH"
    cont "und LUGIA hierher"
    cont "zu bringen, können"
    cont "wir diese Insel"
    cont "vielleicht wieder"
    cont "herstellen!"

    para "Stell dich auf die"
    line "andere Seite des"
    cont "Wasserfalls, wenn"
    cont "du sie beide"
    cont "gefangen hast!"
	done



RainbowIslandCave_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  8, 17, RAINBOW_ISLAND, 1

	db 1 ; coord events
	coord_event  6,  6, SCENE_DEFAULT, StandingOnStartTile

	db 0 ; bg events

	db 3 ; object events
	object_event  7,  2, SPRITE_HO_OH, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0,ObjectEvent, EVENT_RAINBOW_ISLE_CAVE_OBJECTS_HIDDEN
	object_event  7,  2, SPRITE_LUGIA, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RAINBOW_ISLE_CAVE_OBJECTS_HIDDEN
	object_event  9,  6, SPRITE_BLUE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BlueScriptRIC, EVENT_RAINBOW_ISLE_CAVE_BLUE_HIDDEN
	