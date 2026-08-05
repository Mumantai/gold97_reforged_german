	const_def 2
	const TOWER3MED1
	const TOWER3MED2
	const TOWER3MED3
	const TOWER3MED4
	const TOWER3PANGSHI
	const TOWER3TRAINERSAGE
	const TOWER3ITEMBALL

PokemonTower3F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

GengarTombScript:
	checkevent EVENT_BEAT_TOWER_GENGAR
	iftrue defeatedGengar
	opentext
	writetext GengarAttackingText
	cry GENGAR
	pause 15
	closetext
	loadwildmon GENGAR, 45
	startbattle
	if_equal $1, DidntBeatGengar
	if_equal $2, DidntBeatGengar
	setevent EVENT_BEAT_TOWER_GENGAR
	reloadmapafterbattle
	end
	
DidntBeatGengar:
	reloadmapafterbattle
	end
	
defeatedGengar:
	opentext
	writetext GengarTombAfterText
	waitbutton
	closetext
	end

GengarAttackingText:
    text "Etwas Unheimliches"
    line "strömt aus dem"
    cont "alten Mausoleum…"
	
	para "GARAH!"
	done

GengarTombAfterText:
    text "Das Mausoleum ist"
    line "still geworden…"
	done

;----------------------------------------------------------------------------------------------------

Tower3Medium1:
	checkevent EVENT_BEAT_TOWER_GENGAR
	iftrue Tower3Medium1After
	jumptextfaceplayer Tower3Medium1WearyText
	
Tower3Medium1After:
	jumptextfaceplayer Tower3Medium1AfterText
	
Tower3Medium1WearyText:
	text "Der Geist…"
	line "Er ist zu stark…"
	done
	
Tower3Medium1AfterText:
    text "Danke, dass du uns"
    line "befreit hast!"
	done

Tower3Medium2:
	checkevent EVENT_BEAT_TOWER_GENGAR
	iftrue Tower3Medium2After
	jumptextfaceplayer Tower3Medium2WearyText
	
Tower3Medium2After:
	jumptextfaceplayer Tower3Medium2AfterText
	
Tower3Medium2WearyText:
    text "Wir können diese"
    line "Kraft nicht länger"
    cont "eindämmen…"
	done
	
Tower3Medium2AfterText:
    text "Die Geister haben"
    line "sich wieder zur"
    cont "Ruhe gesetzt…"
	done

Tower3Medium3:
	checkevent EVENT_BEAT_TOWER_GENGAR
	iftrue Tower3Medium3After
	jumptextfaceplayer Tower3Medium3WearyText
	
Tower3Medium3After:
	jumptextfaceplayer Tower3Medium3AfterText
	
Tower3Medium3WearyText:
    text "Wenn wir aufhören,"
    line "könnte der Geist"
    cont "sich befreien und"
    cont "die ganze Stadt"
    cont "angreifen!"
	done
	
Tower3Medium3AfterText:
    text "Wir stehen tief"
    line "in deiner Schuld,"
    cont "Kind!"
	done

Tower3Medium4:
	checkevent EVENT_BEAT_TOWER_GENGAR
	iftrue Tower3Medium4After
	jumptextfaceplayer Tower3Medium4WearyText
	
Tower3Medium4After:
	jumptextfaceplayer Tower3Medium4AfterText
	
Tower3Medium4WearyText:
    text "Aaargh… Die über-"
    line "natürliche Energie"
    cont "überwältigt mich!"
	done
	
Tower3Medium4AfterText:
    text "Die Geister des"
    line "#MON TURMs"
    cont "ruhen wieder, dank"
    cont "deiner Hilfe…"
	done


Tower3Pangshi:
	checkevent EVENT_BEAT_TOWER_GENGAR
	iftrue Tower3PangshiAfter
	faceplayer
	opentext
	writetext Tower3PangshiWearyText
	writebyte PANGSHI
	special PlaySlowCry
	waitbutton
	closetext
	end
	
Tower3PangshiAfter:
	faceplayer
	opentext
	writetext Tower3PangshiAfterText
	cry PANGSHI
	waitbutton
	closetext
	end
	
Tower3PangshiWearyText:
	text "PANG-SHI: Shii…"

	para "Es sieht müde aus…"
	done
	
Tower3PangshiAfterText:
	text "PANG-SHI: Shii!"

	para "Es sieht starr,"
	line "aber auch glück-"
	cont "lich aus!"
	done


TrainerSageWang:
	trainer SAGE, WANG, EVENT_BEAT_SAGE_WANG, SageWangSeenText, SageWangBeatenText, 0, .Script

.Script:
	endifjustbattled
	checkevent EVENT_BEAT_TOWER_GENGAR
	iftrue SageWangAfterGengar
	opentext
	writetext SageWangAfterBattleText
	waitbutton
	closetext
	end

SageWangAfterGengar:
	opentext
	writetext SageWangAfterGengarText
	waitbutton
	closetext
	end
	
SageWangAfterGengarText:
    text "Tut mir leid, dass"
    line "ich dein Können"
    cont "vorhin in Frage"
    cont "gestellt habe!"
	done


SageWangSeenText:
    text "Hier geht etwas"
    line "Übernatürliches"
    cont "vor sich!"

    para "Bitte geh sofort!"
	done

SageWangBeatenText:
	text "Stark…"
	done

SageWangAfterBattleText:
    text "Vielleicht bist du"
    line "stark genug, um"
    cont "uns zu helfen, den"
    cont "Geist einzudämmen!"

    para "Bitte hilf uns!"
	done


Tower3Itemball:
	itemball ESCAPE_ROPE


PokemonTower3F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  3,  9, POKEMON_TOWER_2F, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event 10,  7, BGEVENT_READ, GengarTombScript
	bg_event 11,  7, BGEVENT_READ, GengarTombScript

	db 7 ; object events
	object_event  8, 11, SPRITE_GRANNY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Tower3Medium1, -1
	object_event  8,  9, SPRITE_GRANNY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Tower3Medium2, -1
	object_event 13,  9, SPRITE_GRANNY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Tower3Medium3, -1
	object_event 13, 11, SPRITE_GRANNY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Tower3Medium4, -1
	object_event 11, 10, SPRITE_MONSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Tower3Pangshi, -1
	object_event  5,  7, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSageWang, -1
	object_event 12,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Tower3Itemball, EVENT_TOWER3_ITEMBALL
	