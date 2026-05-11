landmark: MACRO
; x, y, name
	db \1 + 8, \2 + 16
	dw \3
ENDM

Landmarks:
; entries correspond to constants/landmark_constants.asm
	dbbw       0,   0, SpecialMapName
	landmark  100, 116, SilentTownName
	landmark  92, 116, Route101Name
	landmark  84, 116, SilentHillsName
	landmark  84, 100, PagotaCityName
	landmark  83,  99, BrassTowerName
	landmark  72, 100, Route102Name
	landmark  60, 100, WestportCityName
	landmark  59,  99, RadioTowerName
	landmark  60,  84, Route103Name
	landmark  60,  68, BirdonTownName
	landmark  59,  67, SlowpokeWellName
	landmark  60,  60, Route116Name
	landmark  52,  60, Route117Name
	landmark  52,  52, EndonCaveName
	landmark  44,  60, SanskritTownName
	landmark  44,  52, RuinsOfAlphName
	landmark  50,  48, TidalGrottoName
	landmark  32,  60, Route118Name
	landmark  20,  60, SunpointCityName
	landmark  19,  59, MagmaShaftName
	landmark  20,  52, SunpointDocksName
	landmark  20,  76, Route119Name
	landmark  28,  92, BoulderMinesName
	landmark  36,  92, Route120Name
	landmark  44,  92, TeknosCityName
	landmark  44,  76, BoardwalkName
	landmark  76,  68, Route104Name
	landmark  92,  68, Route105Name
	landmark  92,  76, JadeForestName
	landmark 100,  76, Route106Name
	landmark 108,  76, AlloyCityName
	landmark 108,  64, Route107Name
	landmark 108,  52, KobanIslandName
	landmark 107,  51, DragonsMawName
	landmark 116,  76, Route108Name
	landmark 124,  68, Route109Name
	landmark 124,  60, AmpareCavernName
	landmark 128,  52, Route110Name
	landmark 140,  52, BlueForestName
	landmark 136,  46, DeepwaterPassageName
	landmark 140,  40, Route111Name
	landmark 132,  36, WhirlIslandName
	landmark 140,  28, FrostpointTownName
	landmark 140,  68, Route112Name
	landmark 140,  84, StandCityName
	landmark 132,  84, NationalParkName
	landmark 140, 100, Route113Name
	landmark 132, 116, Route114Name
	landmark 124, 116, KantoRegionName
	landmark 108, 116, Route115Name
	landmark 100, 108, CrownPassName
	landmark 100, 100, CrownCityName
	landmark  96,  96, VictoryRoadName
	landmark 100,  92, NihonLeagueName
	landmark  20, 124, RainbowIslandName
	landmark  52, 124, TropicalIslandName
	landmark  36, 112, ForkedStraitName
	landmark  36,  92, IcedCavernName
	landmark  36, 100, KumeCityName
	landmark  44, 100, KumePointName
	landmark  60, 100, KeramaStraitName
	landmark  148,  92, AppleOrchardName
	landmark  148, 100, DaitoRanchName
	landmark  116, 100, GreatEastStraitName
	landmark  84, 100, NanjoForestName
	landmark  76,  96, UrasoeTrailName
	landmark  76,  84, UrasoeParkName
	landmark  76,  76, RyukyuCityName
	landmark  92,  68, CharredSummitName
	landmark  84,  68, MeridianPathName
	landmark  44,  44, CastleMountainName
	landmark  44,  52, IeTownName
	landmark  68,  52, MotobuPathName
	landmark  84,  52, NagoVillageName
	landmark  96,  52, IsenStraitName
	landmark 112,  52, SeasidePathName
	landmark 124,  52, JouleCaveName
	landmark 148, 28,  KikaiCalderaName
	landmark 140, 36,  KikaiVillageName
	landmark 140, 44,  KikaiStraitName
	landmark 132, 44,  TatsugoPathName  
	landmark 118,  44, BattleTowerName
	landmark 116,  44, AmamiCityName
	landmark  36, 124, FastShipName
	; the formula to get these numbers from the X/Y in tilemap studio is: (X or Y) * 8 + 4

AlloyCityName:          db "GENEOS¯CITY@"       ; Genus (lat. Gattung) + neos (griech. neu)
AmamiCityName:          db "AMAMIA@"            ; NICHT FINAL Amami - Ort in Ryukyu
AmpareCavernName:       db "AMPERA¯HÖHLE@"
AppleOrchardName:       db "APFELGARTEN@"
BattleTowerName:        db "DUELLTURM@"
BirdonTownName:         db "TOTOMONIA@"         ; Tottori + Flegmon
BlueForestName:         db "KITAOMORIA¯CITY@"   ; Kita (jap. Norden) + ao (jap. Blau) + mori (jap. Wald)
BoardwalkName:          db "PROMENADE@"
BoulderMineName:        db "GERÖLLMINE@"        ;
BrassTowerName:         db "MESSINGTURM@"
CastleMountainName:     db "SCHLOSS-BERG@"      ; NICHT FINAL
CharredSummitName:      db "RUẞGIPFEL@"         ;
CrownCityName:          db "KOROKANIA CITY@"    ; Coroa (port. Krone) + oukan (jap. Krone)
CrownPassName:          db "KOROKANIA-PFAD@"
DaitoRanchName:         db "DAITO RANCH@"       ; NICHT FINAL Daito - Ort in Ryukyu
DeepwaterPassageName:   db "TIEFWASSERPFAD@"    ;
DragonsDenName:         db "DRACHENSCHLUND@"    ;
EndonCaveName:          db "ENDON HÖHLE@"       ; NICHT FINAL Endon vielleicht von "No End" ?
FastShipName:           db "SCHNELLBOOT@"
ForkedStraitName:       db "MEERESGABELUNG@"    ;
FrostpointTownName:     db "SPIZARDIA@"         ; Spitze + Blizzard     NICHT FINAL
GreatEastStraitName:    db "AGARIDINO-STRAẞE@"  ; ufuagari (okinawa. äußerster Osten) + Borodino (europ. Name für Daito-Inseln)
IcedCavernName:         db "GEFRIERGROTTE@"     ; alt. FROSTHÖHLE
IeTownName:             db "II-SHIMA@"          ; okinawa. Iejima - eine der Ryukyu Inseln
IsenStraitName:         db "ISEN-STRAẞE@"       ;
JadeForestName:         db "JADEWALD@"
JouleCaveName:          db "JOULEHÖHLE@"
KantoRegionName:        db "KANTO-REGION@"      ; alt. Kanto
KeramaStraitName:       db "STRAẞE VON KIRAMA@"     ; okinawa. für Kerama - Inselgruppe in Ryukyu
KikaiCalderaName:       db "KIKAI KESSEL@"      ; Caldera (span. Kessel) ggf. aber auch Caldera, da Fachbegriff
KikaiStraitName:        db "STRAẞE VON KIKAI@"  ; Kikai - Ort in Ryukyu
KikaiVillageName:       db "KIKAITANI@"         ; Kikai - Ort in Ryukyu + tanima (jap. Tal)
KobanIslandName:        db "SATORIA-INSEL@"     ; Satou (jap. Zucker)    alt. Satoria Eiland
KumeCityName:           db "KUMIA CITY@"        ; Kumijima (okinawaisch für Kume-jima) - Eine Ryukyu-Insel
KumePointName:          db "KUMIA-SPITZE@"      ;
MagmaShaftName:         db "MAGMA-SCHACHT@"
MeridianPathName:       db "MERIDIAN-PFAD@"
MotobuPathName:         db "MUTUBU-PFAD@"       ; okinawa. Motobu - Ort in Ryukyu
NagoVillageName:        db "NAGOTANI@"          ; Nago - Stadt auf Okinawa + tanima (jap. Tal)
NanjoForestName:        db "NANJUU-WALD@"       ; Nanchuu /Nanjuu - okinawa. für Nanjo
NationalParkName:       db "NATIONALPARK@"      ;
NihonLeagueName:        db "NIHON¯LIGA@"
PagotaCityName:         db "PAGETIA CITY@"      ; Pagode + vetus (lat. alt)
RadioTowerName:         db "RADIOTURM@"         ;
RainbowIslandName:      db "REGENBOGENINSEL@"
RuinsOfAlphName:        db "ALPH-RUINEN@"       ; doch GLYPHONTIA-RUINEN?
RyukyuCityName:         db "RUUCHUU CITY@"      ; Ruuchuu - ryukyu für Ryukyu
SanskritTownName:       db "GLYPHONTIA@"        ; Glyphe + Font
SeasidePathName:        db "KÜSTENPFAD@"
SilentHillsName:        db "SILENITIA HÜGEL@"
SilentTownName:         db "SILENITIA@"         ; Silens (lat. Stille) + initium (lat. Anfang)
SlowpokeWellName:       db "FLEGMON-BRUNNEN@"   ;
StandCityName:          db "SENDESTIA CITY@"    ; Sendai + Podest
SunpointCityName:       db "KAZANAMI CITY@"     ; Kazan (jap. Vulkan) + Minami (jap. Süden)
SunpointDocksName:      db "KAZANAMI DOCKS@"
TatsugoPathName:        db "TATSUGO PFAD@"      ; Tatsugo - Ort in Ryukyu
TeknosCityName:         db "TEKNOPIA CITY@"     ; Teknos (griech. Technik) + Utopia
TidalGrottoName:        db "GEZEITENGROTTE@"
TropicalIslandName:     db "TROPENINSEL@"
UrasoeParkName:         db "URASHI-PARK@"       ; okinawa. für Urasoe - Stadt auf Okinawa
UrasoeTrailName:        db "URASHI-WANDERWEG@"  ;
VictoryRoadName:        db "SIEGESSTRAẞE@"
WestportCityName:       db "PORT ABANISHI@"     ; Port (alt. Hafen) + Abanti (ahd. Abend bzw. Westen) + Nishi (jap. Westen)     evtl. PORT ABANTIA
WhirlIslandsName:       db "STRUDELINSEL@"      ;


Route101Name:           db "ROUTE 101@"
Route102Name:           db "ROUTE 102@"
Route103Name:           db "ROUTE 103@"
Route104Name:           db "ROUTE 104@"
Route105Name:           db "ROUTE 105@"
Route106Name:           db "ROUTE 106@"
Route107Name:           db "ROUTE 107@"
Route108Name:           db "ROUTE 108@"
Route109Name:           db "ROUTE 109@"
Route110Name:           db "ROUTE 110@"
Route111Name:           db "ROUTE 111@"
Route112Name:           db "ROUTE 112@"
Route113Name:           db "ROUTE 113@"
Route114Name:           db "ROUTE 114@"
Route115Name:           db "ROUTE 115@"
Route116Name:           db "ROUTE 116@"
Route117Name:           db "ROUTE 117@"
Route118Name:           db "ROUTE 118@"
Route119Name:           db "ROUTE 119@"
Route120Name:           db "ROUTE 120@"
Route121Name:           db "ROUTE 121@"
SpecialMapName:         db "SPEZIAL@"
