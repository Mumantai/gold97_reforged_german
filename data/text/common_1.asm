_FruitBearingTreeText::
	text "Es ist ein"
	line "Obstbaum."
	done

_HeyItsFruitText::
	text "Hey! Das ist eine"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

_ObtainedFruitText::
	text_ram wStringBuffer3
	text_start
	line "erhalten!"
	done

_FruitPackIsFullText::
	text "Aber der BEUTEL"
	line "ist voll…"
	done

_NothingHereText::
	text "Hier ist"
	line "nichts…"
	done

UnknownText_0x1bc06b::
	text "Welche APRIKOKO"
	line "soll ich benutzen?"
	done

UnknownText_0x1bc089::
	text "Wie viele soll ich"
	line "fertigen?"
	done

UnknownText_0x1bc0a2::
	text_ram wStringBuffer1
	text_start
	line "erhält @"
	text_decimal wCurHPAnimDeltaHP, 2, 3
	text " KP!"
	done

UnknownText_0x1bc0bb::
	text "Die Vergiftung von"
	line "@"
	text_ram wStringBuffer1
	text_start
	cont "wurde geheilt."
	done

UnknownText_0x1bc0d2::
	text "Die Paralyse von"
	line "@"
	text_ram wStringBuffer1
	text_start
	cont "wurde aufgehoben."
	done

UnknownText_0x1bc0ea::
	text "Verbrennung von"
	line "@"
	text_ram wStringBuffer1
	text_start
	cont "wurde geheilt."
	done

UnknownText_0x1bc101::
	text_ram wStringBuffer1
	text_start
	line "wurde aufgetaut."
	done

UnknownText_0x1bc115::
	text_ram wStringBuffer1
	text_start
	line "ist aufgewacht."
	done

UnknownText_0x1bc123::
	text_ram wStringBuffer1
	text_start
	line "ist wieder fit."
	done

UnknownText_0x1bc13a::
	text_ram wStringBuffer1
	text_start
	line "is revitalized."
	done

UnknownText_0x1bc14f::
	text_ram wStringBuffer1
	text " er-"
	line "reicht Level @"
	text_decimal wCurPartyLevel, 1, 3
	text "!@"
	sound_dex_fanfare_50_79 ; plays SFX_DEX_FANFARE_50_79, identical to SFX_LEVEL_UP
	text_waitbutton
	text_end

	text_end ; unreferenced

UnknownText_0x1bc16e::
	text_ram wStringBuffer1
	text " kommt"
	line "wieder zu sich."
	done

UnknownText_0x1bc187::
	text "Gib eine 4-"
	line "stellige Zahl ein."
	done

UnknownText_0x1bc1ac::
	text "Gib dieselbe Zahl"
	line "zur Bestätigung"
	cont "ein."
	done

UnknownText_0x1bc1cf::
	text "Das war nicht"
	line "dieselbe Nummer."
	para ""
	done

UnknownText_0x1bc1eb::
	text "Dein CODE wurde"
	line "festgelegt."

	para "Gib diese Nummer"
	line "ein, wenn du den"
	cont "KARTENORDNER"
	cont "öffnen möchtest."

	para ""
	done

UnknownText_0x1bc23e::
	text "0000 ist ungültig!"

	para ""
	done

UnknownText_0x1bc251::
	text "Gib den KARTEN-"
	next "ORDNER CODE ein."
	done

UnknownText_0x1bc272::
	text "CODE"
	line "falsch!"

	para ""
	done

UnknownText_0x1bc288::
	text "KARTENORDNER"
	line "geöffnet.@"
	text_end

UnknownText_0x1bc29c::
	text "<……><……><……><……><……><……>"
	line "<……><……><……><……><……><……>"

	para "Zzz… Hm? Was…?"
	line "Du hast mich auf-"
	cont "geweckt. Kannst du"

	para "mir sagen, wie"
	line "spät es ist?"
	prompt

UnknownText_0x1bc2eb::
	text "What time is it?"
	done

UnknownText_0x1bc2fd::
	text "Was?@"
	text_end

UnknownText_0x1bc305::
	text "?"
	done

UnknownText_0x1bc308::
	text "Wie viele Minuten?"
	done

UnknownText_0x1bc31b::
	text "Wow!@"
	text_end

UnknownText_0x1bc323::
	text "?"
	done

UnknownText_0x1bc326::
	text "!"
	line "Ich habe"
	cont "verschlafen!"
	done

UnknownText_0x1bc336::
	text "!"
	line "Uah! Ich habe"
	cont "verschlafen!"
	done

UnknownText_0x1bc34f::
	text "!"
	line "Kein Wunder, dass"
	cont "es so dunkel ist!"
	done

UnknownText_0x1bc369::
	text "Welcher Tag ist"
	line "heute?"
	done

UnknownText_0x1bc37a::
	text ", oder?"
	done

UnknownText_0x1bc384::
	text "Es ist nichts"
	line "angeschlossen."
	done

UnknownText_0x1bc3a1::
	text "Überprüfe den"
	line "Handy-Adapter."
	done

UnknownText_0x1bc3bc::
	text "Überprüfe"
	line "CDMA-Adapter."
	done

UnknownText_0x1bc3d1::
	text "Überprüfe DOCOMO"
	line "PHS-Adapter."
	done

UnknownText_0x1bc3ec::
	text "Überprüfe DDI"
	line "PHS-Adapter."
	done

UnknownText_0x1bc404::
	text "Überprüfe unbe-"
	line "grenzten Mobil-"
	cont "Kampf-Adapter."
	done

UnknownText_0x1bc42c::
	text "Das Passwort ist:"
	line ""
	done

UnknownText_0x1bc43f::
	text "In Ordnung?"
	done

UnknownText_0x1bc44c::
	text "Gib die"
	line "ID-Nummer ein.."
	done

UnknownText_0x1bc45e::
	text "Gib den"
	line "Betrag ein."
	done

UnknownText_0x1bc471::
	text "Es gibt nichts"
	line "zum Auswählen."
	prompt

UnknownText_0x1bc48c::
	text "Auf welcher Seite"
	line "willst du sie"
	cont "ablegen?"
	done

UnknownText_0x1bc4b2::
	text "Welche Seite"
	line "willst du ablegen?"
	done

UnknownText_0x1bc4d7::
	text_ram wStringBuffer3
	text_start
	line "ablegen."
	prompt

UnknownText_0x1bc4ec::
	text "Hier ist nichts"
	line "zum Ablegen."
	prompt

UnknownText_0x1bc509::
	text "Dekoriere dein"
	line "Zimmer mit"

	para "@"
	text_ram wStringBuffer3
	text "."
	prompt

UnknownText_0x1bc51c::
	text "Entferne"
	line "@"
	text_ram wStringBuffer3
	text_start

	para "und dekoriere mit"
	line "@"
	text_ram wStringBuffer4
	text "."
	prompt

UnknownText_0x1bc546::
	text "Das ist schon"
	line "in deinem Zimmer."
	prompt

UnknownText_0x1bc55d::
	text "Das ist die KARTE."
	done

UnknownText_0x1bc570::
	text "Das ist ein Poster"
	line "eines niedlichen"
	cont "PIKACHUs."
	done

UnknownText_0x1bc591::
	text "Das ist ein Poster"
	line "eines niedlichen"
	cont "PIEPIs."
	done

UnknownText_0x1bc5b3::
	text "Das ist ein Poster"
	line "eines niedlichen"
	cont "PUMMELUFFs."
	done

UnknownText_0x1bc5d7::
	text "Sehr bezaubernd:"
	line "@"
	text_ram wStringBuffer3
	text "."
	done

_ConsoleDecoText::
	text "<PLAYER> spielt"
	line "@"
	text_ram wStringBuffer3
	text "!"
	para "Mach besser"
	line "weiter - du hast"
	cont "keine Zeit zu"
	cont "verlieren!"
	done

UnknownText_0x1bc5ef::
	text "Eine Riesenpuppe!"
	line "Sie ist flauschig"
	cont "und weich."
	done

UnknownText_0x1bc615::
	text "Hi, <PLAYER>!"
	line "Wie geht es dir?"
	prompt

UnknownText_0x1bc62a::
	text "Ich habe beim"
	line "Einkaufen ein"
	cont "nützliches Item"
	cont "gefunden und"
	prompt

UnknownText_0x1bc64e::
	text "ich habe dieses"
	line "dekorative Item"

	para "von deinem Geld"
	line "gekauft!"
	prompt

UnknownText_0x1bc673::
	text "Es ist in deinem"
	line "PC. Es wird dir"
	cont "gefallen!"
	done

UnknownText_0x1bc693::
	text "Beim Einkaufen"
	line "heute habe ich"
	cont "eine tolle Puppe"
	cont "gesehen und"
	prompt

UnknownText_0x1bc6c7::
	text "Sie ist in deinem"
	line "Zimmer. Du wirst"
	cont "sie lieben!"
	done

UnknownText_0x1bc6e9::
	text_ram wPlayerTrademonSpeciesName
	text " ge-"
	line "sendet an @"
	text_ram wOTTrademonSenderName
	text "."
	done

UnknownText_0x1bc701::
	text_start
	done

UnknownText_0x1bc703::
	text "Lebwohl,"
	line "@"
	text_ram wOTTrademonSpeciesName
	text_end

	text_end ; unused

UnknownText_0x1bc719::
	text "sagt @"
	text_ram wOTTrademonSenderName
	text "."
	done

UnknownText_0x1bc71f::
	text "Kümmere dich um"
	line "@"
	text_ram wOTTrademonSpeciesName
	text "."
	done

UnknownText_0x1bc739::
	text "Für @"
	text_ram wPlayerTrademonSenderName
	text "s"
	line "@"
	text_ram wPlayerTrademonSpeciesName
	text_end

	text_end ; unused

UnknownText_0x1bc74c::
	text "überträgt @"
	text_ram wOTTrademonSenderName
	text_start
	line "@"
	text_ram wOTTrademonSpeciesName
	text "."
	done

UnknownText_0x1bc75e::
	text_ram wOTTrademonSenderName
	text " tauscht"
	line "@"
	text_ram wOTTrademonSpeciesName
	text_end

	text_end ; unreferenced

UnknownText_0x1bc774::
	text "gegen @"
	text_ram wPlayerTrademonSenderName
	text "s"
	line "@"
	text_ram wPlayerTrademonSpeciesName
	text "."
	done

UnknownText_0x1bc787::
	text_ram wPlayerTrademonSenderName
	text " tauscht"
	line "@"
	text_ram wPlayerTrademonSpeciesName
	text_end

	text_end ; unreferenced

UnknownText_0x1bc79d::
	text "gegen @"
	text_ram wOTTrademonSenderName
	text "s"
	line "@"
	text_ram wOTTrademonSpeciesName
	text "."
	done

UnknownText_0x1bc7b0::
	text_ram wPlayerTrademonSenderName
	text " tauscht"
	line "@"
	text_ram wPlayerTrademonSpeciesName
	text "…"
	done

UnknownText_0x1bc7c3::
	text "Kümmere dich um"
	line "@"
	text_ram wOTTrademonSpeciesName
	text "."
	done

UnknownText_0x1bc7dd::
	text_ram wPlayerTrademonSenderName
	text " tauscht"
	line "@"
	text_ram wPlayerTrademonSpeciesName
	text "…"
	done

UnknownText_0x1bc7f0::
	text "Kümmere dich um"
	line "@"
	text_ram wOTTrademonSpeciesName
	text "."
	done

UnknownText_0x1bc80a::
	text_ram wOTTrademonSpeciesName
	text_start
	line "kam zurück!"
	done
; Oak's Pokémon Talk

_OPT_IntroText1::
	text_start
	line "MARGIT:"
	done

_OPT_IntroText2::
	text_start
	line "PROF. EICHs"
	done

_OPT_IntroText3::
	text_start
	line "#MON-TALK!"
	done

_OPT_IntroText3_2::
	text_start
	line "Mit MARGIT!"
	done

_OPT_OakText1::
	text_start
	line "EICH: @"
	text_ram wMonOrItemNameBuffer
	text_end

	text_end ; unreferenced

_OPT_OakText2::
	text_start
	line "wurde gesehen auf"
	done

_OPT_OakText3::
	text_start
	line "@"
	text_ram wStringBuffer1
	text "."
	done

_OPT_MaryText1::
	text_start
	line "MARGIT: @"
	text_ram wStringBuffer1
	text_end

	text_end ; unused

_OPT_SweetAdorablyText::
	text_start
	line "Wie bezaubernd."
	done

_OPT_WigglySlicklyText::
	text_start
	line "Wie smart."
	done

_OPT_AptlyNamedText::
	text_start
	line "Wie reizend."
	done

_OPT_UndeniablyKindOfText::
	text_start
	line "Wie freundlich."
	done

_OPT_UnbearablyText::
	text_start
	line "Nicht zu ertragen…"
	done

_OPT_WowImpressivelyText::
	text_start
	line "Wow, faszinierend."
	done

_OPT_AlmostPoisonouslyText::
	text_start
	line "Fast giftig."
	done

_OPT_SensuallyText::
	text_start
	line "Wie einfühlsam."
	done

_OPT_MischievouslyText::
	text_start
	line "So schelmisch."
	done

_OPT_TopicallyText::
	text_start
	line "Sehr aktuell."
	done

_OPT_AddictivelyText::
	text_start
	line "Suchterregend."
	done

_OPT_LooksInWaterText::
	text_start
	line "Schaut ins Wasser."
	done

_OPT_EvolutionMustBeText::
	text_start
	line "Entwicklung, ja."
	done

_OPT_ProvocativelyText::
	text_start
	line "Wie provozierend."
	done

_OPT_FlippedOutText::
	text_start
	line "Wie ausgeflippt."
	done

_OPT_HeartMeltinglyText::
	text_start
	line "Wie wunderbar."
	done

_OPT_CuteText::
	text_start
	line "Wie niedlich."
	done

_OPT_WeirdText::
	text_start
	line "Wie verrückt."
	done

_OPT_PleasantText::
	text_start
	line "Wie angenehm."
	done

_OPT_BoldSortOfText::
	text_start
	line "Wie dreist."
	done

_OPT_FrighteningText::
	text_start
	line "Furchterregend."
	done

_OPT_SuaveDebonairText::
	text_start
	line "Wie weltmännisch!"
	done

_OPT_PowerfulText::
	text_start
	line "Wie stark."
	done

_OPT_ExcitingText::
	text_start
	line "Wie aufregend."
	done

_OPT_GroovyText::
	text_start
	line "Jetzt!"
	done

_OPT_InspiringText::
	text_start
	line "Wie inspirierend."
	done

_OPT_FriendlyText::
	text_start
	line "Wie freundlich."
	done

_OPT_HotHotHotText::
	text_start
	line "Wie interessant!"
	done

_OPT_StimulatingText::
	text_start
	line "Wie anregend."
	done

_OPT_GuardedText::
	text_start
	line "Gut geschützt."
	done

_OPT_LovelyText::
	text_start
	line "Wie lieblich."
	done

_OPT_SpeedyText::
	text_start
	line "Wie rasant."
	done

_OPT_PokemonChannelText::
	text "#MON"
	done

_PokedexShowText::
	text_start
	line "@"
	text_ram wStringBuffer1
	text_end

	text_end ; unused

; Pokémon Music Channel / Pokémusic

_BenIntroText1::
	text_start
	line "BEN: #MON-MUSIK"
	done

_BenIntroText2::
	text_start
	line "PROGRAMM!"
	done

_BenIntroText3::
	text_start
	line "Ich bin's, DJ BEN!"
	done

_FernIntroText1::
	text_start
	line "FABIAN: #MUSIK!"
	done

_FernIntroText2::
	text_start
	line "Mit DJ FABIAN!"
	done

_BenFernText1::
	text_start
	line "Es ist @"
	text_today
	text "!"
	done

_BenFernText2A::
	text_start
	line "Mach mit beim"
	done

_BenFernText2B::
	text_start
	line "Entspann dich beim"
	done

_BenFernText3A::
	text_start
	line "#MON-Marsch!"
	done

_BenFernText3B::
	text_start
	line "PKMN-Schlaflied!"
	done

; Lucky Channel

_LC_Text1::
	text_start
	line "BASTIAN: Yeah! Wie"
	done

_LC_Text2::
	text_start
	line "geht es euch nun?"
	done

_LC_Text3::
	text_start
	line "Geht es gut, oder"
	done

_LC_Text4::
	text_start
	line "geht es nicht,"
	done

_LC_Text5::
	text_start
	line "die GLÜCKSZAHLSHOW"
	done

_LC_Text6::
	text_start
	line "ist immer Pflicht!"
	done

_LC_Text7::
	text_start
	line "Die Glückszahl ist"
	done

_LC_Text8::
	text_start
	line "@"
	text_pause
	text_ram wStringBuffer1
	text "!"
	done

_LC_Text9::
	text_start
	line "Ich wiederhole!"
	done

_LC_Text10::
	text_start
	line "Gewonnen? Kommt"
	done

_LC_Text11::
	text_start
	line "zum RADIOTURM!"
	done

_LC_DragText1::
	text_start
	line "…Die Wiederholung"
	done

_LC_DragText2::
	text_start
	line "verzögert alles…"
	done

; Places and People

_PnP_Text1::
	text_start
	line "ORTE UND PERSONEN!"
	done

_PnP_Text2::
	text_start
	line "Moderiert von"
	done

_PnP_Text3::
	text_start
	line "DJ LILLY!"
	done

_PnP_Text4::
	text_start
	line "@"
	text_ram wStringBuffer2
	text " @"
	text_ram wStringBuffer1
	text_end

	text_end ; unreferenced

_PnP_cute::
	text_start
	line "ist niedlich."
	done

_PnP_lazy::
	text_start
	line "irgendwie faul."
	done

_PnP_happy::
	text_start
	line "ist immer heiter."
	done

_PnP_noisy::
	text_start
	line "ist ziemlich laut."
	done

_PnP_precocious::
	text_start
	line "ist frühreif."
	done

_PnP_bold::
	text_start
	line "ist wohl dreist."
	done

_PnP_picky::
	text_start
	line "ist zu wählerisch!"
	done

_PnP_sortofok::
	text_start
	line "ist O.K."
	done

_PnP_soso::
	text_start
	line "geht so."
	done

_PnP_great::
	text_start
	line "ist großartig."
	done

_PnP_mytype::
	text_start
	line "ist mein Typ."
	done

_PnP_cool::
	text_start
	line "ist so cool, oder?"
	done

_PnP_inspiring::
	text_start
	line "ist inspirierend!"
	done

_PnP_weird::
	text_start
	line "ist verrückt."
	done

_PnP_rightforme::
	text_start
	line "ist genau richtig?"
	done

_PnP_odd::
	text_start
	line "ist merkwürdig!"
	done

_PnP_Text5::
	text_start
	line "@"
	text_ram wStringBuffer1
	text_end

	text_end ; unreferenced

_RocketRadioText1::
	text_start
	line "… …Ähm, wir sind"
	done

_RocketRadioText2::
	text_start
	line "TEAM ROCKET!"
	done

_RocketRadioText3::
	text_start
	line "Nach drei Jahren"
	done

_RocketRadioText4::
	text_start
	line "Vorbereitung sind"
	done

_RocketRadioText5::
	text_start
	line "wir bereit für"
	done

_RocketRadioText6::
	text_start
	line "unser Comeback!"
	done

_RocketRadioText7::
	text_start
	line "GIOVANNI! @"
	text_pause
	text "Hörst"
	done

_RocketRadioText8::
	text_start
	line "du uns? Geschafft!"
	done

_RocketRadioText9::
	text_start
	line "@"
	text_pause
	text "Wo ist unser Boss?"
	done

_RocketRadioText10::
	text_start
	line "@"
	text_pause
	text "Hört er zu?"
	done

_BuenaRadioText1::
	text_start
	line "BUENA: BUENA hier!"
	done

_BuenaRadioText2::
	text_start
	line "Heutiges Passwort!"
	done

_BuenaRadioText3::
	text_start
	line "Moment… es lautet"
	done

_BuenaRadioText4::
	text_start
	line "@"
	text_ram wStringBuffer1
	text "!"
	done

_BuenaRadioText5::
	text_start
	line "Vergesst es nicht!"
	done

_BuenaRadioText6::
	text_start
	line "Ich bin im RADIO-"
	done

_BuenaRadioText7::
	text_start
	line "TURM von DUKATIA!"
	done

_BuenaRadioMidnightText1::
	text_start
	line "BUENA: Oh, es ist…"
	done

_BuenaRadioMidnightText2::
	text_start
	line "Mitternacht!"
	done

_BuenaRadioMidnightText3::
	text_start
	line "Ich muss aufhören!"
	done

_BuenaRadioMidnightText4::
	text_start
	line "Danke, Zuhörer!"
	done

_BuenaRadioMidnightText5::
	text_start
	line "Das Ende naht!"
	done

_BuenaRadioMidnightText6::
	text_start
	line "Bleibt nicht zu"
	done

_BuenaRadioMidnightText7::
	text_start
	line "lange auf! Euer"
	done

_BuenaRadioMidnightText8::
	text_start
	line "DJ BUENA!"
	done

_BuenaRadioMidnightText9::
	text_start
	line "Ich muss weg!"
	done

_BuenaRadioMidnightText10::
	text_start
	line "…"
	done

_BuenaOffTheAirText::
	text_start
	line ""
	done

Text_EnemyWithdrew::
	text "<ENEMY>"
	line "ersetzt"
	cont "@"
	text_ram wEnemyMonNickname
	text "!"
	prompt

Text_EnemyUsedOn::
	text "<ENEMY>"
	line "setzt @"
	text_ram wMonOrItemNameBuffer
	text_start
	cont "bei"

	para "@"
	text_ram wEnemyMonNickname
	text_start
	line "ein!"
	prompt


Text_ThatCantBeUsedRightNow::
	text "Es ist noch nicht"
	line "an der Zeit, dies"
	cont "zu benutzen."
	prompt

Text_ThatItemCantBePutInThePack::
	text "Dieses Item gehört"
	line "nicht in den"
	cont "BEUTEL."
	done

Text_TheItemWasPutInThePack::
	text_ram wStringBuffer1
	text_start
	line "wurde im BEUTEL"
	cont "verstaut."
	done

Text_RemainingTime::
	text "Verbleibende Zeit"
	done

Text_YourMonsHPWasHealed::
	text "Dein #MON wurde"
	line "komplett geheilt."
	prompt

Text_Warping::
	text "Warpen…"
	done

UnknownText_0x1bd05e::
	text "Welche Nummer soll"
	line "geändert werden?"
	done

UnknownText_0x1bd07f::
	text "Möchtest du"
	line "@"
	text_ram wStringBuffer2
	text " einsetzen?"
	done

UnknownText_0x1bd09a::
	text "Du benötigst zwei"
	line "#MON, um zu"
	cont "züchten."
	prompt

Text_BreedingIsNotPossible::
	text "Züchten ist hier"
	line "nicht möglich."
	prompt

UnknownText_0x1bd0d8::
	text "Sie passen"
	line "@"
	text_decimal wBreedingCompatibility, 1, 3
	text_start
	cont "zueinander."
	cont "Züchten?"
	done

UnknownText_0x1bd109::
	text "Es gibt kein EI."
	line ""
	prompt

UnknownText_0x1bd11c::
	text "Es wird bald aus"
	line "dem EI schlüpfen!"
	prompt

UnknownText_0x1bd131::
	text "Ereignistest"
	line "@"
	text_decimal wStringBuffer2, 1, 2
	text "?"
	done

UnknownText_0x1bd145::
	text "Start!"
	done

UnknownText_0x1bd14d::
	text "Ende!"
	done

UnknownText_0x1bd153::
	text "Für einen Jungen!"
	done

UnknownText_0x1bd15f::
	text "Für ein Mädchen!"
	done

UnknownText_0x1bd16c::
	text "Das geht Jungen"
	line "nichts an!"
	done

UnknownText_0x1bd188::
	text "Die BOX ist voll!"
	done

UnknownText_0x1bd19a::
	text "Eine neue KARTE"
	line "von @"
	text_ram wStringBuffer2
	text "."
	done

UnknownText_0x1bd1ba::
	text "KARTE in den KAR-"
	line "TENORDNER legen?"
	done

UnknownText_0x1bd1dd::
	text_ram wStringBuffer2
	text "s KARTE"
	line "ist Nr.@"
	text_decimal wStringBuffer1, 1, 2
	text "."
	prompt

UnknownText_0x1bd201::
	text "Verbindung steht."
	done

UnknownText_0x1bd211::
	text "Verbindung gelöst."
	done

UnknownText_0x1bd223::
	text "Verbindungsende."
	done

UnknownText_0x1bd232::
	text "Zeitbegrenzung"
	line "löschen?"
	done

UnknownText_0x1bd249::
	text "Die Zeitbegrenzung"
	line "wurde gelöscht."
	done

UnknownText_0x1bd266::
	text "Welches Paket als"
	line "Fehler wählen?"
	done

UnknownText_0x1bd286::
	text "Tausche @"
	text_ram wStringBuffer2
	text_start
	line "gegen @"
	text_ram wStringBuffer1
	text "…"
	done

UnknownText_0x1bd2a0::
	text "VOLTOBALORDEN"
	line "erhalten!"
	done

UnknownText_0x1bd2bc::
	text "Welcher Stock?"
	done

UnknownText_0x1bd2ca::
	text "SPRECHER: BIEP!"

	para "Die Zeit ist um!"
	done

UnknownText_0x1bd2e7::
	text "SPRECHER: Der"
	line "Wettkampf ist"
	cont "vorbei!"
	done

UnknownText_0x1bd308::
	text "SCHUTZ wirkt"
	line "nicht mehr."
	done

UnknownText_0x1bd321::
	text "<PLAYER> findet"
	line "@"
	text_ram wStringBuffer3
	text "."
	done

UnknownText_0x1bd331::
	text "Aber <PLAYER> hat"
	line "keinen Platz"
	cont "dafür…"
	done

UnknownText_0x1bd34b::
	text "Ich sah seltene"
	line "@"
	text_ram wStringBuffer1
	text " bei"
	cont "@"
	text_ram wStringBuffer2
	text "."

	para "Ich rufe an, wenn"
	line "ich ein anderes"
	cont "seltenes #MON"
	cont "sehe, in Ordnung?"
	prompt

UnknownText_0x1bd39e::
	text "SPEICHERN…"
	line ""
	done

UnknownText_0x1bd3be::
	text_ram wPlayerName
	text " erhält"
	line "@"
	text_ram wStringBuffer1
	text "!@"
	sound_item
	text_waitbutton
	text_end

	text_end ; unreferenced

UnknownText_0x1bd3d7::
	text "Du hast keine"
	line "Münzen."
	prompt

UnknownText_0x1bd3eb::
	text "Du hast keinen"
	line "MÜNZKORB."
	prompt

UnknownText_0x1bd407::
	text "O.K., benutze das"
	line "Game Link-Kabel."
	prompt

UnknownText_0x1bd429::
	text "<PLAYER> tauscht"
	line "@"
	text_ram wMonOrItemNameBuffer
	text " gegen"
	cont "@"
	text_ram wStringBuffer2
	text ".@"
	text_end

UnknownText_0x1bd445::
	sound_dex_fanfare_80_109
	text_pause
	text_end

	text_end ; unused

UnknownText_0x1bd449::
	text "Ich sammle #-"
	line "MON. Hast du ein"
	cont "@"
	text_ram wStringBuffer1
	text "?"

	para "Möchtest du es"
	line "gegen mein"

	para "@"
	text_ram wStringBuffer2
	text_start
	line "tauschen?"
	done

UnknownText_0x1bd48c::
	text "Du möchtest nicht"
	line "tauschen? Schade…"
	done

UnknownText_0x1bd4aa::
	text "Häh? Das ist kein"
	line "@"
	text_ram wStringBuffer1
	text "."
	cont "Wie enttäuschend…"
	done

UnknownText_0x1bd4d2::
	text "Yo! Ich habe mir"
	line "@"
	text_ram wStringBuffer1
	text_start
	cont "besorgt! Danke!"
	done

UnknownText_0x1bd4f4::
	text "Hi, wie geht es"
	line "meinem @"
	text_ram wStringBuffer2
	text "?"
	done

UnknownText_0x1bd512::
	text "Hi, ich suche"
	line "ein #MON."

	para "Wenn du ein"
	line "@"
	text_ram wStringBuffer1
	text " hast,"

	para "tauschst du es"
	line "gegen mein"
	cont "@"
	text_ram wStringBuffer2
	text "?"
	done

UnknownText_0x1bd565::
	text "Du hast auch"
	line "keines?"

	para "Das ist wirklich"
	line "enttäuschend…"
	done

UnknownText_0x1bd5a1::
	text "Du hast kein"
	line "@"
	text_ram wStringBuffer1
	text "? Das"
	cont "ist schade, na ja."
	done

UnknownText_0x1bd5cc::
	text "Großartig! Danke!"

	para "Endlich habe ich"
	line "ein @"
	text_ram wStringBuffer1
	text "."
	done

UnknownText_0x1bd5f4::
	text "Dem @"
	text_ram wMonOrItemNameBuffer
	text ","
	line "das du mit mir"
	cont "getauscht hast,"
	cont "geht es gut!"
	done

UnknownText_0x1bd621::
	text_ram wMonOrItemNameBuffer
	text " ist"
	line "niedlich, aber ich"

	para "habe keines. Hast"
	line "du ein @"
	text_ram wStringBuffer1
	text "?"

	para "Ich brütete dieses"
	line "#MON-EI aus,"
	cont "das ich in NIHON"
	cont "bekommen habe,"
	cont "aber es ist zu"
	cont "groß und furcht-"
	cont "erregend geworden!"

;	para "Möchtest du PIEPI"
    para "Möchtest du @"
    text_ram wStringBuffer1
	line "gegen mein"
	para "@"
	text_ram wStringBuffer2
	line "tauschen?"
;	cont "PANZAERON"
;	cont "tauschen?"
	done

UnknownText_0x1bd673::
	text "Du möchtest nicht"
	line "tauschen? Schade…"
	done

UnknownText_0x1bd696::
	text "Das ist kein"
	line "@"
	text_ram wStringBuffer1
	text "."

	para "Komm wieder, wenn"
	line "du tauschen"
	cont "möchtest."
	done

UnknownText_0x1bd6cd::
	text "Danke! Ich wollte"
	line "immer schon ein"
	cont "@"
	text_ram wMonOrItemNameBuffer
	text "!"
	done

UnknownText_0x1bd6f5::
	text "Wie geht es dem"
	line "getauschten"
	cont "@"
	text_ram wStringBuffer2
	text "?"

	para "Dein @"
	text_ram wMonOrItemNameBuffer
	text_start
	line "ist so niedlich!"
	done

UnknownText_0x1bd731::
	text "Was ist passiert?"
	done

UnknownText_0x1bd745::
	text "Tauschen ist"
	line "seltsam…"

	para "Ich muss noch viel"
	line "darüber lernen."
	done

UnknownText_0x1bd77f::
	text "Das ist ein nied-"
	line "liches #MON."

	para "Wo hast du es"
	line "her?"

	para "…"

	para "Du beginnst also"
	line "ein Abenteuer…"

	para "O.K.! Auch ich"
	line "werde dir helfen."

	para "Aber was kann ich"
	line "für dich tun?"

	para "Ich weiß! Ich"
	line "werde für dich"
	cont "sparen."

	para "Auf einer langen"
	line "Reise ist Geld"
	cont "sehr wichtig."

	para "Soll ich dein"
	line "Geld sparen?"
	done

UnknownText_0x1bd868::
	text "O.K., ich verwalte"
	line "deine Ersparnisse."

	para "<……><……><……>"
	prompt

UnknownText_0x1bd88e::
	text "Sei auf der Hut."

	para "#MON sind"
	line "deine Kameraden."
	cont "Ihr müsst als Team"
	cont "auftreten."

	para "Also mach's gut!"
	done

UnknownText_0x1bd8da::
	text "Hi! Willkommen!"
	line "Ich sehe, du"
	cont "bemühst dich sehr."

	para "Ich habe dein"
	line "Zimmer aufgeräumt."

	para "Ist es wegen"
	line "deinem Geld?"
	done

UnknownText_0x1bd942::
	text "Was wirst du"
	line "tun?"
	done

UnknownText_0x1bd95b::
	text "Wie viel möchtest"
	line "du sparen?"
	done

UnknownText_0x1bd97a::
	text "Wie viel möchtest"
	line "du mitnehmen?"
	done

UnknownText_0x1bd999::
	text "Möchtest du weiter"
	line "Geld sparen?"
	done

UnknownText_0x1bd9ba::
	text "So viel hast du"
	line "nicht gespart."
	prompt

UnknownText_0x1bd9d7::
	text "So viel kannst du"
	line "nicht mitnehmen."
	prompt

UnknownText_0x1bd9f1::
	text "So viel hast"
	line "du nicht."
	prompt

UnknownText_0x1bda0b::
	text "So viel kannst"
	line "du nicht sparen."
	prompt

UnknownText_0x1bda25::
	text "O.K., ich spare"
	line "für dich! Traue"
	cont "mir!"

	para "<PLAYER>, bleib"
	line "dabei!"
	done

UnknownText_0x1bda5b::
	text "Dein Geld ist hier"
	line "sicher! Tschüss!"
	done

UnknownText_0x1bda7e::
	text "<PLAYER>, nur nicht"
	line "aufgeben!"
	done

UnknownText_0x1bda90::
	text "Gib immer dein"
	line "Bestes."
	done

UnknownText_0x1bdaa7::
	text_start
	done

UnknownText_0x1bdaa9::
	text "Ich bin der"
	line "PENSIONSLEITER."
	cont "Soll ich eines"
	cont "deiner #MON"
	cont "aufziehen?"
	done

UnknownText_0x1bdad8::
	text "Ich bin der"
	line "PENSIONSLEITER."
	cont "Kennst du dich"
	cont "mit EIERN aus?"

	para "Ich habe #MON"
	line "mit meiner"
	cont "Frau aufgezogen."

	para "Wir waren ent-"
	line "setzt, als wir ein"
	cont "EI fanden!"

	para "Das ist doch"
	line "unglaublich, oder?"

	para "Soll ich ein"
	line "#MON aufziehen?"
	done

UnknownText_0x1bdb85::
	text "Ich bin die"
	line "PENSIONSLEITERIN."

	para "Soll ich eines"
	line "deiner #MON"
	cont "aufziehen?"
	done

UnknownText_0x1bdbbb::
	text "Ich bin die"
	line "PENSIONSLEITERIN."
	cont "Kennst du dich"
	cont "mit EIERN aus?"

	para "Mein Mann und ich"
	line "haben #MON"
	cont "aufgezogen."

	para "Wir waren er-"
	line "staunt, als wir"
	cont "ein EI fanden!"

	para "Das ist doch"
	line "unglaublich, oder?"

	para "Soll ich eines"
	line "deiner #MON"
	cont "aufziehen?"
	done

UnknownText_0x1bdc79::
	text "Welches soll"
	line "ich aufziehen?"
	prompt

UnknownText_0x1bdc97::
	text "Oh? Aber du hast"
	line "nur ein #MON."
	prompt

UnknownText_0x1bdcb8::
	text "Tut mir Leid, aber"
	line "ich kann kein EI"
	cont "annehmen."
	prompt

UnknownText_0x1bdcda::
	text "Entferne den"
	line "BRIEF, ehe du mich"
	cont "aufsuchst."
	prompt

UnknownText_0x1bdcff::
	text "Wenn du mir das"
	line "gibst, wer soll"
	cont "dann kämpfen?"
	prompt

UnknownText_0x1bdd30::
	text "O.K. Ich kümmere"
	line "mich um dein"
	cont "@"
	text_ram wStringBuffer1
	text "."
	prompt

UnknownText_0x1bdd4b::
	text "Hole es später"
	line "wieder ab."
	done

UnknownText_0x1bdd64::
	text "Wir sind genial,"
	line "oder? Möchtest du"
	cont "dein @"
	text_ram wStringBuffer1
	text_start
	cont "sehen?"
	done

UnknownText_0x1bdd96::
	text "Dein @"
	text_ram wStringBuffer1
	text_start
	line "ist groß geworden."

	para "Es ist um @"
	text_decimal wStringBuffer2 + 1, 1, 3
	text_start
	line "Level gestiegen."

	para "Wenn du dein"
	line "#MON zurück"
	cont "haben möchtest,"
	cont "kostet dich das"
	cont "¥@"
	text_decimal wStringBuffer2 + 2, 3, 4
	text "."
	done

UnknownText_0x1bde04::
	text "Perfekt! Hier ist"
	line "dein #MON."
	prompt

UnknownText_0x1bde1f::
	text "<PLAYER> erhält"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

UnknownText_0x1bde32::
	text "Huh? Schon zurück?"
	line "Dein @"
	text_ram wStringBuffer1
	text_start
	para "sollte noch ein"
	line "wenig hierbleiben."

	para "Wenn du dein"
	line "#MON zurück-"
	cont "haben möchtest,"
	cont "zahle ¥100."
	done

UnknownText_0x1bdea2::
	text "Du hast keinen"
	line "Platz mehr."
	prompt

UnknownText_0x1bdebc::
	text "Du hast nicht"
	line "genügend Geld."
	prompt

UnknownText_0x1bded9::
	text "Oh, in Ordnung."
	prompt

UnknownText_0x1bdee9::
	text "Komm wieder."
	done

UnknownText_0x1bdef6::
	text "Noch nicht…"
	done

UnknownText_0x1bdf00::
	text "Ah, du bist's!"

	para "Wir haben uns um"
	line "dein #MON"

	para "gekümmert und"
	line "waren sehr"
	cont "erstaunt!"

	para "Dein #MON hatte"
	line "ein EI!"

	para "Wir wissen nicht,"
	line "wie es dahin"

	para "gekommen ist; dein"
	line "#MON hat es."
	cont "Möchtest du es?"
	done

UnknownText_0x1bdfa5::
	text "<PLAYER> erhält"
	line "das EI!"
	done

UnknownText_0x1bdfba::
	text "Pass gut darauf"
	line "auf."
	done

UnknownText_0x1bdfd1::
	text "Gut, ich passe"
	line "darauf auf. Danke!"
	done

UnknownText_0x1bdff2::
	text "Du kannst keine"
	line "#MON mehr"
	cont "tragen. Komm"
	cont "später wieder."
	done

UnknownText_0x1be024::
	text "Welches #MON"
	line "soll ich"
	cont "fotografieren?"
	prompt

UnknownText_0x1be047::
	text "O.K. Beweg dich"
	line "nicht."
	prompt

UnknownText_0x1be06a::
	text "Erledigt! Schau"
	line "mal wieder vorbei!"
	done
