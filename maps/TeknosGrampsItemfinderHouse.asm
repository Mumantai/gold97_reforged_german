	const_def 2 ; object constants
	const HOUSE_GRAMPS
	const HOUSE_TWIN

TeknosGrampsItemfinderHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

EcruteakItemfinderGuy:
	faceplayer
	opentext
	checkevent EVENT_GOT_ITEMFINDER
	iftrue .itemfinder
	writetext EcruteakItemfinderAdventureText
	yesorno
	iffalse .no
	writetext EcruteakItemfinderTrueSpiritText
	buttonsound
	verbosegiveitem ITEMFINDER
	setevent EVENT_GOT_ITEMFINDER
.itemfinder:
	writetext ItemfinderExplanationText
	waitbutton
	closetext
	end

.no:
	writetext EcruteakItemfinderToEachHisOwnText
	waitbutton
	closetext
	end

EcruteakHistoryBook:
	faceplayer
	opentext
	writetext EcruteakHistoryBookText
	waitbutton
	closetext
	end


ItemFinderHouseRadio:
	jumpstd radio2

EcruteakItemfinderAdventureText:
    text "Ich kann dir nicht"
    line "genug danken, dass"
    cont "du meine Enkelin"
    cont "gefunden hast!"

    para "Sie muss in"
    line "Zukunft vorsich-"
    cont "tiger sein, aber"
    cont "jetzt bin ich nur"
    cont "froh, dass es ihr"
    cont "gut geht!"

    para "Du hast dich in"
    line "der MINE sehr gut"
    cont "geschlagen."

    para "Wenn man weiß,"
    line "wo man suchen"
    cont "muss, kann man in"
    cont "Höhlen wie dieser"
    cont "viele Schätze"
    cont "finden."

    para "Wenn du magst,"
    line "gebe ich dir"
    cont "etwas, das dir"
    cont "beim Suchen"
    cont "helfen wird."
	done

EcruteakItemfinderTrueSpiritText:
	text "Hier, bitte! Nimm"
	line "das hier mit."
	done

ItemfinderExplanationText:
	text "Es liegen viele"
	line "Items herum, die"
	cont "man leicht über-"
	cont "sieht."

	para "Setze den DETEKTOR"
	line "ein, um Items auf-"
	cont "zuspüren, die sich"
	cont "in der Nähe befin-"
	cont "den."

	para "Den exakten Fund-"
	line "ort musst du aber"
	cont "selbst herausfin-"
	cont "den."
	done

EcruteakItemfinderToEachHisOwnText:
	text "Bist du sicher?"

	para "Ich denke, das"
	line "wäre nützlich."
	done

EcruteakHistoryBookText:
	text "Opa will nicht,"
	line "dass ich in der"
	cont "MINE spiele."

	para "Ich schätze, das"
	line "ergibt Sinn."

	para "Er will nur, dass"
	line "ich sicher bin."
	done


TeknosGrampsItemfinderHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, TEKNOS_CITY, 8
	warp_event  5,  7, TEKNOS_CITY, 8

	db 0 ; coord events

	db 1 ; bg events
	bg_event  4,  1, BGEVENT_READ, ItemFinderHouseRadio

	db 2 ; object events
	object_event  4,  4, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, EcruteakItemfinderGuy,EVENT_TEKNOS_GRAMPA_AT_HOME
	object_event  2,  6, SPRITE_TWIN, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, EcruteakHistoryBook, EVENT_TEKNOS_GRAMPA_AT_HOME