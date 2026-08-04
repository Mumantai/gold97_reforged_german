	const_def 2
	const MRFUJISHOUSE_SUPER_NERD
	const MRFUJISHOUSE_LASS
	const MRFUJISHOUSE_PSYDUCK
	const MRFUJISHOUSE_NIDORINO
	const MRFUJISHOUSE_PIDGEY
	const MRFUJI_HIMSELF

KantoFujiHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


MrFujisHouseSuperNerdScript:
	jumptextfaceplayer MrFujisHouseSuperNerdText

MrFujisHouseLassScript:
	jumptextfaceplayer MrFujisHouseLassText

MrFujisPsyduck:
	opentext
	writetext MrFujisPsyduckText
	cry PSYDUCK
	waitbutton
	closetext
	end

MrFujisNidorino:
	opentext
	writetext MrFujisNidorinoText
	cry NIDORINO
	waitbutton
	closetext
	end

MrFujisPidgey:
	opentext
	writetext MrFujisPidgeyText
	cry PIDGEY
	waitbutton
	closetext
	end


MrFujisHouseSuperNerdText:
    text "Das ist wirklich"
    line "das Haus von"
    cont "MR. FUJI."

    para "Er ist wirklich"
    line "freundlich!"

    para "Er kümmert sich um"
    line "verlassene und"
    cont "verwaiste #MON!"
	done

MrFujisHouseLassText:
	text "Es gibt kalt-"
	line "herzige Menschen,"
	cont "die einfach ihre"
	cont "#MON im Stich"
	cont "lassen."

	para "Großvater nimmt"
	line "die armen, heimat-"
	cont "losen #MON auf"
	cont "und sorgt für sie."
	done

MrFujisPsyduckText:
	text "ENTON: Qua-qua?"
	done

MrFujisNidorinoText:
	text "NIDORINO: Nido!"
	done

MrFujisPidgeyText:
	text "TAUBSI: Gru gru!"
	done

MrFuji:
	checkevent EVENT_GOT_CLEANSE_TAG
	iftrue MrFujiFinal
	checkevent EVENT_BEAT_TOWER_GENGAR
	iftrue MrFujiAfter
	jumptextfaceplayer MrFujiEventText
	
MrFujiAfter:
	faceplayer
	opentext
	writetext MrFujiAfterText
	waitbutton
	verbosegiveitem CLEANSE_TAG
	iffalse .NoRoom
	setevent EVENT_GOT_CLEANSE_TAG
	writetext FujiCleanseTagText
	waitbutton
.NoRoom:
	closetext
	end
	
MrFujiFinal:
	jumptextfaceplayer FujiFinalText
	
MrFujiEventText:
    text "MR. FUJI:"
    line "Willkommen."

    para "Hmm… Du scheinst"
    line "dein #MON auf"
    cont "eine freundliche"
    cont "und liebevolle"
    cont "Art und Weise"
    cont "aufzuziehen."

    para "Die stärksten"
    line "Trainer sind die,"
    cont "die ein gutes"
    cont "Herz und eine"
    cont "reine Seele haben."

    para "Ich habe eine"
    line "Bitte an dich…"

    para "Im Inneren des"
    line "#MON-TURMs geht"
    cont "etwas vor sich."

    para "Ich setze darauf,"
    line "dass du es heraus-"
    cont "findest."

    para "Komm zu mir, wenn"
    line "die Sache geregelt"
    cont "ist."
	done
	
MrFujiAfterText:
	text "Ah! So the source"
	line "of the haunting"
	cont "was an ornery"
	cont "GENGAR?"
	
	para "It may not seem"
	line "so, but that is"
	cont "a relief to hear."
	
	para "Last time #MON"
	line "TOWER saw such a"
	cont "disturbance was"
	cont "when it was"
	cont "attacked by TEAM"
	cont "ROCKET."
	
	para "The damage they"
	line "caused was"
	cont "irreparable…"
	
	para "So, I'm glad to"
	line "hear it was just"
	cont "the misgivings"
	cont "of a GHOST"
	cont "#MON and not"
	cont "anything more."
	
	para "As promised, a"
	line "token of my"
	cont "thanks."
	done

FujiCleanseTagText:
	text "This is a CLEANSE"
	line "TAG, it will"
	cont "keep away wild"
	cont "#MON when"
	cont "held by one of"
	cont "yours."
	done

FujiFinalText:
	text "MR.FUJI: Please"
	line "continue treating"
	cont "your #MON"
	cont "with kindness."
	
	para "Always…"
	done

KantoFujiHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 4, 7, KANTO_REGION, 43
	warp_event 5, 7, KANTO_REGION, 43

	db 0 ; coord events

	db 0 ; bg events

	db 6 ; object events
	object_event  7,  3, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, MrFujisHouseSuperNerdScript, -1
	object_event  1,  4, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MrFujisHouseLassScript, -1
	object_event  7,  4, SPRITE_RHYDON, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MrFujisPsyduck, -1
	object_event  5,  5, SPRITE_GROWLITHE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MrFujisNidorino, -1
	object_event  1,  3, SPRITE_MOLTRES, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, MrFujisPidgey, -1
	object_event  4,  2, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MrFuji, -1
	