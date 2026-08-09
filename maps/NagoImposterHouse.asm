	const_def 2 ; object constants
	const NAGOIMPOSTERHOUSE_FISHING_GURU
	const NAGOIMPOSTERHOUSE_DIGLETT

NagoImposterHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

NagoImposterHouseFishingGuruScript:
	jumptextfaceplayer NagoImposterHouseFishingGuruText

CeruleanDiglett:
	opentext
	writetext CeruleanDiglettText
	cry DIGLETT
	waitbutton
	closetext
	end

NagoImposterHouseFishingGuruText:
    text "BETRÜGER EICH: Oh."

    para "Du bist es."

    para "…"

    para "Ich bin nicht"
    line "hier, um zu"
    para "kämpfen oder Teil"
    line "eines bösen Plans"
    cont "zu sein."

    para "Es war falsch von"
    line "mir, mit TEAM"
    cont "ROCKET zusammen"
    cont "zu arbeiten."

    para "Vielleicht war ich"
    line "geblendet von der"
    para "Macht, die man mir"
    line "versprochen hat."

    para "Aber TEAM ROCKET"
    line "ist kein Team."

    para "Ich habe ihnen"
    line "nichts bedeutet"
    para "und sobald sie"
    line "niemanden mehr"
    para "brauchten, der die"
    line "Öffentlichkeit"
    cont "täuscht, haben sie"
    para "mich ohne Umwege"
    line "rausgeschmissen."

    para "Ich sehe sie als"
    line "das, was sie sind"
    para "und ich versuche,"
    line "diesen Teil meines"
    para "Lebens hinter mir"
    line "zulassen."

    para "Du musst mir nicht"
    line "vergeben, aber so"
    para "so stehen die"
    line "Dinge bei mir."
	done


CeruleanDiglettText:
	text "DIGDA: Dig dig."
	done

NagoImposterHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, NAGO_VILLAGE, 2
	warp_event  5,  7, NAGO_VILLAGE, 2

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  7,  4, SPRITE_IMPOSTER_OAK, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, NagoImposterHouseFishingGuruScript, EVENT_TELEPORT_GUY
	object_event  3,  5, SPRITE_DIGLETT, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CeruleanDiglett, EVENT_TELEPORT_GUY
