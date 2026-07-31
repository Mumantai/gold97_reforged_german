	const_def 2 ; object constants
	const ROUTE30BERRYHOUSE_POKEFAN_M

Route104GardenersHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route104GardenersHousePokefanMScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_BERRY_FROM_ROUTE_30_HOUSE
	iftrue .GotBerry
	writetext Route30BerrySpeechHouseMonEatBerriesText
	buttonsound
	verbosegiveitem PSNCUREBERRY
	iffalse .NoRoom
	setevent EVENT_GOT_BERRY_FROM_ROUTE_30_HOUSE
.GotBerry:
	writetext Route30BerrySpeechHouseCheckTreesText
	waitbutton
.NoRoom:
	closetext
	end

Route104GardenersHouseBookshelf:
	jumpstd magazinebookshelf

Route30BerrySpeechHouseMonEatBerriesText:
    text "Weißt du, ich mag"
    line "es wirklich, mich"
    para "um meinen Garten"
    line "zu kümmern."

    para "Diese Gegend ist"
    line "so trocken."

    para "Ich arbeite echt"
    line "hart, damit meine"
    cont "Pflanzen wachsen."

    para "Zuletzt ist es mir"
    line "sogar gelungen,"
    para "BEEREN an einem"
    line "Obstbaum wachsen"
    cont "zu lassen."

    para "Hier, ich teile"
    line "mit dir!"
	done

Route30BerrySpeechHouseCheckTreesText:
    text "Vielleicht schaffe"
    line "ich es eines Tages"
    para "sogar, zwei Bäume"
    line "wachsen zu lassen."
	done

Route104GardenersHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, ROUTE_104, 1
	warp_event  5,  7, ROUTE_104, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  0, BGEVENT_READ, Route104GardenersHouseBookshelf
	bg_event  1,  0, BGEVENT_READ, Route104GardenersHouseBookshelf

	db 1 ; object events
	object_event  4,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route104GardenersHousePokefanMScript, EVENT_GEOFFREY_GONE_TO_DAITO
