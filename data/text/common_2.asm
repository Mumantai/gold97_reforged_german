UnknownText_0x1c0000::
	text "Kein Foto? Schau"
	line "mal wieder vorbei!"
	done

UnknownText_0x1c0021::
	text "Ein EI? Mein"
	line "Talent hat mehr"
	cont "verdient…"
	done

UnknownText_0x1c0043::
	text "Hallo! Ich bin der"
	line "NAMEN-BEWERTER."

	para "Ich bewerte die"
	line "Namen deiner"
	cont "#MON."

	para "Soll ich einen"
	line "Namen bewerten?"
	done

UnknownText_0x1c00a0::
	text "Welchen #MON-"
	line "Spitznamen soll"
	cont "ich bewerten?"
	prompt

UnknownText_0x1c00cd::
	text "Hm… @"
	text_ram wStringBuffer1
	text "…"
	line "Das ist kein"
	cont "schlechter Name."

	para "Aber überlege dir"
	line "einen besseren"
	cont "Spitznamen!"

	para "Soll ich ihm einen"
	line "neuen Namen geben?"
	done

UnknownText_0x1c0142::
	text "O.K. Welchen"
	line "Namen möchtest"
	cont "du haben?"
	prompt

UnknownText_0x1c0171::
	text "Dieser Name"
	line "ist besser!"

	para "Gut gemacht!"
	done

UnknownText_0x1c019e::
	text "O.K. Du kannst"
	line "mich immer be-"
	cont "suchen."
	done

UnknownText_0x1c01be::
	text "Hm… @"
	text_ram wStringBuffer1
	text "?"
	line "Ein wirklich"
	cont "tadelloser Name!"

	para "Kümmere dich gut"
	line "um @"
	text_ram wStringBuffer1
	text "."
	done

UnknownText_0x1c0208::
	text "Wow… Das ist nur"
	line "ein EI."
	done

UnknownText_0x1c0222::
	text "Er sieht genauso"
	line "aus, wie der alte,"

	para "aber er ist "
	line "viel besser."

	para "Gut gemacht!"
	done

UnknownText_0x1c0272::
	text "O.K. Der neue Name"
	line "dieses #MON"
	cont "ist @"
	text_ram wStringBuffer1
	text "."
	prompt

Text_Gained::
	text_ram wStringBuffer1
	text " erhält@"
	text_end

Text_ABoostedStringBuffer2ExpPoints::
	text_start
	line "spezielle"
	cont "@"
	text_decimal wStringBuffer2, 2, 5
	text " EP!"
	prompt

Text_StringBuffer2ExpPoints::
	text_start
	line "@"
	text_decimal wStringBuffer2, 2, 5
	text " EP!"
	prompt

Text_GoMon::
	text "Los! @"
	text_end

Text_DoItMon::
	text "Los! @"
	text_end

Text_GoForItMon::
	text "Los! @"
	text_end

Text_YourFoesWeakGetmMon::
	text "Mach es fertig!"
	line "Los, @"
	text_end

Text_BattleMonNick01::
	text_ram wBattleMonNick
	text "!"
	done

Text_BattleMonNickComma::
	text_ram wBattleMonNick
	text ",@"
	text_end

Text_ThatsEnoughComeBack::
	text " genug!"
	line "Komm zurück!@"
	text_end

Text_OKComeBack::
	text " O.K.!"
	line "Komm zurück!@"
	text_end

Text_GoodComeBack::
	text " super!"
	line "Komm zurück!@"
	text_end

Text_ComeBack::
	text " komm"
	line "zurück!"
	done

UnknownText_0x1c0373::
	text "TM aktiviert."
	prompt

UnknownText_0x1c0384::
	text "VM aktiviert."
	prompt

UnknownText_0x1c0396::
	text "Sie enthält"
	line "@"
	text_ram wStringBuffer2
	text "."

	para "@"
	text_ram wStringBuffer2
	text_start
	line "einem #MON"
	cont "beibringen?"
	done

UnknownText_0x1c03c2::
	text_ram wStringBuffer2
	text " ist"
	line "nicht kompatibel"
	cont "mit @"
	text_ram wStringBuffer1
	text "."

	para "Es kann"
	line "@"
	text_ram wStringBuffer2
	text_start
	cont "nicht erlernen."
	prompt

UnknownText_0x1c03fa::
	text "Du hast keinen"
	line "Platz mehr für:"
	cont "@"
	text_ram wStringBuffer1
	text "."
	prompt

UnknownText_0x1c0421::
	text "Du erhältst"
	line "@"
	text_ram wStringBuffer1
	text "!"
	prompt

UnknownText_0x1c0436::
	text "Die Verbindung"
	line "wurde getrennt."
	prompt

UnknownText_0x1c0454::
	text "Übertragungs-"
	line "fehler."
	prompt

UnknownText_0x1c046a::
	text "Hole dir die"
	line "GABE im"
	cont "#MON-CENTER."
	prompt

UnknownText_0x1c048e::
	text "Dein Freund ist"
	line "nicht bereit."
	prompt

UnknownText_0x1c04a7::
	text "Nur fünf GABEN"
	line "pro Tag."
	prompt

UnknownText_0x1c04c6::
	text "Nur eine GABE"
	line "pro Person pro"
	cont "Tag."
	prompt

UnknownText_0x1c04e9::
	text_ram wMysteryGiftPartnerName
	text " schickte"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

UnknownText_0x1c04fa::
	text_ram wMysteryGiftPartnerName
	text " schickte"
	line "@"
	text_ram wStringBuffer1
	text_start
	cont "zur Adresse von"
	cont "@"
	text_ram wMysteryGiftPlayerName
	text "."
	prompt

UnknownText_0x1c051a::
	text "Erhält KARTE von"
	line "@"
	text_ram wc850
	text "."
	prompt

UnknownText_0x1c0531::
	text_ram wc850
	text "s KARTE"
	line "ist Nr.@"
	text_decimal wDeciramBuffer, 1, 2
	text "."
	prompt

UnknownText_0x1c0555::
	text "Die KARTE wurde"
	line "nicht registriert."
	prompt

UnknownText_0x1c0573::
	text "Die Verbindung"
	line "wurde getrennt."
	prompt

UnknownText_0x1c0591::
	text "Übertragungs-"
	line "fehler."
	prompt

_BadgeRequiredText::
	text "Du benötigst einen"
	line "neuen ORDEN."
	prompt

UnknownText_0x1c05c8::
	text "Du kannst das hier"
	line "nicht benutzen."
	prompt

UnknownText_0x1c05dd::
	text_ram wStringBuffer2
	text " setzt"
	line "den ZERSCHNEIDER"
	cont "ein!"
	prompt

UnknownText_0x1c05ec::
	text "Hier kann"
	line "man nichts"
	cont "zerschneiden."
	prompt

UnknownText_0x1c0609::
	text "Ein gleißender"
	line "BLITZ erhellt"
	cont "das Gebiet!@"
	text_waitbutton
	text_end

	text_end ; unused

_UsedSurfText::
	text_ram wStringBuffer2
	text " setzt"
	line "SURFER ein!"
	done

_CantSurfText::
	text "SURFER kann hier"
	line "nicht eingesetzt"
	cont "werden."
	prompt

_AlreadySurfingText::
	text "SURFER ist bereits"
	line "eingesetzt."
	prompt

_AskSurfText::
	text "Die See ist ruhig."
	line "Möchtest du SURFER"
	cont "einsetzen?"
	done

UnknownText_0x1c068e::
	text_ram wStringBuffer2
	text " setzt"
	line "KASKADE ein!"
	done

UnknownText_0x1c06a3::
	text "Wow, das ist ein"
	line "großer Wasserfall."
	done

UnknownText_0x1c06bf::
	text "Möchtest du"
	line "KASKADE einsetzen?"
	done

UnknownText_0x1c06de::
	text_ram wStringBuffer2
	text " setzt"
	line "SCHAUFLER ein!"
	done

UnknownText_0x1c06ed::
	text "<PLAYER> setzt"
	line "FLUCHTSEIL ein."
	done

UnknownText_0x1c0705::
	text "Das kann hier"
	line "nicht eingesetzt"
	cont "werden."
	done

UnknownText_0x1c071a::
	text "Bringt dich zum"
	line "letzten #MON-"
	cont "CENTER."
	done

UnknownText_0x1c073b::
	text "Das kann hier"
	line "nicht eingesetzt"
	cont "werden."
	prompt

UnknownText_0x1c0751::
	text "Ein #MON setzt"
	line "bereits STÄRKE"
	cont "ein."
	prompt

UnknownText_0x1c0774::
	text_ram wStringBuffer2
	text " setzt"
	line "STÄRKE ein!"
	done

UnknownText_0x1c0788::
	text_ram wStringBuffer1
	text " kann"
	line "Felsen bewegen."
	prompt

UnknownText_0x1c07a0::
	text "Ein #MON könnte"
	line "das vielleicht"
	cont "bewegen."

	para "Möchtest du STÄRKE"
	line "einsetzen?"
	done

UnknownText_0x1c07d8::
	text "Du kannst jetzt"
	line "Felsen bewegen!"
	done

UnknownText_0x1c07f4::
	text "Ein #MON könnte"
	line "das vielleicht"
	cont "bewegen."
	done

UnknownText_0x1c0816::
	text_ram wStringBuffer2
	text " setzt"
	line "WHIRLPOOL ein!"
	prompt

UnknownText_0x1c082b::
	text "Das ist ein"
	line "teuflischer"
	cont "Strudel!"

	para "Ein #MON könnte"
	line "den Strudel"
	cont "durchqueren."
	done

UnknownText_0x1c0864::
	text "Ein Strudel ist"
	line "im Weg."

	para "Möchtest du"
	line "WHIRLPOOL"
	cont "einsetzen?"
	done

UnknownText_0x1c0897::
	text_ram wStringBuffer2
	text " setzt"
	line "KOPFNUSS ein!"
	prompt

UnknownText_0x1c08ac::
	text "Nein. Nichts…"
	done

UnknownText_0x1c08bc::
	text "Vielleicht steckt"
	line "ein #MON in"
	cont "diesem Baum."

	para "Möchtest du KOPF-"
	line "NUSS einsetzen?"
	done

UnknownText_0x1c08f0::
	text_ram wStringBuffer2
	text " setzt"
	line "ZERTRÜMMERER ein!"
	prompt

UnknownText_0x1c0906::
	text "Ein #MON könnte"
	line "ihn vielleicht"
	cont "zerschmettern."
	done

UnknownText_0x1c0924::
	text "Dieser Fels sieht"
	line "zerbrechlich aus."

	para "Soll ZERTRÜMMERER"
	line "eingesetzt werden?"
	done

UnknownText_0x1c0958::
	text "Uah!"
	line "Da hat etwas"
	cont "angebissen!"
	prompt

UnknownText_0x1c0965::
	text "Nicht einmal"
	line "angeknabbert!"
	prompt

UnknownText_0x1c0979::
	text "Hier scheint"
	line "nichts zu sein."
	prompt

UnknownText_0x1c099a::
	text "Du kannst hier"
	line "nicht absteigen!"
	done

UnknownText_0x1c09b2::
	text "<PLAYER> steigt"
	line "aufs @"
	text_ram wStringBuffer2
	text "."
	done

UnknownText_0x1c09c7::
	text "<PLAYER> steigt vom"
	line "@"
	text_ram wStringBuffer2
	text " ab."
	done

_CantGetOffBoardText::
	text "Du kannst hier"
	line "nicht absteigen!"
	done

_GotOnBoardText::
	text "<PLAYER> steigt"
	line "aufs @"
	text_ram wStringBuffer2
	text "."
	done

_GotOffBoardText::
	text "<PLAYER> steigt vom"
	line "@"
	text_ram wStringBuffer2
	text " ab."
	done

UnknownText_0x1c09dd::
	text "Du kannst den"
	line "ZERSCHNEIDER hier"
	cont "einsetzen!"

	para "Möchtest du den"
	line "ZERSCHNEIDER"

	para "einsetzen?"
	done

UnknownText_0x1c0a05::
	text "Der ZERSCHNEIDER"
	line "kann hier"
	cont "eingesetzt werden!"
	done

UnknownText_0x1c0a1c::
	text "<PLAYER> findet"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

UnknownText_0x1c0a2c::
	text "<PLAYER> kann keine"
	line "weiteren Items"
	cont "mehr tragen!"
	done

UnknownText_0x1c0a4e::
	text "<PLAYER> hat kein"
	line "kampffähiges"
	cont "#MON mehr!"

	para "<PLAYER> fällt"
	line "in Ohnmacht!"
	done

UnknownText_0x1c0a77::
	text "Der DETEKTOR zeigt"
	line "dir an, dass ein"
	cont "Item in der Nähe"
	cont "ist."
	prompt

UnknownText_0x1c0aa9::
	text "Der DETEKTOR"
	line "reagiert nicht."
	prompt

UnknownText_0x1c0acc::
	text_ram wStringBuffer3
	text_start
	line "wurde besiegt!"
	prompt

UnknownText_0x1c0ada::
	text "<PLAYER> hat kein"
	line "kampffähiges"
	cont "#MON mehr!"

	para "<PLAYER> wird"
	line "ohnmächtig!"
	prompt

UnknownText_0x1c0b03::
	text_ram wStringBuffer3
	text_start
	line "ben. LOCKDUFT!"
	done

UnknownText_0x1c0b1a::
	text "Hier ist wohl"
	line "nichts…"
	done

UnknownText_0x1c0b3b::
	text "<PLAYER>"
	line "verspritzt Wasser."

	para "Nichts geschieht…"
	done

UnknownText_0x1c0b65::
	text "Die #MON"
	line "von <PLAYER>"
	cont "wurden geheilt!"
	done

Text_AnEGGCantHoldAnItem::
	text "Ein EI kann kein"
	line "Item tragen."
	prompt

UnknownText_0x1c0b9a::
	text "Keine Items."
	done

UnknownText_0x1c0ba5::
	text "Wie viele"
	line "wegwerfen?"
	done

UnknownText_0x1c0bbb::
	text "Wegwerfen?"
	line "@"
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " x @"
	text_ram wStringBuffer2
	text "?"
	done

UnknownText_0x1c0bd8::
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " x @"
	text_ram wStringBuffer2
	text_start
	line "weggeworfen."
	prompt

UnknownText_0x1c0bee::
	text "EICH: <PLAYER>!"
	line "Es ist noch nicht"
	cont "an der Zeit, dies"
	cont "zu benutzen!"
	prompt

Text_YouDontHaveAMon::
	text "Du hast kein"
	line "#MON!"
	prompt

UnknownText_0x1c0c2e::
	text_ram wStringBuffer2
	text_start
	line "eingetragen."
	prompt

UnknownText_0x1c0c45::
	text "Du kannst dieses"
	line "Item nicht"
	cont "eintragen."
	prompt

UnknownText_0x1c0c63::
	text "Wo soll das"
	line "hin?"
	done

UnknownText_0x1c0c83::
	text_start
	done

Text_YouCantUseItInABattle::
	text "Du kannst das"
	line "im Kampf nicht"
	cont "benutzen."
	prompt

Text_AreYouABoyOrAreYouAGirl::
	text "Bist du ein Junge?"
	line "Oder ein Mädchen?"
	done

UnknownText_0x1c0cc6::
	text "<USER>s"
	line "@"
	text_ram wStringBuffer2
	text_end

	text_end ; unused

UnknownText_0x1c0cd0::
	text_pause
	text "<SCROLL>steigt stark!"
	prompt

UnknownText_0x1c0ce0::
	text " steigt!"
	prompt

UnknownText_0x1c0ceb::
	text "<TARGET>s"
	line "@"
	text_ram wStringBuffer2
	text_end

	text_end ; unreferenced

UnknownText_0x1c0cf5::
	text_pause
	text "<SCROLL>sinkt stark!"
	prompt

UnknownText_0x1c0d06::
	text " sinkt!"
	prompt

UnknownText_0x1c0d0e::
	text "<USER>@"
	text_end

UnknownText_0x1c0d12::
	text_start
	line "erzeugt einen"
	cont "Wirbelwind!"
	prompt

UnknownText_0x1c0d26::
	text_start
	line "badet im Licht!"
	prompt

UnknownText_0x1c0d3a::
	text_start
	line "duckt sich!"
	prompt

UnknownText_0x1c0d4e::
	text_start
	line "leuchtet!"
	prompt

UnknownText_0x1c0d5c::
	text_start
	line "fliegt empor!"
	prompt

UnknownText_0x1c0d6c::
	text_start
	line "gräbt ein Loch!"
	prompt

_ActorNameText::
	text "<USER>@"
	text_end

_UsedMove1Text::
	text_start
	line "ben. @"
	text_end

_UsedMove2Text::
	text_start
	line "ben. @"
	text_end

_UsedInsteadText::
	text "stattdessen"
	cont "@"
	text_end

_MoveNameText::
	text_ram wStringBuffer2
	text_end

	text_end ; unused

_EndUsedMove1Text::
	text "!"
	done

_EndUsedMove2Text::
	text "!"
	done

_EndUsedMove3Text::
	text "!"
	done

_EndUsedMove4Text::
	text "!"
	done

_EndUsedMove5Text::
	text "!"
	done

UnknownText_0x1c0db0::
	text "Huch?"

	para "@"
	text_end

UnknownText_0x1c0db8::
	text_start
	done

UnknownText_0x1c0dba::
	text_ram wStringBuffer1
	text_start
	line "schlüpft aus dem"
	cont "EI!@"
	sound_caught_mon
	text_waitbutton
	text_end

	text_end ; unused

UnknownText_0x1c0dd8::
	text "Möchtest du"
	line "@"
	text_ram wStringBuffer1
	text " einen"
	cont "Spitznamen geben?"
	done

UnknownText_0x1c0df3::
	text_ram wBreedMon2Nick
	text " hast du"
	line "der PENSIONSLEI-"
	cont "TERIN anvertraut."
	done

UnknownText_0x1c0e24::
	text_ram wBreedMon1
	text " hast du"
	line "dem PENSIONSLEITER"
	cont "anvertraut."
	done

UnknownText_0x1c0e54::
	text "Es strotzt vor"
	line "Energie."
	prompt

UnknownText_0x1c0e6f::
	text_ram wStringBuffer1
	text_start
	line "ist nicht"
	cont "interessiert."
	prompt

UnknownText_0x1c0e8d::
	text "Es kümmert sich um"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

UnknownText_0x1c0eac::
	text "Es ist freundlich"
	line "gegenüber"

	para "@"
	text_ram wStringBuffer1
	text "."
	prompt

UnknownText_0x1c0ec6::
	text "Es zeigt Interesse"
	line "an @"
	text_ram wStringBuffer1
	text "."
	prompt

_EmptyMailboxText::
	text "Hier sind keine"
	line "BRIEFE."
	prompt

ClearedMailPutAwayText::
	text "Der leere BRIEF"
	line "wurde eingesteckt."
	prompt

MailPackFullText::
	text "Dein BEUTEL"
	line "ist voll."
	prompt

MailMessageLostText::
	text "Soll der Inhalt"
	line "des BRIEFes"
	cont "gelöscht werden?"
	done

MailAlreadyHoldingItemText::
	text "Es hat schon"
	line "ein Item."
	prompt

MailEggText::
	text "Du kannst einem EI"
	line "keinen BRIEF"
	cont "geben."
	prompt

MailMovedFromBoxText::
	text "Der BRIEF wurde"
	line "aus dem BRIEF-"
	cont "KASTEN gelöscht."
	prompt

UnknownText_0x1c0fb3::
	text "Ja"
	prompt

UnknownText_0x1c0fb8::
	text "Nein"
	prompt

UnknownText_0x1c0fbc::
	text_decimal wcf64, 1, 3
	text " @"
	text_ram wStringBuffer1
	text_start
	line "Animationstyp @"
	text_ram wStringBuffer2
	text_end

	text_end ; unreferenced

UnknownText_0x1c0fdd::
	text "#MON-Nummer?"
	done

Text_WasSentToBillsPC::
	text_ram wStringBuffer1
	text_start
	line "wurde auf Bills PC"
	cont "übertragen."
	prompt

UnknownText_0x1c1006::
	text "Du benötigst"
	line "#MON!"
	prompt

UnknownText_0x1c1024::
	text "Was?"
	done

UnknownText_0x1c102b::
	text "Es gibt #MON,"
	line "die einen"
	cont "BRIEF tragen."

	para "Entferne den"
	line "BRIEF."
	prompt

UnknownText_0x1c1062::
	text "Du hast kein"
	line "#MON mehr!"
	prompt

UnknownText_0x1c1080::
	text "Du kannst das"
	line "letzte #MON"
	cont "nicht ablegen!"
	prompt

UnknownText_0x1c10a2::
	text "Du kannst keine"
	line "weiteren #MON"
	cont "mehr mitnehmen."
	prompt

UnknownText_0x1c10c0::
	text_ram wStringBuffer1
	text " wurde"
	line "gefangen!"
	prompt

UnknownText_0x1c10cf::
	text "#MON tauschen?"
	done

UnknownText_0x1c10dd::
	text "Du hast bereits"
	line "ein @"
	text_ram wStringBuffer1
	text_start
	cont "gefangen."
	prompt

ContestJudging_FirstPlaceText::
	text "Der Gewinner des"
	line "Käferturniers ist@"
	text_pause
	text "…"

	para "@"
	text_ram wBugContestWinnerName
	text ","
	line "mit einem"

	para "@"
	text_ram wStringBuffer1
	text "!@"
	text_end

ContestJudging_FirstPlaceScoreText::
	text_start

	para "Mit einer Punkt-"
	line "zahl von @"
	text_decimal wBugContestFirstPlaceScore, 2, 3
	text_start
	cont "Punkten!"
	prompt

ContestJudging_SecondPlaceText::
	text "Zweiter wurde"
	line "@"
	text_ram wBugContestWinnerName
	text ","

	para "mit einem"
	line ""
	line "@"
	text_ram wStringBuffer1
	text "!@"
	text_end

ContestJudging_SecondPlaceScoreText::
	text_start

	para "Die Punktzahl ist"
	line "@"
	text_decimal wBugContestSecondPlaceScore, 2, 3
	text "!"
	prompt

ContestJudging_ThirdPlaceText::
	text "Dritter wurde"
	line "@"
	text_ram wBugContestWinnerName
	text ","

	para "mit einem"
	line "@"
	text_ram wStringBuffer1
	text "!@"
	text_end

ContestJudging_ThirdPlaceScoreText::
	text_start

	para "Mit einer Punkt-"
	line "zahl von @"
	text_decimal wBugContestThirdPlaceScore, 2, 3
	text "!"
	prompt

UnknownText_0x1c1203::
	text "Lass mich dein"
	line "KARPADOR messen."

	para "…Hm, es ist"
	line "@"
	text_ram wStringBuffer1
	text "cm"
	cont "groß."
	prompt

UnknownText_0x1c123a::
	text "AKTUELLER REKORD"

	para "@"
	text_ram wStringBuffer1
	text "cm gefangen"
	line "von @"
	text_ram wMagikarpRecordHoldersName
	text "@"
	text_waitbutton
	text_end

	text_end ; unused

UnknownText_0x1c1261::
	text "Glückwunsch!"

	para "Die ID-Nummer"
	line "von @"
	text_ram wStringBuffer1
	text_start

	para "in deinem Team"
	line "ist stimmig."
	prompt

UnknownText_0x1c12ae::
	text "Glückwunsch!"

	para "Die ID-Nummer"
	line "von @"
	text_ram wStringBuffer1
	text_start

	para "in deiner PC-BOX"
	line "ist stimmig."
	prompt

UnknownText_0x1c12fc::
	text "Möchtest du"
	line "@"
	text_ram wStringBuffer1
	text " einen"
	cont "Spitznamen geben?"
	done

UnknownText_0x1c1328::
	text "Dies kann nur"
	line "ein #MON"
	cont "benutzen!"
	prompt

UnknownText_0x1c1353::
	text "<PLAYER> schaltet"
	line "den PC ein."
	prompt

UnknownText_0x1c1368::
	text "Was möchtest du"
	line "tun?"
	done

_PlayersPCHowManyWithdrawText::
	text "Wie viele möchtest"
	line "du mitnehmen?"
	done

_PlayersPCWithdrewItemsText::
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " x @"
	text_ram wStringBuffer2
	text_start
	line "wurde mitgenommen."
	prompt

_PlayersPCNoRoomWithdrawText::
	text "Du kannst keine"
	line "weiteren Items"
	cont "mehr tragen."
	prompt

UnknownText_0x1c13df::
	text "Du trägst keine"
	line "Items!"
	prompt

_PlayersPCHowManyDepositText::
	text "Wie viele möchtest"
	line "du ablegen?"
	done

_PlayersPCDepositItemsText::
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " x @"
	text_ram wStringBuffer2
	text_start
	line "wurde abgelegt."
	prompt

_PlayersPCNoRoomDepositText::
	text "Es ist kein Platz"
	line "für weitere Items."
	prompt

UnknownText_0x1c144d::
	text "<PLAYER> schaltet"
	line "den PC ein."
	prompt

UnknownText_0x1c1462::
	text "Zugriff auf"
	line "wessen PC?"
	done

UnknownText_0x1c1474::
	text "Die Verbindung zu"
	line "BILLs PC wurde"
	cont "hergestellt."

	para "Du hast Zugriff"
	line "auf das #MON-"
	cont "LAGERUNGS-SYSTEM."
	prompt

UnknownText_0x1c14a4::
	text "Die Verbindung zu"
	line "deinem PC wurde"
	cont "hergestellt."

	para "Du hast Zugriff"
	line "auf das ITEM-"
	cont "LAGERUNGS-SYSTEM."
	prompt

UnknownText_0x1c14d2::
	text "Die Verbindung zu"
	line "PROF. EICHs PC"
	cont "wurde hergestellt."

	para "Du hast Zugriff"
	line "auf die #DEX-"
	cont "BEWERTUNG."
	prompt

UnknownText_0x1c1505::
	text "…"
	line "Verbindung"
	cont "beendet…"
	done

_OakPCText1::
	text "Soll dein #DEX"
	line "bewertet werden?"
	done

_OakPCText2::
	text "In deinem #DEX"
	line "steht:"
	prompt

_OakPCText3::
	text "Ges.: @"
	text_ram wStringBuffer3
	text " #MON"
	line "Bes.: @"
	text_ram wStringBuffer4
	text " #MON"

	para "PROF. EICHs"
	line "Bewertung:"
	done

_OakRating01::
	text "Suche in"
	line "hohem Gras nach"
	cont "#MON!"
	done

_OakRating02::
	text "Gut. Ich sehe, du"
	line "kannst mit #-"
	cont "BÄLLEN umgehen."
	done

_OakRating03::
	text "Du wirst immer"
	line "besser, hast aber"

	para "noch einen langen"
	line "Weg vor dir."
	done

_OakRating04::
	text "Vervollständige"
	line "den #DEX. Fange"

	para "alle Typen von"
	line "#MON!"
	done

_OakRating05::
	text "Du gibst dir Mühe."
	line "Dein #DEX"

	para "wird immer"
	line "besser."
	done

_OakRating06::
	text "Manche #MON"
	line "entwickeln sich"

	para "durch Level,"
	line "andere benötigen"
	cont "STEINE."
	done

_OakRating07::
	text "Hast du eine"
	line "ANGEL? Du"

	para "kannst damit"
	line "#MON fangen."
	done

_OakRating08::
	text "Sehr gut! Sammeln"
	line "scheint dir Spaß"
	cont "zu machen!"
	done

_OakRating09::
	text "Du kannst manchen"
	line "#MON nur zu"

	para "gewissen Tages-"
	line "zeiten begegnen."
	done

_OakRating10::
	text "Es wird immer"
	line "besser. Mach"
	cont "weiter so!"
	done

_OakRating11::
	text "Beeindruckend."
	line "Du fängst nicht"

	para "nur #MON, du"
	line "trainierst sie"
	cont "auch."
	done

_OakRating12::
	text "Hast du KURT schon"
	line "getroffen? Seine"
	cont "handgefertigten"
	cont "#BÄLLE werden"
	cont "dir helfen."
	done

_OakRating13::
	text "Wow. Du hast mehr"
	line "#MON entdeckt,"

	para "als die letzte"
	line "#DEX-For-"
	cont "schungsgruppe."
	done

_OakRating14::
	text "Tauschst du deine"
	line "#MON?"

	para "Alleine ist das"
	line "sehr schwierig!"
	done

_OakRating15::
	text "Wow! Die 200-Marke"
	line "ist erreicht! Dein"
	cont "#DEX sieht"
	cont "großartig aus!"
	done

_OakRating16::
	text "Du hast so viele"
	line "#MON gefunden!"

	para "Du hast mir damit"
	line "sehr geholfen!"
	done

_OakRating17::
	text "Fantastisch! Du"
	line "könntest auch ein"

	para "#MON-Professor"
	line "werden!"
	done

_OakRating18::
	text "Dein #DEX ist"
	line "Wahnsinn! Du"

	para "wirst noch zu"
	line "einem Profi!"
	done

_OakRating19::
	text "Boah! Der perfekte"
	line "#DEX! Davon"

	para "habe ich immer"
	line "geträumt!"
	cont "Gratulation!"
	done

_OakPCText4::
	text "Die Verbindung zu"
	line "PROF. EICHs PC"
	cont "wurde getrennt."
	done

UnknownText_0x1c19cd::
	text "Dreifache Trainer"
	line "Bestenliste!"

	para "Dieser SPIELSTAND"
	line "könnte die Besten-"
	cont "liste erreichen!"

	para ""
	done

UnknownText_0x1c1a22::
	text "Es gibt keine"
	line "Bestenliste."

	para "Verbindung erstel-"
	line "len, um Besten-"
	cont "liste zu erhalten."

	para ""
	done

UnknownText_0x1c1a5b::
	text "!"
	done

UnknownText_0x1c1a65::
	text "Mist…"
	done

UnknownText_0x1c1a6c::
	text "Möchtest du den"
	line "Wettkampf beenden?"
	done

UnknownText_0x1c1a90::
	text "Wie viele"
	line "@"
	text_ram wStringBuffer2
	text_start
	cont "wegwerfen?"
	done

UnknownText_0x1c1aad::
	text "Wegwerfen"
	line "@"
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " x @"
	text_ram wStringBuffer2
	text "?"
	done

UnknownText_0x1c1aca::
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " x @"
	text_ram wStringBuffer1
	text_start
	line "wurde weggeworfen."
	prompt

UnknownText_0x1c1adf::
	text "Dieses Item ist"
	line "zu wichtig! Du"
	cont "kannst es nicht"
	cont "wegwerfen!"
	prompt

UnknownText_0x1c1b03::
	text "EICH: <PLAYER>!"
	line "Es ist noch nicht"
	cont "an der Zeit, dies"
	cont "zu benutzen."
	done

UnknownText_0x1c1b2c::
	text "Nimmt @"
	text_ram wStringBuffer1
	text_start
	line "von @"
	text_ram wMonOrItemNameBuffer
	text_start

	para "und gibt ihm"
	line "@"
	text_ram wStringBuffer2
	text "."
	prompt

UnknownText_0x1c1b57::
	text "Gibt @"
	text_ram wMonOrItemNameBuffer
	text_start
	line "@"
	text_ram wStringBuffer2
	text "."
	prompt

UnknownText_0x1c1b6f::
	text "Entferne zuerst"
	line "den BRIEF."
	prompt

UnknownText_0x1c1b8e::
	text_ram wMonOrItemNameBuffer
	text_start
	line "trägt kein Item."
	prompt

UnknownText_0x1c1baa::
	text "Du kannst keine"
	line "weiteren Items"
	cont "mehr lagern."
	prompt

UnknownText_0x1c1bc4::
	text "Nimmt @"
	text_ram wStringBuffer1
	text_start
	line "von @"
	text_ram wMonOrItemNameBuffer
	text "."
	prompt

UnknownText_0x1c1bdc::
	text_ram wMonOrItemNameBuffer
	text " hält"
	line "schon das Item"

	para "@"
	text_ram wStringBuffer1
	text "."
	line "Items wechseln?"
	done

UnknownText_0x1c1c09::
	text "Du kannst dieses"
	line "Item keinem"
	cont "#MON geben."
	prompt

UnknownText_0x1c1c22::
	text "Der Inhalt des"
	line "BRIEFes wird"
	cont "gelöscht"
	cont "Einverstanden?"
	done

UnknownText_0x1c1c47::
	text "BRIEF entfernt von"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

UnknownText_0x1c1c62::
	text "Es ist nicht"
	line "genügend Platz"
	cont "für entfernte"
	cont "BRIEFE."
	prompt

UnknownText_0x1c1c86::
	text "Den entfernten"
	line "BRIEF auf deinen"
	cont "PC übertragen?"
	done

UnknownText_0x1c1ca9::
	text "Du kannst keine"
	line "weiteren BRIEFE"
	cont "auf deinen PC"
	cont "übertragen."
	prompt

UnknownText_0x1c1cc4::
	text "Der BRIEF wurde"
	line "auf deinen PC"
	cont "übertragen."
	prompt

UnknownText_0x1c1ce3::
	text "Nicht genügend KP!"
	prompt

UnknownText_0x1c1cf3::
	text "Ein Item aus"
	line "deinem BEUTEL"

	para "kann auf"
	line "SELECT"
	cont "gelegt werden."
	done

_OakText1::
	text "Hi! Entschuldige"
	line "die Verspätung!"

	para "Willkommen in der"
	line "Welt der #MON!"

	para "Mein Name ist"
	line "EICH!"
	cont "Man nennt mich"

	para "den #MON-"
	line "PROFESSOR."
	prompt

_OakText2::
	text "Diese Welt wird"
	line "von Wesen"
	cont "bewohnt, die man"
	cont "#MON nennt.@"
	text_end

_OakText3::
	text_waitbutton
	text_end

	text_end ; unused

_OakText4::
	text "Menschen und"
	line "#MON leben"

	para "zusammen und"
	line "helfen einander."

	para "Für manche Leute"
	line "sind #MON"
	cont "Haustiere, andere"
	cont "tragen Kämpfe mit"
	cont "ihnen aus."
	prompt

_OakText5::
	text "Leider wissen wir"
	line "noch nicht alles"
	cont "über #MON."

	para "Es gibt noch"
	line "viele Geheimnisse"
	cont "zu lüften."

	para "Darum studiere"
	line "ich #MON"
	cont "tagaus, tagein!"
	prompt
