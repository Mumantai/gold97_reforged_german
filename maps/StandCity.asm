	const_def 2 ; object constants
	const FUCHSIACITY_ROCKER
	const FUCHSIACITY_POKEFAN_M
	const FUCHSIACITY_TWIN
	const FUCHSIACITY_TEACHER
	const FUCHSIACITY_FRUIT_TREE
	const FUCHSIACITY_MONSTER1
	const FUCHSIACITY_MONSTER2
	const FUCHSIACITY_MONSTER3
	const FUCHSIACITY_BIRD
	const FUCHSIACITY_FAIRY
	const FUCHSIACITY_BLOCKROCKET1
	const FUCHSIACITY_OKERA
	const FUCHSIACITY_BLOCKROCKET3
	const FUCHSIACITY_IMPOSTER
	const FUCHSIACITY_HQBLOCKROCKET
	const FUCHSIACITY_NATIONALBLOCKROCKET

StandCity_MapScripts:
	db 2 ; scene scripts
	scene_script .SceneStandCityNothing ; SCENE_DEFAULT
	scene_script .SceneStandCityImposter ;

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint
	
.SceneStandCityNothing
	end

.SceneStandCityImposter
	end


.FlyPoint:
	setflag ENGINE_FLYPOINT_FUCHSIA
	return
	
ImposterIntro1:
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 5
	jump ImposterSceneScript
	end
	
ImposterIntro2:
	opentext
	writetext ImposterText1
	waitbutton
	closetext
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 5
	applymovement PLAYER, ImposterSceneMove1
	jump ImposterSceneScript
	end
	
ImposterSceneScript:	
	moveobject FUCHSIACITY_TEACHER, 27, 23
	moveobject FUCHSIACITY_TWIN, 29, 23
	moveobject FUCHSIACITY_ROCKER, 28, 24
	moveobject FUCHSIACITY_POKEFAN_M, 27, 25
	applymovement PLAYER, ImposterSceneMove2
	turnobject FUCHSIACITY_POKEFAN_M, RIGHT
	applymovement PLAYER, ImposterSceneMove2_5
	turnobject FUCHSIACITY_TEACHER, LEFT
	applymovement PLAYER, ImposterSceneMove2_7
	showemote EMOTE_SHOCK, FUCHSIACITY_TWIN, 25
	turnobject FUCHSIACITY_TEACHER, UP
	pause 3
	turnobject FUCHSIACITY_ROCKER, UP
	pause 3
	turnobject FUCHSIACITY_POKEFAN_M, UP
	pause 30
	moveobject FUCHSIACITY_IMPOSTER, 29, 19
	appear FUCHSIACITY_IMPOSTER
	applymovement FUCHSIACITY_IMPOSTER, ImposterWalksDown
	pause 10
	playmusic MUSIC_ROCKET_HIDEOUT
	opentext
	writetext ImposterText2
	waitbutton
	closetext
	pause 3
	showemote EMOTE_SHOCK, FUCHSIACITY_ROCKER, 5
	pause 3
	showemote EMOTE_SHOCK, FUCHSIACITY_TWIN, 5
	pause 3
	showemote EMOTE_SHOCK, FUCHSIACITY_TEACHER, 5
	pause 3
	showemote EMOTE_SHOCK, FUCHSIACITY_POKEFAN_M, 5
	pause 15
	opentext
	writetext ImposterText3
	waitbutton
	closetext
	pause 10
	applymovement FUCHSIACITY_IMPOSTER, ImposterWalksUp
	disappear FUCHSIACITY_IMPOSTER
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear FUCHSIACITY_TEACHER
	disappear FUCHSIACITY_TWIN
	disappear FUCHSIACITY_ROCKER
	disappear FUCHSIACITY_POKEFAN_M
	pause 15
	special FadeInQuickly
	appear FUCHSIACITY_OKERA
	playmusic MUSIC_CHERRYGROVE_CITY
	applymovement FUCHSIACITY_OKERA, OkenaWalksUP
	turnobject PLAYER, LEFT
	opentext
	writetext OkenaText
	waitbutton
	turnobject FUCHSIACITY_OKERA, DOWN
	writetext OkenaText2
	waitbutton
	closetext
	applymovement FUCHSIACITY_OKERA, OkenaWalksAway
	disappear FUCHSIACITY_OKERA
	setevent EVENT_ILEX_FOREST_APPRENTICE
	setscene SCENE_DEFAULT
	setevent EVENT_OKERA_AT_BASE
	setevent EVENT_IMPOSTER_FIGHTING_OKERA
	end


StandCityRocker:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .RockerRocketsGone
	checkevent EVENT_ILEX_FOREST_APPRENTICE
	iftrue .RockerAfterImposter
	writetext StandCityRockerText
	waitbutton
	closetext
	end
	
.RockerRocketsGone
	writetext StandCityRockerAllGoodText
	waitbutton
	closetext
	end
	
.RockerAfterImposter
	writetext StandCityRockerImposterText
	waitbutton
	closetext
	end

StandCityPokefanM:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .PokefanRocketsGone
	checkevent EVENT_ILEX_FOREST_APPRENTICE
	iftrue .PokefanAfterImposter
	writetext StandCityPokefanMText
	waitbutton
	closetext
	end
	
.PokefanRocketsGone
	writetext StandCityPokefanAllGoodText
	waitbutton
	closetext
	end
	
.PokefanAfterImposter
	writetext StandCityPokefanImposterText
	waitbutton
	closetext
	end


StandCityTwin:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .TwinRocketsGone
	checkevent EVENT_ILEX_FOREST_APPRENTICE
	iftrue .TwinAfterImposter
	writetext StandCityTwinText
	waitbutton
	closetext
	end
	
.TwinRocketsGone
	writetext StandCityTwinAllGoodText
	waitbutton
	closetext
	end
	
.TwinAfterImposter
	writetext StandCityTwinImposterText
	waitbutton
	closetext
	end
	
StandCityTeacher:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .TeacherRocketsGone
	checkevent EVENT_ILEX_FOREST_APPRENTICE
	iftrue .TeacherAfterImposter
	writetext StandCityTeacherText
	waitbutton
	closetext
	end
	
.TeacherRocketsGone
	writetext StandCityTeacherAllGoodText
	waitbutton
	closetext
	end
	
.TeacherAfterImposter
	writetext StandCityTeacherImposterText
	waitbutton
	closetext
	end
	
StandCityBlockRocket1:
	faceplayer
	opentext
	checkevent EVENT_STAND_CITY_ROCKETS_DEPARTED
	iftrue .BlockRocket1AfterBase
	checkevent EVENT_ILEX_FOREST_APPRENTICE
	iftrue .BlockRocket1AfterImposter
	writetext BlockRocket1BeforeText
	waitbutton
	closetext
	end
	
.BlockRocket1AfterBase
	writetext BlockRocket1AfterBaseText
	waitbutton
	closetext
	end

.BlockRocket1AfterImposter
	writetext BlockRocket1AfterText
	waitbutton
	closetext
	end
	
StandCityBlockRocket3:
	faceplayer
	opentext
	checkevent EVENT_STAND_CITY_ROCKETS_DEPARTED
	iftrue .BlockRocket3AfterBase
	checkevent EVENT_ILEX_FOREST_APPRENTICE
	iftrue .BlockRocket3AfterImposter
	writetext BlockRocket3BeforeText
	waitbutton
	closetext
	end
	
.BlockRocket3AfterBase
	writetext BlockRocket3AfterBaseText
	waitbutton
	closetext
	end

	
.BlockRocket3AfterImposter
	writetext BlockRocket3AfterText
	waitbutton
	closetext
	end	

StandCitySign:
	jumptext StandCitySignText

FuchsiaGymSign:
	jumptext FuchsiaGymSignText

SafariZoneOfficeSign:
	jumptext SafariZoneOfficeSignText

WardensHomeSign:
	jumptext WardensHomeSignText

SafariZoneClosedSign:
	jumptext SafariZoneClosedSignText

SafariZoneClefairySign:
	jumptext SafariZoneClefairySignText
	
SafariZoneAmpharosSign:
	jumptext SafariZoneAmpharosSignText
	
SafariZoneSkarmorySign:
	jumptext SafariZoneSkarmorySignText
	
SafariZoneGolduckSign:
	jumptext SafariZoneGolduckSignText

NoLitteringSign:
	jumptext NoLitteringSignText

StandCityPokecenterSign:
;	setevent EVENT_STAND_CITY_ZOO_MONS_GONE
;	clearevent EVENT_ILEX_FOREST_APPRENTICE
;	clearevent EVENT_ILEX_FOREST_LASS
	jumpstd pokecentersign

StandCityMartSign:
	jumpstd martsign

StandCityFruitTree:
	fruittree FRUITTREE_STAND_CITY
	
StandCityHQBlockRocket:
	jumptextfaceplayer StandCityHQBlockRocketText
	
StandCityNationalBlockRocket:
	faceplayer
	opentext
	checkevent EVENT_STAND_CITY_ROCKETS_DEPARTED
	iftrue .NatioanlBlockRocketAfterBase
	writetext StandCityNationalBlockRocketText
	waitbutton
	closetext
	end

.NatioanlBlockRocketAfterBase
	writetext StandCityNationalBlockRocketAfterBaseText
	waitbutton
	closetext
	end

ImposterSceneMove1:
	step LEFT
	step_end
	
ImposterSceneMove2:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step UP
	step UP
	step_end
	
ImposterSceneMove2_5:
	step UP
	step UP
	step_end
	
ImposterSceneMove2_7:
	step UP
	step UP
	step UP
	step UP
	step_end
	
ImposterWalksDown:
	step DOWN
	step DOWN
	step_end
	
ImposterWalksUp:
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step_end
	
OkenaWalksUP:
	big_step UP
	big_step UP
	big_step LEFT
	big_step LEFT
	big_step UP
	big_step UP
	big_step UP
	step_end


OkenaWalksAway:
	big_step DOWN
	big_step DOWN
	big_step LEFT
	big_step LEFT
	big_step LEFT
	step_end
	
StandCityNationalBlockRocketAfterBaseText:
    text "Ich fühle mich"
    line "immer von allen"
    cont "ausgeschlossen…"

    para "Niemand sagt mir,"
    line "was hier vor sich"
    cont "geht…"
	done
	
BlockRocket4AfterBaseText:
    text "Alle anderen"
    line "sind weg?"

    para "Du hast nichts"
    line "damit zu tun,"
    cont "oder?"
	done

BlockRocket3AfterBaseText:
    text "Angeblich sind"
    line "jetzt alle drüben"
    cont "in PORT ABANISHI."

    para "Aber was hat das"
    line "zu bedeuten?"

    para "Was ist denn mit"
    line "unserer Basis"
    cont "passiert?"
	done
	
BlockRocket2AfterBaseText:
    text "Ist das wahr?"

    para "Ich hörte, die"
    line "Basis sei leer."

    para "Warum sind wir"
    line "dann noch hier?"
	done
	
BlockRocket1AfterBaseText:
    text "Ist die Basis"
    line "wirklich leer?"

    para "Wo sind denn"
    line "dann alle hin?"
	done
	
StandCityHQBlockRocketText:
    text "Wir alle hassen"
    line "es, den Eingang"
    para "zu diesem Gebäude"
    line "zu bewachen."

    para "Meine Schicht ist"
    line "aber fast vorbei."

    para "Ich hoffe, meine"
    line "Ablösung taucht"
    cont "dieses Mal auch"
    cont "wirklich auf…"
	done
	
StandCityNationalBlockRocketText:
    text "Niemand darf jetzt"
    line "den NATIONALPARK"
    cont "betreten!"

    para "Nicht solange"
    line "die #MON krank"
    cont "werden."

    para "Mir liegt ihre"
    line "Gesundheit am"
    cont "Herzen, verstehst"
    cont "du?"
	done
	
BlockRocket1BeforeText:
    text "Oh Junge!"

    para "Ich kann nicht"
    line "glauben, wie gut"
    cont "dieser Plan läuft!"
	done
	
BlockRocket1AfterText:
    text "Hey, Knirps!"

    para "War das nicht eine"
    line "tolle Rede vom"
    cont "allerechten"
    cont "PROF. EICH?"
	done
	
BlockRocket3BeforeText:
	text "Südlich von hier"
	line "ist nichts!"

	para "Du solltest besser"
	line "in der Stadt"
	cont "bleiben!"
	done

BlockRocket3AfterText:
	text "Die Leute lieben"
	line "PROF.EICH!"
	done
	
	
ImposterText1:
	text "Bürger von"
	line "SENDESTIA CITY!"
	done
	done
	
ImposterText2:
	text "Ich bin es, der"
	line "weltberühmte"
	cont "PROF. EICH!"

	para "Ich habe tolle"
	line "Neuigkeiten!"

	para "Ich habe mich mit"
	line "TEAM ROCKET"
	cont "zusammengetan, um"
    cont "euch eine wunder-"
    cont "bare neue Techno-"
    cont "logie zu bringen!"
	done
	
ImposterText3:
    text "Macht euch"
    line "keine Sorgen!"
	
    para "Wir entwickeln ein"
    line "Hochleistungs-"
    cont "Radiosignal, mit"
    cont "dessen Hilfe man"
    cont "die Gedanken von"
    cont "#MON lesen"
    cont "können wird!"
	
    para "Und dieses Signal"
    line "wird genau hier in"
    cont "SENDESTIA CITY"
    cont "entwickelt!"

    para "Gerüchte darüber,"
    line "dass dieses Signal"
    cont "die #MON krank"
    cont "macht, sind reiner"
    cont "Unsinn."

    para "Es passiert ihnen"
    line "nichts!"

    para "Da könnt ihr mir"
    line "vertrauen, denn,"
    cont "wie ihr sehen"
    cont "könnt…"

    para "bin ich"
    cont "PROF. EICH!"

    para "Das war alles!"
	done
	
OkenaText:
    text "RABAN: Tss…"

    para "Was für ein Ärger…"

    para "Zuerst dieser"
    line "Sturm und jetzt"
    cont "will so ein alter"
    cont "Typ ein Signal in"
    cont "meiner Stadt"
    cont "entwickeln?"
	done
	
OkenaText2:
    text "Das lasse ich mir"
    line "nicht gefallen!"

    para "Ich brauche meine"
    line "Ruhe!"
	done

StandCityRockerText:
	text "Die #MON, die"
	line "normalerweise im"
	cont "ZOO dort drüben"
	cont "sind, fühlen sich"
	cont "nicht wohl."

    para "Die Verantwort-"
    line "lichen vom ZOO"
    cont "kümmern sich um"
    line "sie, in ihrer"
    cont "#MON-Klink."
	done
	
StandCityRockerAllGoodText:
	text "Das war gar nicht"
	line "der echte"
	cont "PROF. EICH?"

	para "Total verrückt!"

	para "Ich bin froh, dass"
	line "es den #MON"
	cont "jetzt besser geht."
	done
	
StandCityRockerImposterText:
	text "TEAM ROCKET ist"
	line "schuld daran, dass"
	cont "es den #MON"
	cont "schlecht geht?"

	para "Aber PROF. EICH"
	line "sagt, ihnen pa-"
	cont "ssiere nichts und"
	cont "das alles sei Teil"
	cont "seiner wichtigen"
	cont "Forschung…"

	para "Ich vertraue ihm."
	done

StandCityPokefanMText:
	text "Ich bin enttäuscht"
	line "darüber, dass die
	cont "#MON nicht"
	cont "draußen sind."

	para "Aber es ist wich-"
	line "tiger, dass sie"
	cont "gesund werden."
	done
	
StandCityPokefanImposterText:
	text "PROF. EICH ist"
	line "schuld daran,"
	cont "dass es den"
	cont "#MON so"
	cont "schlecht geht?"

	para "Er muss einen"
	line "guten Grund haben…"
	done
	
StandCityPokefanAllGoodText:
    text "Ich bin so froh,"
    line "dass es allen"
    cont "#MON wieder gut"
    cont "geht!"
	done

StandCityTwinText:
	text "Der ZOO von"
	line "SENDESTIA CITY"
	cont "hat geschlossen…"

	para "Das ist schade,"
	line "denn er ist"
	cont "die größte"
	cont "Attraktion hier."

	para "Ich hoffe, den"
	line "#MON geht es"
	cont "gut."
	done
	
StandCityTwinImposterText:
	text "TEAM ROCKET ist"
	line "zurück?"

	para "Und das zusammen"
	line "mit PROF. EICH?"

	para "Da simmt doch"
	line "etwas nicht…"
	done
	
StandCityTwinAllGoodText:
	text "Juhu! Der ZOO hat"
	line "wieder geöffnet!"
	done

StandCityTeacherText:
	text "Was machen all die"
	line "Leute von TEAM"
	cont "ROCKET hier?"

	para "Das kann nichts"
	line "Gutes heißen!"
	done
	
StandCityTeacherImposterText:
    text "Irgendwas kam mir"
    line "komisch vor, an"
    cont "PROF. EICH…"
	done

StandCityTeacherAllGoodText:
	text "Zum Glück ist"
	line "alles wieder"
	cont "normal."
	done

StandCitySignText:
	text "SENDESTIA CITY"

	para "Eine Utopie für"
	line "Mensch und #MON"
	done

FuchsiaGymSignText:
	text "#MON-ARENA von"
	line "SENDESTIA CITY"
	cont "LEITUNG: RABAN"

	para "Der Junge, der"
	line "im Dunkeln"
	cont "aufblüht"
	done

SafariZoneOfficeSignText:
	text "There's a notice"
	line "here…"

	para "SAFARI ZONE OFFICE"
	line "is closed until"
	cont "further notice."
	done

WardensHomeSignText:
	text "SENDESTIA CITY ZOO"
	line "#MON-Klinikum"
	done

SafariZoneClosedSignText:
	text "#MON:"
	line "KANGAMA"

	para "Um das Junge, das"
	line "es in seinem Beu-"
	para "tel trägt, nicht"
	line "zu zerquetschen,"
	para "schläft es immer"
	line "nur im Stehen."
	done

SafariZoneClefairySignText:
	text "#MON:"
	line "PIEPI"

	para "Es wird nur selten"
	line "gesehen, doch in"
	para "Vollmondnächten"
	line "kann man es aus"
	para "irgendeinem Grund"
	line "öfter finden."
	done
	
SafariZoneAmpharosSignText:
	text "#MON:"
	line "AMPHAROS"

	para "Wenn es dunkel"
	line "wird, kann man das"
	para "Licht an seinem"
	line "Schwanz bis weit"
	para "draußen auf dem"
	line "Meer sehen."
	done
	
SafariZoneSkarmorySignText:
	text "#MON:"
	line "PANZAERON"

	para "Die Federn, die"
	line "es verliert, sind"
	cont "extrem scharf."

	para "Angeblich wurden"
	line "sie früher sogar"
	para "als Schwerter"
	line "verwendet."
	done
	
SafariZoneGolduckSignText:
	text "#MON:"
	line "ENTORON"

	para "Es schwimmt"
	line "anmutig durch"
	para "ruhige, langsam"
	line "fließende Flüsse"
	para "und Seen, in denen"
	line "es sich besonders"
	cont "wohlfühlt."
	done

NoLitteringSignText:
	text "SENDESTIA CITY ZOO"
	line "Hauptbüro"
	done

StandCity_MapEvents:
	db 0, 0 ; filler

	db 11 ; warp events
	warp_event 35, 26, STAND_MART, 1
	warp_event 16, 21, STAND_ZOO_MAIN_OFFICE, 1
	warp_event 34, 31, STAND_GYM, 1
	warp_event 26, 29, STAND_SPEECH_HOUSE, 1
	warp_event 33, 20, STAND_POKECENTER_1F, 1
	warp_event 17, 31, STAND_ROCKET_HOUSE_1F, 1
	warp_event 30, 13, ROUTE_112_STAND_CITY_GATE, 3
	warp_event 31, 13, ROUTE_112_STAND_CITY_GATE, 4
	warp_event  6, 17, NATIONAL_PARK_STAND_GATE, 4
	warp_event 35, 31, STAND_GYM, 2
	warp_event 24, 17, STAND_ZOO_INFIRMARY, 1


	db 2 ; coord events
	coord_event  34, 32, SCENE_FUCHSIA_CITY_IMPOSTER, ImposterIntro1
	coord_event  35, 32, SCENE_FUCHSIA_CITY_IMPOSTER, ImposterIntro2

	db 11 ; bg events
	bg_event 36, 20, BGEVENT_READ, StandCitySign
	bg_event 32, 35, BGEVENT_READ, FuchsiaGymSign
	bg_event 24, 20, BGEVENT_READ, WardensHomeSign
	bg_event  8,  8, BGEVENT_READ, SafariZoneClosedSign
	bg_event 18, 21, BGEVENT_READ, NoLitteringSign
	bg_event 34, 20, BGEVENT_READ, StandCityPokecenterSign
	bg_event 36, 26, BGEVENT_READ, StandCityMartSign
	bg_event 14,  8, BGEVENT_READ, SafariZoneClefairySign
	bg_event 20, 10, BGEVENT_READ, SafariZoneAmpharosSign
	bg_event 16, 16, BGEVENT_READ, SafariZoneSkarmorySign
	bg_event 10, 20, BGEVENT_READ, SafariZoneGolduckSign

	db 16 ; object events
	object_event 28, 21, SPRITE_ROCKER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, StandCityRocker, -1
	object_event 14, 10, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, StandCityPokefanM, -1
	object_event 14, 17, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, StandCityTwin, -1
	object_event 28, 30, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, StandCityTeacher, -1
	object_event 26, 11, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, StandCityFruitTree, -1
	object_event 20,  8, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_STAND_CITY_ZOO_MONS_GONE
	object_event  7, 21, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_STAND_CITY_ZOO_MONS_GONE
	object_event  7,  6, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_STAND_CITY_ZOO_MONS_GONE
	object_event 15, 14, SPRITE_BIRD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_STAND_CITY_ZOO_MONS_GONE
	object_event 12,  6, SPRITE_FAIRY, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_STAND_CITY_ZOO_MONS_GONE
	object_event 30, 35, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, StandCityBlockRocket1, EVENT_CLEARED_RADIO_TOWER
	object_event 29, 28, SPRITE_OKERA, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_GOT_A_POKEMON_FROM_OAK
	object_event 31, 35, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, StandCityBlockRocket3, EVENT_CLEARED_RADIO_TOWER
	object_event -5, -5, SPRITE_IMPOSTER_OAK, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, 0
	object_event 17, 32, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, StandCityHQBlockRocket, EVENT_BEAT_OKERA
	object_event  6, 18, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, StandCityNationalBlockRocket, EVENT_CLEARED_RADIO_TOWER

