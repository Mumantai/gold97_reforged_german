	const_def 2 ; object constants
	const ALLOYOLDCAPTAINSHOUSE_CAPTAIN

AlloyOldCaptainsHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

AlloyOldCaptainsHouseCaptainScript:
IF DEF(_GOLD)
	checkevent EVENT_FOUGHT_HO_OH
	iftrue .AfterEverythingBirdFight
	faceplayer
	opentext
	writetext AlloyOldCaptainsHouseCaptainIntroText
	buttonsound
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .NoEvilLeft
	writetext AlloyOldCaptainsHouseCaptainEvilText
	waitbutton
	closetext
	end
	
ELIF DEF(_SILVER)
	checkevent EVENT_FOUGHT_LUGIA
	iftrue .AfterEverythingBirdFight
	faceplayer
	opentext
	writetext AlloyOldCaptainsHouseCaptainIntroText
	buttonsound
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .NoEvilLeft
	writetext AlloyOldCaptainsHouseCaptainEvilText
	waitbutton
	closetext
	end
ENDC
	
.NoEvilLeft
	checkevent EVENT_GOT_HM07_WATERFALL
	iffalse .NoWaterfall
	writetext AlloyOldCaptainsHouseCaptainText2
	yesorno
	iffalse AlloyOldCaptainNoStory
IF DEF(_GOLD)
	writetext AlloyOldCaptainHoOhStoryText
	waitbutton
	closetext
	special FadeOutMusic
	pause 20
	cry HO_OH
	playsound SFX_FLY
	showemote EMOTE_SHOCK, ALLOYOLDCAPTAINSHOUSE_CAPTAIN, 20
	pause 15
	opentext
	writetext HoOhAppearsText
	waitbutton
	closetext
	checkcode VAR_FACING
	ifequal UP, .CaptainWalkAroundPlayerGold
	applymovement ALLOYOLDCAPTAINSHOUSE_CAPTAIN, CaptainWalksOutMovement
	playsound SFX_EXIT_BUILDING
	disappear ALLOYOLDCAPTAINSHOUSE_CAPTAIN
	setevent EVENT_ALLOY_CAPTAIN_AND_TOWER_SAGES_GONE
	setevent EVENT_HO_OH_STAIRS_APPEAR
	clearevent EVENT_BRASS_TOWER_ELDER_SAGE_GONE
	setmapscene PAGOTA_CITY, SCENE_KURTS_HOUSE_LOCKED
	setmapscene BRASS_TOWER_5F, SCENE_HO_OH_EVENT
	pause 15
	special RestartMapMusic
	end
	
.CaptainWalkAroundPlayerGold
	applymovement ALLOYOLDCAPTAINSHOUSE_CAPTAIN, CaptainWalksAroundPlayerMovement
	playsound SFX_EXIT_BUILDING
	disappear ALLOYOLDCAPTAINSHOUSE_CAPTAIN
	setevent EVENT_ALLOY_CAPTAIN_AND_TOWER_SAGES_GONE
	setevent EVENT_HO_OH_STAIRS_APPEAR
	clearevent EVENT_BRASS_TOWER_ELDER_SAGE_GONE
	setmapscene PAGOTA_CITY, SCENE_KURTS_HOUSE_LOCKED
	setmapscene BRASS_TOWER_5F, SCENE_HO_OH_EVENT
	pause 15
	special RestartMapMusic
	end
	
ELIF DEF(_SILVER)
	writetext AlloyOldCaptainLugiaStoryText
	waitbutton
	closetext
	special FadeOutMusic
	pause 20
	cry LUGIA
	playsound SFX_BUBBLEBEAM
	showemote EMOTE_SHOCK, ALLOYOLDCAPTAINSHOUSE_CAPTAIN, 20
	pause 15
	opentext
	writetext LugiaAppearsText
	waitbutton
	closetext
	checkcode VAR_FACING
	ifequal UP, .CaptainWalkAroundPlayerSilver
	applymovement ALLOYOLDCAPTAINSHOUSE_CAPTAIN, CaptainWalksOutMovement
	playsound SFX_EXIT_BUILDING
	disappear ALLOYOLDCAPTAINSHOUSE_CAPTAIN
	setevent EVENT_ALLOY_CAPTAIN_AND_TOWER_SAGES_GONE
	setevent EVENT_LUGIA_CAVE_OPEN
	clearevent EVENT_WHIRL_ISLANDS_SAGE_GONE
	setmapscene PAGOTA_CITY, SCENE_KURTS_HOUSE_LOCKED
	setmapscene WHIRL_ISLAND_B3F, SCENE_LUGIA_EVENT
	pause 15
	special RestartMapMusic
	end

	
.CaptainWalkAroundPlayerSilver
	applymovement ALLOYOLDCAPTAINSHOUSE_CAPTAIN, CaptainWalksAroundPlayerMovement
	playsound SFX_EXIT_BUILDING
	disappear ALLOYOLDCAPTAINSHOUSE_CAPTAIN
	setevent EVENT_ALLOY_CAPTAIN_AND_TOWER_SAGES_GONE
	setevent EVENT_LUGIA_CAVE_OPEN
	clearevent EVENT_WHIRL_ISLANDS_SAGE_GONE
	setmapscene PAGOTA_CITY, SCENE_KURTS_HOUSE_LOCKED
	setmapscene WHIRL_ISLAND_B3F, SCENE_LUGIA_EVENT
	pause 15
	special RestartMapMusic
	end
ENDC
	
.NoWaterfall
	writetext AlloyOldCaptainsHouseCaptainNoWaterfallText
	waitbutton
	closetext
	end
	
.AfterEverythingBirdFight
	faceplayer
	opentext
IF DEF(_GOLD)
	writetext SometimesYouLiveLongEnoughGold
	closetext
	end
	
ELIF DEF(_SILVER)
	writetext SometimesYouLiveLongEnoughSilver
	waitbutton
	closetext
	end
ENDC
	
AlloyOldCaptainNoStory:
	writetext AlloyOldCaptainsHouseCaptainAnotherTime
	waitbutton
	closetext
	end
	
CaptainWalksAroundPlayerMovement:
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end
	
CaptainWalksOutMovement:
	step DOWN
	step DOWN
	step LEFT
	step DOWN
	step DOWN
	step_end
	
SometimesYouLiveLongEnoughGold:
    text "Manchmal lebt man"
    line "lang genug, um"
    para "Dinge zu erleben,"
    line "die man immer für"
    cont "unmöglich hielt."

    para "Ich hatte eine"
    line "Begegnung mit dem"
    cont "legendären Vogel."

    para "Ein wahrhaft magi-"
    line "sches Erlebnis."

    para "…"

    para "Weißt du was? Du"
    line "solltest NIHON"
    para "nach den legen-"
    line "dären Bestien"
    cont "absuchen."

    para "Wenn HO-OH zurück-"
    line "gekehrt ist, ist"
    cont "alles möglich."
	done

SometimesYouLiveLongEnoughSilver:
    text "Manchmal lebt man"
    line "lang genug, um"
    para "Dinge zu erleben,"
    line "die man immer für"
    cont "unmöglich hielt."

    para "Ich hatte eine"
    line "Begegnung mit dem"
    cont "legendären Vogel."

    para "Ein wahrhaft magi-"
    line "sches Erlebnis."

    para "…"

    para "Weißt du was? Du"
    line "solltest NIHON"
    para "nach den legen-"
    line "dären Bestien"
    cont "absuchen."

    para "Wenn LUGIA zurück-"
    line "gekehrt ist, ist"
    cont "alles möglich."
	done

AlloyOldCaptainHoOhStoryText:
    text "Hör gut zu…"
	
	para "Vor vielen Jahren"
	line "wurde NIHON von"
	para "einem edlen Vogel"
	line "bewacht, dessen"
	para "Schwingen die"
	line "Farben des Regen-"
	cont "bogens trugen."

	para "Der Legende nach,"
	line "soll sein Nest an"
	para "dem Ort gewesen"
    line "sein, der heute"
    para "als MEESINGTURM"
    cont "bekannt ist."

    para "Doch der wachsende"
    line "Bosheit in der"
    para "Region machte den"
    line "Vogel unruhig."

    para "Da er sich nicht"
    line "länger verbunden"
    para "fühlte, flog der"
    line "Vogel davon…"
	
	para "Als er flog, fiel"
	line "Asche aus seinem"
	cont "Gefieder."
	
	para "Aus dieser Asche"
	line "erhoben sich drei"
	para "Bestien, die NIHON"
	line "bewachen sollten,"
	para "solange der Vogel"
	line "fort war."
	
	para "Die Bestien"
	line "verstreuten sich"
	para "und seither hat"
	line "niemand sie je"
	cont "wieder gesehen."
	
	para "Doch man weiß,"
	line "dass sie noch"
	para "immer in NIHON"
	line "verweilen und es"
	para "im Verborgenen"
	line "bewachen und,"
	para "dass jemand reinen"
	line "Herzens den Vogel"
    cont "zurückbringen"
    cont "wird."

    para "Ich spüre, dass"
    line "der Tag schon bald"
    cont "kommen wird…"
	done
	
AlloyOldCaptainLugiaStoryText:
    text "Hör gut zu…"

	para "Vor vielen Jahren"
	line "wurde NIHON von"
	para "einem edlen Vogel"
	line "bewacht, dessen"
	para "Schwingen silbrig"
	line "glänzten."

	para "Der Legende nach,"
	line "nistet es am Ort,"
	para "der als STRUDEL-"
    line "INSEL bekannt ist."

    para "Doch der mangelnde"
    line "Respekt für die"
    para "Meere machte den"
    line "Vogel unruhig."
	
    para "Da er sich nicht"
    line "länger verbunden"
    para "fühlte, flog der"
    line "Vogel davon…"

    para "Als es abtauchte,"
    line "erzeugte sein"
    para "Gesang zahlreiche"
    line "Strudel."

    para "Diese Strudel"
    line "hielten die See"
    para "sauber und sicher"
    line "vor den Menschen."

    para "Drei Bestien"
    line "wurden beauftragt,"
    para "NIHON in der"
    line "Abwesenheit des"
    cont "Vogels zu bewachen."

	para "Die Bestien"
	line "verstreuten sich"
	para "und seither hat"
	line "niemand sie je"
	cont "wieder gesehen."

	para "Doch man weiß,"
	line "dass sie noch"
	para "immer in NIHON"
	line "verweilen und es"
	para "im Verborgenen"
	line "bewachen und,"
	para "dass jemand reiner"
	line "Seele den Vogel"
    cont "zurückbringen"
    cont "wird."
	
    para "Ich spüre, dass"
    line "der Tag schon bald"
    cont "kommen wird…"
	done
	
HoOhAppearsText:
	text "Könnte es sein!?"
	
	para "Der Vogel!"

	para "Komm, mein Kind,"
	line "wir müssen und auf"
	cont "zum MESSINGTURM"
	cont "begeben."

	para "Die Legende wird"
    line "wahr!"
	done
	
LugiaAppearsText:
	text "Könnte es sein!?"

	para "Der Vogel!"

	para "Komm, mein Kind,"
	line "wir müssen und auf"
	cont "zur STRUDELINSEL"
	cont "begeben."

	para "Die Legende wird"
    line "wahr!"
	done
	
AlloyOldCaptainsHouseCaptainAnotherTime:
	text "Dann ein andermal."
	done

AlloyOldCaptainsHouseCaptainText2:
	text "Möchtest du die"
	line "Geschichte des"
	cont "Vogels hören?"
	done
	
AlloyOldCaptainsHouseCaptainIntroText:
    text "Ich hoffe, eines"
    line "Tages das Ende der"
    para "Legende persönlich"
    line "erleben zu können."
	done

AlloyOldCaptainsHouseCaptainEvilText:
    text "Ich spüre eine"
    line "böse Präsenz über"
    cont "NIHON schweben."

    para "Der Vogel kehrt"
    line "sicher nicht"
    para "zurück, bis sie"
    line "vertrieben wurde."
	done
	
AlloyOldCaptainsHouseCaptainNoWaterfallText:
    text "Die Zeit ist schon"
    line "bald gekommen,"
    para "doch ich spüre"
    line "nicht, dass du die"
    para "Art Trainer bist,"
    line "dem sich der Vogel"
    cont "zeigen würde."
	done

AlloyOldCaptainsHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, ALLOY_CITY, 9
	warp_event  5,  7, ALLOY_CITY, 9

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  6,  3, SPRITE_CAPTAIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AlloyOldCaptainsHouseCaptainScript, EVENT_ALLOY_CAPTAIN_AND_TOWER_SAGES_GONE
