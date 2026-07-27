	const_def 2 ; object constants
	const ROUTE35_YOUNGSTER1
	const ROUTE35_LASS2
	const ROUTE35_YOUNGSTER3
	const ROUTE35_SUPER_NERD
	const ROUTE35_FRUIT_TREE
	const ROUTE35_POKE_BALL
	const ROUTE35_FISHER
	const ROUTE35_SLOWPOKE1
	const ROUTE35_SLOWPOKE2

Route103_MapScripts:
	db 2 ; scene scripts
	scene_script .Scene35SlowpokeTail ; SCENE_DEFAULT
	scene_script .Scene35Nothing ;

	db 0 ; callbacks

.Scene35SlowpokeTail
	end

.Scene35Nothing
	end
	
Route103SlowpokeScript:
	opentext
	writetext Route103SlowpokeText1
	pause 60
	writetext Route103SlowpokeText2
	cry SLOWPOKE
	waitbutton
	closetext
	end
	
Route103SlowpokeGuyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_WHITNEY
	iftrue .slowpokegone
	writetext SlowpokeGuyText1
	waitbutton
	closetext
	end
	
.slowpokegone
	writetext SlowpokeGuyText2
	waitbutton
	closetext
	end

SlowpokeVendor:
	faceplayer
	turnobject PLAYER, UP
	opentext
	writetext Text_MillionDollarSlowpokeTail
	yesorno
	iffalse .scenerefused
	writetext Text_ThoughtKidsWereLoaded
	waitbutton
	closetext
	setscene SCENE_ROUTE_35_NOTHING
	end

.scenerefused
	writetext Text_RefusedToBuySlowpokeTail
	waitbutton
	closetext
	setscene SCENE_ROUTE_35_NOTHING
	end

TrainerBirdKeeperBryan:
	trainer BIRD_KEEPER, BRYAN, EVENT_BEAT_BIRD_KEEPER_BRYAN, BirdKeeperBryanSeenText, BirdKeeperBryanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperBryanAfterBattleText
	waitbutton
	closetext
	end

TrainerJugglerIrwin:
	trainer JUGGLER, IRWIN, EVENT_BEAT_JUGGLER_IRWIN, JugglerIrwin1SeenText, JugglerIrwin1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext JugglerIrwinAfterBattleText
	waitbutton
	closetext
	end

TrainerCamperIvan:
	trainer CAMPER, IVAN, EVENT_BEAT_CAMPER_IVAN, CamperIvanSeenText, CamperIvanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperIvanAfterBattleText
	waitbutton
	closetext
	end


TrainerPicnickerKim:
	trainer PICNICKER, KIM, EVENT_BEAT_PICNICKER_KIM, PicnickerKimSeenText, PicnickerKimBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerKimAfterBattleText
	waitbutton
	closetext
	end

Route103Sign:
	jumptext Route103SignText

Route103TMRollout:
	itemball TM_ROLLOUT
	
Route103SuperPotion:
	itemball SUPER_POTION

Route103FruitTree:
	fruittree FRUITTREE_ROUTE_103
	

SlowpokeTailSalesmanScript:
	faceplayer
	opentext
	writetext Text_MillionDollarSlowpokeTail
	yesorno
	iffalse .refused
	writetext Text_ThoughtKidsWereLoaded
	waitbutton
	closetext
	end

.refused
	writetext Text_RefusedToBuySlowpokeTail
	waitbutton
	closetext
	end
	

Text_MillionDollarSlowpokeTail:
	text "Wie möchtest du"
	line "die schmackhafte,"
	cont "gehaltvolle"
	cont "FLEGMONRUTE"
	cont "zubereitet haben?"

	para "Für dich jetzt nur"
	line "¥1,000,000!"

	para "Möchtest du sie?"
	done

Text_ThoughtKidsWereLoaded:
	text "Ts! Ich dachte,"
	line "die Kinder von"
	cont "heute wären"
	cont "stinkreich…"
	done

Text_RefusedToBuySlowpokeTail:
	text "Du möchtest sie"
	line "nicht? Dann mach"
	cont "dich vom Acker!"
	done

CamperIvanSeenText:
	text "Ich habe aus dem"
	line "Radio #MON-"
	cont "Daten erhalten."

	para "Ich glaube, ich"
	line "bin gut."
	done

CamperIvanBeatenText:
	text "Ich teile aus!"
	done

CamperIvanAfterBattleText:
	text "Die Musik aus dem"
	line "Radio beeinflusst"
	cont "die Stimmung von"
	cont "wilden #MON."
	done

PicnickerKimSeenText:
	text "Gehst du auch"
	line "zur PKMN-ARENA?"
	done

PicnickerKimBeatenText:
	text "Oh, ich habe"
	line "verloren…"
	done

PicnickerKimAfterBattleText:
	text "Die ORDEN"
	line "sind hübsch."
	cont "Deshalb sammle ich"
	cont "sie."
	done

BirdKeeperBryanSeenText:
	text "Welche Art von"
	line "#BALL"
	cont "benutzt du?"
	done

BirdKeeperBryanBeatenText:
	text "Mist! Nicht"
	line "schnell genug!"
	done

BirdKeeperBryanAfterBattleText:
	text "Manche #MON"
	line "rennen sofort weg."

	para "Versuche, sie mit"
	line "einem von KURTs
    cont "TURBOBÄLLEN"
	cont "einzufangen."

	para "Sie sind super für"
	cont "schnelle #MON."
	done

JugglerIrwin1SeenText:
	text "Siehe meine"
	line "Virtuosität, mit"
	cont "der ich die BÄLLE"
	cont "jongliere!"
	done

JugglerIrwin1BeatenText:
	text "Puh, das war ein"
	line "Ruck!"
	done

JugglerIrwinAfterBattleText:
	text "Ich wollte dich"
	line "mit meinen"

	para "prämierten #MON"
	line "fritzeln."

	para "Aber dein Können"
	line "elektrisierte"
	cont "mich!"
	done
	
Route103SlowpokeText1:
	text "FLEGMON: …"

	para "<……> <……> <……>"
	done

Route103SlowpokeText2:
	text "<……> <……>Gähn?"
	done

Route103SignText:
	text "ROUTE 103"
	para "PORT ABANISHI -"
	line "TOTOMONIA"
	done
	
SlowpokeGuyText1:
    text "Ja…"

    para "Diese FLEGMON"
    line "liegen hier immer"
    cont "herum."

    para "Es könnte 'ne"
    line "Weile dauern, bis"
    cont "die Straße wieder"
    cont "frei ist…"
	done
	
SlowpokeGuyText2:
    text "Sieht so aus, als"
    line "hätten die FLEGMON"
    cont "endlich das Weite"
    cont "gesucht."

    para "Du kannst jetzt"
    line "nach TOTOMONIA"
    cont "gehen, wenn du"
    cont "willst."
	done

Route103_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 12, 49, ROUTE_103_WESTPORT_GATE, 1
	warp_event 13, 49, ROUTE_103_WESTPORT_GATE, 2

	db 1 ; coord events
	coord_event  8, 14, SCENE_DEFAULT, SlowpokeVendor

	db 1 ; bg events
	bg_event  6, 44, BGEVENT_READ, Route103Sign

	db 11 ; object events
	object_event 11,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerCamperIvan, -1
	object_event  6, 23, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerPicnickerKim, -1
	object_event 10, 44, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperBryan, -1
	object_event  8, 37, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerJugglerIrwin, -1
	object_event 14, 31, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route103FruitTree, -1
	object_event 15, 30, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route103TMRollout, EVENT_ROUTE_35_TM_ROLLOUT
	object_event  8, 13, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SlowpokeTailSalesmanScript, EVENT_RIVAL_BURNED_TOWER
	object_event 10, 28, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route103SlowpokeScript, EVENT_BEAT_WHITNEY
	object_event 11, 28, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route103SlowpokeScript, EVENT_BEAT_WHITNEY
	object_event  8, 30, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route103SlowpokeGuyScript, -1
	object_event 15, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route103SuperPotion, EVENT_ROUTE_35_SUPER_POTION
