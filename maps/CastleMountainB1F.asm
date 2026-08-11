	const_def 2
	const CM_B1F_EXEC
	const CM_B1F_DRAGONITE
	const CM_B1F_ITEMBALL1
	const CM_B1F_ITEMBALL2

CastleMountainB1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

DragoniteSteps:
	slow_step DOWN
	slow_step DOWN
	slow_step DOWN
	step_end


ArianaDungeonScript:
	faceplayer
	opentext
	writetext OuchFallText
	waitbutton
	closetext
	playsound SFX_RAGE
	pause 15
	special FadeOutMusic
	turnobject CM_B1F_EXEC, UP
	opentext
	writetext DidYouHearThatText
	waitbutton
	closetext
	turnobject PLAYER, UP
	playsound SFX_SURF
	pause 10
	appear CM_B1F_DRAGONITE
	applymovement CM_B1F_DRAGONITE, DragoniteSteps
	pause 10
	opentext
	writetext DragoniteCryText
	cry DRAGONITE
	pause 15
	closetext
	opentext
	writetext IThinkHesAngryText
	waitbutton
	writetext DragoniteCryText
	cry DRAGONITE
	pause 15
	loadwildmon DRAGONITE, 60
	writecode VAR_BATTLETYPE, BATTLETYPE_SHINY
	startbattle
	disappear CM_B1F_DRAGONITE
	reloadmapafterbattle
	turnobject CM_B1F_EXEC, RIGHT
	turnobject PLAYER, LEFT
	opentext
	writetext DontForgetTRText
	waitbutton
	closetext
	special FadeOutPalettes
	disappear CM_B1F_EXEC
	playsound SFX_ESCAPE_ROPE
	pause 10
	special LoadMapPalettes
	special FadeInPalettes
	setevent EVENT_CASTLE_B1F_SPRITES_NOT_SHOWN
	setevent EVENT_CASTLE_MTN_EVENTS_COMPLETE
	setevent EVENT_CM3A_NUGGET1
	setevent EVENT_CM3A_NUGGET2
	setevent EVENT_CM3A_NUGGET3
	setevent EVENT_CM3A_NUGGET4
	setevent EVENT_CM3A_NUGGET5
	setevent EVENT_CM3A_NUGGET6
	setevent EVENT_CM3A_NUGGET7
	setevent EVENT_CM3A_NUGGET8
	clearevent EVENT_DESERTER_ROCKET_GRUNT
	end
	
OuchFallText:
    text "Autsch…"
    para "Ich hätte besser"
    line "auf die Hebel für"
    cont "die Falltüren"
    cont "achten sollen…"

    para "Das ist alles nur"
    line "deine Schuld!"

    para "Hättest du nicht"
    line "unsere Mission im"
    cont "RADIOTURM sabo-"
    cont "tiert, dann müsste"
    cont "meine Einheit sich"
    cont "nicht in diesem"
    cont "Drecksloch hier"
    cont "verstecken!"
	done

DidYouHearThatText:
	text "…Hast du etwas"
	line "gehört?"
	done


DragoniteCryText:
	text "DRAGORAN: KYUUUU!"
	done

	
IThinkHesAngryText:
    text "Als ob! Die alte"
    line "Stadtlegende war"
    cont "wahr! Es ist der"
    cont "GRÜNE DRACHE!"

    para "U-und er sieht"
    line "echt wütend aus!"
	done

DontForgetTRText:
	text "Puh…"

	para "Denk nicht, dass"
	line "ich dir einfach so"
	cont "durchgehen lasse,"
    cont "was du hier getan"
    cont "hast!"

    para "Du hast die Wahr-"
    line "heit doch selber"
    cont "in der NIHON LIGA"
    cont "gesehen!"

    para "GIOVANNI ist noch"
    line "immer so mächtig,"
    cont "wie eh und je!"

    para "TEAM ROCKET hat"
    line "Agenten überall"
    cont "auf der Welt!"

    para "Wir kommen wieder!"
    line "Darauf kannst du"
    cont "Knirps dich aber"
    cont "verlassen!"
	done

CMB1Itemball1:
	itemball KINGS_ROCK
	
CMB1Itemball2:
	itemball ESCAPE_ROPE

CastleMountainB1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 25,  3, CASTLE_MOUNTAIN_1F_STAIRS, 5
	warp_event  4, 27, CASTLE_MOUNTAIN_3FB, 0
	warp_event 15,  7, CASTLE_MOUNTAIN_3FB, 0

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event 14,  7, SPRITE_ROCKET_EXECUTIVE_F, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ArianaDungeonScript, EVENT_CASTLE_B1F_SPRITES_NOT_SHOWN
	object_event 14,  2, SPRITE_DRAGON, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_CASTLE_DRAGONITE_NOT_SHOWN
	object_event 26, 23, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CMB1Itemball1, EVENT_CMB1_ITEMBALL1
	object_event 15, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CMB1Itemball2, EVENT_CMB1_ITEMBALL2
