	const_def 2 ; object constants
	const BRASSTOWER5F_SAGE1
	const BRASSTOWER5F_KURT
	const BRASSTOWER5F_CAPTAIN

BrassTower5F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .AddStairs

.AddStairs:
IF DEF(_GOLD)
	checkevent EVENT_HO_OH_STAIRS_APPEAR
	iffalse .DoneStairs
	changeblock   0,  5, $3C ; ladder
	
ELIF DEF(_SILVER)
	checkevent EVENT_REPAIRED_SHIP_FUEL_LINE
	iffalse .DoneStairs
	changeblock   0,  5, $3C ; ladder
ENDC

.DoneStairs:
	return

BrassTower5FSageScript:
	checkevent EVENT_FOUGHT_HO_OH
	iftrue .AfterHoOh
	checkevent EVENT_HO_OH_STAIRS_APPEAR
	iftrue .DuringHoOh
	setevent EVENT_GOT_5F_SAGE_BLESSING
	faceplayer
	opentext
	writetext Text_5FSage
	waitbutton
	closetext
	end
	
.AfterHoOh
	faceplayer
	opentext
	writetext Text_5FSageAfterHoOh
	waitbutton
	closetext
	end
	
.DuringHoOh
	faceplayer
	opentext
	writetext Text_5FSageDuringHoOh
	waitbutton
	closetext
	end
	
KurtScript:
	jumptext KurtKnewIt
	
CaptainScript:
	jumptext CaptainCantBelieve
	
HoOhEventSceneUp:
	applymovement PLAYER, PlayerWalksToHoOhGroup1
	jump HoOhEventMainScene
	end
	
HoOhEventSceneLeft:
	applymovement PLAYER, PlayerWalksToHoOhGroup2
	jump HoOhEventMainScene
	end
	
HoOhEventMainScene:
	showemote EMOTE_SHOCK, BRASSTOWER5F_KURT, 15
	opentext
	writetext KurtKnewIt
	waitbutton
	closetext
	showemote EMOTE_SHOCK, BRASSTOWER5F_CAPTAIN, 15
	opentext
	writetext CaptainCantBelieve
	waitbutton
	closetext
	applymovement BRASSTOWER5F_SAGE1, SageOneStepDown
	opentext
	writetext SageTellsYouToSeeBird
	waitbutton
	closetext
	setscene SCENE_DEFAULT
	end
	
SageOneStepDown:
	step DOWN
	step_end
	
PlayerWalksToHoOhGroup2:
	step LEFT
	step LEFT
	turn_head UP
	step_end
	
PlayerWalksToHoOhGroup1:
	step LEFT
	step LEFT
	step DOWN
	step LEFT
	turn_head UP
	step_end
	
KurtKnewIt:
    text "KURT: Ich wusste,"
    line "ich hatte Recht,"
    para "als ich etwas an"
    line "dir gespürt habe."
	done
	
CaptainCantBelieve:
    text "Ich kann es nicht"
    line "fassen!"

    para "Die Rückkehr des"
    line "Vogels!"

    para "Es geschieht!"
	done
	
SageTellsYouToSeeBird:
    text "<PLAY_G>."

    para "HO-OH nistet über"
    line "unseren Köpfen."

    para "Es ist tatsächlich"
    line "zurückgekehrt."

    para "Wie es die Legende"
    line "voraussagt."

    para "Ich spüre, dass es"
    line "dich treffen will."

    para "Es hat entschie"
    line "den, dass deine"
    para "Taten dich als"
    line "würdig erweisen,"
    para "ihm jetzt direkt"
    line "gegenüberzutreten."

    para "Nun begib dich"
    line "auf das Dach."
	done
	
Text_5FSageDuringHoOh:
	text "Der Vogel wartet."
	done

Text_5FSageAfterHoOh:
    text "Eine Begegnung"
    line "mit dem Vogel gilt"
    cont "als legendär."
	done
	
Text_5FSage:
    text "Willkommen auf"
    line "der Spitze des"
    cont "MESSINGTURMs."

    para "Dies ist ein ge-"
    line "weihter Ort, der"
    para "nur von denen"
    line "besucht werden"
    cont "sollte, die ihm"
    para "den angemessenen"
    line "Respekt erweisen."

    para "Ich verstehe, dass"
    line "FALK dich gebeten"
    para "hat, seine Ebenen"
    line "zu erklimmen."

    para "Ich hoffe, du"
    line "konntest lernen,"
    para "wie man #MON"
    line "den richtigen"
    para "Respekt entgegen-"
    line "bringt."

    para "Kehre jetzt zu"
    line "FALK zurück. Du"
    cont "hast meinen Segen."
	done

SproutTower5FSign:
	jumptext SproutTower5FSignText

	
SproutTower5FSignText:
    text "Eine Statue von"
    line "ABRA."

    para "ABRA sind sehr"
    line "schreckhaft und"
    para "fliehen schnell,"
    line "wenn man ihnen in"
    para "freier Wildbahn"
    line "begegnet."

    para "Ehre und respek-"
    line "tiere alle #MON"
    para "in ihrem natür-"
    line "lichen Lebensraum."
	done
	
SproutTower5FIncense:
	jumptext SproutTower5FIncenseText

SproutTower5FIncenseText:
	text "Was ist das?"

	para "Oh, das ist ein"
	line "Räucherstäbchen!"
	done

BrassTower5F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  5,  5, BRASS_TOWER_4F, 2
	warp_event  0,  5, BRASS_TOWER_ROOF, 1

	db 2 ; coord events
	coord_event  5,  4, SCENE_HO_OH_EVENT, HoOhEventSceneUp
	coord_event  4,  5, SCENE_HO_OH_EVENT, HoOhEventSceneLeft

	db 2 ; bg events
	bg_event 4, 1, BGEVENT_READ, SproutTower5FSign
	bg_event 3, 0, BGEVENT_READ, SproutTower5FIncense


	db 3 ; object events
	object_event  2,  3, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BrassTower5FSageScript, -1
	object_event  1,  3, SPRITE_KURT, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KurtScript, EVENT_BRASS_TOWER_ELDER_SAGE_GONE
	object_event  3,  3, SPRITE_CAPTAIN, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CaptainScript, EVENT_BRASS_TOWER_ELDER_SAGE_GONE
