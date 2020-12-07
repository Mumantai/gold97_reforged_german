DoAnimFrame:
	ld hl, SPRITEANIMSTRUCT_ANIM_SEQ_ID
	add hl, bc
	ld e, [hl]
	ld d, 0
	ld hl, .Jumptable
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.Jumptable:
; entries correspond to SPRITE_ANIM_SEQ_* constants
	dw .Null
	dw .PartyMon
	dw .PartyMonSwitch
	dw .PartyMonSelected
	dw .Null
	dw .NamingScreenCursor
	dw .GameFreakLogo
	dw .GSIntroStar
	dw .GSIntroSparkle
	dw .SlotsGolem
	dw .SlotsChansey
	dw .SlotsChanseyEgg
	dw .MailCursor
	dw .UnusedCursor
	dw .DummyGameCursor
	dw .PokegearArrow
	dw .TradePokeBall
	dw .TradeTubeBulge
	dw .TrademonInTube
	dw .RevealNewMon
	dw .RadioTuningKnob
	dw .CutLeaves
	dw .FlyFrom
	dw .FlyLeaf
	dw .FlyTo
	dw .Null
	dw .EZChatCursor
	dw .MobileTradeSentPulse
	dw .MobileTradeOTPulse
	dw .Null ;.IntroSuicune
	dw .Null ;.IntroPichuAnchorage
	dw .Leafeon
	dw .Null ;.IntroUnown
	dw .Null ;.IntroUnownF
	dw .Null ;.IntroSuicuneAway
	dw .TitleFlame

	dw .AnimSeq_GSIntroFireball
	dw .AnimSeq_GSIntroChikoritaTotodile
	dw .AnimSeq_GSIntroCyndaquil
	dw .AnimSeq_GSIntroPikachuTail
	dw .AnimSeq_GSIntroPikachu
	dw .AnimSeq_GSIntroJigglypuff
	dw .AnimSeq_GSIntroNote
	dw .AnimSeq_GSIntroLapras
	dw .AnimSeq_GSIntroShellder
	dw .AnimSeq_GSIntroMagikarp
	dw .AnimSeq_GSIntroBubble
	dw .AnimSeq_GSIntroAerodactyl


.Null:
	ret

.PartyMon
	ld a, [wMenuCursorY]

	ld hl, SPRITEANIMSTRUCT_INDEX
	add hl, bc
	cp [hl]
	jr z, .PartyMonSwitch

	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld [hl], 8 * 2

	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], $0
	ret

.PartyMonSwitch
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld [hl], 8 * 3

	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	ld d, a
	inc [hl]
	and $f
	ret nz

	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld e, [hl]

	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld a, d
	and $10 ; bit 4
	jr z, .load_zero
	ld a, e
	and a
	jr z, .load_minus_two
	cp $1
	jr z, .load_minus_one
.load_zero
	xor a
	ld [hl], a
	ret

.load_minus_one
	ld a, -1
	ld [hl], a
	ret

.load_minus_two
	ld a, -2
	ld [hl], a
	ret

.PartyMonSelected
	ld a, [wMenuCursorY]

	ld hl, SPRITEANIMSTRUCT_INDEX
	add hl, bc
	cp [hl]
	jr z, .three_offset_right

	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld [hl], 8 * 2
	ret

.three_offset_right
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld [hl], 8 * 3
	ret

.NamingScreenCursor
	callfar NamingScreen_AnimateCursor
	ret

.MailCursor
	callfar ComposeMail_AnimateCursor
	ret

.GameFreakLogo:
	callfar GameFreakLogoJumper
	ret

.GSIntroStar
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_8d3ba
	dec [hl]
	dec [hl]
	ld d, a
	and $1f
	jr nz, .asm_8d395

	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	dec [hl]
.asm_8d395
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld a, [hl]
	push af
	push de
	call .Sprites_Sine

	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call .Sprites_Cosine

	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a

	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld a, [hl]

	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	add [hl]
	ld [hl], a
	ret

.asm_8d3ba
	ld a, $1
	ld [wcf64], a
	call DeinitializeSprite
	ret

.GSIntroSparkle
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hli]
	or [hl]
	jr z, .asm_8d41e

	ld hl, SPRITEANIMSTRUCT_0F
	add hl, bc
	ld d, [hl]

	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld a, [hl]
	push af
	push de
	call .Sprites_Sine

	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call .Sprites_Cosine

	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a

	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]

	ld hl, SPRITEANIMSTRUCT_0E
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	add hl, de
	ld e, l
	ld d, h

	ld hl, SPRITEANIMSTRUCT_0E
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d

	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, -$10
	add hl, de
	ld e, l
	ld d, h

	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d

	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld a, [hl]
	xor $20
	ld [hl], a
	ret

.asm_8d41e
	call DeinitializeSprite
	ret

.SlotsGolem:
	callfar Slots_AnimateGolem
	ret

.SlotsChansey:
	callfar Slots_AnimateChansey
	ld hl, wcf64
	ld a, [hl]
	cp $2
	ret nz
	ld [hl], $3
	ld a, SPRITE_ANIM_FRAMESET_SLOTS_CHANSEY_2
	call _ReinitSpriteAnimFrame
	ret

.SlotsChanseyEgg:
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld a, [hl]
	dec [hl]
	ld e, a
	and $1
	jr z, .move_vertical

	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp 15 * 8
	jr c, .move_right
	call DeinitializeSprite
	ld a, $4
	ld [wcf64], a
	ld de, SFX_PLACE_PUZZLE_PIECE_DOWN
	call PlaySFX
	ret

.move_right
	inc [hl]
.move_vertical
	ld a, e
	ld d, $20
	call .Sprites_Sine

	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ret

.UnusedCursor
	callfar ret_e00ed
	ret

.PokegearArrow
	callfar AnimatePokegearModeIndicatorArrow
	ret

.DummyGameCursor
	callfar DummyGame_InterpretJoypad_AnimateCursor
	ret

.TradePokeBall
	call .AnonymousJumptable
	jp hl

; Anonymous dw (see .AnonymousJumptable)
	dw .TradePokeBall_zero
	dw .TradePokeBall_one
	dw .TradePokeBall_two
	dw .TradePokeBall_three
	dw .TradePokeBall_four
	dw .TradePokeBall_five

.TradePokeBall_zero
	ld a, SPRITE_ANIM_FRAMESET_TRADE_POKE_BALL_WOBBLE
	call _ReinitSpriteAnimFrame

	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld [hl], $2

	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld [hl], $20
	ret

.TradePokeBall_two
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_8d4af
	dec [hl]
	ret

.asm_8d4af
	call .IncrementJumptableIndex

	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld [hl], $40

.TradePokeBall_three
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	cp $30
	jr c, .asm_8d4cd
	dec [hl]
	ld d, $28
	call .Sprites_Sine

	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ret

.asm_8d4cd
	ld de, SFX_GOT_SAFARI_BALLS
	call PlaySFX
	jr .TradePokeBall_five

.TradePokeBall_one
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld [hl], $4

	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld [hl], $30

	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld [hl], $24
	ret

.TradePokeBall_four
	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_8d51c
	ld d, a

	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	call Sprites_Sine

	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a

	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	inc [hl]
	ld a, [hl]
	and $3f
	ret nz

	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld [hl], $20

	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld a, [hl]
	sub $c
	ld [hl], a
	ld de, SFX_SWITCH_POKEMON
	call PlaySFX
	ret

.asm_8d51c
	xor a

	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	call .IncrementJumptableIndex
	ret

.TradePokeBall_five
	call DeinitializeSprite
	ret

.TradeTubeBulge
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	inc [hl]
	inc [hl]
	cp $b0
	jr nc, .delete
	and $3
	ret nz
	ld de, SFX_POKEBALLS_PLACED_ON_TABLE
	call PlaySFX
	ret

.delete
	call DeinitializeSprite
	ret

.TrademonInTube
	callfar TradeAnim_AnimateTrademonInTube
	ret

.RevealNewMon:
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	cp $80
	jr nc, .finish_EggShell
	ld d, a
	add $8
	ld [hl], a

	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld a, [hl]
	xor $20
	ld [hl], a

	push af
	push de
	call .Sprites_Sine

	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a

	pop de
	pop af
	call .Sprites_Cosine

	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ret

.finish_EggShell
	call DeinitializeSprite
	ret

.RadioTuningKnob:
	callfar AnimateTuningKnob
	ret

.CutLeaves
	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $80
	add hl, de
	ld e, l
	ld d, h

	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d

	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	inc [hl]
	inc [hl]
	inc [hl]
	push af
	push de
	call .Sprites_Sine

	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call .Sprites_Cosine

	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ret

.FlyFrom:
	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	ld a, [hl]
	and a
	ret z

	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld a, [hl]
	inc [hl]
	cp $40
	ret c

	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	dec [hl]
	dec [hl]

	ld hl, SPRITEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	ld d, a
	cp $40
	jr nc, .skip
	add $8
	ld [hl], a
.skip
	ld hl, SPRITEANIMSTRUCT_0E
	add hl, bc
	ld a, [hl]
	inc [hl]
	call .Sprites_Cosine

	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ret

.FlyLeaf:
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp -9 * 8
	jr nc, .delete_leaf
	inc [hl]
	inc [hl]

	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	dec [hl]

	ld d, $40
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	inc [hl]
	call .Sprites_Cosine

	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ret

.delete_leaf
	call DeinitializeSprite
	ret

.FlyTo:
	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	ld a, [hl]
	cp 10 * 8 + 4
	ret z

	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	inc [hl]
	inc [hl]

	ld hl, SPRITEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	ld d, a
	and a
	jr z, .asm_8d621
	sub $2
	ld [hl], a
.asm_8d621
	ld hl, SPRITEANIMSTRUCT_0E
	add hl, bc
	ld a, [hl]
	inc [hl]
	call .Sprites_Cosine

	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ret

.MobileTradeSentPulse
	farcall Function108bc7
	ret

.MobileTradeOTPulse
	farcall Function108be0
	ret

.EZChatCursor
	farcall AnimateEZChatCursor
	ret

.Leafeon
	farcall UpdateLeafeonPosition
	ret

.TitleFlame:
	; Move a tad to the left
	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld a, [hl]
	ld d, a
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	sub d
	ld [hl], a

	; Set the y offset
	ld a, d
	add a
	add a
	ld d, a
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	inc [hl]
	inc [hl]
	call .Sprites_Sine
	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ret

.AnonymousJumptable:
	ld hl, sp+$0
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de

	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

.IncrementJumptableIndex:
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	inc [hl]
	ret

.Sprites_Sine:
	call Sprites_Sine
	ret

.Sprites_Cosine:
	call Sprites_Cosine
	ret

.AnimSeq_GSIntroBubble:
	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld a, [hl]
	inc [hl]
	cp $40
	jr nc, .intro_bubble_delete

	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	dec [hl]
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	add 2
	ld [hl], a
	ld d, 8
	call .Sprites_Sine
	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ret
.intro_bubble_delete
	call DeinitializeSprite
	ret

.AnimSeq_GSIntroShellder:
	ld a, [wGlobalAnimYOffset]
	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	add [hl]
	cp $b0
	ret c
	call DeinitializeSprite
	ret

.AnimSeq_GSIntroMagikarp:
	call .AnonymousJumptable
	jp hl
.m_anon_dw
	dw .m_zero
	dw .m_one
.m_zero
	call .IncrementJumptableIndex
	ld hl, SPRITEANIMSTRUCT_INDEX
	add hl, bc
	ld a, [hl]
	and $3
	swap a
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld [hl], a
.m_one
	lb de, 4, 2
	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld a, [hl]
	cp $f0
	jr nc, .m_delete
	add d
	ld [hl], a
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	add e
	ld [hl], a
	ld d, 8
	call .Sprites_Sine
	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ret
.m_delete
	call DeinitializeSprite
	ret

.AnimSeq_GSIntroLapras:
	call .AnonymousJumptable
	jp hl
.l_anon_dw
	dw .l_zero
	dw .l_one
	dw .l_two
.l_zero
	call .l_update_y_offset
	ret z
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $58
	jr c, .l_next1
	dec [hl]
	ret
.l_next1
	call .IncrementJumptableIndex
	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld [hl], $b0
	ret
.l_one
	call .l_update_y_offset
	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld a, [hl]
	and a
	jr z, .l_next2
	dec [hl]
	ret
.l_next2
	call .IncrementJumptableIndex
	ret
.l_two
	call .l_update_y_offset
	ret z
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $d0
	jr z, .l_delete
	dec [hl]
	ret
.l_delete
	call DeinitializeSprite
	ld a, TRUE
	ld [wIntroSpriteStateFlag], a
	ret
.l_update_y_offset
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	inc [hl]
	ld d, 4
	call .Sprites_Sine
	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	and $1
	ret

.AnimSeq_GSIntroNote:
	call .AnonymousJumptable
	jp hl
.in_anon_dw
	dw .in_zero
	dw .in_one
.in_zero
	call .IncrementJumptableIndex
	ld hl, 0
	add hl, bc
	ld a, [hl]
	and $1
	swap a
	sla a
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld [hl], a
.in_one
	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld a, [hl]
	cp $80
	jr nc, .in_delete
	inc [hl]
	ld d, 4
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	add 2
	ld [hl], a
	call .Sprites_Sine
	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	and $2
	ret z
	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	dec [hl]
	ret
.in_delete
	call DeinitializeSprite
	ret

.AnimSeq_GSIntroJigglypuff:
	call .AnonymousJumptable
	jp hl
.j_anon_dw
	dw .j_zero
	dw .j_one
.j_zero
	ld a, [wIntroSpriteStateFlag]
	and a
	ret z
	call .IncrementJumptableIndex
	ld a, SPRITE_ANIM_FRAMESET_GS_INTRO_JIGGLYPUFF_2
	call _ReinitSpriteAnimFrame
.j_one
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $d0
	jr z, .j_delete
	dec [hl]
	dec [hl]
	ret
.j_delete
	call DeinitializeSprite
	ret

.AnimSeq_GSIntroPikachu:
	call .AnonymousJumptable
	jp hl
.p_anon_dw
	dw .p_zero
	dw .p_one
	dw .p_two
	dw .p_three
.p_zero
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $80
	jr z, .p_next1
	dec [hl]
	ret
.p_next1
	call .IncrementJumptableIndex
	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld [hl], $30
	ld a, SPRITE_ANIM_FRAMESET_GS_INTRO_PIKACHU_2
	call _ReinitSpriteAnimFrame
	ret
.p_one
	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld a, [hl]
	and a
	jr z, .p_next2
	dec [hl]
	ret
.p_next2
	call .IncrementJumptableIndex
	ld a, SPRITE_ANIM_FRAMESET_GS_INTRO_PIKACHU_3
	call _ReinitSpriteAnimFrame
	ret
.p_two
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	add 4
	ld [hl], a
	ld d, 4
	call .Sprites_Sine
	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $50
	jr z, .p_next3
	dec [hl]
	dec [hl]
	dec [hl]
	dec [hl]
	ret
.p_next3
	ld a, TRUE
	ld [wIntroSpriteStateFlag], a
	call .IncrementJumptableIndex
	ret
.p_three
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $d0
	jr z, .p_delete
	dec [hl]
	dec [hl]
	ret
.p_delete
	call DeinitializeSprite
	ret

.AnimSeq_GSIntroPikachuTail:
	call .AnonymousJumptable
	jp hl
.pt_anon_dw
	dw .pt_zero
	dw .pt_one
	dw .pt_two
.pt_zero
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $80
	jr z, .pt_next1
	dec [hl]
	ret
.pt_next1
	call .IncrementJumptableIndex
	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld [hl], $30
	ld a, SPRITE_ANIM_FRAMESET_GS_INTRO_PIKACHU_TAIL_2
	call _ReinitSpriteAnimFrame
	ret
.pt_one
	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld a, [hl]
	and a
	jr z, .pt_next2
	dec [hl]
	cp $20
	ret nz
	ld a, SPRITE_ANIM_FRAMESET_GS_INTRO_PIKACHU_TAIL
	call _ReinitSpriteAnimFrame
	ret
.pt_next2
	call .IncrementJumptableIndex
	ret
.pt_two
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	add 4
	ld [hl], a
	ld d, 4
	call .Sprites_Sine
	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $d0
	jr z, .pt_delete
	dec [hl]
	dec [hl]
	ld a, [wIntroSpriteStateFlag]
	and a
	ret nz
	dec [hl]
	dec [hl]
	ret
.pt_delete
	call DeinitializeSprite
	ret

.AnimSeq_GSIntroFireball:
	call .AnonymousJumptable
	jp hl
.fb_anon_dw
	dw .fb_zero
	dw .fb_one
.fb_zero
	call .IncrementJumptableIndex
	ld hl, 0
	add hl, bc
	ld a, [hl]
	and $4
	sla a
	ld e, a
	ld a, [hl]
	and $3
	swap a
	add e
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld [hl], a
	ret
.fb_one
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	dec [hl]
	dec [hl]
	dec [hl]
	dec [hl]
	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld a, [hl]
	ld d, a
	add 8
	ld [hl], a
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	push af
	push de
	call .Sprites_Sine
	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call .Sprites_Cosine
	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ret

.AnimSeq_GSIntroChikoritaTotodile:
	call .AnonymousJumptable
	jp hl
.ctd_anon_dw
	dw .ctd_zero
	dw .ctd_one
.ctd_zero
	call .IncrementJumptableIndex
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld [hl], $30
	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld [hl], $30
	ret
.ctd_one
; flash down/right
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	cp $3c
	ret nc
	inc [hl]
	inc [hl]
	ld d, $90
	call .Sprites_Sine
	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld a, [hl]
	inc [hl]
	inc [hl]
	ld d, $90
	call .Sprites_Cosine
	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ret

.AnimSeq_GSIntroCyndaquil:
	call .AnonymousJumptable
	jp hl
.cy_anon_dw
	dw .cy_zero
	dw .cy_one
.cy_zero
	call .IncrementJumptableIndex
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld [hl], $30
	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld [hl], $10
	ret
.cy_one
; flash down/left
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	cp $3c
	ret nc
	inc [hl]
	inc [hl]
	ld d, $90
	call .Sprites_Sine
	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld a, [hl]
	inc [hl]
	inc [hl]
	ld d, $90
	call .Sprites_Cosine
	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ret

.AnimSeq_GSIntroAerodactyl:
	ld hl, SPRITEANIMSTRUCT_0D	; frame counter (y offset)
	add hl, bc
	ld a, [hl]			; apply sine
	ld d, 5				; amplitude
	call .Sprites_Sine
	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a

	ld hl, SPRITEANIMSTRUCT_0C	; frame counter (x)
	add hl, bc
	ld a, [hl]
	inc [hl]
	cp $01
	ret nz				; move aerodactyl every 2 frames
	xor a
	ld [hl], a			; clear frame counter

	ld hl, SPRITEANIMSTRUCT_0D	; frame counter (y)
	add hl, bc
	inc [hl]			; increase the y-offset counter
					; at the same rate as x

	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $b0
	jr nc, .a_delete		; delete when off the screen

	inc [hl]			; move aerodactyl to the right

	ld hl, SPRITEANIMSTRUCT_0E	; frame counter (y location)
	add hl, bc
	ld a, [hl]
	inc [hl]
	cp $04
	ret nz				; move aerodactyl every 4 * 2 frames
	xor a
	ld [hl], a			; clear frame counter

	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	inc [hl]			; move aerodactyl to the bottom
	ret

.a_delete
	call DeinitializeSprite
	ret
