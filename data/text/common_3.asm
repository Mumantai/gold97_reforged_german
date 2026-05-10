_OakText6::
	text "Wie lautet dein"
	line "Name?"
	prompt

_OakText7::
	text "<PLAYER>, bist du"
	line "bereit?"

	para "Dein eigenes"
	line "#MON-Abenteuer"
	cont "erwartet dich."

	para "Dich erwarten tol-"
	line "le Dinge, aber"
	cont "auch harte Zeiten."

	para "Eine Welt voller"
	line "Träume und aufre-"
	cont "gender #MON-"

	para "Abenteuer erwar-"
	line "tet dich! Mach"
	cont "dich bereit!"

	para "Ich treffe dich"
	line "später!"
	done

UnknownText_0x1c40e6::
	text "Die Uhr könnte"
	line "falsch gestellt"
	cont "sein."

	para "Gib bitte die"
	line "genaue Uhrzeit an."
	prompt

UnknownText_0x1c411c::
	text "Benutze dafür das"
	line "Steuerkreuz."

	para "Bestätigen:"
	line "A-Knopf"
	cont "Zurück: B-Knopf"
	done

UnknownText_0x1c415b::
	text "Einverstanden?"
	done

UnknownText_0x1c4168::
	text "Die Uhr wurde"
	line "korrigiert."
	done

UnknownText_0x1c4183::
	text "Es verging zu viel"
	line "Zeit. Probier's"
	cont "noch einmal."
	prompt

UnknownText_0x1c41b1::
	text "Wenn du dieses"
	line "#MON tauschst,"
	cont "kannst du nicht"
	cont "mehr kämpfen."
	prompt

UnknownText_0x1c41e6::
	text "Das @"
	text_ram wStringBuffer1
	text_start
	cont "deines Freundes"
	cont "scheint nicht in"
	cont "Ordnung zu sein!"
	prompt

UnknownText_0x1c4212::
	text "Tausche @"
	text_ram wd004
	text_start
	line "mit @"
	text_ram wStringBuffer1
	text "?"
	done

UnknownText_0x1c422a::
	text "Um einen Mobil-"
	line "Kampf auszuführen,"

	para "musst du drei"
	line "#MON auswählen."

	para "In Ordnung?"
	done

UnknownText_0x1c4275::
	text "Benötigst du mehr"
	line "Informationen über"
	cont "den Mobil-Kampf?"
	done

UnknownText_0x1c4298::
	text "An einem Mobil-"
	line "Kampf nehmen drei"
	cont "#MON teil."

	para "Die max. Kampfzeit"
	line "pro Tag beträgt"

	para "zehn Minuten für"
	line "jeden angeschlos-"
	cont "senen Spieler."

	para "Steht nach Ablauf"
	line "des Zeitlimits"

	para "kein Sieger fest,"
	line "gewinnt der Spie-"
	cont "ler, der noch über"

	para "die meisten kampf-"
	line "fähigen #MON"
	cont "verfügt."

	para "Bei einem Remis,"
	line "gewinnt der Spie-"
	cont "ler, dessen Team"

	para "die wenigsten KP"
	line "verloren hat."
	done

UnknownText_0x1c439c::
	text "Für heute bleiben"
	line "noch @"
	text_decimal wStringBuffer2, 1, 2
	text " min."

	para "Möchtest du"
	line "kämpfen?"
	done

UnknownText_0x1c43dc::
	text "Für heute bleiben"
	line "nur noch @"
	text_decimal wStringBuffer2, 1, 2
	text " min."

	para "Einen schnellen"
	line "Kampf bestreiten?"
	done

UnknownText_0x1c4419::
	text "Du hast nur noch"
	line "1 min. für heute!"

	para "Wie wäre es mit"
	line "einem Blitzkampf?"
	done

UnknownText_0x1c445a::
	text "Weniger als 1"
	line "min. für heute!"

	para "Kommme morgen"
	line "wieder."
	done

UnknownText_0x1c449c::
	text "Noch ein Versuch"
	line "bei gleichen"
	cont "Einstellungen?"
	done

UnknownText_0x1c44c0::
	text "Weniger als 1"
	line "min. für heute!"
	done

UnknownText_0x1c44e7::
	text "Heute ist keine"
	line "Zeit für eine"
	cont "Verbindung."
	done

UnknownText_0x1c4508::
	text "Wähle drei #MON"
	line "für den Kampf."
	done

UnknownText_0x1c4525::
	text "Heute sind noch"
	line "@"
	text_decimal wStringBuffer2, 1, 2
	text " min übrig."
	done

UnknownText_0x1c454b::
	text "Möchtest du das"
	line "Spiel SICHERN?"
	done

UnknownText_0x1c4590::
	text "<PLAYER> hat das"
	line "Spiel gesichert."
	done

UnknownText_0x1c45a3::
	text "Es gibt bereits"
	line "einen Spielstand."

	para "Spielstand"
	line "überschreiben?"
	done

UnknownText_0x1c45d9::
	text "Es gibt bereits"
	line "einen Spielstand."
	cont "Spielstand"
	cont "überschreiben?"
	done

UnknownText_0x1c460d::
	text "Der Spielstand"
	line "ist zerstört!"
	prompt

UnknownText_0x1c462a::
	text "Vor einem Wechsel"
	line "der #MON-BOX"
	cont "wird das Spiel"
	cont "gesichert!"
	done

UnknownText_0x1c465f::
	text "Immer, wenn du"
	line "ein #MON"
	cont "verschiebst, wird"
	cont "das Spiel ge-"
	cont "sichert!"
	done

UnknownText_0x1c4693::
	text "Die Speicherkapa-"
	line "zität des Fensters"
	cont "wurde überschrit-"
	cont "ten."
	done

UnknownText_0x1c46b7::
	text "Für den Tausch"
	line "stehen keine Fens-"
	cont "ter zur Verfügung."
	done

UnknownText_0x1c46dc::
	text "Vorgang abge-"
	cont "brochen!"
	prompt

_ObjectEventText::
	text "Object event"
	done

UnknownText_0x1c46fc::
	text "BG event"
	done

UnknownText_0x1c4706::
	text "Coordinates event"
	done

UnknownText_0x1c4719::
	text "<PLAYER> erhält"
	line "@"
	text_ram wStringBuffer4
	text "."
	done

UnknownText_0x1c472c::
	text "<PLAYER> steckt"
	line "@"
	text_ram wStringBuffer1
	text " in"
	cont "@"
	text_ram wStringBuffer3
	text "."
	prompt

UnknownText_0x1c474b::
	text_ram wStringBuffer3
	text_start
	line "ist voll…"
	prompt

UnknownText_0x1c475f::
	text "Ich sehe alles."
	line "Ich weiß alles…"

	para "Gewiss kenne ich"
	line "deine #MON!"
	done

UnknownText_0x1c4797::
	text "Wiiieeee? Ich kann"
	line "nichts sagen!"

	para "Wieso weiß ich"
	line "darüber nichts?"
	done

UnknownText_0x1c47d4::
	text "Hm… du trafst"
	line "@"
	text_ram wSeerNickname
	text " hier:"
	cont "@"
	text_ram wSeerCaughtLocation
	text "!"
	prompt

UnknownText_0x1c47fa::
	text "Die Tageszeit war"
	line "@"
	text_ram wSeerTimeOfDay
	text "!"

	para "Sein Level war @"
	text_ram wSeerCaughtLevelString
	text "!"

	para "Ich bin gut, oder?"
	prompt

UnknownText_0x1c4837::
	text "Hm… hast du"
	line "@"
	text_ram wSeerNickname
	text " mit"

	para "@"
	text_ram wSeerOT
	text_start
	line "getauscht?"

	para "@"
	text_ram wSeerOT
	text " traf"
	line "@"
	text_ram wSeerNickname
	text " hier:"
	cont "@"
	text_ram wSeerCaughtLocation
	text "!"
	prompt

UnknownText_0x1c487f::
	text "Was!? Unglaublich!"

	para "Ich weiß nicht"
	line "wie, aber es ist"

	para "unglaublich!"
	line "Du bist anders."

	para "Ich kann nicht sa-"
	line "gen, wo du es"
	cont "trafst, aber sein"
	cont "Level war @"
	text_ram wSeerCaughtLevelString
	text "."

	para "Ich bin gut, oder?"
	prompt

UnknownText_0x1c491d::
	text "Heh!"

	para "Das ist ein EI!"

	para "Du kannst nicht"
	line "behaupten, du"
	cont "hättest es schon"
	cont "getroffen…"
	done

UnknownText_0x1c4955::
	text "Fufufu! Ich sah,"
	line "dass du müßig"
	cont "gehst!"
	done

UnknownText_0x1c497a::
	text "Apropos…"

	para "Du solltest deine"
	line "#MON etwas"

	para "umsichtiger"
	line "trainieren."
	done

UnknownText_0x1c49c6::
	text "Übrigens…"

	para "Es scheint"
	line "gewachsen zu sein."

	para "@"
	text_ram wSeerNickname
	text_start
	line "wird immer"
	cont "selbstbewusster."
	done

UnknownText_0x1c4a21::
	text "Apropos…"

	para "@"
	text_ram wSeerNickname
	text " ist"
	line "gewachsen. Es ist"
	cont "viel stärker."
	done

UnknownText_0x1c4a5b::
	text "Apropos…"

	para "Es ist sehr"
	line "gewachsen!"

	para "@"
	text_ram wSeerNickname
	text_start
	line "muss viele"

	para "#MON-Kämpfe"
	line "bestritten haben."

	para "Es strotzt vor"
	line "Selbstbewusstsein."
	done

UnknownText_0x1c4ae5::
	text "Apropos…"

	para "Deine Hingabe be-"
	line "eindruckt mich."

	para "Es ist schon lange"
	line "her, dass ich ein"

	para "so starkes #MON"
	line "wie @"
	text_ram wSeerNickname
	text_start
	cont "gesehen habe."

	para "Ich bin sicher,"
	line "dass jeder"

	para "@"
	text_ram wSeerNickname
	text_start
	line "gerne kämpfen"
	cont "sehen würde."
	done

UnknownText_0x1c4b92::
	text "Glückwunsch!"
	line "Dein @"
	text_ram wStringBuffer2
	text_end

	text_end ; unused

UnknownText_0x1c4baf::
	text_start

	para "wurde zu"
	line "@"
	text_ram wStringBuffer1
	text "!"
	done

UnknownText_0x1c4bc5::
	text "Hmm? Die Entwick-"
	line "lung wurde abge-"
	cont "brochen!"
	prompt

UnknownText_0x1c4be3::
	text "Hey! @"
	text_ram wStringBuffer2
	text_start
	line "entwickelt sich!"
	done

UnknownText_0x1c4bfd::
	text "Wie viele?"
	done

UnknownText_0x1c4c08::
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " x"
	line "@"
	text_ram wStringBuffer2
	text "?"

	para "Das macht dann"
	line "¥@"
	text_decimal hMoneyTemp, 3, 6
	text "."
	done

UnknownText_0x1c4c28::
	text "Hallo,"

	para "ich verkaufe"
	line "preiswerte"
	cont "Kräutermedizin."

	para "Sie wirkt, ist"
	line "aber bitter."

	para "Deine #MON"
	line "werden sie nicht"
	cont "mögen."

	para "Hihihihi…"
	done

UnknownText_0x1c4ca3::
	text "Wie viele?"
	done

UnknownText_0x1c4cae::
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " x @"
	text_ram wStringBuffer2
	text_start
	line "kostet ¥@"
	text_decimal hMoneyTemp, 3, 6
	text "."
	done

UnknownText_0x1c4cce::
	text "Danke, Kleiner."
	line "Hihihihi…"
	done

UnknownText_0x1c4cea::
	text "Oh? In deinem"
	line "BEUTEL ist kein"
	cont "Platz mehr."
	done

UnknownText_0x1c4d08::
	text "Hihihi… Du hast"
	line "nicht genug Geld."
	done

UnknownText_0x1c4d2a::
	text "Besuche mich"
	line "wieder. Hihihihi…"
	done

UnknownText_0x1c4d47::
	text "Heh! Bist du an"
	line "Schnäppchen"
	cont "interessiert?"

	para "Ich verkaufe"
	line "seltene Items,"

	para "aber leider sind"
	line "es nur Einzel-"
	cont "stücke."
	done

UnknownText_0x1c4db0::
	text_ram wStringBuffer2
	text_start
	line "kostet ¥@"
	text_decimal hMoneyTemp, 3, 6
	text "."

	para "Kaufen?"
	done

UnknownText_0x1c4dcd::
	text "Danke."
	done

UnknownText_0x1c4dd6::
	text "Uhh, dein BEUTEL"
	line "platzt aus"
	cont "allen Nähten."
	done

UnknownText_0x1c4df7::
	text "Das hast du schon"
	line "gekauft. Ich"
	cont "habe keines mehr."
	done

UnknownText_0x1c4e28::
	text "Uhh, du bist knapp"
	line "bei Kasse."
	done

UnknownText_0x1c4e46::
	text "Schau mal"
	line "wieder vorbei."
	done

UnknownText_0x1c4e5f::
	text "Was ist? Brauchst"
	line "du Medizin?"
	done

UnknownText_0x1c4e7e::
	text "Wie viele?"
	done

UnknownText_0x1c4e89::
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " x @"
	text_ram wStringBuffer2
	text_start
	line "kostet ¥@"
	text_decimal hMoneyTemp, 3, 6
	text "."
	done

UnknownText_0x1c4eab::
	text "Vielen Dank!"
	done

UnknownText_0x1c4eb9::
	text "Du hast keinen"
	line "Platz mehr."
	done

UnknownText_0x1c4ed8::
	text "Wie? Das ist nicht"
	line "genügend Geld."
	done

UnknownText_0x1c4ef6::
	text "In Ordnung."
	line "Bis die Tage."
	done

UnknownText_0x1c4f12::
	text "Du hast nichts"
	line "zu verkaufen."
	prompt

UnknownText_0x1c4f33::
	text "Wie viele?"
	done

UnknownText_0x1c4f3e::
	text "Ich zahle dir"
	line "¥@"
	text_decimal hMoneyTemp, 3, 6
	text "."

	para "Reicht das?"
	done

UnknownText_0x1c4f62::
	text "Willkommen! Womit"
	line "kann ich dienen?"
	done

UnknownText_0x1c4f80::
	text "Hier, bitte."
	line "Danke schön!"
	done

UnknownText_0x1c4f9a::
	text "Du hast nicht"
	line "genügend Geld."
	done

UnknownText_0x1c4fb7::
	text "Du kannst keine"
	line "weiteren Items"
	cont "mehr tragen."
	done

UnknownText_0x1c4fd7::
	text "Ich kann dir das"
	line "nicht abkaufen."
	prompt

UnknownText_0x1c4ff9::
	text "Komm wieder!"
	done

UnknownText_0x1c500d::
	text "Kann ich noch"
	line "etwas für dich"
	cont "tun?"
	done

UnknownText_0x1c502e::
	text "Erhält ¥@"
	text_decimal hMoneyTemp, 3, 6
	text " für"
	line "@"
	text_decimal wItemQuantityChange, 1, 2
	text " x @"
	text_ram wStringBuffer2
	text "."
	done

UnknownText_0x1c5049::
	text "Wie viel setzen?"
	done

UnknownText_0x1c505e::
	text "Start!"
	done

UnknownText_0x1c5066::
	text "Nicht genügend"
	line "Münzen."
	prompt

UnknownText_0x1c5079::
	text "Mist… Ich habe"
	line "keine Münzen mehr…"
	done

UnknownText_0x1c5092::
	text "Noch einmal?"
	done

UnknownText_0x1c509f::
	text "Bingo!"
	line "@"
	text_ram wStringBuffer2
	text " Münzen"
	cont "gewonnen!"
	done

UnknownText_0x1c50bb::
	text "Mist!"
	done

_MobileStadiumEntryText::
	text "Daten für das"
	line "MOBILE STADION"

	para "bei #MON"
	line "STADIUM 2 auf N64"
	cont "können hier"
	cont "gelesen werden."

	para "Daten lesen?"
	done

_MobileStadiumSuccessText::
	text "Datentransfer"
	line "abgeschlossen."

	para "Wir hoffen, du"
	line "magst die Kämpfe"

	para "im MOBILEN STADION"
	line "bei #MON"
	cont "STADIUM 2 auf N64."

	para ""
	done

UnknownText_0x1c5182::
	text "Uhrzeit unbekannt"
	done

UnknownText_0x1c5196::
	text "Das LOG-IN-"
	line "PASSWORT löschen?"
	done

UnknownText_0x1c51b9::
	text "LOG-IN-PASSWORT"
	line "gelöscht."
	done

UnknownText_0x1c51d7::
	text "Wähle drei #MON"
	line "für den Kampf."
	prompt

UnknownText_0x1c51f4::
	text_ram wMobileParticipant1Nickname
	text ","
	line "@"
	text_ram wMobileParticipant2Nickname
	text " und"
	cont "@"
	text_ram wMobileParticipant3Nickname
	text "."

	para "Diese 3 einsetzen?"
	done

UnknownText_0x1c521c::
	text "Es dürfen nur drei"
	line "#MON kämpfen."
	prompt

UnknownText_0x1c5238::
	text "Im KARTENORDNER"
	line "legst du deine und"

	para "die KARTEN deiner"
	line "Freunde ab."

	para "Eine KARTE enhält"
	line "Informationen wie"

	para "den Namen, die"
	line "Nummer und das"
	cont "Profil einer"
	cont "Person."

	para ""
	done

UnknownText_0x1c52bc::
	text "Hier, deine KARTE."

	para "Gib deine Telefon-"
	line "nummer ein und"

	para "tausche KARTEN"
	line "mit deinen"
	cont "Freunden."

	para ""
	done

UnknownText_0x1c531e::
	text "Wenn du im Besitz"
	line "der KARTE deines"

	para "Freundes bist,"
	line "kannst du ihn vom"

	para "Handy im 1.Stock"
	line "in jedem #MON-"
	cont "CENTER anrufen."

	para ""
	done

UnknownText_0x1c5394::
	text "Um deine KARTEN"
	line "sicher wegzulegen,"

	para "musst du einen"
	line "CODE für den"
	cont "KARTENORDNER"
	cont "festlegen."

	para ""
	done

UnknownText_0x1c53ee::
	text "Wird der KARTEN-"
	line "ORDNER gelöscht,"

	para "werden auch alle"
	line "KARTEN und der"
	cont "CODE gelöscht."

	para "Vorsicht - Ein"
	line "gelöschter KARTEN-"
	cont "ORDNER kann nicht"
	cont "wieder hergestellt"
	cont "werden."

	para "Den KARTENORDNER"
	line "löschen?"
	done

UnknownText_0x1c5494::
	text "Möchtest du ihn"
	line "wirklich löschen?"
	done

UnknownText_0x1c54b9::
	text "Der KARTENORDNER"
	line "wurde gelöscht."

	para ""
	done

UnknownText_0x1c54dd::
	text "Es gibt einen al-"
	line "ten KARTENORDNER"
	cont "von einem anderen"
	cont "Abenteuer."

	para "Möchtest du ihn"
	line "öffnen?"
	done

UnknownText_0x1c552d::
	text "Den alten KARTEN-"
	line "ORDNER löschen?"
	done

UnknownText_0x1c554a::
	text "Ablage der KARTEN"
	line "abgeschlossen?"
	done

UnknownText_0x1c5565::
	text "Äh? Ich habe mich"
	line "verwählt!"
	done

UnknownText_0x1c5580::
	text "Klick!"
	done

UnknownText_0x1c5588::
	text "<……>"
	done

UnknownText_0x1c558b::
	text "Die Nummer ist"
	line "außerhalb des"
	cont "Funknetzes."
	done

UnknownText_0x1c55ac::
	text "Du musst diesen"
	line "Gesprächspartner"
	cont "zu Fuß aufsuchen!"
	done

UnknownText_0x1c55ca::
	text "Danke!"
	done

UnknownText_0x1c55d6::
	text "  :"
	done

UnknownText_0x1c55db::
	text "Passwort O.K."
	line "Wähle Fortfahren"
	cont "& verwirf die"
	cont "Einstellungen."
	prompt

UnknownText_0x1c560b::
	text "Passwort falsch!"
	prompt

UnknownText_0x1c561c::
	text "Uhr neu stellen?"
	done

UnknownText_0x1c562e::
	text "Gib das Passwort"
	line "ein."
	done

UnknownText_0x1c564a::
	text "Spielstand"
	line "löschen?"
	done

UnknownText_0x1c5660::
	text_ram wMonOrItemNameBuffer
	text " erlernt"
	line "@"
	text_ram wStringBuffer2
	text "!@"
	sound_dex_fanfare_50_79
	text_waitbutton
	text_end

	text_end ; unused

UnknownText_0x1c5678::
	text "Welche Attacke"
	next "soll vergessen"
	cont "werden?"
	done

UnknownText_0x1c5699::
	text_ram wStringBuffer2
	text_start
	line "nicht erlernen?"
	done

UnknownText_0x1c56af::
	text_ram wMonOrItemNameBuffer
	text_start
	line "hat @"
	text_ram wStringBuffer2
	text_start
	cont "nicht erlernt."
	prompt

UnknownText_0x1c56c9::
	text_ram wMonOrItemNameBuffer
	text " "
	line "versucht,"
	cont "@"
	text_ram wStringBuffer2
	text " zu"
	cont "erlernen!"

	para "Aber @"
	text_ram wMonOrItemNameBuffer
	text_start
	line "kann nicht mehr"
	cont "als vier Attacken"
	cont "erlernen."

	para "Soll eine andere"
	line "Attacke zugunsten"
	cont "von @"
	text_ram wStringBuffer2
	text_start
	cont "vergessen werden?"
	done

UnknownText_0x1c5740::
	text "1, 2 und…@"
	text_pause
	text_end

	text_end ; unused

UnknownText_0x1c574e::
	text "Schwupp!@"
	text_pause
	text_start

	para "@"
	text_ram wMonOrItemNameBuffer
	text " hat"
	line "@"
	text_ram wStringBuffer1
	text_start

	para "vergessen!"

	para "Und…"
	prompt

UnknownText_0x1c5772::
	text "VM-Attacken"
	line "können nicht"
	cont "gelöscht werden!"
	prompt

UnknownText_0x1c5793::
	text "Drei Münzen set-"
	line "zen?"
	done

UnknownText_0x1c57ab::
	text "Nicht genügend"
	cont "Münzen…"
	prompt

UnknownText_0x1c57be::
	text "Zieh eine Karte."
	done

UnknownText_0x1c57ce::
	text "Worauf setzen?"
	done

UnknownText_0x1c57df::
	text "Noch einmal?"
	done

UnknownText_0x1c57f4::
	text "Die Karten"
	line "wurden gemischt."
	prompt

UnknownText_0x1c5813::
	text "Yoh!"
	done

UnknownText_0x1c581a::
	text "Mist…"
	done

UnknownText_0x1c5821::
	text_today
	text_end

	text_end ; unused

UnknownText_0x1c5824::
	text "<……>"
	done

UnknownText_0x1c5827::
	text "Du bist außerhalb"
	line "des Service-"
	cont "gebiets."
	prompt

UnknownText_0x1c5847::
	text "Wen möchtest du"
	line "anrufen?"
	done

UnknownText_0x1c5862::
	text "Drücke eine Taste,"
	line "um abzubrechen."
	done

UnknownText_0x1c587d::
	text "Die gespeicherte"
	line "Nummer löschen?"
	done

UnknownText_0x1c589f::
	text "Welchen Preis"
	line "hättest du gerne?"
	done

UnknownText_0x1c58bc::
	text_ram wStringBuffer1
	text "?"
	line "Ist das richtig?"
	done

UnknownText_0x1c58d1::
	text "Und los!"

	para ""
	done

UnknownText_0x1c58e0::
	text "Du hast nicht ge-"
	line "nügend Punkte."

	para ""
	done

UnknownText_0x1c58ff::
	text "Du hast keinen"
	line "Platz dafür."

	para ""
	done

UnknownText_0x1c591a::
	text "Oh. Komme bitte"
	line "wieder!"
	done

UnknownText_0x1c5937::
	text "Entschuldigung!"

	para ""
	done

Text_ExcuseMeYoureNotReady::
	text "Entschuldigung. Du"
	line "bist nicht bereit."

	para ""
	done

UnknownText_0x1c5962::
	text "Komme wieder, wenn"
	line "du bereit bist."
	done

UnknownText_0x1c5983::
	text "Du benötigst min-"
	line "destens 3 #MON."

	para ""
	done

UnknownText_0x1c59a3::
	text "Sorry, ein EI"
	line "geht nicht durch."

	para ""
	done

Text_OnlyThreeMonMayBeEntered::
	text "Nur drei #MON"
	line "sind gestattet."

	para ""
	done

Text_TheMonMustAllBeDifferentKinds::
	text "Die @"
	text_ram wStringBuffer2
	text " #MON"
	line "müssen unter-"
	cont "schiedlich sein."

	para ""
	done

Text_TheMonMustNotHoldTheSameItems::
	text "Die @"
	text_ram wStringBuffer2
	text " #MON"
	line "dürfen nicht"
	cont "dieselben Items"
	cont "tragen."

	para ""
	done

Text_YouCantTakeAnEgg::
	text "Du kannst kein EI"
	line "mitnehmen!"

	para ""
	done

UnknownText_0x1c5a5a::
	text "Es weicht dem"
	line "BALL aus!"

	para "Dieses #MON"
	line "lässt sich nicht"
	cont "fangen!"
	prompt

UnknownText_0x1c5a90::
	text "Du hast das"
	line "#MON verfehlt!"
	prompt

UnknownText_0x1c5aa6::
	text "Mist! Das #MON"
	line "hat sich befreit!"
	prompt

UnknownText_0x1c5ac3::
	text "Fast hätte es"
	line "geklappt!"
	prompt

UnknownText_0x1c5ae3::
	text "Mist!"
	line "Das war knapp!"
	prompt

UnknownText_0x1c5afa::
	text "Verflixt! Es"
	line "hätte beinahe"
	cont "geklappt!"
	prompt

UnknownText_0x1c5b17::
	text "Toll! @"
	text_ram wEnemyMonNick
	text_start
	line "wurde gefangen!@"
	sound_caught_mon
	text_end

	text_end ; unused

Text_Waitbutton_2::
	text_waitbutton
	text_end

	text_end ; unused

UnknownText_0x1c5b38::
	text_ram wMonOrItemNameBuffer
	text_start
	line "wurde auf BILLs PC"
	cont "übertragen."
	prompt

UnknownText_0x1c5b53::
	text "Für @"
	text_ram wEnemyMonNick
	text_start
	line "wird ein neuer"
	cont "Eintrag im"
	cont "#DEX angelegt.@"
	sound_slot_machine_start
	text_waitbutton
	text_end

	text_end ; unused

UnknownText_0x1c5b7f::
	text "Möchtest du"
	line "@"
	text_ram wStringBuffer1
	text " einen"
	cont "Spitznamen geben?"
	done

UnknownText_0x1c5b9a::
	text_ram wStringBuffer2
	text " von"
	line "@"
	text_ram wStringBuffer1
	text_start

	para "nimmt zu."
	prompt

UnknownText_0x1c5bac::
	text "Dieses #MON"
	line "kann das nicht"
	cont "einsetzen."
	prompt

Text_RepelUsedEarlierIsStillInEffect::
	text "SCHUTZ wirkt"
	line "noch immer."
	prompt

UnknownText_0x1c5bf9::
	text "Die #FLÖTE"
	line "wurde gespielt."

	para "Das ist ein"
	line "flotter Rhythmus!"
	prompt

UnknownText_0x1c5c28::
	text "Alle schlafenden"
	line "#MON sind"
	cont "aufgewacht."
	prompt

UnknownText_0x1c5c44::
	text "<PLAYER> spielte"
	line "die #FLÖTE.@"
	text_waitbutton
	text_end

	text_end ; unused

UnknownText_0x1c5c5e::
	text "Du hast jetzt"
	line "@"
	text_decimal wBlueCardBalance, 1, 2
	text " Punkte."
	done

UnknownText_0x1c5c7b::
	text "Münzen:"
	line "@"
	text_decimal wCoins, 2, 4
	text_end

	text_end ; unused

Text_RaiseThePPOfWhichMove::
	text "Für welche"
	line "Attacke sollen"
	cont "die AP aufgefüllt"
	cont "werden?"
	done

Text_RestoreThePPOfWhichMove::
	text "Für welche"
	line "Attacke sollen"
	cont "die AP erneuert"
	cont "werden?"
	done

Text_PPIsMaxedOut::
	text_ram wStringBuffer2
	text "s AP"
	line "wurden komplett"
	cont "aufgefüllt."
	prompt

Text_PPsIncreased::
	text_ram wStringBuffer2
	text "s AP"
	line "wurden aufgefüllt."
	prompt

UnknownText_0x1c5cf1::
	text "AP aufgefüllt."
	prompt

UnknownText_0x1c5d03::
	text "Hier ist eine"
	line "Trophäe!@"
	sound_dex_fanfare_50_79
	text_start

	para "@"
	text_ram wPlayerName
	text " hat"
	line "die Trophäe nach"
	cont "Hause gesandt."
	prompt

UnknownText_0x1c5d3e::
	text "Das ist bitter…"
	prompt

UnknownText_0x1c5d50::
	text "Ein EI kann das"
	line "nicht benutzen."
	prompt

UnknownText_0x1c5d6e::
	text "EICH: <PLAYER>!"
	line "Es ist nicht"
	cont "an der Zeit,"
	cont "dies zu benutzen!"
	prompt

UnknownText_0x1c5d97::
	text "Das gehört nicht"
	line "dir!"
	prompt

UnknownText_0x1c5db6::
	text "Das hätte keinen"
	line "Effekt."
	prompt

UnknownText_0x1c5dd0::
	text "Der Trainer hat"
	line "den BALL"
	cont "abgeblockt!"
	prompt

UnknownText_0x1c5def::
	text "Sei kein Dieb!"
	prompt

UnknownText_0x1c5e01::
	text "Rad fahren ist"
	line "hier nicht"
	cont "gestattet."
	prompt

UnknownText_0x1c5e1d::
	text_ram wStringBuffer1
	text_start
	line "kann nicht be-"
	cont "stiegen werden."
	prompt

UnknownText_0x1c5e3a::
	text "Die #MON-BOX"
	line "ist voll. Das"
	cont "kannst du jetzt"
	cont "nicht benutzen."
	prompt

UnknownText_0x1c5e68::
	text "<PLAYER> setzt"
	line "@"
	text_ram wStringBuffer2
	text " ein."
	done

UnknownText_0x1c5e7b::
	text "<PLAYER> stieg auf@"
	text_low
	text_ram wStringBuffer2
	text "."
	prompt

UnknownText_0x1c5e90::
	text "<PLAYER> stieg vom@"
	text_low
	text_ram wStringBuffer2
	text " ab."
	prompt

UnknownText_0x1c5ea8::
	text_ram wStringBuffer1
	text " kennt"
	line "@"
	text_ram wStringBuffer2
	text "."
	prompt

UnknownText_0x1c5eba::
	text "Dieses #MON"
	line "kann nur eine"
	cont "Attacke."
	done

UnknownText_0x1c5eda::
	text "Soll @"
	text_ram wStringBuffer1
	text_start
	line "vergessen werden?"
	done

UnknownText_0x1c5ef5::
	text "Dein #MON hat"
	line "die Attacke"
	cont "vergessen."
	done

UnknownText_0x1c5f17::
	text "Ein EI verfügt"
	line "über keine"
	cont "Attacken!"
	done

UnknownText_0x1c5f36::
	text "Nein? Besuche mich"
	line "wieder."
	done

UnknownText_0x1c5f50::
	text "Welche Attacke"
	line "soll vergessen"
	cont "werden?"
	prompt

UnknownText_0x1c5f74::
	text "Ähm… Oh, ja, ich"
	line "bin der ATTACKEN-"
	cont "VERLERNER."

	para "Ich verfüge über"
	line "die Fähigkeit,"
	cont "#MON ihre"
	cont "Attacken vergessen"
	cont "zu lassen."

	para "Soll ein #MON "
	line "eine Attacke"
	cont "vergessen?"
	done

UnknownText_0x1c5fd1::
	text "Welches #MON?"
	prompt

Text_DSTIsThatOK::
	text " SZ,"
	line "in Ordnung?"
	done

UnknownText_0x1c5ff1::
	text ","
	line "in Ordnung?"
	done

UnknownText_0x1c6000::
	text "Möchtest du auf"
	line "Sommerzeit um-"
	cont "stellen?"
	done

UnknownText_0x1c6030::
	text "Ich stelle die Uhr"
	line "eine Stunde vor."
	prompt

UnknownText_0x1c6056::
	text "Ist die Sommer-"
	line "zeit vorüber?"
	done

UnknownText_0x1c6075::
	text "Ich stelle die Uhr"
	line "eine Stunde zu-"
	cont "rück."
	prompt

UnknownText_0x1c6095::
	text "Möchtest du die"
	line "Uhrzeit der"

	para "Sommerzeit an-"
	line "passen?"
	done

UnknownText_0x1c60d1::
	text "Ich habe die An-"
	line "leitung für den"
	cont "#COM verloren."

	para "Komm später noch"
	line "mal wieder."
	prompt
