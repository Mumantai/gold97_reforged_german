	const_def 2 ; object constants
	const RADIOTOWER6F_TEACHER
	const RADIOTOWER6F_GENTLEMAN
	const RADIOTOWER6F_CLEFABLE
	const RADIOTOWER6F_CLEFABLE_SCARED
	const RADIOTOWER6F_GIOVANNI
	const RADIOTOWER6F_EXECUTIVE

RadioTower6F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
RadioTower6fClefable:	
	faceplayer
	opentext
	writetext RadioTower6FClefableText
	cry CLEFABLE
	waitbutton
	closetext
	end
	
RadioTower6fClefableTakeover:
	faceplayer
	opentext
	writetext RadioTower6FClefableText
	cry CLEFABLE
	waitbutton
	closetext
	end

RadioTower6fGentleman:
	faceplayer
	opentext
	writetext RadioTower6fGentlemanText
	waitbutton
	closetext
	end
	

RadioTower6fTeacher:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .MidRocketTakeover6fTeacher
	writetext RadioTower6fTeacherText
	waitbutton
	closetext
	end
.MidRocketTakeover6fTeacher
	writetext RadioTower6fTeacherTextTakeover
	waitbutton
	closetext
	end
	
RadioTower6FDirectorsOfficeSign:
	jumptext RadioTower6FDirectorsOfficeSignText
	
RadioTower6fGiovanni:
	end
	

TrainerExecutive6F:
	trainer EXECUTIVEM, EXECUTIVEM_3, EVENT_BEAT_ROCKET_EXECUTIVEM_3, Executive6FSeenText, Executive6FBeatenText, 0, .Script

.Script:
	opentext
	writetext Executive6FAfterBattleText
	waitbutton
	closetext
	end
	
GiovanniEncounter:
	special FadeOutMusic
	applymovement PLAYER, TwoStepsToGiovanni
	pause 15
	opentext
	writetext GiovanniGreeting
	waitbutton
	closetext
	applymovement RADIOTOWER6F_GIOVANNI, GiovanniToPlayer
	opentext
	writetext GiovanniSpeech
	waitbutton
	closetext
	winlosstext GiovanniWinText, GiovanniLossText
	loadtrainer BOSS, GIOVANNI1
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	turnobject RADIOTOWER6F_GIOVANNI, DOWN
	opentext
	writetext GiovanniAfterText
	waitbutton
	closetext
	applymovement RADIOTOWER6F_GIOVANNI, GiovanniLeaving
	turnobject PLAYER, UP
	opentext
	writetext GiovanniExitingText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear RADIOTOWER6F_GIOVANNI
	disappear RADIOTOWER6F_EXECUTIVE
	pause 15
	special FadeInQuickly
	pause 30
	setevent EVENT_CLEARED_RADIO_TOWER
	clearflag ENGINE_ROCKETS_IN_RADIO_TOWER
	setevent EVENT_GOLDENROD_CITY_ROCKET_TAKEOVER
	setevent EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	clearevent EVENT_GOLDENROD_CITY_CIVILIANS
	clearevent EVENT_RADIO_TOWER_CIVILIANS_AFTER
	setevent EVENT_TEAM_ROCKET_DISBANDED
	clearevent EVENT_STAND_CITY_ZOO_MONS_GONE
	special PlayMapMusic
	moveobject RADIOTOWER6F_GENTLEMAN, 3, 2
	appear RADIOTOWER6F_GENTLEMAN
	applymovement RADIOTOWER6F_GENTLEMAN, DirectorWalks
	showemote EMOTE_SHOCK, RADIOTOWER6F_GENTLEMAN, 15
	applymovement RADIOTOWER6F_GENTLEMAN, DirectorWalks2
	applymovement PLAYER, PlayerWalksToDirector
	opentext
	writetext DirectorThanksText
	buttonsound
	verbosegiveitem HM_ROCK_SMASH
	setevent EVENT_GOT_TM08_ROCK_SMASH
	writetext DirectorThanksText2
	waitbutton
	closetext
	setscene SCENE_RADIOTOWER6F_NOTHING; this scene is also set when you meet silver right at the beginning, then re set as part of the jump to radiotowerrockets
	setmapscene WESTPORT_CITY, SCENE_GOLDENROD_CITY_RIVAL
	end
	
TwoStepsToGiovanni:
	step DOWN
	step DOWN
	step DOWN
	turn_head RIGHT
	step_end
	
GiovanniToPlayer:
	step UP
	step LEFT
	step LEFT
	step DOWN
	turn_head LEFT
	step_end
	
GiovanniLeaving:
	step UP
	step LEFT
	step UP
	turn_head DOWN
	step_end
	
DirectorWalks:
	step DOWN
	step DOWN
	step_end
	
DirectorWalks2:
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step DOWN
	turn_head LEFT
	step_end
	
PlayerWalksToDirector:
	step RIGHT
	step_end
	
DirectorThanksText:
    text "Oh je!"

    para "Wo sind all die"
    line "fiesen TEAM ROCKET"
    cont "Rüpel hin?"

    para "Ich wurde hier im"
    line "Keller gefangen"
    cont "gehalten…"

    para "aber plötzlich"
    line "sind diese Rüpel"
    cont "abgehauen!"

    para "Mein armes PIXI"
    line "wurde ganz allein"
    cont "zurückgelassen!"

	para "Ich möchte mich"
	line "dir erkenntlich"
    cont "zeigen!"

    para "Hier, nimm das!"
	done
	
DirectorThanksText2:
	text "Diese Attacke"
	line "ermöglicht deinen"
	cont "#MON Felsen zu"
	cont "zertrümmern, die"
	cont "die dir den Weg"
	cont "versperren."

	para "Sie ist dir sicher"
	line "von größerem"
	cont "Nutzen als mir!"

	para "Ich werde dieses"
	line "Büro sicher nie"
	cont "wieder verlassen!"
	done
	
GiovanniWinText:
	text "Nein! Nicht"
	line "schon wieder!"

	para "Meine Pläne…"

	para "Meine Mühen…"

	para "War das alles"
	line "umsonst!?"
	done
	
GiovanniLossText:
	text "Heh."
	done
	
GiovanniGreeting:
	text "Ah."

	para "Ich nehme an, du"
	line "bist eins der"
	cont "beiden Kinder, von"
	cont "denen ich ständig"
	cont "hören muss."
	done
	
GiovanniSpeech:	
	text "Du musst sehr"
	line "tapfer sein…"
	
	para "…oder sehr"
	line "dumm."
	
	para "Ich bin der Boss"
	line "von TEAM ROCKET."
	
	para "Ich musste viel"
	line "ertragen, um meine"
	cont "Organisation zu"
	cont "altem Ruhm zu"
	cont "verhelfen."
	
	para "Du erinnerst mich"
	line "an ein anderes"
	cont "Kind, das mir"
	cont "einst gegenüber-"
	cont "stand."

	para "…"
	
	para "Es macht mich"
	line "wirklich wütend."

	para "Ich weiß ganz"
	line "genau, was deine"
	cont "fehlgeleiteten"
	cont "Absichten sind."
	
	para "Du willst meinen"
	line "Plan durchkreuzen."
	
	para "Das werde ich"
	line "nicht zulassen."
	
	para "Nicht noch einmal!"
	
	para "Ich, GIOVANNI, der"
	line "mächtige BOSS von"
	cont "TEAM ROCKET, werde"
	cont "dich vernichten!"
	done
	
GiovanniAfterText:
    text "D-das kann nicht"
    line "wahr sein!"

    para "Ich habe versagt…"

    para "schon WIEDER!"

    para "Zweimal habe ich"
    line "versucht, die Welt"
    cont "zu erobern…"

    para "Zweimal habe ich"
    line "versagt…"

    para "Und beide Male von"
    line "einer kleinen Göre"
    cont "entthront!"

    para "Wie soll ich so"
    line "meinen Anhängern"
    cont "gegenübertreten?"
	done
	
GiovanniExitingText:
	text "Nun gut…"

	para "Du hast mich"
	line "geschlagen."

	para "TEAM ROCKET ist"
	line "aber noch nicht"
	cont "am Ende…"

	para "Eines Tages werden"
	line "wir zurückkehren."

	para "Und meine Pläne"
	line "werden gelingen."

	para "Und bis dieser Tag"
	line "kommt…"

	para "Du solltest für"
	line "unser nächstes"
    cont "Aufeinandertreffen"
    cont "vorbereitet sein!"
	done
	
Executive6FSeenText:
	text "VORSTAND: Nein!"

	para "Keinen Schritt"
	line "weiter!"

	para "Gören wie du"
	line "verdienen keine"
	cont "Audienz bei"
	cont "unserem Boss!"

	para "Hier endet es"
	line "für dich!"
	done
	
Executive6FBeatenText:
	text "Nein!"

	para "GIOVANNI,"
	line "vergib mir!"
	done
	
Executive6FAfterBattleText:
	text "…"

	para "Ich habe keinen"
	line "Zorn mehr über."

	para "Wenn du GIOVANNI"
	line "sehen willst,"
	cont "er ist direkt"
	cont "dort drüben."
	done
	
RadioTower6FDirectorsOfficeSignText:
	text "5S BÜRO DES"
	line "   INTENDANTEN"
	done
	
RadioTower6FClefableText:
	text "PIXI: Pix-pixi!"
	done

RadioTower6fTeacherText:
	text "Das ist das Büro"
	line "des INTENDANTEN,"
	cont "der hier alles"
	cont "leitet!"
	done
	
RadioTower6fTeacherTextTakeover:
	text "Wo ist der"
	line "INTENDANT hin?"

	para "Hoffentlich geht"
	line "es ihm gut!"
	done

RadioTower6fGentlemanText:
	text "Ich gründete JOPM,"
	line "um meine Liebe für"
	cont "#MON mit der"
	cont "Welt zu teilen!"

	para "Ich hoffe, Mensch"
	line "und #MON"
	cont "haben Freude an"
	cont "unserem Programm."
	done

RadioTower6F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  7,  0, RADIO_TOWER_5F, 2

	db 1 ; coord events
	coord_event  3,  3, SCENE_DEFAULT, GiovanniEncounter

	db 1 ; bg events
	bg_event  3,  0, BGEVENT_READ, RadioTower6FDirectorsOfficeSign

	db 6 ; object events
	object_event  6,  2, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower6fTeacher, -1
	object_event  6,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RadioTower6fGentleman, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event  1,  6, SPRITE_FAIRY, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTower6fClefable, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event  0,  5, SPRITE_FAIRY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTower6fClefableTakeover, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  6,  6, SPRITE_GIOVANNI, SPRITEMOVEDATA_STANDING_LEFT, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTower6fGiovanni, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  2,  2, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerExecutive6F, EVENT_RADIO_TOWER_ROCKET_TAKEOVER

