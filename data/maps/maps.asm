map: MACRO
;\1: map name: for the MapAttributes pointer (see data/maps/attributes.asm)
;\2: tileset: a TILESET_* constant
;\3: environment: TOWN, ROUTE, INDOOR, CAVE, ENVIRONMENT_5, GATE, or DUNGEON
;\4: location: from constants/landmark_constants.asm
;\5: music: a MUSIC_* constant
;\6: phone service flag: TRUE to prevent phone calls
;\7: time of day: a PALETTE_* constant
;\8: fishing group: a FISHGROUP_* constant
	db BANK(\1_MapAttributes), \2, \3
	dw \1_MapAttributes
	db \4, \5
	dn \6, \7
	db \8
ENDM

MapGroupPointers::
; pointers to the first map of each map group
	dw MapGroup_Olivine     ;  1 newtype
	dw MapGroup_Mahogany    ;  2 honto
	dw MapGroup_Dungeons    ;  3 
	dw MapGroup_Ecruteak    ;  4 teku
	dw MapGroup_Blackthorn  ;  5 blue forest
	dw MapGroup_Cinnabar    ;  6 north island
	dw MapGroup_Cerulean    ;  7
	dw MapGroup_Azalea      ;  8 birdon
	dw MapGroup_LakeOfRage  ;  9 silent hills
	dw MapGroup_Violet      ; 10 old
	dw MapGroup_Goldenrod   ; 11 west
	dw MapGroup_Vermilion   ; 12 
	dw MapGroup_Pallet      ; 13 sugar
	dw MapGroup_Pewter      ; 14
	dw MapGroup_FastShip    ; 15
	dw MapGroup_Indigo      ; 16 fuji
	dw MapGroup_Fuchsia     ; 17 stand
	dw MapGroup_Lavender    ; 18 possibly scary forest?
	dw MapGroup_CableClub   ; 20
	dw MapGroup_Celadon     ; 21 kanto
	dw MapGroup_Cianwood    ; 22 south point
	dw MapGroup_Viridian    ; 23
	dw MapGroup_NewBark     ; 24 silent
	dw MapGroup_Saffron     ; 25
	dw MapGroup_Cherrygrove ; 26 prince

MapGroup_Olivine:
	map AlloyPokecenter1F, TILESET_POKECENTER, INDOOR, ALLOY_CITY, MUSIC_POKEMON_CENTER, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map AlloyGym, TILESET_CHAMPIONS_ROOM, INDOOR, ALLOY_CITY, MUSIC_GYM, TRUE, PALETTE_DAY, FISHGROUP_NONE
	map AlloyTimsHouse, TILESET_HOUSE, INDOOR, ALLOY_CITY, MUSIC_VIOLET_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map AlloyOldCaptainsHouse, TILESET_HOUSE, INDOOR, ALLOY_CITY, MUSIC_VIOLET_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map AlloyPunishmentSpeechHouse, TILESET_HOUSE, INDOOR, ALLOY_CITY, MUSIC_VIOLET_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map AlloyGoodRodHouse, TILESET_HOUSE, INDOOR, ALLOY_CITY, MUSIC_VIOLET_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map AlloyCafe, TILESET_GAME_CORNER, INDOOR, ALLOY_CITY, MUSIC_VIOLET_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map AlloyMart, TILESET_MART, INDOOR, ALLOY_CITY, MUSIC_VIOLET_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map Route109Route110Gate, TILESET_GATE, GATE, ROUTE_109, MUSIC_ROUTE_37, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map Route108, TILESET_JOHTO_MODERN, ROUTE, ROUTE_108, MUSIC_ROUTE_37, FALSE, PALETTE_AUTO, FISHGROUP_NONE
	map Route109, TILESET_JOHTO_MODERN, ROUTE, ROUTE_109, MUSIC_ROUTE_37, FALSE, PALETTE_AUTO, FISHGROUP_NONE
	map AlloyCity, TILESET_JOHTO_MODERN, TOWN, ALLOY_CITY, MUSIC_VIOLET_CITY, FALSE, PALETTE_AUTO, FISHGROUP_SHORE
	map Route107AlloyGate, TILESET_GATE, GATE, ROUTE_107, MUSIC_ROUTE_36, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map Route107AlloyGate2F, TILESET_GATE, GATE, ROUTE_107, MUSIC_ROUTE_36, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map Route106, TILESET_JOHTO_MODERN, ROUTE, ROUTE_106, MUSIC_ROUTE_36, FALSE, PALETTE_AUTO, FISHGROUP_NONE
	map Route106Pokecenter1F, TILESET_POKECENTER, INDOOR, ROUTE_106, MUSIC_POKEMON_CENTER, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map DayCare, TILESET_HOUSE, INDOOR, ROUTE_106, MUSIC_AZALEA_TOWN, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map FightingDojo, TILESET_TRADITIONAL_HOUSE, INDOOR, ALLOY_CITY, MUSIC_VIOLET_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map Route109Pokecenter1F, TILESET_POKECENTER, INDOOR, ROUTE_109, MUSIC_POKEMON_CENTER, FALSE, PALETTE_DAY, FISHGROUP_NONE

MapGroup_Mahogany:
	map SanskritCoinCaseSpeechHouse, TILESET_HOUSE, INDOOR, SANSKRIT_TOWN, MUSIC_CHERRYGROVE_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map SanskritPokecenter1F, TILESET_POKECENTER, INDOOR, SANSKRIT_TOWN, MUSIC_POKEMON_CENTER, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map SanskritTown, TILESET_PARK, TOWN, SANSKRIT_TOWN, MUSIC_CHERRYGROVE_CITY, FALSE, PALETTE_AUTO, FISHGROUP_NONE
	map Route116, TILESET_PARK, ROUTE, ROUTE_116, MUSIC_ROUTE_36, FALSE, PALETTE_AUTO, FISHGROUP_SHORE
	map Route117, TILESET_PARK, ROUTE, ROUTE_117, MUSIC_ROUTE_36, FALSE, PALETTE_AUTO, FISHGROUP_SHORE
	map RuinsOfAlphOutside, TILESET_PARK, ROUTE, RUINS_OF_ALPH, MUSIC_UNION_CAVE, FALSE, PALETTE_AUTO, FISHGROUP_POND
	map Boardwalk, TILESET_PARK, ROUTE, BOARDWALK, MUSIC_LAKE_OF_RAGE, FALSE, PALETTE_AUTO, FISHGROUP_OCEAN
	map Route118, TILESET_PARK, ROUTE, ROUTE_118, MUSIC_LAKE_OF_RAGE, FALSE, PALETTE_AUTO, FISHGROUP_SHORE
	map Route118SunpointGate, TILESET_GATE, GATE, ROUTE_118, MUSIC_LAKE_OF_RAGE, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map RuinsOfAlphResearchCenter, TILESET_LAB, INDOOR, SANSKRIT_TOWN, MUSIC_CHERRYGROVE_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map SanskritRocketHouse, TILESET_POKECOM_CENTER, INDOOR, SANSKRIT_TOWN, MUSIC_ROCKET_HIDEOUT, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map SanskritMart, TILESET_MART, INDOOR, SANSKRIT_TOWN, MUSIC_CHERRYGROVE_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map BoardwalkGameCorner, TILESET_GAME_CORNER, INDOOR, BOARDWALK, MUSIC_GAME_CORNER, FALSE, PALETTE_DAY, FISHGROUP_NONE

MapGroup_Dungeons:
	map BrassTower1F, TILESET_TOWER, DUNGEON, BRASS_TOWER, MUSIC_TIN_TOWER, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map BrassTower2F, TILESET_TOWER, DUNGEON, BRASS_TOWER, MUSIC_TIN_TOWER, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map BrassTower3F, TILESET_TOWER, DUNGEON, BRASS_TOWER, MUSIC_TIN_TOWER, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map BrassTower4F, TILESET_TOWER, DUNGEON, BRASS_TOWER, MUSIC_TIN_TOWER, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map BrassTower5F, TILESET_TOWER, DUNGEON, BRASS_TOWER, MUSIC_TIN_TOWER, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map NationalPark, TILESET_PARK, ROUTE, NATIONAL_PARK, MUSIC_NATIONAL_PARK, FALSE, PALETTE_AUTO, FISHGROUP_SHORE
	map NationalParkBugContest, TILESET_PARK, ROUTE, NATIONAL_PARK, MUSIC_BUG_CATCHING_CONTEST, FALSE, PALETTE_AUTO, FISHGROUP_NONE
	map RuinsOfAlphHoOhChamber, TILESET_RUINS_OF_ALPH, DUNGEON, RUINS_OF_ALPH, MUSIC_UNION_CAVE, TRUE, PALETTE_DAY, FISHGROUP_NONE
	map RuinsOfAlphKabutoChamber, TILESET_RUINS_OF_ALPH, DUNGEON, RUINS_OF_ALPH, MUSIC_UNION_CAVE, TRUE, PALETTE_DAY, FISHGROUP_NONE
	map RuinsOfAlphOmanyteChamber, TILESET_RUINS_OF_ALPH, DUNGEON, RUINS_OF_ALPH, MUSIC_UNION_CAVE, TRUE, PALETTE_DAY, FISHGROUP_NONE
	map RuinsOfAlphAerodactylChamber, TILESET_RUINS_OF_ALPH, DUNGEON, RUINS_OF_ALPH, MUSIC_UNION_CAVE, TRUE, PALETTE_DAY, FISHGROUP_NONE
	map RuinsOfAlphInnerChamber, TILESET_RUINS_OF_ALPH, DUNGEON, RUINS_OF_ALPH, MUSIC_RUINS_OF_ALPH_INTERIOR, TRUE, PALETTE_DAY, FISHGROUP_NONE
	map BoulderMines1F, TILESET_CAVE, CAVE, BOULDER_MINES, MUSIC_UNION_CAVE, TRUE, PALETTE_NITE, FISHGROUP_LAKE
	map BoulderMinesB1F, TILESET_DARK_CAVE, CAVE, BOULDER_MINES, MUSIC_UNION_CAVE, TRUE, PALETTE_NITE, FISHGROUP_LAKE
	map BoulderMinesB5F, TILESET_DARK_CAVE, CAVE, BOULDER_MINES, MUSIC_UNION_CAVE, TRUE, PALETTE_NITE, FISHGROUP_LAKE
	map SlowpokeWellB1F, TILESET_DARK_CAVE, CAVE, SLOWPOKE_WELL, MUSIC_DARK_CAVE, TRUE, PALETTE_NITE, FISHGROUP_NONE
	map SlowpokeWellB2F, TILESET_DARK_CAVE, CAVE, SLOWPOKE_WELL, MUSIC_DARK_CAVE, TRUE, PALETTE_NITE, FISHGROUP_LAKE
	map EndonCaveB1F, TILESET_DARK_CAVE, CAVE, ENDON_CAVE, MUSIC_UNION_CAVE, TRUE, PALETTE_NITE, FISHGROUP_LAKE
	map TeamRocketBaseB2FOffice, TILESET_UNDERGROUND, DUNGEON, STAND_CITY, MUSIC_ROCKET_HIDEOUT, TRUE, PALETTE_DAY, FISHGROUP_NONE
	map TeamRocketBaseB1F, TILESET_UNDERGROUND, DUNGEON, STAND_CITY, MUSIC_ROCKET_HIDEOUT, TRUE, PALETTE_DAY, FISHGROUP_NONE
	map TeamRocketBaseB2F, TILESET_UNDERGROUND, DUNGEON, STAND_CITY, MUSIC_ROCKET_HIDEOUT, TRUE, PALETTE_DAY, FISHGROUP_NONE
	map JadeForest, TILESET_FOREST, CAVE, JADE_FOREST, MUSIC_UNION_CAVE, FALSE, PALETTE_NITE, FISHGROUP_POND
	map CrownPass, TILESET_DARK_CAVE, CAVE, CROWN_PASS, MUSIC_INDIGO_PLATEAU, TRUE, PALETTE_NITE, FISHGROUP_NONE
	map CharredSummitCave, TILESET_DARK_CAVE, CAVE, CHARRED_SUMMIT, MUSIC_MT_MOON, TRUE, PALETTE_NITE, FISHGROUP_NONE
	map JouleCave, TILESET_DARK_CAVE, CAVE, JOULE_CAVE, MUSIC_MT_MOON, TRUE, PALETTE_NITE, FISHGROUP_NONE
	map JouleCaveZapdosRoom, TILESET_DARK_CAVE, CAVE, JOULE_CAVE, MUSIC_MT_MOON, TRUE, PALETTE_NITE, FISHGROUP_NONE
	map IcedCavern1F, TILESET_ICE_PATH, CAVE, ICED_CAVERN, MUSIC_DARK_CAVE, TRUE, PALETTE_NITE, FISHGROUP_WHIRL_ISLANDS
	map IcedCavernB1F, TILESET_ICE_PATH, CAVE, ICED_CAVERN, MUSIC_DARK_CAVE, TRUE, PALETTE_NITE, FISHGROUP_NONE
	map DeepwaterPassageB2F, TILESET_ICE_PATH, CAVE, DEEPWATER_PASSAGE, MUSIC_DARK_CAVE, TRUE, PALETTE_NITE, FISHGROUP_WHIRL_ISLANDS
	map MagmaShaftB1F, TILESET_ICE_PATH, CAVE, MAGMA_SHAFT, MUSIC_DARK_CAVE, TRUE, PALETTE_NITE, FISHGROUP_NONE; mountain cave
	map MagmaShaftB2F, TILESET_ICE_PATH, CAVE, MAGMA_SHAFT, MUSIC_DARK_CAVE, TRUE, PALETTE_NITE, FISHGROUP_NONE; mountain cave
	map MagmaShaft1F, TILESET_ICE_PATH, CAVE, MAGMA_SHAFT, MUSIC_DARK_CAVE, TRUE, PALETTE_NITE, FISHGROUP_NONE; mountain cave
	map DeepwaterPassageB1F, TILESET_ICE_PATH, CAVE, DEEPWATER_PASSAGE, MUSIC_DARK_CAVE, TRUE, PALETTE_NITE, FISHGROUP_WHIRL_ISLANDS
	map DeepwaterPassageB3F, TILESET_ICE_PATH, CAVE, DEEPWATER_PASSAGE, MUSIC_DARK_CAVE, TRUE, PALETTE_NITE, FISHGROUP_WHIRL_ISLANDS
	map WhirlIslandB2FCave, TILESET_DARK_CAVE, CAVE, WHIRL_ISLAND, MUSIC_UNION_CAVE, TRUE, PALETTE_NITE, FISHGROUP_WHIRL_ISLANDS
	map WhirlIsland1F, TILESET_DARK_CAVE, CAVE, WHIRL_ISLAND, MUSIC_UNION_CAVE, TRUE, PALETTE_NITE, FISHGROUP_WHIRL_ISLANDS
	map WhirlIslandB1F, TILESET_DARK_CAVE, CAVE, WHIRL_ISLAND, MUSIC_UNION_CAVE, TRUE, PALETTE_NITE, FISHGROUP_WHIRL_ISLANDS
	map WhirlIslandB2F, TILESET_DARK_CAVE, CAVE, WHIRL_ISLAND, MUSIC_UNION_CAVE, TRUE, PALETTE_NITE, FISHGROUP_WHIRL_ISLANDS
	map WhirlIslandLugiaChamber, TILESET_DARK_CAVE, CAVE, WHIRL_ISLAND, MUSIC_UNION_CAVE, TRUE, PALETTE_NITE, FISHGROUP_WHIRL_ISLANDS
	map AmpareCavernB1F, TILESET_DARK_CAVE, CAVE, AMPARE_CAVERN, MUSIC_DARK_CAVE, TRUE, PALETTE_NITE, FISHGROUP_LAKE
	map AmpareCavern1F, TILESET_DARK_CAVE, CAVE, AMPARE_CAVERN, MUSIC_DARK_CAVE, TRUE, PALETTE_NITE, FISHGROUP_LAKE
	map DeepwaterPassage1F, TILESET_CAVE, CAVE, DEEPWATER_PASSAGE, MUSIC_DARK_CAVE, TRUE, PALETTE_NITE, FISHGROUP_NONE
	map EndonCave1F, TILESET_DARK_CAVE, CAVE, ENDON_CAVE, MUSIC_UNION_CAVE, TRUE, PALETTE_NITE, FISHGROUP_LAKE
	map BoulderMinesB4F, TILESET_DARK_CAVE, CAVE, BOULDER_MINES, MUSIC_UNION_CAVE, TRUE, PALETTE_NITE, FISHGROUP_LAKE
	map BoulderMinesB2F, TILESET_DARK_CAVE, CAVE, BOULDER_MINES, MUSIC_UNION_CAVE, TRUE, PALETTE_NITE, FISHGROUP_LAKE
	map BoulderMinesB3F, TILESET_DARK_CAVE, CAVE, BOULDER_MINES, MUSIC_UNION_CAVE, TRUE, PALETTE_NITE, FISHGROUP_LAKE
	map NanjoForest, TILESET_FOREST, CAVE, NANJO_FOREST, MUSIC_UNION_CAVE, FALSE, PALETTE_NITE, FISHGROUP_POND
	map VictoryRoad, TILESET_DARK_CAVE, CAVE, VICTORY_ROAD, MUSIC_VICTORY_ROAD, TRUE, PALETTE_NITE, FISHGROUP_LAKE
	map VictoryRoad2F, TILESET_DARK_CAVE, CAVE, VICTORY_ROAD, MUSIC_VICTORY_ROAD, TRUE, PALETTE_NITE, FISHGROUP_LAKE

MapGroup_Ecruteak:
	map TeknosPokecenter1F, TILESET_POKECENTER, INDOOR, TEKNOS_CITY, MUSIC_POKEMON_CENTER, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map TeknosOldRodHouse, TILESET_HOUSE, INDOOR, TEKNOS_CITY, MUSIC_ECRUTEAK_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map TeknosMart, TILESET_MART, INDOOR, TEKNOS_CITY, MUSIC_ECRUTEAK_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map TeknosGrampsItemfinderHouse, TILESET_HOUSE, INDOOR, TEKNOS_CITY, MUSIC_ECRUTEAK_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map TeknosCity, TILESET_PARK, TOWN, TEKNOS_CITY, MUSIC_ECRUTEAK_CITY, FALSE, PALETTE_AUTO, FISHGROUP_OCEAN
	map Route119, TILESET_PARK, ROUTE, ROUTE_119, MUSIC_ROUTE_30, FALSE, PALETTE_AUTO, FISHGROUP_QWILFISH
	map Route120, TILESET_PARK, ROUTE, ROUTE_120, MUSIC_ROUTE_30, FALSE, PALETTE_AUTO, FISHGROUP_QWILFISH
	map TeknosPortPassage, TILESET_UNDERGROUND, INDOOR, TEKNOS_CITY, MUSIC_ECRUTEAK_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map TeknosGym, TILESET_POKECENTER, INDOOR, TEKNOS_CITY, MUSIC_GYM, TRUE, PALETTE_DAY, FISHGROUP_NONE
	map TeknosAquarium1F, TILESET_POKECOM_CENTER, INDOOR, TEKNOS_CITY, MUSIC_MAHOGANY_MART, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map TeknosAquarium2F, TILESET_POKECOM_CENTER, INDOOR, TEKNOS_CITY, MUSIC_MAHOGANY_MART, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map TeknosKylesHouse, TILESET_HOUSE, INDOOR, TEKNOS_CITY, MUSIC_ECRUTEAK_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE

MapGroup_Blackthorn:
	map BlueForestSpeechHouse, TILESET_TRADITIONAL_HOUSE, INDOOR, BLUE_FOREST, MUSIC_AZALEA_TOWN, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map BlueForestEmysHouse, TILESET_HOUSE, INDOOR, BLUE_FOREST, MUSIC_AZALEA_TOWN, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map BlueForestMart, TILESET_MART, INDOOR, BLUE_FOREST, MUSIC_AZALEA_TOWN, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map BlueForestPokecenter1F, TILESET_POKECENTER, INDOOR, BLUE_FOREST, MUSIC_POKEMON_CENTER, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map MoveDeletersHouse, TILESET_HOUSE, INDOOR, BLUE_FOREST, MUSIC_AZALEA_TOWN, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map BlueForest, TILESET_BATTLE_TOWER, TOWN, BLUE_FOREST, MUSIC_AZALEA_TOWN, FALSE, PALETTE_AUTO, FISHGROUP_NONE
	map Route110, TILESET_BATTLE_TOWER, ROUTE, ROUTE_110, MUSIC_ROUTE_37, FALSE, PALETTE_AUTO, FISHGROUP_OCEAN
	map Route112, TILESET_BATTLE_TOWER, ROUTE, ROUTE_112, MUSIC_ROUTE_36, FALSE, PALETTE_AUTO, FISHGROUP_NONE
	map Route110SandstormHouse, TILESET_HOUSE, INDOOR, ROUTE_110, MUSIC_VIOLET_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map BlueForestGym, TILESET_ELITE_FOUR_ROOM, CAVE, BLUE_FOREST, MUSIC_GYM, TRUE, PALETTE_DAY, FISHGROUP_NONE
	map BlueForestNightmareHouse, TILESET_HOUSE, INDOOR, BLUE_FOREST, MUSIC_AZALEA_TOWN, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map Route111BlueForestGate, TILESET_GATE, GATE, ROUTE_111, MUSIC_ROUTE_36, FALSE, PALETTE_DAY, FISHGROUP_NONE

MapGroup_Cinnabar:
	map FrostpointPokecenter1F, TILESET_POKECENTER, INDOOR, FROSTPOINT_TOWN, MUSIC_POKEMON_CENTER, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map RyukyuCityMeridianPathGate, TILESET_GATE, GATE, MERIDIAN_PATH, MUSIC_ROUTE_3, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map FrostpointTown, TILESET_BATTLE_TOWER, TOWN, FROSTPOINT_TOWN, MUSIC_ECRUTEAK_CITY, FALSE, PALETTE_AUTO, FISHGROUP_REMORAID
	map Route111, TILESET_BATTLE_TOWER, ROUTE, ROUTE_111, MUSIC_ROUTE_36, FALSE, PALETTE_AUTO, FISHGROUP_REMORAID
	map FrostpointMart, TILESET_MART, INDOOR, FROSTPOINT_TOWN, MUSIC_ECRUTEAK_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map PrycesFamilyHouse, TILESET_HOUSE, INDOOR, FROSTPOINT_TOWN, MUSIC_ECRUTEAK_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map FrostpointNameRater, TILESET_HOUSE, INDOOR, FROSTPOINT_TOWN, MUSIC_ECRUTEAK_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE

MapGroup_Cerulean:
	map NagoImposterHouse, TILESET_HOUSE, INDOOR, NAGO_VILLAGE, MUSIC_VIRIDIAN_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map NagoPokecenter1F, TILESET_POKECENTER, INDOOR, NAGO_VILLAGE, MUSIC_POKEMON_CENTER, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map JadeForestSnorlaxRoom, TILESET_FOREST, CAVE, JADE_FOREST, MUSIC_UNION_CAVE, TRUE, PALETTE_NITE, FISHGROUP_NONE
	map MeridianPath, TILESET_JOHTO_MODERN, ROUTE, MERIDIAN_PATH, MUSIC_ROUTE_3, FALSE, PALETTE_AUTO, FISHGROUP_OCEAN
	map NagoVillage, TILESET_JOHTO_MODERN, TOWN, NAGO_VILLAGE, MUSIC_VIRIDIAN_CITY, FALSE, PALETTE_AUTO, FISHGROUP_OCEAN
	map CharredSummit, TILESET_JOHTO_MODERN, ROUTE, CHARRED_SUMMIT, MUSIC_ROUTE_3, FALSE, PALETTE_AUTO, FISHGROUP_NONE
	map ResearchFacilityBackRoom, TILESET_UNDERGROUND, CAVE, ISEN_STRAIT, MUSIC_UNION_CAVE_SLOW, TRUE, PALETTE_NITE, FISHGROUP_NONE
	map ResearchFacilityEntrance, TILESET_UNDERGROUND, CAVE, ISEN_STRAIT, MUSIC_UNION_CAVE_SLOW, TRUE, PALETTE_NITE, FISHGROUP_NONE
	map IsenStrait, TILESET_JOHTO_MODERN, ROUTE, ISEN_STRAIT, MUSIC_ROUTE_3, FALSE, PALETTE_AUTO, FISHGROUP_OCEAN
	map NagoCharmanderHouse, TILESET_HOUSE, INDOOR, NAGO_VILLAGE, MUSIC_VIRIDIAN_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE

MapGroup_Azalea:
	map BirdonPokecenter1F, TILESET_POKECENTER, INDOOR, BIRDON_TOWN, MUSIC_POKEMON_CENTER, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map BirdonCafe, TILESET_POKECOM_CENTER, INDOOR, BIRDON_TOWN, MUSIC_AZALEA_TOWN, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map BirdonMart, TILESET_MART, INDOOR, BIRDON_TOWN, MUSIC_AZALEA_TOWN, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map Route103, TILESET_JOHTO, ROUTE, ROUTE_103, MUSIC_ROUTE_36, FALSE, PALETTE_AUTO, FISHGROUP_NONE
	map BirdonTown, TILESET_JOHTO, TOWN, BIRDON_TOWN, MUSIC_AZALEA_TOWN, FALSE, PALETTE_AUTO, FISHGROUP_NONE
	map Route104, TILESET_JOHTO, ROUTE, ROUTE_104, MUSIC_ROUTE_36, FALSE, PALETTE_AUTO, FISHGROUP_NONE
	map Route105, TILESET_JOHTO, ROUTE, ROUTE_105, MUSIC_ROUTE_36, FALSE, PALETTE_AUTO, FISHGROUP_NONE
	map Route105Route106Gate, TILESET_GATE, GATE, ROUTE_106, MUSIC_ROUTE_36, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map BirdonGym, TILESET_TOWER, INDOOR, BIRDON_TOWN, MUSIC_GYM, TRUE, PALETTE_DAY, FISHGROUP_NONE
	map BirdonEldersHouse, TILESET_TRADITIONAL_HOUSE, INDOOR, BIRDON_TOWN, MUSIC_AZALEA_TOWN, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map BirdonSpeechHouse, TILESET_HOUSE, INDOOR, BIRDON_TOWN, MUSIC_AZALEA_TOWN, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map Route116Gate, TILESET_GATE, GATE, ROUTE_116, MUSIC_ROUTE_36, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map Route104GardenersHouse, TILESET_HOUSE, INDOOR, ROUTE_104, MUSIC_AZALEA_TOWN, FALSE, PALETTE_DAY, FISHGROUP_NONE

MapGroup_LakeOfRage:
	map BoardwalkTeknosGate, TILESET_GATE, GATE, BOARDWALK, MUSIC_LAKE_OF_RAGE, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map BoardwalkSanskritGate, TILESET_GATE, GATE, BOARDWALK, MUSIC_LAKE_OF_RAGE, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map SilentHills, TILESET_FOREST, TOWN, SILENT_HILLS, MUSIC_UNION_CAVE, FALSE, PALETTE_NITE, FISHGROUP_NONE

MapGroup_Violet:
	map Route102, TILESET_BATTLE_TOWER_OUTSIDE, ROUTE, ROUTE_102, MUSIC_ROUTE_30, FALSE, PALETTE_AUTO, FISHGROUP_NONE
	map PagotaCity, TILESET_BATTLE_TOWER_OUTSIDE, TOWN, PAGOTA_CITY, MUSIC_VIOLET_CITY, FALSE, PALETTE_AUTO, FISHGROUP_POND
	map PagotaMart, TILESET_MART, INDOOR, PAGOTA_CITY, MUSIC_VIOLET_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map PagotaGym, TILESET_ELITE_FOUR_ROOM, INDOOR, PAGOTA_CITY, MUSIC_GYM, TRUE, PALETTE_DAY, FISHGROUP_NONE
	map PagotaTrainerSchool, TILESET_LAB, INDOOR, PAGOTA_CITY, MUSIC_VIOLET_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map PagotaNicknameSpeechHouse, TILESET_TRADITIONAL_HOUSE, INDOOR, PAGOTA_CITY, MUSIC_VIOLET_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map PagotaPokecenter1F, TILESET_POKECENTER, INDOOR, PAGOTA_CITY, MUSIC_POKEMON_CENTER, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map Route103WestportGate, TILESET_GATE, GATE, ROUTE_103, MUSIC_ROUTE_36, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map Route112StandCityGate, TILESET_GATE, GATE, ROUTE_112, MUSIC_ROUTE_36, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map Route102WestportGate, TILESET_GATE, GATE, ROUTE_102, MUSIC_ROUTE_30, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map Route102WestportGate2F, TILESET_GATE, GATE, ROUTE_102, MUSIC_ROUTE_30, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map KurtsHouse, TILESET_TRADITIONAL_HOUSE, INDOOR, PAGOTA_CITY, MUSIC_VIOLET_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map EarlsArtHouse, TILESET_TOWER, INDOOR, PAGOTA_CITY, MUSIC_VIOLET_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map BillsFamilysHouse, TILESET_TRADITIONAL_HOUSE, INDOOR, PAGOTA_CITY, MUSIC_VIOLET_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map Route102N64House, TILESET_HOUSE, INDOOR, ROUTE_102, MUSIC_VIOLET_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map DragonsMaw, TILESET_DARK_CAVE, INDOOR, DRAGONS_MAW, MUSIC_DRAGONS_DEN, TRUE, PALETTE_NITE, FISHGROUP_DRATINI

MapGroup_Goldenrod:
	map WestportCity, TILESET_JOHTO, TOWN, WESTPORT_CITY, MUSIC_GOLDENROD_CITY, FALSE, PALETTE_AUTO, FISHGROUP_SHORE
	map WestportBikeShop, TILESET_CHAMPIONS_ROOM, INDOOR, WESTPORT_CITY, MUSIC_GOLDENROD_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map WestportHappinessRater, TILESET_HOUSE, INDOOR, WESTPORT_CITY, MUSIC_GOLDENROD_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map WestportPPSpeechHouse, TILESET_HOUSE, INDOOR, WESTPORT_CITY, MUSIC_GOLDENROD_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map WestportNameRater, TILESET_HOUSE, INDOOR, WESTPORT_CITY, MUSIC_GOLDENROD_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map WestportDeptStore1F, TILESET_MART, INDOOR, WESTPORT_CITY, MUSIC_GOLDENROD_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map WestportDeptStore2F, TILESET_MART, INDOOR, WESTPORT_CITY, MUSIC_GOLDENROD_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map WestportDeptStore3F, TILESET_MART, INDOOR, WESTPORT_CITY, MUSIC_GOLDENROD_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map WestportDeptStore4F, TILESET_MART, INDOOR, WESTPORT_CITY, MUSIC_GOLDENROD_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map WestportDeptStore5F, TILESET_MART, INDOOR, WESTPORT_CITY, MUSIC_GOLDENROD_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map WestportDeptStore6F, TILESET_MART, INDOOR, WESTPORT_CITY, MUSIC_GOLDENROD_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map WestportDeptStoreElevator, TILESET_MART, INDOOR, WESTPORT_CITY, MUSIC_GOLDENROD_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map WestportDeptStoreRoof, TILESET_MART, INDOOR, WESTPORT_CITY, MUSIC_GOLDENROD_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map WestpointPokecenter1F, TILESET_POKECENTER, INDOOR, WESTPORT_CITY, MUSIC_POKEMON_CENTER, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map Route115KantoGate, TILESET_GATE, GATE, ROUTE_115, MUSIC_ROUTE_26, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map Route113Route114Gate, TILESET_GATE, GATE, ROUTE_113, MUSIC_ROUTE_36, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map WestportUnderground, TILESET_GATE, GATE, WESTPORT_CITY, MUSIC_GOLDENROD_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map RadioTower1F, TILESET_RADIO_TOWER, INDOOR, RADIO_TOWER, RADIO_TOWER_MUSIC | MUSIC_GOLDENROD_CITY, TRUE, PALETTE_DAY, FISHGROUP_NONE
	map RadioTower2F, TILESET_RADIO_TOWER, INDOOR, RADIO_TOWER, RADIO_TOWER_MUSIC | MUSIC_GOLDENROD_CITY, TRUE, PALETTE_DAY, FISHGROUP_NONE
	map RadioTower3F, TILESET_RADIO_TOWER, INDOOR, RADIO_TOWER, RADIO_TOWER_MUSIC | MUSIC_GOLDENROD_CITY, TRUE, PALETTE_DAY, FISHGROUP_NONE
	map RadioTower4F, TILESET_RADIO_TOWER, INDOOR, RADIO_TOWER, RADIO_TOWER_MUSIC | MUSIC_GOLDENROD_CITY, TRUE, PALETTE_DAY, FISHGROUP_NONE
	map RadioTower5F, TILESET_RADIO_TOWER, INDOOR, RADIO_TOWER, RADIO_TOWER_MUSIC | MUSIC_GOLDENROD_CITY, TRUE, PALETTE_DAY, FISHGROUP_NONE
	map RadioTower6F, TILESET_RADIO_TOWER, INDOOR, RADIO_TOWER, RADIO_TOWER_MUSIC | MUSIC_GOLDENROD_CITY, TRUE, PALETTE_DAY, FISHGROUP_NONE
	map WestportGym, TILESET_ELITE_FOUR_ROOM, INDOOR, WESTPORT_CITY, MUSIC_GYM, TRUE, PALETTE_DAY, FISHGROUP_NONE
	map WestportPortPassage, TILESET_UNDERGROUND, INDOOR, WESTPORT_CITY, MUSIC_GOLDENROD_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE

MapGroup_Vermilion:
	map AmamiTown, TILESET_PARK, TOWN, AMAMI_TOWN, MUSIC_VERMILION_CITY, FALSE, PALETTE_AUTO, FISHGROUP_OCEAN
	map AmamiFishingSpeechHouse, TILESET_HOUSE, INDOOR, AMAMI_TOWN, MUSIC_VERMILION_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map AmamiPokecenter1F, TILESET_POKECENTER, INDOOR, AMAMI_TOWN, MUSIC_POKEMON_CENTER, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map AmamiMart, TILESET_MART, INDOOR, AMAMI_TOWN, MUSIC_VERMILION_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map NagoSpeechHouse, TILESET_HOUSE, INDOOR, AMAMI_TOWN, MUSIC_VERMILION_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map AmamiSwimmingPool, TILESET_POKECOM_CENTER, INDOOR, AMAMI_TOWN, MUSIC_VERMILION_CITY, TRUE, PALETTE_DAY, FISHGROUP_NONE
	map RyukyuUrasoeGate, TILESET_GATE, GATE, URASOE_PARK, MUSIC_ROUTE_3, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map SeasidePath, TILESET_PARK, ROUTE, SEASIDE_PATH, MUSIC_ROUTE_3, FALSE, PALETTE_AUTO, FISHGROUP_OCEAN
	map UrasoeTrailSuperRodHouse, TILESET_HOUSE, INDOOR, AMAMI_TOWN, MUSIC_VERMILION_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE

MapGroup_Pallet:
	map KobanIsland, TILESET_PARK, TOWN, KOBAN_ISLAND, MUSIC_ECRUTEAK_CITY, FALSE, PALETTE_AUTO, FISHGROUP_OCEAN
	map KobanPokecenter1F, TILESET_POKECENTER, INDOOR, KOBAN_ISLAND, MUSIC_POKEMON_CENTER, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map KobanMart, TILESET_MART, INDOOR, KOBAN_ISLAND, MUSIC_ECRUTEAK_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map KobanFisherHouse, TILESET_TRADITIONAL_HOUSE, INDOOR, KOBAN_ISLAND, MUSIC_ECRUTEAK_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map KobanClairsHouse, TILESET_HOUSE, INDOOR, KOBAN_ISLAND, MUSIC_ECRUTEAK_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map Route107, TILESET_PARK, ROUTE, ROUTE_107, MUSIC_ROUTE_36, FALSE, PALETTE_AUTO, FISHGROUP_OCEAN

MapGroup_Pewter:
	map YoronCity, TILESET_JOHTO_MODERN, TOWN, YORON_CITY, MUSIC_VIRIDIAN_CITY, FALSE, PALETTE_AUTO, FISHGROUP_QWILFISH_NO_SWARM
	map YoronPartsShop, TILESET_CHAMPIONS_ROOM, INDOOR, YORON_CITY, MUSIC_VIRIDIAN_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map YoronSocialHouse, TILESET_HOUSE, INDOOR, YORON_CITY, MUSIC_VIRIDIAN_CITY, TRUE, PALETTE_DAY, FISHGROUP_NONE
	map YoronPokecenter1F, TILESET_POKECENTER, INDOOR, YORON_CITY, MUSIC_POKEMON_CENTER, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map YoronSnoozeSpeechHouse, TILESET_HOUSE, INDOOR, YORON_CITY, MUSIC_VIRIDIAN_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map NagoMart, TILESET_MART, INDOOR, YORON_CITY, MUSIC_VIRIDIAN_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map UrasoeTrail, TILESET_JOHTO_MODERN, ROUTE, URASOE_TRAIL, MUSIC_ROUTE_12, FALSE, PALETTE_AUTO, FISHGROUP_QWILFISH_NO_SWARM
	map KeramaStrait, TILESET_JOHTO_MODERN, ROUTE, KERAMA_STRAIT, MUSIC_ROUTE_12, FALSE, PALETTE_AUTO, FISHGROUP_QWILFISH_NO_SWARM
	map YoronPoint, TILESET_JOHTO_MODERN, ROUTE, YORON_POINT, MUSIC_ROUTE_12, FALSE, PALETTE_AUTO, FISHGROUP_QWILFISH_NO_SWARM

MapGroup_FastShip:
	map WestportPort, TILESET_PORT, ROUTE, WESTPORT_CITY, MUSIC_GOLDENROD_CITY, FALSE, PALETTE_AUTO, FISHGROUP_OCEAN
	map TeknosPort, TILESET_PORT, ROUTE, TEKNOS_CITY, MUSIC_ECRUTEAK_CITY, FALSE, PALETTE_AUTO, FISHGROUP_OCEAN
	map AmamiPort, TILESET_PORT, ROUTE, AMAMI_TOWN, MUSIC_VERMILION_CITY, FALSE, PALETTE_AUTO, FISHGROUP_OCEAN
	map FastShip1F, TILESET_LIGHTHOUSE, INDOOR, FAST_SHIP, MUSIC_SS_AQUA, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map FastShipCabins_NNW_NNE_NE, TILESET_LIGHTHOUSE, INDOOR, FAST_SHIP, MUSIC_SS_AQUA, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map FastShipCabins_SW_SSW_NW, TILESET_LIGHTHOUSE, INDOOR, FAST_SHIP, MUSIC_SS_AQUA, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map FastShipCabins_SE_SSE_CaptainsCabin, TILESET_LIGHTHOUSE, INDOOR, FAST_SHIP, MUSIC_SS_AQUA, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map FastShipB1F, TILESET_LIGHTHOUSE, INDOOR, FAST_SHIP, MUSIC_SS_AQUA, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map AmamiPortPassage, TILESET_UNDERGROUND, INDOOR, AMAMI_TOWN, MUSIC_VERMILION_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map BrassTowerRoof, TILESET_TOWER, ROUTE, BRASS_TOWER, MUSIC_TIN_TOWER, FALSE, PALETTE_AUTO, FISHGROUP_NONE

MapGroup_Indigo:
	map NihonLeague, TILESET_JOHTO_MODERN, TOWN, NIHON_LEAGUE, MUSIC_INDIGO_PLATEAU, FALSE, PALETTE_AUTO, FISHGROUP_NONE
	map NihonLeaguePokecenter1F, TILESET_POKECENTER, INDOOR, NIHON_LEAGUE, MUSIC_INDIGO_PLATEAU, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map LoreleisRoom, TILESET_ELITE_FOUR_ROOM, INDOOR, NIHON_LEAGUE, MUSIC_INDIGO_PLATEAU, TRUE, PALETTE_DAY, FISHGROUP_NONE
	map KogasRoom, TILESET_ELITE_FOUR_ROOM, INDOOR, NIHON_LEAGUE, MUSIC_INDIGO_PLATEAU, TRUE, PALETTE_DAY, FISHGROUP_NONE
	map AgathasRoom, TILESET_ELITE_FOUR_ROOM, INDOOR, NIHON_LEAGUE, MUSIC_INDIGO_PLATEAU, TRUE, PALETTE_DAY, FISHGROUP_NONE
	map GiovannisRoom, TILESET_ELITE_FOUR_ROOM, INDOOR, NIHON_LEAGUE, MUSIC_INDIGO_PLATEAU, TRUE, PALETTE_DAY, FISHGROUP_NONE
	map LancesRoom, TILESET_CHAMPIONS_ROOM, INDOOR, NIHON_LEAGUE, MUSIC_INDIGO_PLATEAU, TRUE, PALETTE_DAY, FISHGROUP_NONE
	map HallOfFame, TILESET_ICE_PATH, INDOOR, NIHON_LEAGUE, MUSIC_SILENT_TOWN, TRUE, PALETTE_DAY, FISHGROUP_NONE

MapGroup_Fuchsia:
	map StandCity, TILESET_JOHTO_MODERN, TOWN, STAND_CITY, MUSIC_CHERRYGROVE_CITY, FALSE, PALETTE_AUTO, FISHGROUP_NONE
	map StandMart, TILESET_MART, INDOOR, STAND_CITY, MUSIC_CHERRYGROVE_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map StandZooMainOffice, TILESET_RADIO_TOWER, INDOOR, STAND_CITY, MUSIC_CHERRYGROVE_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map BillsBrothersHouse, TILESET_HOUSE, INDOOR, STAND_CITY, MUSIC_CHERRYGROVE_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map StandPokecenter1F, TILESET_POKECENTER, INDOOR, STAND_CITY, MUSIC_POKEMON_CENTER, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map StandRocketHouse1F, TILESET_POKECOM_CENTER, INDOOR, STAND_CITY, MUSIC_ROCKET_HIDEOUT, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map StandRocketHouse2F, TILESET_POKECOM_CENTER, INDOOR, STAND_CITY, MUSIC_ROCKET_HIDEOUT, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map Route113, TILESET_JOHTO_MODERN, ROUTE, ROUTE_113, MUSIC_ROUTE_36, FALSE, PALETTE_AUTO, FISHGROUP_SHORE
	map StandGym, TILESET_TOWER, INDOOR, STAND_CITY, MUSIC_GYM, TRUE, PALETTE_NITE, FISHGROUP_NONE
	map StandZooInfirmary, TILESET_POKECENTER, INDOOR, STAND_CITY, MUSIC_CHERRYGROVE_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map NationalParkStandGate, TILESET_GATE, INDOOR, NATIONAL_PARK, MUSIC_NATIONAL_PARK, FALSE, PALETTE_DAY, FISHGROUP_NONE

MapGroup_Lavender:
	map UrasoeParkUrasoeTrailGate, TILESET_GATE, GATE, URASOE_PARK, MUSIC_ROUTE_3, FALSE, PALETTE_DAY, FISHGROUP_NONE

MapGroup_CableClub:
	map Pokecenter2F, TILESET_POKECENTER, INDOOR, SPECIAL_MAP, MUSIC_POKEMON_CENTER, TRUE, PALETTE_DAY, FISHGROUP_NONE
	map TradeCenter, TILESET_GATE, INDOOR, SPECIAL_MAP, MUSIC_CHERRYGROVE_CITY, TRUE, PALETTE_DAY, FISHGROUP_NONE
	map Colosseum, TILESET_GATE, INDOOR, SPECIAL_MAP, MUSIC_CHERRYGROVE_CITY, TRUE, PALETTE_DAY, FISHGROUP_NONE
	map TimeCapsule, TILESET_GATE, INDOOR, SPECIAL_MAP, MUSIC_CHERRYGROVE_CITY, TRUE, PALETTE_DAY, FISHGROUP_NONE
	map MobileTradeRoom, TILESET_MANSION, INDOOR, SPECIAL_MAP, MUSIC_CHERRYGROVE_CITY, TRUE, PALETTE_DAY, FISHGROUP_NONE
	map MobileBattleRoom, TILESET_MANSION, INDOOR, SPECIAL_MAP, MUSIC_CHERRYGROVE_CITY, TRUE, PALETTE_DAY, FISHGROUP_NONE

MapGroup_Celadon:
	map KantoRegion, TILESET_KANTO, TOWN, KANTO_REGION_M, MUSIC_VIRIDIAN_CITY, FALSE, PALETTE_AUTO, FISHGROUP_SHORE
	map KantoDeptStore1F, TILESET_MART, INDOOR, KANTO_REGION_M, MUSIC_VIRIDIAN_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map KantoDeptStore2F, TILESET_MART, INDOOR, KANTO_REGION_M, MUSIC_VIRIDIAN_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map KantoDeptStore3F, TILESET_MART, INDOOR, KANTO_REGION_M, MUSIC_VIRIDIAN_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map KantoDeptStore4F, TILESET_MART, INDOOR, KANTO_REGION_M, MUSIC_VIRIDIAN_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map KantoDeptStore5F, TILESET_MART, INDOOR, KANTO_REGION_M, MUSIC_VIRIDIAN_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map KantoDeptStore6F, TILESET_MART, INDOOR, KANTO_REGION_M, MUSIC_VIRIDIAN_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map KantoDeptStoreElevator, TILESET_MART, INDOOR, KANTO_REGION_M, MUSIC_VIRIDIAN_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map KantoCeladonMansion1F, TILESET_MANSION, INDOOR, KANTO_REGION_M, MUSIC_VIRIDIAN_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map KantoCeladonMansion2F, TILESET_MANSION, INDOOR, KANTO_REGION_M, MUSIC_VIRIDIAN_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map KantoCeladonMansion3F, TILESET_MANSION, INDOOR, KANTO_REGION_M, MUSIC_VIRIDIAN_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map KantoCeladonMansionRoof, TILESET_MANSION, INDOOR, KANTO_REGION_M, MUSIC_VIRIDIAN_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map KantoCeladonMansionRoofHouse, TILESET_MANSION, INDOOR, KANTO_REGION_M, MUSIC_VIRIDIAN_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map KantoPokecenterWest1F, TILESET_POKECENTER, INDOOR, KANTO_REGION_M, MUSIC_POKEMON_CENTER, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map KantoGameCorner, TILESET_GAME_CORNER, INDOOR, KANTO_REGION_M, MUSIC_GAME_CORNER, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map KantoGameCornerPrizeRoom, TILESET_GAME_CORNER, INDOOR, KANTO_REGION_M, MUSIC_VIRIDIAN_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map KantoGym, TILESET_ELITE_FOUR_ROOM, INDOOR, KANTO_REGION_M, MUSIC_GYM, TRUE, PALETTE_DAY, FISHGROUP_NONE
	map KantoLeftoversHouse, TILESET_GAME_CORNER, INDOOR, KANTO_REGION_M, MUSIC_VIRIDIAN_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map IsenStraitSeasidePathGate, TILESET_GATE, GATE, URASOE_PARK, MUSIC_ROUTE_3, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map Route114, TILESET_KANTO, ROUTE, ROUTE_114, MUSIC_ROUTE_3, FALSE, PALETTE_AUTO, FISHGROUP_NONE
	map SilphCo1F, TILESET_POKECOM_CENTER, INDOOR, KANTO_REGION_M, MUSIC_VIRIDIAN_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map KantoHotel, TILESET_MART, INDOOR, KANTO_REGION_M, MUSIC_VIRIDIAN_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map OaksLabKanto, TILESET_LAB, INDOOR, KANTO_REGION_M, MUSIC_VIRIDIAN_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map BluesHouse, TILESET_HOUSE, INDOOR, KANTO_REGION_M, MUSIC_VIRIDIAN_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map RedsHouse1F, TILESET_PLAYERS_HOUSE, INDOOR, KANTO_REGION_M, MUSIC_VIRIDIAN_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map RedsHouse2F, TILESET_PLAYERS_HOUSE, INDOOR, KANTO_REGION_M, MUSIC_VIRIDIAN_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map KantoPokecenter1F, TILESET_POKECENTER, INDOOR, KANTO_REGION_M, MUSIC_POKEMON_CENTER, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map KantoMart, TILESET_MART, INDOOR, KANTO_REGION_M, MUSIC_VIRIDIAN_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map KantoBattleClub1F, TILESET_GATE, INDOOR, KANTO_REGION_M, MUSIC_VIRIDIAN_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map KantoBattleClubB1F, TILESET_GATE, INDOOR, KANTO_REGION_M, MUSIC_VIRIDIAN_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map KantoHouse1, TILESET_HOUSE, INDOOR, KANTO_REGION_M, MUSIC_VIRIDIAN_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map KantoHouse2, TILESET_HOUSE, INDOOR, KANTO_REGION_M, MUSIC_VIRIDIAN_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map KantoHouse3, TILESET_HOUSE, INDOOR, KANTO_REGION_M, MUSIC_VIRIDIAN_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map KantoHouse4, TILESET_HOUSE, INDOOR, KANTO_REGION_M, MUSIC_VIRIDIAN_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map KantoFossilLab, TILESET_LAB, INDOOR, KANTO_REGION_M, MUSIC_VIRIDIAN_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map KantoCafe, TILESET_GAME_CORNER, INDOOR, KANTO_REGION_M, MUSIC_VIRIDIAN_CITY, TRUE, PALETTE_DAY, FISHGROUP_NONE
	map DiglettsCave, TILESET_CAVE, CAVE, KANTO_REGION_M, MUSIC_MT_MOON, TRUE, PALETTE_NITE, FISHGROUP_SHORE
	map RockTunnel1F, TILESET_DARK_CAVE, CAVE, KANTO_REGION_M, MUSIC_MT_MOON, TRUE, PALETTE_DARK, FISHGROUP_SHORE
	map RockTunnelB1F, TILESET_DARK_CAVE, CAVE, KANTO_REGION_M, MUSIC_MT_MOON, TRUE, PALETTE_DARK, FISHGROUP_SHORE
	map MountMoon, TILESET_CAVE, CAVE, KANTO_REGION_M, MUSIC_MT_MOON, TRUE, PALETTE_NITE, FISHGROUP_SHORE
	map MountMoonSquare, TILESET_KANTO, ROUTE, KANTO_REGION_M, MUSIC_MT_MOON_SQUARE, FALSE, PALETTE_AUTO, FISHGROUP_SHORE
	map MountMoonGiftShop, TILESET_TRADITIONAL_HOUSE, INDOOR, KANTO_REGION_M, MUSIC_VIRIDIAN_CITY, FALSE, PALETTE_DAY, FISHGROUP_SHORE
	map KantoVictoryRoad, TILESET_CAVE, CAVE, KANTO_REGION_M, MUSIC_VICTORY_ROAD, TRUE, PALETTE_NITE, FISHGROUP_SHORE
	map SafariZoneFuchsiaGateBeta, TILESET_GATE, INDOOR, KANTO_REGION_M, MUSIC_VIRIDIAN_CITY, FALSE, PALETTE_DAY, FISHGROUP_SHORE
	map SafariZoneBeta, TILESET_FOREST, CAVE, KANTO_REGION_M, MUSIC_EVOLUTION, FALSE, PALETTE_AUTO, FISHGROUP_SHORE

MapGroup_Cianwood:
	map SunpointCity, TILESET_BATTLE_TOWER_OUTSIDE, TOWN, SUNPOINT_CITY, MUSIC_AZALEA_TOWN, FALSE, PALETTE_AUTO, FISHGROUP_OCEAN
	map SunpointPokecenter1F, TILESET_POKECENTER, INDOOR, SUNPOINT_CITY, MUSIC_POKEMON_CENTER, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map SunpointPhotoStudio, TILESET_HOUSE, INDOOR, SUNPOINT_CITY, MUSIC_AZALEA_TOWN, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map PokeSeersHouse, TILESET_HOUSE, INDOOR, SUNPOINT_CITY, MUSIC_AZALEA_TOWN, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map BattleTower1F, TILESET_POKECENTER, INDOOR, BATTLE_TOWER, MUSIC_BATTLE_TOWER_LOBBY, TRUE, PALETTE_DAY, FISHGROUP_NONE
	map BattleTowerBattleRoom, TILESET_POKECENTER, INDOOR, BATTLE_TOWER, MUSIC_BATTLE_TOWER_THEME, TRUE, PALETTE_DAY, FISHGROUP_NONE
	map BattleTowerElevator, TILESET_POKECENTER, INDOOR, BATTLE_TOWER, MUSIC_NONE, TRUE, PALETTE_DAY, FISHGROUP_NONE
	map BattleTowerHallway, TILESET_POKECENTER, INDOOR, BATTLE_TOWER, MUSIC_BATTLE_TOWER_THEME, TRUE, PALETTE_DAY, FISHGROUP_NONE
	map BattleTowerOutside, TILESET_BATTLE_TOWER_OUTSIDE, ROUTE, BATTLE_TOWER, MUSIC_BATTLE_TOWER_THEME, FALSE, PALETTE_AUTO, FISHGROUP_NONE
	map SunpointDocks, TILESET_PORT, ROUTE, SUNPOINT_DOCKS, MUSIC_LAKE_OF_RAGE, FALSE, PALETTE_AUTO, FISHGROUP_OCEAN
	map SunPointDocksSunPointGate, TILESET_GATE, GATE, SUNPOINT_DOCKS, MUSIC_LAKE_OF_RAGE, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map YoronMart, TILESET_MART, INDOOR, SUNPOINT_CITY, MUSIC_AZALEA_TOWN, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map Route119SunpointGate, TILESET_GATE, GATE, ROUTE_119, MUSIC_ROUTE_30, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map RocketShipBase, TILESET_LIGHTHOUSE, INDOOR, SUNPOINT_DOCKS, MUSIC_ROCKET_HIDEOUT, TRUE, PALETTE_DAY, FISHGROUP_NONE

MapGroup_Viridian:
	map VictoryRoadGate, TILESET_GATE, GATE, VICTORY_ROAD, MUSIC_INDIGO_PLATEAU, FALSE, PALETTE_DAY, FISHGROUP_NONE

MapGroup_NewBark:
	map Route115, TILESET_JOHTO_MODERN, ROUTE, ROUTE_115, MUSIC_ROUTE_26, FALSE, PALETTE_AUTO, FISHGROUP_SHORE
	map Route101, TILESET_JOHTO_MODERN, ROUTE, ROUTE_101, MUSIC_ROUTE_29, FALSE, PALETTE_AUTO, FISHGROUP_NONE
	map SilentTown, TILESET_JOHTO_MODERN, TOWN, SILENT_TOWN, MUSIC_SILENT_TOWN, FALSE, PALETTE_AUTO, FISHGROUP_NONE
	map OaksLabEntrance, TILESET_LAB, INDOOR, SILENT_TOWN, MUSIC_POKEMON_TALK, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map OaksLab, TILESET_LAB, INDOOR, SILENT_TOWN, MUSIC_POKEMON_TALK, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map PlayersHouse1F, TILESET_PLAYERS_HOUSE, INDOOR, SILENT_TOWN, MUSIC_SILENT_TOWN, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map PlayersHouse2F, TILESET_PLAYERS_ROOM, INDOOR, SILENT_TOWN, MUSIC_SILENT_TOWN, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map SilentHouse, TILESET_PLAYERS_HOUSE, INDOOR, SILENT_TOWN, MUSIC_SILENT_TOWN, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map SilentPokecenter1F, TILESET_POKECENTER, INDOOR, SILENT_TOWN, MUSIC_POKEMON_CENTER, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map Route101PagotaGate, TILESET_GATE, GATE, ROUTE_101, MUSIC_ROUTE_29, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map Route101PagotaGate2F, TILESET_GATE, GATE, ROUTE_101, MUSIC_ROUTE_29, FALSE, PALETTE_DAY, FISHGROUP_NONE

MapGroup_Saffron:
	map RyukyuCity, TILESET_BATTLE_TOWER_OUTSIDE, TOWN, RYUKYU_CITY, MUSIC_VIRIDIAN_CITY, FALSE, PALETTE_AUTO, FISHGROUP_SHORE
	map RyukyuFakeGym, TILESET_ICE_PATH, INDOOR, RYUKYU_CITY, MUSIC_GYM, TRUE, PALETTE_DAY, FISHGROUP_NONE
	map RyukyuMart, TILESET_MART, INDOOR, RYUKYU_CITY, MUSIC_VIRIDIAN_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map RyukyuPokecenter1F, TILESET_POKECENTER, INDOOR, RYUKYU_CITY, MUSIC_POKEMON_CENTER, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map MrPsychicsHouse, TILESET_HOUSE, INDOOR, RYUKYU_CITY, MUSIC_VIRIDIAN_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map RyukyuArboretum, TILESET_BATTLE_TOWER_OUTSIDE, INDOOR, RYUKYU_CITY, MUSIC_VIRIDIAN_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map UrasoePark, TILESET_BATTLE_TOWER_OUTSIDE, ROUTE, URASOE_PARK, MUSIC_ROUTE_3, FALSE, PALETTE_AUTO, FISHGROUP_NONE
	map RyukyuTradeSpeechHouse, TILESET_HOUSE, INDOOR, RYUKYU_CITY, MUSIC_VIRIDIAN_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE

MapGroup_Cherrygrove:
	map CrownMart, TILESET_MART, INDOOR, CROWN_CITY, MUSIC_CHERRYGROVE_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map CrownPokecenter1F, TILESET_POKECENTER, INDOOR, CROWN_CITY, MUSIC_POKEMON_CENTER, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map CrownCity, TILESET_JOHTO_MODERN, TOWN, CROWN_CITY, MUSIC_CHERRYGROVE_CITY, FALSE, PALETTE_AUTO, FISHGROUP_SHORE
	map VictoryRoadOutside, TILESET_JOHTO_MODERN, ROUTE, VICTORY_ROAD, MUSIC_VICTORY_ROAD, FALSE, PALETTE_AUTO, FISHGROUP_NONE
	map CrownCityScopeLensHouse, TILESET_HOUSE, INDOOR, CROWN_CITY, MUSIC_CHERRYGROVE_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map CrownCitySpeechHouse, TILESET_HOUSE, INDOOR, CROWN_CITY, MUSIC_CHERRYGROVE_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
	map CrownCityTrainerHouse, TILESET_LAB, INDOOR, CROWN_CITY, MUSIC_CHERRYGROVE_CITY, FALSE, PALETTE_DAY, FISHGROUP_NONE
