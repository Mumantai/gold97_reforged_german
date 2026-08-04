	const_def 2 ; object constants
	const KANTOHOUSE_4_FISHING_GURU

KantoHouse4_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
KantoHouse4FishingGuru:
	faceplayer
	opentext
	checkevent EVENT_KANTO_FISHING_GURU_ELIXIR_ON_STANDBY
	iftrue .GetReward
	checkevent EVENT_KANTO_FISHING_GURU_ASKED_FOR_MAGIKARP
	iftrue .AskedForMagikarp
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .ClearedRocketHideout
	checkevent EVENT_KANTO_FISHING_GURU_EXPLAINED_WEIRD_MAGIKARP
	iftrue .ExplainedHistory
	writetext MagikarpLengthRaterText_LakeOfRageHistory
	waitbutton
	closetext
	setevent EVENT_KANTO_FISHING_GURU_EXPLAINED_WEIRD_MAGIKARP
	end

.ExplainedHistory:
	writetext MagikarpLengthRaterText_MenInBlack
	waitbutton
	closetext
	end

.ClearedRocketHideout:
	writetext MagikarpLengthRaterText_WorldsLargestMagikarp
	waitbutton
	closetext
	setevent EVENT_KANTO_FISHING_GURU_ASKED_FOR_MAGIKARP
	end

.AskedForMagikarp:
	writebyte MAGIKARP
	special FindPartyMonThatSpecies
	iffalse .ClearedRocketHideout
	writetext MagikarpLengthRaterText_YouHaveAMagikarp
	waitbutton
	special CheckMagikarpLength
	ifequal MAGIKARPLENGTH_NOT_MAGIKARP, .NotMagikarp
	ifequal MAGIKARPLENGTH_REFUSED, .Refused
	ifequal MAGIKARPLENGTH_TOO_SHORT, .TooShort
	jump .GetReward

.GetReward:
	writetext MagikarpLengthRaterText_Memento
	buttonsound
	verbosegiveitem ELIXER
	iffalse .NoRoom
	writetext MagikarpLengthRaterText_Bonus
	waitbutton
	closetext
	clearevent EVENT_KANTO_FISHING_GURU_ELIXIR_ON_STANDBY
	end

.NoRoom:
	closetext
	setevent EVENT_KANTO_FISHING_GURU_ELIXIR_ON_STANDBY
	end

.TooShort:
	writetext MagikarpLengthRaterText_TooShort
	waitbutton
	closetext
	end

.NotMagikarp:
	writetext MagikarpLengthRaterText_NotMagikarp
	waitbutton
	closetext
	end

.Refused:
	writetext MagikarpLengthRaterText_Refused
	waitbutton
	closetext
	end

MagikarpHouseBookshelf:
	jumpstd difficultbookshelf

MagikarpLengthRaterText_LakeOfRageHistory:
	text "UNUSED" ; wasting a lot of space on unused text tbh
	done

MagikarpLengthRaterText_MenInBlack:
	text "Verschwinde,"
	line "Knirps."
	done

MagikarpLengthRaterText_WorldsLargestMagikarp:
	text "Seit ich ein Kind"
	line "war, liebe ich"
	cont "KARPADOR."

	para "Vielleicht geht"
	line "nun mein Traum in"
	cont "Erfüllung, das"
	cont "größte KARPADOR"
	cont "der Welt zu sehen!"

	para "Hast du eine"
	line "ANGEL? Wenn ja,"
	cont "dann hilf mir"
	cont "bitte!"
	done

MagikarpLengthRaterText_YouHaveAMagikarp:
	text "Ah, du hast ein"
	line "KARPADOR! Lass uns"

	para "sehen, wie groß"
	line "das Kleine ist."
	done

MagikarpLengthRaterText_Memento:
	text "Wow! Das ist ja"
	line "riesig!"

	para "Ich ziehe meinen"
	line "Hut vor dir!"

	para "Nimm das als An-"
	line "denken!"
	done

MagikarpLengthRaterText_Bonus:
	text "Wichtig ist nur"
	line "die Erinnerung."

	para "Sieh es als eine"
	line "Art Bonus!"
	done

MagikarpLengthRaterText_TooShort:
	text "Wow! Das ist ja"
	line "riesig!"

	para "…Zumindest würde"
	line "ich das gerne sa-"
	cont "gen, aber ich habe"

	para "schon größere ge-"
	line "sehen."
	done

MagikarpLengthRaterText_NotMagikarp:
	text "Was? Das ist kein"
	line "KARPADOR!"
	done

MagikarpLengthRaterText_Refused:
	text "Oh… Du hast also"
	line "keines, das es"

	para "wert wäre, mir zu"
	line "zeigen? Vielleicht"
	cont "beim nächsten Mal."
	done


KantoHouse4_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, KANTO_REGION, 28
	warp_event  5,  7, KANTO_REGION, 28

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  4,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoHouse4FishingGuru, -1
