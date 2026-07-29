	const_def 2 ; object constants
	const SLOWPOKE_WELL_B1F_SILVER


SlowpokeWellB1F_MapScripts:
	db 2 ; scene scripts
	scene_script .SceneSlowpoke1RivalDummy ; SCENE_DEFAULT
	scene_script .SceneSlowpoke1Nothing ;

	db 0 ; callbacks

.SceneSlowpoke1RivalDummy:
	priorityjump .SceneSlowpoke1Rival
	end

.SceneSlowpoke1Rival:
	showemote EMOTE_SHOCK, SLOWPOKE_WELL_B1F_SILVER, 15
	special FadeOutMusic
	pause 15
	turnobject SLOWPOKE_WELL_B1F_SILVER, DOWN
	pause 15
	applymovement PLAYER, WellPlayerWalksToSilver
	applymovement SLOWPOKE_WELL_B1F_SILVER, WellSilverWalksToPlayer
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext BurnedTowerSilver_BeforeText
	waitbutton
	closetext
	checkevent EVENT_GOT_CRUIZE_FROM_OAK
	iftrue .cruise
	checkevent EVENT_GOT_CHIKORITA_FROM_OAK
	iftrue .CHIKORITA
	winlosstext BurnedTowerSilver_WinText, BurnedTowerSilver_LossText
	;setlasttalked SLOWPOKE_WELL_B1F_SILVER
	loadtrainer RIVAL1, RIVAL1_3_CRUIZE
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .returnfrombattle

.cruise
	winlosstext BurnedTowerSilver_WinText, BurnedTowerSilver_LossText
	;setlasttalked SLOWPOKE_WELL_B1F_SILVER
	loadtrainer RIVAL1, RIVAL1_3_CHIKORITA
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .returnfrombattle

.CHIKORITA
	winlosstext BurnedTowerSilver_WinText, BurnedTowerSilver_LossText
	;setlasttalked SLOWPOKE_WELL_B1F_SILVER
	loadtrainer RIVAL1, RIVAL1_3_FLAMBEAR
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .returnfrombattle

.returnfrombattle
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext BurnedTowerSilver_AfterText1
	waitbutton
	closetext
	applymovement SLOWPOKE_WELL_B1F_SILVER, WellSilverWalksToRoom2
	playsound SFX_EXIT_BUILDING
	disappear SLOWPOKE_WELL_B1F_SILVER
	setscene SCENE_SLOWPOKE1_NOTHING
	setevent EVENT_GOT_SQUIRTBOTTLE
	setevent EVENT_EXPLODING_TRAP_21
	special HealParty
	special FadeOutMusic
	waitsfx
	playmapmusic
	pause 15
	end
	


.SceneSlowpoke1Nothing
	end
	
WellPlayerWalksToSilver:
	step UP
	step UP
	step_end
	
WellSilverWalksToPlayer:
	step RIGHT
	turn_head DOWN
	step_end
	
WellSilverWalksToRoom2:
	step UP
	step UP
	step UP
	step_end

SlowpokeWellB1FSilverScript:
	end
;<……>
BurnedTowerSilver_BeforeText:
	text "<PLAY_G>!"

    para "PROF. EICH und"
    line "BLAU warten weiter"
    cont "unten im Brunnen"
    cont "auf uns."

    para "Aber ich wollte"
    line "hier warten, weil"
    cont "ich wusste, dass"
    cont "du bald auftauchen"
    cont "würdest!"

    para "Mein Team ist seit"
    line "unserem letzten"
    cont "Treffen so viel"
    cont "stärker geworden."

    para "Hier! Lass es mich"
    line "dir zeigen!"
	done

BurnedTowerSilver_WinText:
    text "Huh."

    para "Ich habe mein Team"
    line "bis aufs Äußerste"
    cont "trainiert und doch"
    cont "habe ich verloren…"
	done
BurnedTowerSilver_AfterText1:
    text "Ach, egal."

    para "Dann muss ich sie"
    line "eben noch härter"
    cont "trainieren als"
    cont "bisher!"

    para "Komm, wir sollten"
    line "besser weiter und"
    cont "uns mit den"
    cont "anderen treffen!"
	done

BurnedTowerSilver_LossText:
	text "Ja!"

	para "Ich bin der Beste!"
	done

BurnedTowerSilver_AfterText2:
	text "Humpf!"

	para "Was hast du dir"
	line "dabei gedacht,"

	para "einfach in ein"
	line "Loch zu fallen?"
	cont "Du Genie!"

	para "Das geschieht dir"
	line "recht!"
	done
	
Text_RivalGreets:
	text "Yo."
	done


SlowpokeWellB1F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  9, 11, BIRDON_TOWN, 6
	warp_event  9,  1, SLOWPOKE_WELL_B2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  8,  8, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SlowpokeWellB1FSilverScript, EVENT_GOT_SQUIRTBOTTLE

