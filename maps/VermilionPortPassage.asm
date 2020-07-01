	const_def 2 ; object constants
	const VERMILIONPORTPASSAGE_TEACHER
	const INDIGOPLATEAUPOKECENTER1F_GRAMPS
	const INDIGOPLATEAUPOKECENTER1F_ABRA

VermilionPortPassage_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

VermilionPortPassageTeacherScript:
	jumptextfaceplayer VermilionPortPassageTeacherText
	
TeleportGuyScript:
	faceplayer
	opentext
	checkevent EVENT_EXPLODING_TRAP_1
	iftrue .SkipTeleportTextAmami
	writetext TeleportGuyText1
	buttonsound
	setevent EVENT_EXPLODING_TRAP_1
.SkipTeleportTextAmami
	writetext TeleportGuyText1_2
	yesorno
	iffalse .No
	writetext TeleportGuyYesText
	waitbutton
	closetext
	playsound SFX_WARP_TO
	special FadeOutPalettes
	waitsfx
	warp OLIVINE_PORT_PASSAGE, 13, 2
	end

.No:
	writetext TeleportGuyNoText
	waitbutton
	closetext
	end

AbraScript:
	opentext
	writetext AbraText
	cry ABRA
	waitbutton
	closetext
	end


VermilionPortPassageTeacherText:
	text "The S.S.AQUA sails"
	line "to WEST CITY on"
	para "Wednesdays and"
	line "Sundays."
	done
	

TeleportGuyText1:
	text "Don't feel like"
	line "taking the ship?"
	para "Or maybe it isn't"
	line "running today?"
	para "Well look here!"
	para "My beloved ABRA"
	line "can send you back"
	para "to the mainland in"
	line "an instant!"
	para "I got a buddy"
	line "waiting at the"
	cont "WEST CITY DOCKS."
	para "I'll send you to"
	line "him!"
	para "How about it?"
	done
	
TeleportGuyText1_2:
	text "Want to go to"
	line "WEST CITY?"
	done

TeleportGuyYesText:
	text "OK, OK. Picture"
	line "WEST CITY in your"
	cont "mind…"
	done

TeleportGuyNoText:
	text "OK, OK. I'll be"
	line "here!"
	done

AbraText:
	text "ABRA: Aabra…"
	done


VermilionPortPassage_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 19,  4, VERMILION_CITY, 1
	warp_event 19,  5, VERMILION_CITY, 2
	warp_event 15, 14, VERMILION_PORT_PASSAGE, 4
	warp_event 15,  4, VERMILION_PORT_PASSAGE, 3
	warp_event  3, 14, VERMILION_PORT, 1

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event 18,  2, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionPortPassageTeacherScript, -1
	object_event 13,  1, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TeleportGuyScript, EVENT_TELEPORT_GUY
	object_event 14,  1, SPRITE_JYNX, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, AbraScript, EVENT_TELEPORT_GUY
