	; ���g�p���ۂ�RAM
	;$06B0�F�t���[��
	;$06B1�F�b��
	;$06B2�F�t���[��(�^�C���\���p)
	;$06B3�F�b��(�^�C���\���p)
	;$06B4�F100%���[�g�t���O(0:Any%/1:100%)
	;$06B5�F�{�X��(0:Wind First/1:Flame First/2:Knight First)
	;$06B6�FBGM�t���O(0:ON/1:OFF)
	;$06C0�F�֐��ptmp�ϐ�
	;$06C1�F�֐��ptmp�ϐ�
	;$06C2�F�t���[���^�C��tmp(�^�C���\���p)
	;$06C3�F�b���^�C��tmp(�^�C���\���p)

	; �I�[�v�j���O�����X�L�b�v
	;BANKORG_D $3E0CC9		; PC:$7CCC9
	;nop					; �f�t�H���g��jsr $CB28
	;nop					; �f�t�H���g��db $01
	;nop
	;nop

	; �}�b�p�[��MMC3��119�ɕύX���邽��chr_ram_banks���C��
	BANKORG_D $3F1F50		; PC:$7FF50
	db $40, $42, $44, $45, $46, $47		;���ꂼ��+40

	; CAPCOM���S�����X�L�b�v
	BANKORG_D $3E0CC3		; PC:$7CCC3
	db $EA, $EA, $EA		; �f�t�H���g��jsr $D048

	; �I�[�v�j���O�X�L�b�v
	BANKORG_D $3E0CC9		; PC:$7CCC9
	db $EA, $EA, $EA, $EA	; �f�t�H���g��jsr $CB28, .db $01

	; �^�C�g�����(GAME START) �p�^�[���e�[�u��
	BANKORG_D $3C0930		; PC:$78930
	;�f�t�H���g:A6 6C 85 A7 00 A8 A9 6C AA A9
	;  A    N    Y    %
	db $6C, $A6, $A7, $A8, $00, $00, $00, $00, $00, $00

	; �^�C�g�����(PASS WORD) �p�^�[���e�[�u��
	BANKORG_D $3C0946		; PC:$78946
	;�f�t�H���g:6F 6C A8 A8 00 9C 84 AA 9D
	;  1    O    O    %
	db $9C, $84, $84, $A8, $00, $00, $00, $00, $00

	; �^�C�g�����(CAPCOM 1993) �p�^�[���e�[�u��
	BANKORG_D $3C0961		; PC:$78961
	;�f�t�H���g:01 67 6C 6F 67 84 85 00 20 30 30 93
	;  P    R    A    C         H    A    C    K
	db $6F, $30, $6C, $67, $00, $93, $6C, $67, $01
	;  v    1.0 
	db $9D, $85, $00

	; �X�e�[�W�I�����(PUSH START) �p�^�[���e�[�u��
	BANKORG_D $3C0DF9		; PC:$78DF9
	;�f�t�H���g:3A 3F 3D 32 10 10 3D 3E 2B 3C 3E
	;                                F    I    R    S    T
    db $10, $10, $10, $10, $10, $10, $30, $33, $3C, $3D, $3E

	; ���j���[���l�\������(E��) �p�^�[���e�[�u��
	BANKORG_D $3C0CCB		; PC:$78CCB
	db $09, $0A				; �f�t�H���g:$01, $01

	; ���j���[���l�\������(�c�@) �p�^�[���e�[�u��
	BANKORG_D $3C0CD6		; PC:$78CD6
	db $09, $0A				; �f�t�H���g:$01, $01

	; ���j���[���l�\������(E�ʁA�c�@) �X�V����
	BANKORG_D $381A85		; PC:$71A85
	ldx <$47				; ������
	lda #$01				; ������
	sta $0780,x				; ������
	sta $0784,x				; ������
	lda #$23				; ������
	sta $0781,x				; ������
	lda #$3B				; ������
	sta $0782,x				; ������
	lda #$0A				; �f�t�H���g:lda $A9
	nop						; �f�t�H���g:clc
	db $EA, $EA				; �f�t�H���g:adc #$01
	sta $0783,x				; �c�@1����
	lda #$23				; ������
	sta $0785,x				; ������(E��1����,y���W)
	lda #$28				; ������
	sta $0786,x				; ������(E��1����,x���W)
	lda #$0A				; �f�t�H���g:lda $06A1
	nop						; �f�t�H���g:clc
	db $EA, $EA				; �f�t�H���g:adc #$01
	sta $0787,x				; E��1����
	txa						; ������
	clc						; ������
	adc #$08				; ������
	sta <$47				; ������
	rts						; ������

	; �^�C�g����ʂ�100%�p�t���O������
	BANKORG_D $3E0D08		; PC:$7CD08
	jsr TitleScreenInit
	nop

	; �^�C�g����ʂ�PASS WORD�I������GAME START�Ɠ��������{100%�p�t���O����
	BANKORG_D $3E0D18		; PC:$7CD18
	lda #$02
	sta $06B4				; 100%���[�g�t���OON
	nop
	nop

	; ��j���X�|�[���𑁂߂�(�ʏ�)
	BANKORG_D $380E73		; PC:$70E73
	lda #$16				; �f�t�H���g��F0
	sta <$95				; ������

	; ��j���X�|�[���𑁂߂�(����)
	BANKORG_D $380F0C		; PC:$70F0C
	lda #$16				; �f�t�H���g��3C
	sta <$95				; ������

	; ����ł��c�@����Ȃ��悤�ɂ���
	BANKORG_D $380E8A		; PC:$70E8A
	db $EA, $EA, $EA, $EA, $EA, $EA

	; E�ʎg���Ă�����Ȃ��悤�ɂ���
	BANKORG_D $381537		; PC:$71537
	db $EA, $EA, $EA		; �f�t�H���g:dsc $06A1

	; �Q�[���I�[�o����(����G�l�񕜓�)
	BANKORG_D $3E0D87 		; PC:$7CD87
	LONG_CALL GameoverHackStart
							; �f�t�H���g:lda #$02
							; �f�t�H���g:sta <$A9
							; �f�t�H���g:lda <$11

	; �X�e�[�W�J�n���̏��X�����������X�L�b�v(���Ԃ����l)
	BANKORG_D $3E0E59		; PC:$7CE59
	db $EA, $EA, $EA		; �f�t�H���g:sta $0686
	db $EA, $EA, $EA		; �f�t�H���g:sta $0684
	db $EA, $EA, $EA		; �f�t�H���g:sta $06A0
	db $EA, $EA, $EA		; �f�t�H���g:sta $0685
	sta $069E 				; ������

	; CONTINUE���̃N���A�ς݃t���O(�p���b�g�ύX�p)�����������X�L�b�v
	BANKORG_D $3E0D6E		; PC:$7CD6E
	db $EA, $EA, $EA		; �f�t�H���g:sty $06A0

	; NMI�Ƀ^�C���J�E���g�����ǉ�
	BANKORG_D $3E00B7		; PC:$7C0B7
	jsr FrameCounterStart

	; �e���|�[�g���n���ɃJ�E���g���Z�b�g
	BANKORG_D $3F00AF		; PC:$7E0AF
	jsr TeleportLandStart
	nop

	; �X�N���[���I���㏈��(�E)
	BANKORG_D $3E175B		; PC:$7D75B
	jmp EndTransitionHackLR

	; �X�N���[���I���㏈��(���H)
	BANKORG_D $3E17AF		; PC:$7D7AF
	jmp EndTransitionHackLR

	; �X�N���[���I���㏈��(��,��q��)
	BANKORG_D $3E17EB		; PC:$7D7EB
	jsr EndTransitionHackUD
	nop

	; �X�N���[���I���㏈��(��,��q�L)
	BANKORG_D $3E1828		; PC:$7D828
	jsr EndTransitionHackUD
	nop

	; �X�N���[���I���㏈��(��,��q���H)
	BANKORG_D $3E186D		; PC:$7D86D
	jsr EndTransitionHackUD
	nop

	; �X�N���[���I���㏈��(��,��q�L)
	BANKORG_D $3E18AA		; PC:$7D8AA
	jsr EndTransitionHackUD
	nop

	; ��ʃX�N���[�����Ƀ^�C�}�[�\��(����)
	BANKORG_D $3E1712 		; PC:$7D712
	jsr ShowTimerStage

	; �{�X���j��̃t�@���t�@�[���ҋ@���ԕύX
	;BANKORG_D $3F1989 		; PC:$7F989
	;lda #$01				; �X���b�h�x�~���邽�ߒZ�߂ɐݒ�(�f�t�H���g:$F0)

	; �{�X���j��Ƀ^�C�}�[�\��(�X���b�h�x�~�Ń�����������)
	BANKORG_D $3F19C4 		; PC:$7F98E
	jsr ShowTimerBoss

	; X�N���b�V���[���j��Ƀ^�C�}�[�\��(�X���b�h�x�~�Ń�����������)
	BANKORG_D $390CC7 		; PC:$72CC7
	lda #$13
	sta <$DC				; �t�@���t�@�[���𗬂�(�Ȃ�ƂȂ�)
	jsr ShowTimer
	lda #$F0				; �C�ӂ̐��l
	jsr $C5F6				; A���W�X�^�Ŏw�肵���t���[���������X���b�h���x�~
	jsr ChangeBankOriginal	;
	lda #$01				; �N���A�t���O�𗧂Ăċ����E�o
	sta <$F0				; ���C�����[�v�E�o�t���O(01�ŃX�e�[�W�N���A��,02�Ŏ��񂾂Ƃ�,03�ŃQ�[���I�[�o�[)
	rts						; �㑱�����͖���(PC:$72CE3 - $72DF8)

	; ���C���[���j��̃t�@���t�@�[���ҋ@���ԕύX
	BANKORG_D $391177 		; PC:$73177
	lda #$01				; �X���b�h�x�~���邽�ߒZ�߂ɐݒ�(�f�t�H���g:$F0)

	; ���C���[���j��Ƀ^�C�}�[�\��(�X���b�h�x�~�Ń�����������)
	BANKORG_D $391182 		; PC:$73182
	jsr ShowTimerWily

	; ���C���[���j��ɃX�e�[�W�I����ʂɖ߂�
	;BANKORG_D $39118A 		; PC:$7318A
	lda #$01				; �N���A�t���O�𗧂Ăċ����E�o
	sta <$F0				; ���C�����[�v�E�o�t���O(01�ŃX�e�[�W�N���A��,02�Ŏ��񂾂Ƃ�,03�ŃQ�[���I�[�o�[)
	rts						; �㑱�����͖���

	; �e���|�[�^IN���Ƀ^�C�}�[�\��
	BANKORG_D $391ABE 		; PC:$73ABE
	jsr ShowTimerTeleporter

	; �{�X���b�V����(��)�擾���Ƀ^�C�}�[�\��
	BANKORG_D $390F3B 		; PC:$72F3B
	jsr ShowTimerBossRushRefill

	; �Q�[���I�[�o��� Mr.X�ȍ~��STAGE SELECT�\��
	BANKORG_D $3C005F 		; PC:$7805F
	db $EA, $EA, $EA, $EA, $EA, $EA

	; �{�X���j��̕���擾�A�j���[�V�������X�L�b�v(Mr.X�ȍ~�Ɠ����ɂ���)
	BANKORG_D $38116B 		; PC:$7116B
	db $EA, $EA, $EA, $EA, $EA, $EA

	; �{�X���j��ɃZ���^�[�܂ŕ������Ȃ�(Mr.X�ȍ~�Ɠ����ɂ���)
	;BANKORG_D $3F19A0 		; PC:$7F9A0
	;db $EA, $EA, $EA, $EA, $EA, $EA, $EA, $EA, $EA
;loc_7F9A5:
	;lda #$00
	;jsr $D42E
	;jsr $E46C
	;����ʂ��y���W�Ŕ��肷��ƃ��J�U�E���X��̍�������ɑΉ��ł��Ȃ��̂Œ��n�t���O�Ŋm�F
	;lda <$AD				; �f�t�H���g:lda $04CB
	;cmp #$01				; �f�t�H���g:cmp #$B4
	;bne loc_7F9A5			; ������
	;nop

	; �{�X���j��̕���f���V�[�����X�L�b�v
	BANKORG_D $3E0D95 		; PC:$7CD95
	db $EA, $EA, $EA, $EA, $EA, $EA, $EA, $EA, $EA, $EA, $EA, $EA
	db $EA, $EA, $EA, $EA, $EA, $EA, $EA, $EA, $EA, $EA, $EA, $EA

	; �X�e�[�W�I����ʂɖ߂�Ƃ��Ƀt���O������
	BANKORG_D $3F1062 		; PC:$7F062
	jsr StageSelectHackStart
	nop

	; �Z���N�g�{�^�������A�N�V����
	BANKORG_D $388E95		; PC:$
	jsr RestartHackStart

	; �X�e�[�W�I�����[�v�ŏ�
	BANKORG_D $3F1138		; PC:$7F138
SelectLoop:
	; �X�e�[�W�I����� �{�^�������A�N�V����
	BANKORG_D $3F1171		; PC:$7F171
	LDA <$42				; ������
	AND #$F0				; B,SELECT�����e(�f�t�H���g��$90)
	db $F0, $C1				; ������(BEQ loc_7F134)
	lda #$38				; ������
	sta $DC					; ������
	lda <$05				; ������
	asl	a					; ������
	asl	a					; ������
	ora <$04				; ������
	tay						; ������
	pha
	LONG_CALL SelectHackStart
	pla
	tay						;
	cpy #$05				; �^�񒆂͑I��s��
	beq SelectLoop			; ������
	jsr $CA3D				; ������
	rts						; �X�e�[�W�J�n�O�J�b�g�V�[���X�L�b�v
	db $EA, $EA

	; 8�{�X���`��
	BANKORG_D $3F1138		; PC:$7F138
	jsr BossOrderDrawInit

	; �X�e�[�WBGM
	BANKORG_D $3E1BF1		; PC:$7DBF1
	jsr StageMusic
	nop
	nop

	; �X�e�[�W�I�����BGM
	BANKORG_D $3F1088		; PC:$7F088
	jsr StageSelectMusic
	nop

	; �p�X���[�h���(�Q�[���I�[�o)BGM
	BANKORG_D $3C001D		; PC:$7801D
	jsr PasswordMusic
	nop

	; �{�X��BGM
	BANKORG_D $390EE7		; PC:$72EE7
	jsr BossMusic
	nop

	; �{�X��(�{�X���b�V��)BGM
	BANKORG_D $3F1A0F		; PC:$7FA0F
	jsr BossMusic
	nop

	; �{�X���b�V������(�O��IN)BGM
	BANKORG_D $3909EA		; PC:$729EA
	jsr BossRushMusic
	nop

	; �{�X���b�V������(����IN)BGM
	BANKORG_D $390F3E		; PC:$72F3E
	jsr BossRushMusic
	nop

	; ���X�{�X��BGM
	BANKORG_D $3F1A19		; PC:$7FA19
	jsr FinalBossMusic
	nop

;���펞���蓖�Ă���v���O�����o���N�̌��
	BANKORG $3FFAC0
	;�����O�R�[���֌W�̃��[�`�� {
	;�o���N���܂������v���O�����̃R�[��
	;�Ăяo����ɂ�a,x,y���������n��B
	;�Ăяo�����ɂ�a,x,y,�t���O���������A��B
	;�o���N�擪(8000,A000)�ւ̃W�����v�ɂ͎��s����̂Œ��ӁB
Misc_LongCall:
.TmpZPMem1 = $17
.TmpZPMem2 = $31
	;�Ăяo����ɓn��a,y��ޔ�
	sta <.TmpZPMem2
	sty <.TmpZPMem2+1
	;�L�q���ꂽ�A�h���X�̓ǂݏo���̂��߂̃|�C���^�ݒ�
	pla
	sta <.TmpZPMem1+0
	pla
	sta <.TmpZPMem1+1
	;���A�ʒu���X�^�b�N�ɏ�������
	clc
	lda <.TmpZPMem1+0
	adc #$03
	tay
	lda <.TmpZPMem1+1
	adc #$00
	pha
	tya
	pha
	;���݂̃v���O�����o���N���X�^�b�N�ɏ�������
	lda <vCurBnk8
	pha
	lda <vCurBnkA
	pha
	;���A�p���[�`���̃A�h���X���X�^�b�N�ɏ�������
	lda #HIGH(Misc_LongReturn-1)
	pha
	lda #LOW(Misc_LongReturn-1)
	pha
	;�Ăяo���A�h���X��ǂݍ��݁A�A�h���X���X�^�b�N�ɏ�������
	ldy #$01
	lda [.TmpZPMem1],y
	pha
	sta vLongCallTmp
	iny
	lda [.TmpZPMem1],y
	pha
	iny
	;�Ăяo���o���N��ǂݍ��݁A�A�h���X���Ó��Ȉʒu�̃o���N��؂�ւ�
	lda vLongCallTmp
	cmp #$A0
	lda [.TmpZPMem1],y
	ldy #$06
	bcc .call_2_8000
	iny
.call_2_8000
	sty <vMMC3Cmd
	sty ioMMC3Cmd
	sta ioMMC3Value
	sta vCurBnk8-6,y ;0�y�[�W�s��
	;�Ăяo����ɓn��z,y�̕���
	ldy <.TmpZPMem2+1
	lda <.TmpZPMem2
	rts

Misc_LongReturn:
.TmpZPMem1 = $17
	sta <.TmpZPMem1
	php
	pla
	sta <.TmpZPMem1+1
	;Prg(A000)��߂�
	lda #$07
	sta <vMMC3Cmd
	sta ioMMC3Cmd
	pla
	sta ioMMC3Value
	sta <vCurBnkA
	;Prg(8000)��߂�
	lda #$06
	sta <vMMC3Cmd
	sta ioMMC3Cmd
	pla
	sta ioMMC3Value
	sta <vCurBnk8
	;a,�t���O
	lda <.TmpZPMem1+1
	pha
	lda <.TmpZPMem1
	plp
	rts
	; �����O�R�[���֌W�̃��[�`��}
	;�ǉ��̃��[�`�� {
Misc_SwapPrgBank8:
	sta <vCurBnk8
	lda #$06
	sta <vMMC3Cmd
	sta ioMMC3Cmd
	lda <vCurBnk8
	sta ioMMC3Value
	rts
	;}

FrameCounterStart:
	lda $06B1
	cmp #$63				; ���:90'00
	beq FrameCounterEnd
	inc $06B0
	lda $06B0
	cmp #60
	bne FrameCounterEnd
	inc $06B1
	lda #$00
	sta $06B0
FrameCounterEnd:
	jsr $C88D				; ������
    rts

TeleportLandStart:
	lda #$00
	sta $06B0
	sta $06B1
	lda #$37				; ������
	sta <$DC				; ������
	rts

EndTransitionHackLR:
	pla						; ������
	sta <$70				; ������
	jsr ChangeBankOriginal	; �o���N�ؑ�(�߂�)
	rts
	
EndTransitionHackUD:
	jsr ChangeBankOriginal	; �o���N�ؑ�(�߂�)
	sta <$FB				; ������
	rts

ChangeBankOriginal:
	; �o���N�ؑ�(�߂�)
	lda #%00000010
	sta $8000
	lda #%01000100
	sta $8001
	lda #%00000011
	sta $8000
	lda #%01000101
	sta $8001
	lda #$01
	; �^�C�}�[���Z�b�g
	lda #$00
	sta $06B0
	sta $06B1
	sta $06B2
	sta $06B3
	; �^�C����\��
	lda #$F0
	sta $0250
	sta $0254
	sta $0258
	sta $025C
	sta $0260
	rts

ChangeBankTimer:
	; �o���N�ؑ�(�^�C���\���p)
	ldx #%00000010
	stx $8000
	ldx #%00000000
	jsr AdvanceBankPointer
	stx $8001
	ldx #%00000011
	stx $8000
	ldx #%00000001
	jsr AdvanceBankPointer
	stx $8001
ChangeBankTimerEnd:
	rts

AdvanceBankPointer:
	lda $9B					;Current Rush Adaptor (01 -> �W�F�b�g, 02 -> �p���[)
	beq AdvanceBankPointerEnd
	cmp #$01
	beq AdvanceBankPointerJet
AdvanceBankPointerPower:
	inx
	inx
AdvanceBankPointerJet:
	inx
	inx
AdvanceBankPointerEnd:
	rts

ShowTimerStage:
	jsr ShowTimer
	jsr $C62B				; ������
	rts

ShowTimerBoss:
	jsr ShowTimer
	lda #$68				; �C�ӂ̐��l
	jsr $C5F6				; A���W�X�^�Ŏw�肵���t���[���������X���b�h���x�~
	jsr ChangeBankOriginal	;
	rts

ShowTimerBossRush:
	jsr ShowTimer
	lda #$38				; �C�ӂ̐��l
	jsr $C5F6				; A���W�X�^�Ŏw�肵���t���[���������X���b�h���x�~
	jsr ChangeBankOriginal	;
	rts

ShowTimerTeleporter:
	jsr $E028				; ������(�Ó]�����O)
	jsr ShowTimerBossRush
	rts

ShowTimerBossRushRefill:
	jsr ShowTimerBossRush
	jsr $CA3D				; ������(�Ó]����)
	rts

ShowTimerWily:
	jsr ShowTimer
	lda #$E8				; �C�ӂ̐��l
	jsr $C5F6				; A���W�X�^�Ŏw�肵���t���[���������X���b�h���x�~
	jsr ChangeBankOriginal
	dec $05B9				; ������
	rts

ShowTimer:
	txa						; ���W�X�^�ޔ�
	pha						; ���W�X�^�ޔ�

	lda $06B2
	ora $06B3
	bne ShowTimerNotInit	; ����������
	jsr ChangeBankTimer		; �o���N�ؑ�(�^�C���\���p)
	lda $06B0
	sta $06B2
	lda $06B1
	sta $06B3

ShowTimerNotInit:
	; �^�C���\��(y���W)
	lda #$10
	sta $0250
	sta $0254
	sta $0258
	sta $025C
	sta $0260
	
	; �^�C���\��(�^�C��)
	lda $06B2			; �t���[��(�^�C���\���p)
	jsr hex_to_dec		; 16��10�i��
	sta $06C2			; �t���[���^�C��tmp(�^�C���\���p)

	lda $06B3			; �b��(�^�C���\���p)
	jsr hex_to_dec		; 16��10�i��
	sta $06C3			; �b���^�C��tmp(�^�C���\���p)

	lda $06C3			; �b���^�C��tmp(�^�C���\���p)
	lsr A
	lsr A
	lsr A
	lsr A
	tax
	jsr AdvanceTilePointer
	LDA TileTableNormal,x
	sta $0251			; �b(2����)

	ldx #$0A
	jsr AdvanceTilePointer
	lda TileTableNormal,x
	sta $0259			; �f

	lda $06C3			; �b���^�C��tmp(�^�C���\���p)
	and #$0F
	tax
	jsr AdvanceTilePointer
	LDA TileTableNormal,x
	sta $0255			; �b(1����)

	lda $06C2			; �t���[���^�C��tmp(�^�C���\���p)
	lsr A
	lsr A
	lsr A
	lsr A
	tax
	jsr AdvanceTilePointer
	LDA TileTableNormal,x
	sta $025D			; �t���[��(2����)

	lda $06C2			; �t���[���^�C��tmp(�^�C���\���p)
	and #$0F
	tax
	jsr AdvanceTilePointer
	LDA TileTableNormal,x
	sta $0261			; �t���[��(1����)
	
	; �^�C���\��(�p���b�g)
	lda #$01
	sta $0252
	sta $0256
	sta $025A
	sta $025E
	sta $0262
	
	; �^�C���\��(x���W)
	lda #$D0
	sta $0253
	lda #$D8
	sta $0257
	lda #$E0
	sta $025B
	lda #$E8
	sta $025F
	lda #$F0
	sta $0263

	pla						; ���W�X�^�C��
	tax						; ���W�X�^�C��
	rts

; util
hex_to_dec:
	sta $06C0
	lsr A
	adc $06C0
	ror A
	lsr A
	lsr A
	adc $06C0
	ror A
	adc $06C0
	ror A
	lsr A
	and #$3C
	sta $06C1
	lsr A
	adc $06C1
	adc $06C0
	rts

AdvanceTilePointer:			; ���݂̃��b�N�}����Ԃɍ��킹��X���W�X�^����
	lda $9B					; Current Rush Adaptor (01 -> �W�F�b�g, 02 -> �p���[)
	beq AdvanceTilePointerEnd
	cmp #$01
	beq AdvanceTilePointerJet
AdvanceTilePointerPower:
	txa
	adc #$0B
	tax
AdvanceTilePointerJet:
	txa
	adc #$0A
	tax
AdvanceTilePointerEnd:
	rts

TileTableNormal:										; ���b�N�}��
	;  0    1    2    3    4    5    6    7    8    9    '
	db $72, $73, $74, $75, $76, $77, $78, $79, $7A, $7B, $7C

TileTableJet:											; �W�F�b�g���b�N�}��
	;  0    1    2    3    4    5    6    7    8    9    '
	db $29, $2A, $39, $3D, $3E, $4D, $4E, $7C, $7D, $7E, $7F

TileTablePower:											; �p���[���b�N�}��
	;  0    1    2    3    4    5    6    7    8    9    '
	db $60, $61, $62, $70, $71, $72, $35, $45, $55, $73, $74

RestartHackStart:
	lda <$42				;
	and #$20				; SELECT�����ŃQ�[���I�[�o��ʕ\��
	beq RestartHackEnd
	lda #$03
	sta <$F0
RestartHackEnd:
	jmp $924D				; �������ɕԂ�

StageSelectHackStart:
	lda #$01				; E�ʁ~1
	sta $06A1				;
	jsr ResetFlagsStart
	jsr ChangeBankOriginal
	rts

ResetFlagsStart:
	ldx #$03
	lda #$00
ResetClearFlagLoop:
	sta $0692,x				; �X�e�[�W�N���A�t���O���Z�b�g
	dex
	bpl ResetClearFlagLoop
	ldx #$05
SeesawHeightResetLoop:
	sta $0643,x				; �V�[�\�[����̍������Z�b�g(Mr.X3)
	dex
	bpl SeesawHeightResetLoop
	sta <$51				; ���݃X�e�[�W���Z�b�g
	jsr $CB28				; ������
	db $42					; ������
	rts

BossOrderDrawInit:
	LONG_CALL OrderInitDone
	jsr $C62B				; ������
	rts

TitleScreenInit:
	lda #$19				; ������
	sta $DC					; ������
	lda #$03
	sta $06B4				; 100%���[�g�t���O(3:Any%/2:100%)
	rts

MuteFlagMusic:				; BGM�t���O�ɉ�����A���W�X�^��BGM�Đ�or�~���[�g
	pha
	lda $06B6				; BGM�t���O(0:ON/1:OFF)
	beq MuteFlagMusicPlay
	lda #$F0				; BGM�Ȃ�
	sta <$DC
	pla
	rts
MuteFlagMusicPlay:
	pla
	sta <$DC
	rts

StageMusic:
	lda DefaultMusicTable,y
	jsr MuteFlagMusic		; BGM�t���O�ɉ�����A���W�X�^��BGM�Đ�or�~���[�g
	rts

DefaultMusicTable:
	db $01, $00, $04, $03, $02, $06, $07, $05	; 8�{�X�X�e�[�WBGM
	db $09, $09, $09, $09, $0B, $0B, $0B, $0B	; ��X�e�[�WBGM

StageSelectMusic:
	lda #$0F
	jsr MuteFlagMusic		; BGM�t���O�ɉ�����A���W�X�^��BGM�Đ�or�~���[�g
	rts

PasswordMusic:
	lda #$15
	jsr MuteFlagMusic		; BGM�t���O�ɉ�����A���W�X�^��BGM�Đ�or�~���[�g
	rts

BossMusic:
	lda #$0C
	jsr MuteFlagMusic		; BGM�t���O�ɉ�����A���W�X�^��BGM�Đ�or�~���[�g
	rts

BossRushMusic:
	lda #$0B
	jsr MuteFlagMusic		; BGM�t���O�ɉ�����A���W�X�^��BGM�Đ�or�~���[�g
	rts

FinalBossMusic:
	lda #$18
	jsr MuteFlagMusic		; BGM�t���O�ɉ�����A���W�X�^��BGM�Đ�or�~���[�g
	rts

	FILL_TEST $3FFF40


;���o���N0D(���S�󂫂̃o���N)
	BANKORG_D $0D8000
	nop ;�o���N�擪�Ƀ����O�R�[���ł��Ȃ�����

GameoverHackStart:
	jsr SetAmmoStart
	lda #$02				; ������
	sta <$A9				; ������
	lda <$11
	rts

SelectHackStart:
	cpy #$05				; �^�񒆃`�F�b�N
	beq CenterPressed
	lda #$33				; ���ʉ�(�ʏ�X�e�[�W�I��)
	sta <$DC				; ���ʉ��ݒ�
	lda StageTable,y		; �X�e�[�W�ԍ�(�ʏ�X�e�[�W�I��)
	sta <$51				; �X�e�[�W�ԍ��ݒ�
	ldx #$00
	lda <$40
	and #$0F				; D-pad���͂���Ă���΃p���b�g�ύX
	beq NoPaletteChange
	inx
NoPaletteChange:
	stx $06A0				; �X�e�[�W�N���A�σt���O(�p���b�g�ύX�p)
	ldx #$80
	lda <$42
	and #$30				; START/SELECT
	beq SelectHackEnd		; START/SELECT�Ȃ��X�e�[�W
	lda #$3A				; ���ʉ�(��X�e�[�W�I��)
	sta <$DC				; ���ʉ��ݒ�
	lda CastleStageTable,y	; �X�e�[�W�ԍ�(��X�e�[�W�I��)
	sta <$51				; �X�e�[�W�ԍ��ݒ�
	lda $06B4				; 100%���[�g�t���O(3:Any%/2:100%)
	cmp #$03
	beq SelectHackEnd		; Any%�Ȃ�r�[�g�Ȃ�
	ldx #$1B
SelectHackEnd:
	stx $0691				; ����G�l���M�[(�r�[�g)
	jsr SetClearFlagStart
	jsr SetAmmoStart
	jsr SetCheckPointStart
	rts

CenterPressed:
	lda <$40
	and #$60				; SELECT or START
	cmp #$20
	beq CenterPressedSelect
	; cmp #$40
	; beq CenterPressedB
	rts
CenterPressedB:
	lda #$F0				; ����
	sta <$DC				; ���ʉ��ݒ�
	lda $06B6				; BGM�t���O(0:ON/1:OFF)
	eor #$01
	sta $06B6				; BGM�t���O(0:ON/1:OFF)
	bne OrderInitDone
	lda #$0F				; ����
	sta <$DC				; ���ʉ��ݒ�
	jmp OrderInitDone

CenterPressedSelect:
	lda #$34				; ���ʉ�
	sta <$DC				; ���ʉ��ݒ�
	inc $06B5				; �{�X��(0:Wind First/1:Flame First/2:Knight First)
	lda $06B5
	cmp $06B4				; 100%���[�g�t���O(3:Any%/2:100%)
	bne OrderInitDone
	lda #$00
	sta $06B5
OrderInitDone:
	ldx #$00
	lda $06B5
	tay
LoopStageOrder:
	beq DrawBossOrder
	txa
	adc #$06
	tax
	dey
	bpl LoopStageOrder
DrawBossOrder:
	ldy #$00
	lda #$06
	sta $0780				; bit6-0 -> �������ރf�[�^�̃o�C�g��bit6-0 -> �������ރf�[�^�̃o�C�g��
	lda #$20
	sta $0781				; VRAM�������݃A�h���X(high)
	lda #$4A
	sta $0782				; VRAM�������݃A�h���X(low)
DrawBossOrderLoop:
	lda BossOrderGfx,x
	sta $0783,y				; �������ޒl(byte0��bit6-0�Ŏw�肵����������������)
	inx
	iny
	cpy #$06
	bne DrawBossOrderLoop
	;lda #$09				; �������ރo�C�g��(3 + 6)
	;sta <$47
CenterPressedDone:
	ldx #$00
	ldy #$00
	lda $06B4				; 100%���[�g�t���O(3:Any%/2:100%)
	cmp #$03
	beq DrawCategoryAny		; Any%�Ȃ�r�[�g�Ȃ�
	inx
	inx
	inx
	inx
DrawCategoryAny:
	lda #$04
	sta $0789				; bit6-0 -> �������ރf�[�^�̃o�C�g��bit6-0 -> �������ރf�[�^�̃o�C�g��
	lda #$20
	sta $078A				; VRAM�������݃A�h���X(high)
	lda #$44
	sta $078B				; VRAM�������݃A�h���X(low)
DrawCategoryLoop:
	lda CategoryGfx,x
	sta $078C,y				; �������ޒl(byte0��bit6-0�Ŏw�肵����������������)
	inx
	iny
	cpy #$04
	bne DrawCategoryLoop
	lda #$10				; �������ރo�C�g��(3 + 6 + 3 + 4)
	sta <$47
;DrawMusic:
;	ldx $06B6				; BGM�t���O(0:ON/1:OFF)
;	lda #$01
;	sta $0790				; bit6-0 -> �������ރf�[�^�̃o�C�g��bit6-0 -> �������ރf�[�^�̃o�C�g��
;	lda #$20
;	sta $0791				; VRAM�������݃A�h���X(high)
;	lda #$5B
;	sta $0792				; VRAM�������݃A�h���X(low)
;	lda MusicGfx,x
;	sta $0793				; �������ޒl(byte0��bit6-0�Ŏw�肵����������������)
;
;	lda #$14				; �������ރo�C�g��(3 + 6 + 3 + 4 + 3 + 1)
;	sta <$47
	rts

BossOrderGfx:
	;       W    I    N    D
    db $10, $41, $33, $38, $2E, $10
	;       F    L    A    M    E
    db $10, $30, $36, $2B, $37, $2F
	;  K    N    I    G    H    T
    db $35, $38, $33, $31, $32, $3E

CategoryGfx:
	;  A    N    Y    %
    db $2B, $38, $43, $47
	;  1    0    0    %   
    db $21, $20, $20, $47

MusicGfx:
	;  ��
    db $60
    ;
    db $10

SetAmmoStart:
	ldx <$51				; �X�e�[�W�ԍ��擾
	ldy #$00
AdvanceAmmoLoop:
	jsr AdvanceAmmoPointer
	dex 
	bpl AdvanceAmmoLoop
	ldx #$07
	lda $06B5				; �{�X��(0:Wind First/1:Flame First/2:Knight First)
	beq WindAmmoLoop
	cmp #$01
	beq FlameAmmoLoop
KnightAmmoLoop:
	lda KnightAmmoTable1-1,y
	sta $0689,x				; ����G�l���M�[�ݒ�
	dey
	dex
	bpl KnightAmmoLoop
	rts

WindAmmoLoop:
	lda WindAmmoTable1-1,y
	sta $0689,x				; ����G�l���M�[�ݒ�
	dey
	dex
	bpl WindAmmoLoop
	rts

FlameAmmoLoop:
	lda FlameAmmoTable1-1,y
	sta $0689,x				; ����G�l���M�[�ݒ�
	dey
	dex
	bpl FlameAmmoLoop
	rts

AdvanceAmmoPointer:
	iny
	iny
	iny
	iny
	iny
	iny
	iny
	iny
	rts

SetClearFlagStart:
	ldx <$51				; �X�e�[�W�ԍ��擾
	ldy #$00
	sty $0696				; �G�l���M�[�o�����T�[������
AdvanceClearFlagLoop:
	iny
	iny
	iny
	iny
	dex 
	bpl AdvanceClearFlagLoop
	ldx #$03
	lda $06B4				; 100%���[�g�t���O(3:Any%/2:100%)
	cmp #$02
	beq SetClearFlagHundo
	lda $06B5				; �{�X��(0:Wind First/1:Flame First/2:Knight First)
	beq WindClearFlagAnyLoop
	cmp #$01
	beq FlameClearFlagAnyLoop
KnightClearFlagAnyLoop:
	lda KnightClearFlagTableAny1-1,y
	sta $0692,x				; �X�e�[�W�N���A�t���O�ݒ�(Any%���[�g)
	dey
	dex
	bpl KnightClearFlagAnyLoop
	rts

WindClearFlagAnyLoop:
	lda WindClearFlagTableAny1-1,y
	sta $0692,x				; �X�e�[�W�N���A�t���O�ݒ�(Any%���[�g)
	dey
	dex
	bpl WindClearFlagAnyLoop
	rts

FlameClearFlagAnyLoop:
	lda FlameClearFlagTableAny1-1,y
	sta $0692,x				; �X�e�[�W�N���A�t���O�ݒ�(Any%���[�g)
	dey
	dex
	bpl FlameClearFlagAnyLoop
	rts

SetClearFlagHundo:
	lda $06B5					; �{�X��(0:Wind First/1:Flame First/2:Knight First)
	beq WindClearFlagHundoLoop	; ��Knight First��100%�͂ł��Ȃ�
FlameClearFlagHundoLoop:
	lda FlameClearFlagTableHundo1-1,y
	sta $0692,x					; �X�e�[�W�N���A�t���O�ݒ�(100%���[�g)
	dey
	dex
	bpl SetClearFlagHundo
	ldx #$00
	lda <$51
	cmp #$01 
	beq FlameYesEnegyBalancer	; �E�C���h����
	cmp #$04					; ���}�g�X�e�[�W�ȍ~�Ȃ�G�l���M�[�o�����T�[����
	bcc FlameNoEnegyBalancer
	cmp #$05					; ���}�g�X�e�[�W�ȍ~�Ȃ�G�l���M�[�o�����T�[����
	beq WindNoEnegyBalancer
FlameYesEnegyBalancer:
	inx
FlameNoEnegyBalancer:
	stx $0696					; �G�l���M�[�o�����T�[
	rts

WindClearFlagHundoLoop:
	lda WindClearFlagTableHundo1-1,y
	sta $0692,x					; �X�e�[�W�N���A�t���O�ݒ�(100%���[�g)
	dey
	dex
	bpl WindClearFlagHundoLoop
	ldx #$00
	lda <$51
	cmp #$04
	bcc WindNoEnegyBalancer
	cmp #$05					; ���}�g�X�e�[�W�ȍ~�Ȃ�G�l���M�[�o�����T�[����
	beq WindNoEnegyBalancer
WindYesEnegyBalancer:
	inx
WindNoEnegyBalancer:
	stx $0696					; �G�l���M�[�o�����T�[
	rts

SetCheckPointStart:
	lda #$00				; ���ԃ|�C���g�f�[�^������
	sta $0684				; ���ԕ��A���̕����ԍ�
	sta $0685				; ���ԕ��A���̃p�^�[���e�[�u���������ݔԍ�
	sta $0686				; ���ԕ��A���̃p���b�g�ύX�ԍ�
	lda <$42
	and #$60				; B or SELECT
	beq SetCheckPointEnd
	ldx <$51				; �X�e�[�W�ԍ��擾
	lda $06B4				; 100%���[�g�t���O�`�F�b�N
	bne SetCheckPointHundo
SetCheckPointAny:
	lda CheckPointRoomTableAny,x
	sta $0684				; ���ԕ��A���̕����ԍ�
	lda CheckPointPatternTableAny,x
	sta $0685				; ���ԕ��A���̃p�^�[���e�[�u���������ݔԍ�
	lda CheckPointPaletteTableAny,x
	sta $0686				; ���ԕ��A���̃p���b�g�ύX�ԍ�
SetCheckPointEnd:
	rts

SetCheckPointHundo:
	lda CheckPointRoomTableHundo,x
	sta $0684				; ���ԕ��A���̕����ԍ�
	lda CheckPointPatternTableHundo,x
	sta $0685				; ���ԕ��A���̃p�^�[���e�[�u���������ݔԍ�
	lda CheckPointPaletteTableHundo,x
	sta $0686				; ���ԕ��A���̃p���b�g�ύX�ԍ�
	rts

StageTable:
	db $00, $01, $03, $FF, $02, $FF, $05, $FF	; ���f�[�^���������̃o���N�ɂ��R�s�[
	db $04, $06, $07, $FF, $FF, $FF, $FF, $FF	; ���f�[�^���������̃o���N�ɂ��R�s�[

CastleStageTable:
	db $08, $09, $0A, $FF, $0B, $FF, $0C, $FF
	db $0D, $0E, $0F, $FF, $FF, $FF, $FF, $FF

WindAmmoTable1:									; �u���U�[�h�}���X�e�[�W
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $80, $1B, $80, $1B, $80, $80, $80, $80	; 3

WindAmmoTable2:									; �E�C���h�}���X�e�[�W
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $80, $80, $80, $80, $80, $80, $80, $80	; 1

WindAmmoTable3:									; �v�����g�}���X�e�[�W
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $80, $1B, $1B, $1B, $80, $80, $80, $80	; 4

WindAmmoTable4:									; �t���C���}���X�e�[�W
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $80, $1B, $80, $80, $80, $80, $80, $80	; 2

WindAmmoTable5:									; ���}�g�}���X�e�[�W
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $80, $1B, $1B, $1B, $1B, $80, $1B, $80	; 6

WindAmmoTable6:									; �g�}�z�[�N�}���X�e�[�W
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $80, $1B, $1B, $1B, $1B, $80, $80, $80	; 5

WindAmmoTable7:									; �i�C�g�}���X�e�[�W
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $1B, $1B, $1B, $1B, $1B, $80, $1B, $80	; 7

WindAmmoTable8:									; �P���^�E���X�}���X�e�[�W
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $1B, $1B, $1B, $1B, $1B, $1B, $1B, $80	; 8

WindAmmoTable9:									; Mr.X�X�e�[�W1
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $1B, $1B, $1B, $1B, $1B, $1B, $1B, $1B

WindAmmoTable10:								; Mr.X�X�e�[�W2
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $1B, $1B, $1B, $13, $1B, $1B, $1B, $1B	; �t���C��-8

WindAmmoTable11:								; Mr.X�X�e�[�W3
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $1B, $1B, $1B, $13, $1B, $1B, $08, $1B	; �g�}�z�[�N-20

WindAmmoTable12:								; Mr.X�X�e�[�W4
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $1B, $1B, $1B, $13, $1B, $1B, $08, $1B	; Mr.X�X�e�[�W3�Ɠ���

WindAmmoTable13:								; Wily�X�e�[�W1
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $1B, $1B, $1B, $13, $1B, $08, $08, $1B	; �i�C�g-20

WindAmmoTable14:								; Wily�X�e�[�W2
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $11, $1B, $1B, $13, $1B, $08, $08, $1B	; ���}�g-10

WindAmmoTable15:								; Wily�X�e�[�W3
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $11, $09, $1B, $0E, $1B, $08, $08, $1B	; �t���C��-5,�E�B���h-18

WindAmmoTable16:								; Wily�X�e�[�W4
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $0A, $02, $14, $07, $14, $01, $14, $14	; �g�}�z�[�NMAX-7,��-7,

FlameAmmoTable1:								; �u���U�[�h�}���X�e�[�W
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $80, $80, $80, $1B, $80, $80, $80, $80	; 2

FlameAmmoTable2:								; �E�C���h�}���X�e�[�W
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $1B, $80, $1B, $1B, $1B, $1B, $1B, $1B	; 8

FlameAmmoTable3:								; �v�����g�}���X�e�[�W
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $80, $80, $1B, $1B, $80, $80, $80, $80	; 3

FlameAmmoTable4:								; �t���C���}���X�e�[�W
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $80, $80, $80, $80, $80, $80, $80, $80	; 1

FlameAmmoTable5:								; ���}�g�}���X�e�[�W
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $80, $80, $1B, $1B, $1B, $80, $1B, $80	; 5

FlameAmmoTable6:								; �g�}�z�[�N�}���X�e�[�W
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $80, $80, $1B, $1B, $1B, $80, $80, $80	; 4

FlameAmmoTable7:								; �i�C�g�}���X�e�[�W
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $1B, $80, $1B, $1B, $1B, $80, $1B, $80	; 6

FlameAmmoTable8:								; �P���^�E���X�}���X�e�[�W
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $1B, $80, $1B, $1B, $1B, $1B, $1B, $80	; 7

FlameAmmoTable9:								; Mr.X�X�e�[�W1
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $1B, $1B, $1B, $1B, $1B, $1B, $1B, $1B

FlameAmmoTable10:								; Mr.X�X�e�[�W2
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $1B, $1B, $1B, $13, $1B, $1B, $1B, $1B	; �t���C��-8

FlameAmmoTable11:								; Mr.X�X�e�[�W3
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $1B, $1B, $1B, $13, $1B, $1B, $08, $1B	; �g�}�z�[�N-20

FlameAmmoTable12:								; Mr.X�X�e�[�W4
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $1B, $1B, $1B, $13, $1B, $1B, $08, $1B	; Mr.X�X�e�[�W3�Ɠ���

FlameAmmoTable13:								; Wily�X�e�[�W1
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $1B, $1B, $1B, $13, $1B, $08, $08, $1B	; �i�C�g-20

FlameAmmoTable14:								; Wily�X�e�[�W2
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $11, $1B, $1B, $13, $1B, $08, $08, $1B	; ���}�g-10

FlameAmmoTable15:								; Wily�X�e�[�W3
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $11, $09, $1B, $0E, $1B, $08, $08, $1B	; �t���C��-5,�E�B���h-18

FlameAmmoTable16:								; Wily�X�e�[�W4
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $0A, $02, $14, $07, $14, $01, $14, $14	; �g�}�z�[�NMAX-7,��-7,

KnightAmmoTable1:								; �u���U�[�h�}���X�e�[�W
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $80, $1B, $80, $1B, $80, $1B, $80, $1B	; 5

KnightAmmoTable2:								; �E�C���h�}���X�e�[�W
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $80, $80, $80, $80, $80, $1B, $80, $1B	; 3

KnightAmmoTable3:								; �v�����g�}���X�e�[�W
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $80, $1B, $1B, $1B, $80, $1B, $80, $1B	; 6

KnightAmmoTable4:								; �t���C���}���X�e�[�W
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $80, $1B, $80, $80, $80, $1B, $80, $1B	; 4

KnightAmmoTable5:								; ���}�g�}���X�e�[�W
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $80, $1B, $1B, $1B, $1B, $1B, $1B, $1B	; 8

KnightAmmoTable6:								; �g�}�z�[�N�}���X�e�[�W
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $80, $1B, $1B, $1B, $1B, $1B, $80, $1B	; 7

KnightAmmoTable7:								; �i�C�g�}���X�e�[�W
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $80, $80, $80, $80, $80, $80, $80, $80	; 1

KnightAmmoTable8:								; �P���^�E���X�}���X�e�[�W
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $80, $80, $80, $80, $80, $1B, $80, $80	; 2

KnightAmmoTable9:								; Mr.X�X�e�[�W1
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $1B, $1B, $1B, $1B, $1B, $1B, $1B, $1B

KnightAmmoTable10:								; Mr.X�X�e�[�W2
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $1B, $1B, $1B, $13, $1B, $1B, $1B, $1B	; �t���C��-8

KnightAmmoTable11:								; Mr.X�X�e�[�W3
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $1B, $1B, $1B, $13, $1B, $1B, $08, $1B	; �g�}�z�[�N-20

KnightAmmoTable12:								; Mr.X�X�e�[�W4
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $1B, $1B, $1B, $13, $1B, $1B, $08, $1B	; Mr.X�X�e�[�W3�Ɠ���

KnightAmmoTable13:								; Wily�X�e�[�W1
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $1B, $1B, $1B, $13, $1B, $08, $08, $1B	; �i�C�g-20

KnightAmmoTable14:								; Wily�X�e�[�W2
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $11, $1B, $1B, $13, $1B, $08, $08, $1B	; ���}�g-10

KnightAmmoTable15:								; Wily�X�e�[�W3
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $11, $09, $1B, $0E, $1B, $08, $08, $1B	; �t���C��-5,�E�B���h-18

KnightAmmoTable16:								; Wily�X�e�[�W4
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $0A, $02, $14, $07, $14, $01, $14, $14	; �g�}�z�[�NMAX-7,��-7,

WindClearFlagTableAny1:							; �u���U�[�h�}���X�e�[�W
	db $00, $01, $01, $00

WindClearFlagTableAny2:							; �E�C���h�}���X�e�[�W
	db $00, $00, $00, $00

WindClearFlagTableAny3:							; �v�����g�}���X�e�[�W
	db $01, $01, $01, $00

WindClearFlagTableAny4:							; �t���C���}���X�e�[�W
	db $00, $01, $00, $00

WindClearFlagTableAny5:							; ���}�g�}���X�e�[�W
	db $03, $01, $01, $01

WindClearFlagTableAny6:							; �g�}�z�[�N�}���X�e�[�W
	db $01, $01, $01, $01

WindClearFlagTableAny7:							; �i�C�g�}���X�e�[�W
	db $03, $07, $01, $01

WindClearFlagTableAny8:							; �P���^�E���X�}���X�e�[�W
	db $03, $07, $01, $03

WindClearFlagTableAny9:							; Mr.X�X�e�[�W1�`Wily�X�e�[�W4
	db $03, $07, $03, $03
	db $03, $07, $03, $03
	db $03, $07, $03, $03
	db $03, $07, $03, $03
	db $03, $07, $03, $03
	db $03, $07, $03, $03
	db $03, $07, $03, $03
	db $03, $07, $03, $03

FlameClearFlagTableAny1:						; 2 �u���U�[�h�}���X�e�[�W
	db $00, $00, $01, $00

FlameClearFlagTableAny2:						; 8 �E�C���h�}���X�e�[�W
	db $03, $06, $03, $03

FlameClearFlagTableAny3:						; 3 �v�����g�}���X�e�[�W
	db $01, $00, $01, $00

FlameClearFlagTableAny4:						; 1 �t���C���}���X�e�[�W
	db $00, $00, $00, $00

FlameClearFlagTableAny5:						; 5 ���}�g�}���X�e�[�W
	db $03, $00, $01, $01

FlameClearFlagTableAny6:						; 4 �g�}�z�[�N�}���X�e�[�W
	db $01, $00, $01, $01

FlameClearFlagTableAny7:						; 6 �i�C�g�}���X�e�[�W
	db $03, $06, $01, $01

FlameClearFlagTableAny8:						; 7 �P���^�E���X�}���X�e�[�W
	db $03, $06, $01, $03

FlameClearFlagTableAny9:						; Mr.X�X�e�[�W1�`Wily�X�e�[�W4
	db $03, $07, $03, $03
	db $03, $07, $03, $03
	db $03, $07, $03, $03
	db $03, $07, $03, $03
	db $03, $07, $03, $03
	db $03, $07, $03, $03
	db $03, $07, $03, $03
	db $03, $07, $03, $03

KnightClearFlagTableAny1:						; 5 �u���U�[�h�}���X�e�[�W
	db $00, $01, $03, $02

KnightClearFlagTableAny2:						; 3 �E�C���h�}���X�e�[�W
	db $00, $00, $02, $02

KnightClearFlagTableAny3:						; 6 �v�����g�}���X�e�[�W
	db $01, $01, $03, $02

KnightClearFlagTableAny4:						; 4 �t���C���}���X�e�[�W
	db $00, $01, $02, $02

KnightClearFlagTableAny5:						; 8 ���}�g�}���X�e�[�W
	db $03, $01, $03, $03

KnightClearFlagTableAny6:						; 7 �g�}�z�[�N�}���X�e�[�W
	db $01, $01, $03, $03

KnightClearFlagTableAny7:						; 1 �i�C�g�}���X�e�[�W
	db $00, $00, $00, $00

KnightClearFlagTableAny8:						; 2 �P���^�E���X�}���X�e�[�W
	db $00, $00, $00, $02

KnightClearFlagTableAny9:						; Mr.X�X�e�[�W1�`Wily�X�e�[�W4
	db $03, $07, $03, $03
	db $03, $07, $03, $03
	db $03, $07, $03, $03
	db $03, $07, $03, $03
	db $03, $07, $03, $03
	db $03, $07, $03, $03
	db $03, $07, $03, $03
	db $03, $07, $03, $03

WindClearFlagTableHundo1:						; 3 �u���U�[�h�}���X�e�[�W
	db $00, $01, $01, $00

WindClearFlagTableHundo2:						; 1 �E�C���h�}���X�e�[�W
	db $00, $00, $00, $00

WindClearFlagTableHundo3:						; 4 �v�����g�}���X�e�[�W
	db $01, $01, $01, $00

WindClearFlagTableHundo4:						; 2 �t���C���}���X�e�[�W
	db $00, $01, $00, $00

WindClearFlagTableHundo5:						; 6 ���}�g�}���X�e�[�W
	db $07, $01, $01, $01

WindClearFlagTableHundo6:						; 5 �g�}�z�[�N�}���X�e�[�W
	db $01, $01, $01, $01

WindClearFlagTableHundo7:						; 7 �i�C�g�}���X�e�[�W
	db $07, $07, $01, $01

WindClearFlagTableHundo8:						; 8 �P���^�E���X�}���X�e�[�W
	db $07, $07, $01, $07

WindClearFlagTableHundo9:						; Mr.X�X�e�[�W1�`Wily�X�e�[�W4
	db $07, $07, $07, $07
	db $07, $07, $07, $07
	db $07, $07, $07, $07
	db $07, $07, $07, $07
	db $07, $07, $07, $07
	db $07, $07, $07, $07
	db $07, $07, $07, $07
	db $07, $07, $07, $07

FlameClearFlagTableHundo1:						; 2 �u���U�[�h�}���X�e�[�W
	db $00, $00, $01, $00

FlameClearFlagTableHundo2:						; 8 �E�C���h�}���X�e�[�W
	db $07, $06, $07, $07

FlameClearFlagTableHundo3:						; 3 �v�����g�}���X�e�[�W
	db $01, $00, $01, $00

FlameClearFlagTableHundo4:						; 1 �t���C���}���X�e�[�W
	db $00, $00, $00, $00

FlameClearFlagTableHundo5:						; 5 ���}�g�}���X�e�[�W
	db $07, $00, $01, $01

FlameClearFlagTableHundo6:						; 4 �g�}�z�[�N�}���X�e�[�W
	db $01, $00, $01, $01

FlameClearFlagTableHundo7:						; 6 �i�C�g�}���X�e�[�W
	db $07, $06, $01, $01

FlameClearFlagTableHundo8:						; 7 �P���^�E���X�}���X�e�[�W
	db $07, $06, $01, $07

FlameClearFlagTableHundo9:						; Mr.X�X�e�[�W1�`Wily�X�e�[�W4
	db $07, $07, $07, $07
	db $07, $07, $07, $07
	db $07, $07, $07, $07
	db $07, $07, $07, $07
	db $07, $07, $07, $07
	db $07, $07, $07, $07
	db $07, $07, $07, $07
	db $07, $07, $07, $07

CheckPointRoomTableAny:
	;  ���  ��   ���  ��   ��   ��   Ų   ��
	db $17, $14, $16, $16, $1C, $16, $16, $19
	;  X1   X2   X3   X4   W1   W2   W3   W4
	db $10, $10, $10, $14, $12, $0E, $08, $05

CheckPointRoomTableHundo:
	;  ���  ��   ���  ��   ��   ��   Ų   ��
	db $17, $14, $16, $16, $1C, $1E, $19, $16
	;  X1   X2   X3   X4   W1   W2   W3   W4
	db $10, $10, $10, $14, $12, $0E, $08, $05

CheckPointPatternTableAny:
	;  ���  ��   ���  ��   ��   ��   Ų   ��
	db $84, $8E, $93, $87, $98, $95, $00, $00
	;  X1   X2   X3   X4   W1   W2   W3   W4
	db $D7, $B8, $B4, $00, $8B, $B2, $A9, $BE

CheckPointPatternTableHundo:
	;  ���  ��   ���  ��   ��   ��   Ų   ��
	db $84, $8E, $93, $87, $98, $95, $00, $00
	;  X1   X2   X3   X4   W1   W2   W3   W4
	db $D7, $B8, $B4, $00, $8B, $B2, $A9, $BE

CheckPointPaletteTableAny:
	;  ���  ��   ���  ��   ��   ��   Ų   ��
	db $1C, $3D, $32, $1F, $5E, $95, $7B, $A9
	;  X1   X2   X3   X4   W1   W2   W3   W4
	db $6C, $00, $D0, $00, $81, $B8, $00, $18

CheckPointPaletteTableHundo:
	;  ���  ��   ���  ��   ��   ��   Ų   ��
	db $1C, $3D, $32, $1F, $5E, $95, $7B, $A9
	;  X1   X2   X3   X4   W1   W2   W3   W4
	db $6C, $00, $D0, $00, $81, $B8, $00, $18

	FILL_TEST $0DA000