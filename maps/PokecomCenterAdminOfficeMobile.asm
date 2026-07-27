	const_def 2 ; object constants
	const POKECOMCENTERADMINOFFICEMOBILE_SCIENTIST1
	const POKECOMCENTERADMINOFFICEMOBILE_SCIENTIST2
	const POKECOMCENTERADMINOFFICEMOBILE_SCIENTIST3

PokecomCenterAdminOfficeMobile_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PokecomCenterAdminOfficeMobileScientist1Script:
	jumptextfaceplayer PokecomCenterAdminOfficeMobileScientist1Text

PokecomCenterAdminOfficeMobileScientist2Script:
	jumptextfaceplayer PokecomCenterAdminOfficeMobileScientist2Text

PokecomCenterAdminOfficeMobileScientist3Script:
	jumptextfaceplayer PokecomCenterAdminOfficeMobileScientist3Text

PokecomCenterAdminOfficeMobileComputer1:
	opentext
	writetext PokecomCenterAdminOfficeMobileComputer1Text
	waitbutton
.loop:
	reloadmappart
	loadmenu .Computer1MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .PokeComClub
	ifequal 2, .MobileCenter
	jump .Quit

.PokeComClub:
	opentext
	writetext PokecomCenterAdminOfficeMobileComputer1Text_PokeComClub
	waitbutton
	jump .loop

.MobileCenter:
	opentext
	writetext PokecomCenterAdminOfficeMobileComputer1Text_MobileCenter
	waitbutton
	jump .loop

.Quit:
	closetext
	end

.Computer1MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 15, 8
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 3 ; items
	db "#KOM-CLUB@" ; # COM CLUB
	db "MOBILES CENTER@" ; MOBILE CENTER
	db "ZURÜCK@" ; QUIT

PokecomCenterAdminOfficeMobileComputer2:
	opentext
	writetext PokecomCenterAdminOfficeMobileComputer2Text
	waitbutton
.loop:
	reloadmappart
	loadmenu .Computer2MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .UsePhone
	ifequal 2, .DontUsePhone
	jump .Quit

.UsePhone:
	opentext
	writetext PokecomCenterAdminOfficeMobileComputer2Text_UsePhone
	waitbutton
	jump .loop

.DontUsePhone:
	opentext
	writetext PokecomCenterAdminOfficeMobileComputer2Text_DontUsePhone
	waitbutton
	jump .loop

.Quit:
	closetext
	end

.Computer2MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 15, 8
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 3 ; items
	db "HANDY-NUTZUNG@" ; Use phone
	db "KEIN NETZEMPFANG@" ; Don't use phone
	db "ZURÜCK@" ; QUIT

PokecomCenterAdminOfficeMobileComputer3:
	jumptext PokecomCenterAdminOfficeMobileComputer3Text

PokecomCenterAdminOfficeMobileScientist1Text:
	text "Das #KOM-CENTER"
	line "und das MOBILE"
	para "CENTER wurden"
	line "errichtet, um das"
	para "Tauschen und"
	line "Kämpfen mit"
	para "weit entfernten"
	line "Freunden und sogar"
	para "wildfremden"
	line "Trainern zu"
	cont "ermöglichen."
	done

PokecomCenterAdminOfficeMobileScientist2Text:
	text "Warst du nicht"
	line "auch beeindruckt,"
	para "als du dich das"
	line "erste Mal über"
	para "dein Handy mit"
	line "jemandem verbunden"
	cont "hast?"

	para "Bei meinem ersten"
	line "erfolgreichen"
	para "Versuch war ich"
	line "so beeindruckt,"
	para "dass ich sogar"
	line "Gänsehaut bekam!"
	done

PokecomCenterAdminOfficeMobileScientist3Text:
	text "Dank Fortschritten"
	line "auf dem Gebiet der"
	para "Funktechnologie,"
	line "konnten sie diese"
	cont "Stätte bauen."
	done

PokecomCenterAdminOfficeMobileComputer1Text:
	text "Eine Notiz über"
	line "die Einsatzzwecke"
	para "des MOBILEN"
	line "ADAPTERs…"
	done

PokecomCenterAdminOfficeMobileComputer1Text_PokeComClub:
	text "Es gibt in jedem"
	line "#MON-CENTER im"
	para "Obergeschoss den"
	line "#KOM-CLUB."
	para "Mit einem MOBILEN"
	line "ADAPTER kannst du"
	para "dort mit weit"
	line "entfernten"
	para "Freunden kämpfen"
	line "oder tauschen."

	para "Um sich verbinden"
	line "zu können, benö-"
	cont "tigen dein Freund"
	para "und du die gleiche"
	line "Art eines MOBILEN"
	cont "ADAPTERs."
	done

PokecomCenterAdminOfficeMobileComputer1Text_MobileCenter:
	text "TAUSCHECKE und"
	line "#MON-NACHRICH-"
	cont "TEN werden über"
	para "eine Verbindung"
	line "zum MOBILEN CENTER"
	cont "bereitgestellt."
	para "Hierfür musst du"
	line "dich zunächst beim"
	para "MOBILEN CENTER"
	line "registrieren."
	done

PokecomCenterAdminOfficeMobileComputer2Text:
	text "Eine Notiz über"
	line "die Handy-Nutzung…"
	done

PokecomCenterAdminOfficeMobileComputer2Text_UsePhone:
	text "Verbinde das Handy"
	line "und den MOBILEN"
	para "ADAPTER sicher"
	line "miteinander und"
	para "achte auf guten"
	line "Netzempfang."

	para "Berühre während"
	line "der Übertragung"
	para "nicht dein Handy"
	line "und trenne nicht"
	cont "die Verbindung."
	done

PokecomCenterAdminOfficeMobileComputer2Text_DontUsePhone:
	text "Wenn der Server"
	line "überlastet ist,"
	para "könnte ein Ver-"
	line "bindungsversuch"
	cont "scheitern."

	para "Versuche es dann"
	line "später erneut."

	para "Wenn du dich"
	line "weiterhin nicht"
	para "verbinden kannst"
	line "oder die Fehler-"
	cont "meldungen nicht"
	para "verständlich sind,"
	line "wende dich an den"
	para "Kundendienst oder"
	line "erfahre mehr in"
	para "der Bedienungs-"
	line "anleitung."
	done

PokecomCenterAdminOfficeMobileComputer3Text:
	text "Eine E-Mail an das"
	line "VERWALTUNGS-BÜRO…"

	para "<……> <……> <……>"

	para "An die #KOM-"
	line "CENTER-Beleg-"
	cont "schaft…"

	para "Dank der Funktech-"
	line "nologie können"
	para "Trainer jetzt lan-"
	line "desweit miteinan-"
	cont "der interagieren."

	para "Lasst uns auch"
	line "weiterhin unser"
	para "Bestes geben,"
	line "damit sich Trainer"
	para "eines Tages auch"
	line "über Ländergrenzen"
	para "hinweg miteinander"
	line "verbinden können!"

	para "<……> <……> <……>"
	done

PokecomCenterAdminOfficeMobile_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  0, 31, WESTPORT_POKECENTER_1F, 3
	warp_event  1, 31, WESTPORT_POKECENTER_1F, 3

	db 0 ; coord events

	db 3 ; bg events
	bg_event  6, 26, BGEVENT_UP, PokecomCenterAdminOfficeMobileComputer1
	bg_event  6, 28, BGEVENT_UP, PokecomCenterAdminOfficeMobileComputer2
	bg_event  3, 26, BGEVENT_UP, PokecomCenterAdminOfficeMobileComputer3

	db 3 ; object events
	object_event  4, 28, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PokecomCenterAdminOfficeMobileScientist1Script, -1
	object_event  7, 27, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PokecomCenterAdminOfficeMobileScientist2Script, -1
	object_event  7, 29, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PokecomCenterAdminOfficeMobileScientist3Script, -1
