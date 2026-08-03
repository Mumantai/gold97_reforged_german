	const_def 2 ; object constants
	const TEAMROCKETBASEB1F_POKE_BALL1
	const TEAMROCKETBASEB1F_POKE_BALL2
	const TEAMROCKETBASEB1F_POKE_BALL3
	const TEAMROCKETBASEB1F_GRUNT1
	const TEAMROCKETBASEB1F_GRUNT2
	const TEAMROCKETBASEB1F_GRUNT3
	const TEAMROCKETBASEB1F_GRUNT4
	const TEAMROCKETBASEB1F_GRUNT5
	const TEAMROCKETBASEB1F_IMPOSTER
	const TEAMROCKETBASEB1F_EXECUTIVE
	const TEAMROCKETBASEB1F_OKERA
	const TEAMROCKETBASEB1F_IMPOSTER2
	const TEAMROCKETBASEB1F_OKERA2

TeamRocketBaseB2FOffice_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TeamRocketBaseB2FOfficeHyperPotion:
	itemball HYPER_POTION

TeamRocketBaseB2FOfficeNugget:
	itemball NUGGET

TeamRocketBaseB2FOfficeGuardSpec:
	itemball GUARD_SPEC

TeamRocketBaseB2FOfficeHiddenRevive:
	hiddenitem REVIVE, EVENT_TEAM_ROCKET_BASE_B1F_HIDDEN_REVIVE
	
RocketBossRoomGrunt1:
	jumptextfaceplayer RocketBossRoomGrunt1Text

RocketBossRoomGrunt2:
	jumptextfaceplayer RocketBossRoomGrunt2Text

RocketBossRoomGrunt3:
	jumptextfaceplayer RocketBossRoomGrunt3Text

RocketBossRoomGrunt4:
	jumptextfaceplayer RocketBossRoomGrunt4Text

RocketBossRoomGrunt5:
	jumptextfaceplayer RocketBossRoomGrunt5Text
	
ImposterScript:
	jumptext ImposterFighting
	
OkeraScript:
	jumptext OkeraFighting
	
	
ImposterConfrontationScene:
	showemote EMOTE_SHOCK, TEAMROCKETBASEB1F_IMPOSTER, 15
	turnobject PLAYER, UP
	applymovement PLAYER, PlayerStepsBack
	applymovement TEAMROCKETBASEB1F_IMPOSTER, ImposterStepsToPlayer
	jump ConfrontationScript
	end
	
ImposterConfrontationScene2:
	showemote EMOTE_SHOCK, TEAMROCKETBASEB1F_IMPOSTER, 15
	applymovement TEAMROCKETBASEB1F_IMPOSTER, ImposterStepsToPlayer
	turnobject PLAYER, UP
	jump ConfrontationScript
	end
	
ExecutiveConfrontationScene:
	applymovement PLAYER, PlayerWalksToExecutive
	jump ExecutiveScript
	end
	
ExecutiveConfrontationScene2:
	applymovement PLAYER, PlayerWalksToExecutive2
	jump ExecutiveScript
	end
	
ExecutiveConfrontationScene3:
	applymovement PLAYER, PlayerWalksToExecutive3
	jump ExecutiveScript
	end
	
ConfrontationScript:
	opentext
	writetext ImposterConfront
	waitbutton
	closetext
	winlosstext Imposter2WinText, Imposter2LossText
	loadtrainer IMPOSTER, IMPOSTER2
	startbattle
	reloadmapafterbattle	
	opentext
	writetext ImposterConfront2
	waitbutton
	closetext
	setevent EVENT_IMPOSTER_FIGHTING_OKERA_2
	clearevent EVENT_IMPOSTER_FIGHTING_OKERA
	moveobject TEAMROCKETBASEB1F_OKERA, 9, 9
	appear TEAMROCKETBASEB1F_OKERA
	applymovement TEAMROCKETBASEB1F_OKERA, OkeraRuns
	turnobject TEAMROCKETBASEB1F_IMPOSTER, RIGHT
	playsound SFX_TACKLE
	applymovement TEAMROCKETBASEB1F_IMPOSTER, OkeraBumpsIntoImposter	
	opentext
	writetext OkeraWatchIt
	waitbutton
	closetext
	showemote EMOTE_SHOCK, TEAMROCKETBASEB1F_OKERA, 15
	opentext
	writetext OkeraConfront
	waitbutton
	closetext
	turnobject TEAMROCKETBASEB1F_OKERA, DOWN
	opentext
	writetext OkeraConfront2
	waitbutton
	closetext
	applymovement TEAMROCKETBASEB1F_OKERA, OkeratoImposter
	appear TEAMROCKETBASEB1F_OKERA2
	disappear TEAMROCKETBASEB1F_OKERA
	appear TEAMROCKETBASEB1F_IMPOSTER2
	disappear TEAMROCKETBASEB1F_IMPOSTER
	setscene SCENE_EXECUTIVE
	end
	
ExecutiveScript:
	pause 10
	opentext
	writetext TheExecutiveGreeting
	waitbutton
	closetext
	winlosstext ExecutiveWinText, ExecutiveLossText
	loadtrainer EXECUTIVEM, EXECUTIVEM_2
	startbattle
	reloadmapafterbattle
	opentext
	writetext ExecutiveSceneAfterBattleText
	waitbutton
	closetext
	applymovement TEAMROCKETBASEB1F_EXECUTIVE, ExecutiveLeavesOffice
	turnobject PLAYER, DOWN
	disappear TEAMROCKETBASEB1F_EXECUTIVE
	disappear TEAMROCKETBASEB1F_OKERA2
	disappear TEAMROCKETBASEB1F_IMPOSTER2
	pause 15
	turnobject PLAYER, UP
	pause 15
	showemote EMOTE_SHOCK, PLAYER, 15
	applymovement PLAYER, NoticeComputer
	turnobject PLAYER, UP
	opentext
	writetext ComputerIsOn
	waitbutton
	closetext
	setevent EVENT_IMPOSTER_FIGHTING_OKERA
	clearevent EVENT_OKERA_AT_BASE
	setevent EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_1
	setscene SCENE_TEAMROCKETBASEB1F_NOTHING
	end
	
TeamRocketBaseB2FOfficePassword:
	opentext
	writetext BadSecurityPractices
	waitbutton
	closetext
	setevent EVENT_ROUTE_30_BATTLE
	end
	
PlayerStepsUpToImposter:
	step UP
	step_end
	
NoticeComputer:
	step RIGHT
	step RIGHT
	step_end
	
ImposterStepsToPlayer:
	step DOWN
	step_end
	
PlayerStepsBack:
	fix_facing
	step DOWN
	remove_fixed_facing
	step_end
	
OkeraRuns:
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step LEFT
	step_end
	
OkeraBumpsIntoImposter:
	fix_facing
	fast_jump_step LEFT
	remove_fixed_facing
	step_end
	
OkeratoImposter:
	step LEFT
	step LEFT
	step_end
	
PlayerWalksToExecutive:
	step UP
	step UP
	step UP
	step RIGHT
	step UP
	step_end

PlayerWalksToExecutive2:
	step UP
	step UP
	step UP
	step UP
	step_end
	
PlayerWalksToExecutive3:
	step UP
	step UP
	step UP
	step LEFT
	step UP
	step_end

ExecutiveLeavesOffice:
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step RIGHT
	big_step RIGHT
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	step_end
	
ComputerIsOn:
	text "Looks like theres"
	line "something still"
	cont "on the computer"
	cont "screen…"
	done
	
RocketBossRoomGrunt1Text:
    text "Das ist die letzte"
    line "Besprechung, bevor"
    para "unsere Maschine"
    line "voll funktions-"
    cont "fähig ist."

    para "Ich bin sicher,"
    line "dass es nichts"
    para "gibt, was unserem"
    line "Plan jetzt noch"
    para "in die Quere"
    line "kommen könnte!"
	done
	
RocketBossRoomGrunt2Text:
    text "Der BETRÜGER EICH"
    line "hat gute Arbeit"
    para "geleistet, die"
    line "Bewohner von"
    para "SENDESTIA CITY"
    line "davon zu über-"
    cont "zeugen, sich keine"
    para "Sorgen wegen uns"
    line "zu machen."
	done
	
RocketBossRoomGrunt3Text:
    text "Der VORSTAND ist"
    line "der einzige, der"
    para "das Passwort zum"
    line "Abschalten der"
    para "Gedankenkontrolle"
    line "kennt."

    para "Er ist aber auch"
    line "sehr vergesslich…"
	done
	
RocketBossRoomGrunt4Text:
    text "Die Welt wird"
    line "nicht wissen, wie"
    para "ihr geschieht,"
    line "wenn die Maschine"
    para "auf Hochtouren"
    line "läuft und wir"
    para "all ihre #MON"
    line "für unsere Zwecke"
    cont "einsetzen!"
	done
	
RocketBossRoomGrunt5Text:
    text "Meinen Berechnung-"
    line "en zufolge, sollte"
    para "das Signal zur"
    line "Gedankenkontrolle"
    para "in der nächsten"
    line "Woche seine volle"
    cont "Stärke erreichen!"
	done
	
BadSecurityPractices:
    text "Was ist das?"
	
    para "Es ist das Pass-"
    line "wort für die"
    cont "Konsole!"
	
	para "…"
	
	para "<PLAY_G>"
    line "merkt sich das"
    cont "Passwort!"
	done
	
ExecutiveSceneAfterBattleText:
    text "Argh!"

    para "Du hast mich zwar"
    line "im Kampf besiegt,"
    para "aber das ändert"
    line "gar nichts!"

    para "Unsere Maschine"
    line "ist schon fast bei"
    cont "voller Leistung!"

    para "Bald stehen selbst"
    line "deine #MON"
    cont "unter unserer"
    cont "Kontrolle!"

    para "Wenn du mich jetzt"
    line "entschuldigen wür-"
    cont "dest, ich habe"
    para "wichtige Dinge zu"
    line "erledigen!"
	done
	
ExecutiveWinText:
	text "Das kann ich nicht"
	line "glauben!"
	done
	
ExecutiveLossText:
	text "HA!"
	done
	
Imposter2WinText:
	text "W-was!?"
	line "W-wie!?"
	done
	
Imposter2LossText:
	text "HA!"
	done
	
TheExecutiveGreeting:
    text "Ist dir eigentlich"
    line "klar, worauf du"
    para "dich hier einge-"
    line "lassen hast?"

    para "Offensichtlich"
    line "nicht, sonst wärst"
    cont "du nicht hier."

    para "…"

    para "Du erinnerst dich"
    line "an mich, oder?"

    para "Ich war der KÄPT'N"
    line "unseres Frachters."

    para "Doch vor allem bin"
    line "ich der leitende"
    para "VORSTAND von TEAM"
    line "ROCKET."

    para "Nur GIOVANNI,"
    line "unser Anführer,"
    cont "steht über mir."

    para "Du hast also"
    line "herausgefunden,"
    cont "was wir vorhaben?"

    para "Wir haben ein"
    line "Funkgerät gebaut,"
    cont "mit dem man die"
    cont "Gedanken von"
    cont "#MON kontrol-"
    cont "lieren kann!"

    para "Anders gesagt, wir"
    line "können sie für"
    cont "TEAM ROCKETs"
    cont "Zwecke kontrol-"
    cont "lieren!"

    para "Wir werden sie"
    line "besser zu nutzen"
    cont "wissen, als sonst"
    cont "irgendjemand!"

    para "Ich werde es nicht"
    line "zulassen, dass du"
    para "dich weiter in den"
    line "Weg von TEAM"
    cont "ROCKET stellst!"
	done
	
	
ImposterConfront:
    text "Du kleines Wiesel!"

    para "Ich wusste, dass"
    line "du stark bist,…"

    para "Aber dass du alle"
    line "unsere Wachen"
    cont "besiegen würdest?"

    para "Inakzeptabel!"

    para "Ich werde deinen"
    line "kleinen Kreuzzug"
    cont "hier beenden!"

    para "Diesmal werde ich"
    line "mich nicht zurück-"
    cont "halten!"
	done
	
ImposterConfront2:
    text "Nein!"

    para "Ich werde das"
    line "nicht akzeptieren!"

    para "Selbst wenn du das"
    line "Passwort nicht"
    cont "haben solltest,…"

    para "Ich werde keine"
    line "Risiken mehr"
    cont "eingehen!"

    para "Der VORSTAND wird"
    line "nicht gestört!"

    para "Ich werde dich mit"
    line "allen Mitteln"
    cont "entfernen…"
	done
	
OkeraWatchIt:	
	text "RABAN: Hey!"
	line "Pass auf!"
	done
	
OkeraConfront:
	text "Du!"

	para "Hab überall nach"
	line "dir gesucht, Opa!"

	para "Einfach ein Signal"
	line "in meiner Stadt"
    cont "bauen,"

    para "mein friedliches,"
    line "ruhiges Leben"
    cont "stören…"

    para "Du hast ganz schön"
    line "Nerven!"
	done
	
OkeraConfront2:
	text "Hey Kniprs!"

	para "Ich kümmere mich"
	line "um den Knacker."

	para "Geh du weiter."
	done
	
ImposterFighting:
	text "…uff."

	para "Unsere Pläne"
	line "werden voran-"
	cont "schreiten…"
	done
	
OkeraFighting:
    text "Hälst dich ja für"
    line "'nen ganz harten,"
    cont "was Opa?"
	done

TeamRocketBaseB2FOffice_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 24, 17, TEAM_ROCKET_BASE_B2F, 4
	warp_event 25, 17, TEAM_ROCKET_BASE_B2F, 5

	db 5 ; coord events
	coord_event  7, 12, SCENE_DEFAULT, ImposterConfrontationScene
	coord_event  7, 13, SCENE_DEFAULT, ImposterConfrontationScene2
	coord_event  3,  8, SCENE_EXECUTIVE, ExecutiveConfrontationScene
	coord_event  4,  8, SCENE_EXECUTIVE, ExecutiveConfrontationScene2
	coord_event  5,  8, SCENE_EXECUTIVE, ExecutiveConfrontationScene3


	db 3 ; bg events
	bg_event  9,  1, BGEVENT_ITEM, TeamRocketBaseB2FOfficeHiddenRevive
	bg_event  6,  1, BGEVENT_READ, TeamRocketBaseB2FOfficePassword
	bg_event  7,  1, BGEVENT_READ, TeamRocketBaseB2FOfficePassword


	db 13 ; object events
	object_event  9, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseB2FOfficeHyperPotion, EVENT_TEAM_ROCKET_BASE_B1F_HYPER_POTION
	object_event 16,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseB2FOfficeNugget, EVENT_TEAM_ROCKET_BASE_B1F_NUGGET
	object_event 24,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseB2FOfficeGuardSpec, EVENT_TEAM_ROCKET_BASE_B1F_GUARD_SPEC
	object_event 21,  3, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 1, RocketBossRoomGrunt1, EVENT_STAND_CITY_ROCKETS_DEPARTED
	object_event 28,  6, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 1, RocketBossRoomGrunt2, EVENT_STAND_CITY_ROCKETS_DEPARTED
	object_event 22, 10, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 1, RocketBossRoomGrunt3, EVENT_STAND_CITY_ROCKETS_DEPARTED
	object_event 19,  7, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 1, RocketBossRoomGrunt4, EVENT_STAND_CITY_ROCKETS_DEPARTED
	object_event 25,  3, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 1, RocketBossRoomGrunt5, EVENT_STAND_CITY_ROCKETS_DEPARTED
	object_event  7, 11, SPRITE_IMPOSTER_OAK, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 1, ImposterScript,  EVENT_IMPOSTER_FIGHTING_OKERA_2
	object_event  4,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 1, ObjectEvent, EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_1
	object_event -4, -4, SPRITE_OKERA, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, OkeraScript, -1
	object_event  5, 12, SPRITE_IMPOSTER_OAK, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 1, ImposterScript, EVENT_IMPOSTER_FIGHTING_OKERA
	object_event  6, 12, SPRITE_OKERA, SPRITEMOVEDATA_STANDING_LEFT, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, OkeraScript, EVENT_IMPOSTER_FIGHTING_OKERA
