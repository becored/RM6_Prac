	; 未使用っぽいRAM
	;$06B0：フレーム
	;$06B1：秒数
	;$06B2：フレーム(タイム表示用)
	;$06B3：秒数(タイム表示用)
	;$06B4：100%ルートフラグ(0:Any%/1:100%)
	;$06B5：ボス順(0:Wind First/1:Flame First/2:Knight First)
	;$06B6：BGMフラグ(0:ON/1:OFF)
	;$06C0：関数用tmp変数
	;$06C1：関数用tmp変数
	;$06C2：フレームタイルtmp(タイム表示用)
	;$06C3：秒数タイルtmp(タイム表示用)

	; オープニング処理スキップ
	;BANKORG_D $3E0CC9		; PC:$7CCC9
	;nop					; デフォルトはjsr $CB28
	;nop					; デフォルトはdb $01
	;nop
	;nop

	; マッパーをMMC3→119に変更するためchr_ram_banksを修正
	BANKORG_D $3F1F50		; PC:$7FF50
	db $40, $42, $44, $45, $46, $47		;それぞれ+40

	; CAPCOMロゴ処理スキップ
	BANKORG_D $3E0CC3		; PC:$7CCC3
	db $EA, $EA, $EA		; デフォルトはjsr $D048

	; オープニングスキップ
	BANKORG_D $3E0CC9		; PC:$7CCC9
	db $EA, $EA, $EA, $EA	; デフォルトはjsr $CB28, .db $01

	; タイトル画面(GAME START) パターンテーブル
	BANKORG_D $3C0930		; PC:$78930
	;デフォルト:A6 6C 85 A7 00 A8 A9 6C AA A9
	;  A    N    Y    %
	db $6C, $A6, $A7, $A8, $00, $00, $00, $00, $00, $00

	; タイトル画面(PASS WORD) パターンテーブル
	BANKORG_D $3C0946		; PC:$78946
	;デフォルト:6F 6C A8 A8 00 9C 84 AA 9D
	;  1    O    O    %
	db $9C, $84, $84, $A8, $00, $00, $00, $00, $00

	; タイトル画面(CAPCOM 1993) パターンテーブル
	BANKORG_D $3C0961		; PC:$78961
	;デフォルト:01 67 6C 6F 67 84 85 00 20 30 30 93
	;  P    R    A    C         H    A    C    K
	db $6F, $30, $6C, $67, $00, $93, $6C, $67, $01
	;  v    1.0 
	db $9D, $85, $00

	; ステージ選択画面(PUSH START) パターンテーブル
	BANKORG_D $3C0DF9		; PC:$78DF9
	;デフォルト:3A 3F 3D 32 10 10 3D 3E 2B 3C 3E
	;                                F    I    R    S    T
    db $10, $10, $10, $10, $10, $10, $30, $33, $3C, $3D, $3E

	; メニュー数値表示改造(E缶) パターンテーブル
	BANKORG_D $3C0CCB		; PC:$78CCB
	db $09, $0A				; デフォルト:$01, $01

	; メニュー数値表示改造(残機) パターンテーブル
	BANKORG_D $3C0CD6		; PC:$78CD6
	db $09, $0A				; デフォルト:$01, $01

	; メニュー数値表示改造(E缶、残機) 更新処理
	BANKORG_D $381A85		; PC:$71A85
	ldx <$47				; 元処理
	lda #$01				; 元処理
	sta $0780,x				; 元処理
	sta $0784,x				; 元処理
	lda #$23				; 元処理
	sta $0781,x				; 元処理
	lda #$3B				; 元処理
	sta $0782,x				; 元処理
	lda #$0A				; デフォルト:lda $A9
	nop						; デフォルト:clc
	db $EA, $EA				; デフォルト:adc #$01
	sta $0783,x				; 残機1桁目
	lda #$23				; 元処理
	sta $0785,x				; 元処理(E缶1桁目,y座標)
	lda #$28				; 元処理
	sta $0786,x				; 元処理(E缶1桁目,x座標)
	lda #$0A				; デフォルト:lda $06A1
	nop						; デフォルト:clc
	db $EA, $EA				; デフォルト:adc #$01
	sta $0787,x				; E缶1桁目
	txa						; 元処理
	clc						; 元処理
	adc #$08				; 元処理
	sta <$47				; 元処理
	rts						; 元処理

	; タイトル画面で100%用フラグ初期化
	BANKORG_D $3E0D08		; PC:$7CD08
	jsr TitleScreenInit
	nop

	; タイトル画面のPASS WORD選択時にGAME STARTと同じ処理＋100%用フラグ立て
	BANKORG_D $3E0D18		; PC:$7CD18
	lda #$02
	sta $06B4				; 100%ルートフラグON
	nop
	nop

	; 岩男リスポーンを早める(通常)
	BANKORG_D $380E73		; PC:$70E73
	lda #$16				; デフォルトはF0
	sta <$95				; 元処理

	; 岩男リスポーンを早める(落下)
	BANKORG_D $380F0C		; PC:$70F0C
	lda #$16				; デフォルトは3C
	sta <$95				; 元処理

	; 死んでも残機減らないようにする
	BANKORG_D $380E8A		; PC:$70E8A
	db $EA, $EA, $EA, $EA, $EA, $EA

	; E缶使っても減らないようにする
	BANKORG_D $381537		; PC:$71537
	db $EA, $EA, $EA		; デフォルト:dsc $06A1

	; ゲームオーバ処理(武器エネ回復等)
	BANKORG_D $3E0D87 		; PC:$7CD87
	LONG_CALL GameoverHackStart
							; デフォルト:lda #$02
							; デフォルト:sta <$A9
							; デフォルト:lda <$11

	; ステージ開始時の諸々初期化処理スキップ(中間も同様)
	BANKORG_D $3E0E59		; PC:$7CE59
	db $EA, $EA, $EA		; デフォルト:sta $0686
	db $EA, $EA, $EA		; デフォルト:sta $0684
	db $EA, $EA, $EA		; デフォルト:sta $06A0
	db $EA, $EA, $EA		; デフォルト:sta $0685
	sta $069E 				; 元処理

	; CONTINUE時のクリア済みフラグ(パレット変更用)初期化処理スキップ
	BANKORG_D $3E0D6E		; PC:$7CD6E
	db $EA, $EA, $EA		; デフォルト:sty $06A0

	; NMIにタイムカウント処理追加
	BANKORG_D $3E00B7		; PC:$7C0B7
	jsr FrameCounterStart

	; テレポート着地時にカウントリセット
	BANKORG_D $3F00AF		; PC:$7E0AF
	jsr TeleportLandStart
	nop

	; スクロール終了後処理(右)
	BANKORG_D $3E175B		; PC:$7D75B
	jmp EndTransitionHackLR

	; スクロール終了後処理(左？)
	BANKORG_D $3E17AF		; PC:$7D7AF
	jmp EndTransitionHackLR

	; スクロール終了後処理(下,梯子無)
	BANKORG_D $3E17EB		; PC:$7D7EB
	jsr EndTransitionHackUD
	nop

	; スクロール終了後処理(下,梯子有)
	BANKORG_D $3E1828		; PC:$7D828
	jsr EndTransitionHackUD
	nop

	; スクロール終了後処理(上,梯子無？)
	BANKORG_D $3E186D		; PC:$7D86D
	jsr EndTransitionHackUD
	nop

	; スクロール終了後処理(上,梯子有)
	BANKORG_D $3E18AA		; PC:$7D8AA
	jsr EndTransitionHackUD
	nop

	; 画面スクロール中にタイマー表示(共通)
	BANKORG_D $3E1712 		; PC:$7D712
	jsr ShowTimerStage

	; ボス撃破後のファンファーレ待機時間変更
	;BANKORG_D $3F1989 		; PC:$7F989
	;lda #$01				; スレッド休止するため短めに設定(デフォルト:$F0)

	; ボス撃破後にタイマー表示(スレッド休止でムリヤリ実装)
	BANKORG_D $3F19C4 		; PC:$7F98E
	jsr ShowTimerBoss

	; Xクラッシャー撃破後にタイマー表示(スレッド休止でムリヤリ実装)
	BANKORG_D $390CC7 		; PC:$72CC7
	lda #$13
	sta <$DC				; ファンファーレを流す(なんとなく)
	jsr ShowTimer
	lda #$F0				; 任意の数値
	jsr $C5F6				; Aレジスタで指定したフレーム数だけスレッドを休止
	jsr ChangeBankOriginal	;
	lda #$01				; クリアフラグを立てて強制脱出
	sta <$F0				; メインループ脱出フラグ(01でステージクリア時,02で死んだとき,03でゲームオーバー)
	rts						; 後続処理は無視(PC:$72CE3 - $72DF8)

	; ワイリー撃破後のファンファーレ待機時間変更
	BANKORG_D $391177 		; PC:$73177
	lda #$01				; スレッド休止するため短めに設定(デフォルト:$F0)

	; ワイリー撃破後にタイマー表示(スレッド休止でムリヤリ実装)
	BANKORG_D $391182 		; PC:$73182
	jsr ShowTimerWily

	; ワイリー撃破後にステージ選択画面に戻る
	;BANKORG_D $39118A 		; PC:$7318A
	lda #$01				; クリアフラグを立てて強制脱出
	sta <$F0				; メインループ脱出フラグ(01でステージクリア時,02で死んだとき,03でゲームオーバー)
	rts						; 後続処理は無視

	; テレポータIN時にタイマー表示
	BANKORG_D $391ABE 		; PC:$73ABE
	jsr ShowTimerTeleporter

	; ボスラッシュ回復(大)取得時にタイマー表示
	BANKORG_D $390F3B 		; PC:$72F3B
	jsr ShowTimerBossRushRefill

	; ゲームオーバ画面 Mr.X以降もSTAGE SELECT表示
	BANKORG_D $3C005F 		; PC:$7805F
	db $EA, $EA, $EA, $EA, $EA, $EA

	; ボス撃破後の武器取得アニメーションをスキップ(Mr.X以降と同じにする)
	BANKORG_D $38116B 		; PC:$7116B
	db $EA, $EA, $EA, $EA, $EA, $EA

	; ボス撃破後にセンターまで歩かせない(Mr.X以降と同じにする)
	;BANKORG_D $3F19A0 		; PC:$7F9A0
	;db $EA, $EA, $EA, $EA, $EA, $EA, $EA, $EA, $EA
;loc_7F9A5:
	;lda #$00
	;jsr $D42E
	;jsr $E46C
	;原作通りにy座標で判定するとメカザウルス戦の高い足場に対応できないので着地フラグで確認
	;lda <$AD				; デフォルト:lda $04CB
	;cmp #$01				; デフォルト:cmp #$B4
	;bne loc_7F9A5			; 元処理
	;nop

	; ボス撃破後の武器デモシーンをスキップ
	BANKORG_D $3E0D95 		; PC:$7CD95
	db $EA, $EA, $EA, $EA, $EA, $EA, $EA, $EA, $EA, $EA, $EA, $EA
	db $EA, $EA, $EA, $EA, $EA, $EA, $EA, $EA, $EA, $EA, $EA, $EA

	; ステージ選択画面に戻るときにフラグ初期化
	BANKORG_D $3F1062 		; PC:$7F062
	jsr StageSelectHackStart
	nop

	; セレクトボタン押下アクション
	BANKORG_D $388E95		; PC:$
	jsr RestartHackStart

	; ステージ選択ループ最初
	BANKORG_D $3F1138		; PC:$7F138
SelectLoop:
	; ステージ選択画面 ボタン押下アクション
	BANKORG_D $3F1171		; PC:$7F171
	LDA <$42				; 元処理
	AND #$F0				; B,SELECTも許容(デフォルトは$90)
	db $F0, $C1				; 元処理(BEQ loc_7F134)
	lda #$38				; 元処理
	sta $DC					; 元処理
	lda <$05				; 元処理
	asl	a					; 元処理
	asl	a					; 元処理
	ora <$04				; 元処理
	tay						; 元処理
	pha
	LONG_CALL SelectHackStart
	pla
	tay						;
	cpy #$05				; 真ん中は選択不可
	beq SelectLoop			; 元処理
	jsr $CA3D				; 元処理
	rts						; ステージ開始前カットシーンスキップ
	db $EA, $EA

	; 8ボス順描画
	BANKORG_D $3F1138		; PC:$7F138
	jsr BossOrderDrawInit

	; ステージBGM
	BANKORG_D $3E1BF1		; PC:$7DBF1
	jsr StageMusic
	nop
	nop

	; ステージ選択画面BGM
	BANKORG_D $3F1088		; PC:$7F088
	jsr StageSelectMusic
	nop

	; パスワード画面(ゲームオーバ)BGM
	BANKORG_D $3C001D		; PC:$7801D
	jsr PasswordMusic
	nop

	; ボス戦BGM
	BANKORG_D $390EE7		; PC:$72EE7
	jsr BossMusic
	nop

	; ボス戦(ボスラッシュ)BGM
	BANKORG_D $3F1A0F		; PC:$7FA0F
	jsr BossMusic
	nop

	; ボスラッシュ部屋(外部IN)BGM
	BANKORG_D $3909EA		; PC:$729EA
	jsr BossRushMusic
	nop

	; ボスラッシュ部屋(内部IN)BGM
	BANKORG_D $390F3E		; PC:$72F3E
	jsr BossRushMusic
	nop

	; ラスボス戦BGM
	BANKORG_D $3F1A19		; PC:$7FA19
	jsr FinalBossMusic
	nop

;●常時割り当てられるプログラムバンクの後方
	BANKORG $3FFAC0
	;ロングコール関係のルーチン {
	;バンクをまたいだプログラムのコール
	;呼び出し先にはa,x,yが正しく渡る。
	;呼び出し元にはa,x,y,フラグが正しく帰る。
	;バンク先頭(8000,A000)へのジャンプには失敗するので注意。
Misc_LongCall:
.TmpZPMem1 = $17
.TmpZPMem2 = $31
	;呼び出し先に渡すa,yを退避
	sta <.TmpZPMem2
	sty <.TmpZPMem2+1
	;記述されたアドレスの読み出しのためのポインタ設定
	pla
	sta <.TmpZPMem1+0
	pla
	sta <.TmpZPMem1+1
	;復帰位置をスタックに書き込み
	clc
	lda <.TmpZPMem1+0
	adc #$03
	tay
	lda <.TmpZPMem1+1
	adc #$00
	pha
	tya
	pha
	;現在のプログラムバンクをスタックに書き込み
	lda <vCurBnk8
	pha
	lda <vCurBnkA
	pha
	;復帰用ルーチンのアドレスをスタックに書き込み
	lda #HIGH(Misc_LongReturn-1)
	pha
	lda #LOW(Misc_LongReturn-1)
	pha
	;呼び出しアドレスを読み込み、アドレスをスタックに書き込み
	ldy #$01
	lda [.TmpZPMem1],y
	pha
	sta vLongCallTmp
	iny
	lda [.TmpZPMem1],y
	pha
	iny
	;呼び出しバンクを読み込み、アドレスより妥当な位置のバンクを切り替え
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
	sta vCurBnk8-6,y ;0ページ不可
	;呼び出し先に渡すz,yの復元
	ldy <.TmpZPMem2+1
	lda <.TmpZPMem2
	rts

Misc_LongReturn:
.TmpZPMem1 = $17
	sta <.TmpZPMem1
	php
	pla
	sta <.TmpZPMem1+1
	;Prg(A000)を戻す
	lda #$07
	sta <vMMC3Cmd
	sta ioMMC3Cmd
	pla
	sta ioMMC3Value
	sta <vCurBnkA
	;Prg(8000)を戻す
	lda #$06
	sta <vMMC3Cmd
	sta ioMMC3Cmd
	pla
	sta ioMMC3Value
	sta <vCurBnk8
	;a,フラグ
	lda <.TmpZPMem1+1
	pha
	lda <.TmpZPMem1
	plp
	rts
	; ロングコール関係のルーチン}
	;追加のルーチン {
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
	cmp #$63				; 上限:90'00
	beq FrameCounterEnd
	inc $06B0
	lda $06B0
	cmp #60
	bne FrameCounterEnd
	inc $06B1
	lda #$00
	sta $06B0
FrameCounterEnd:
	jsr $C88D				; 元処理
    rts

TeleportLandStart:
	lda #$00
	sta $06B0
	sta $06B1
	lda #$37				; 元処理
	sta <$DC				; 元処理
	rts

EndTransitionHackLR:
	pla						; 元処理
	sta <$70				; 元処理
	jsr ChangeBankOriginal	; バンク切替(戻し)
	rts
	
EndTransitionHackUD:
	jsr ChangeBankOriginal	; バンク切替(戻し)
	sta <$FB				; 元処理
	rts

ChangeBankOriginal:
	; バンク切替(戻し)
	lda #%00000010
	sta $8000
	lda #%01000100
	sta $8001
	lda #%00000011
	sta $8000
	lda #%01000101
	sta $8001
	lda #$01
	; タイマーリセット
	lda #$00
	sta $06B0
	sta $06B1
	sta $06B2
	sta $06B3
	; タイム非表示
	lda #$F0
	sta $0250
	sta $0254
	sta $0258
	sta $025C
	sta $0260
	rts

ChangeBankTimer:
	; バンク切替(タイム表示用)
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
	lda $9B					;Current Rush Adaptor (01 -> ジェット, 02 -> パワー)
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
	jsr $C62B				; 元処理
	rts

ShowTimerBoss:
	jsr ShowTimer
	lda #$68				; 任意の数値
	jsr $C5F6				; Aレジスタで指定したフレーム数だけスレッドを休止
	jsr ChangeBankOriginal	;
	rts

ShowTimerBossRush:
	jsr ShowTimer
	lda #$38				; 任意の数値
	jsr $C5F6				; Aレジスタで指定したフレーム数だけスレッドを休止
	jsr ChangeBankOriginal	;
	rts

ShowTimerTeleporter:
	jsr $E028				; 元処理(暗転処理前)
	jsr ShowTimerBossRush
	rts

ShowTimerBossRushRefill:
	jsr ShowTimerBossRush
	jsr $CA3D				; 元処理(暗転処理)
	rts

ShowTimerWily:
	jsr ShowTimer
	lda #$E8				; 任意の数値
	jsr $C5F6				; Aレジスタで指定したフレーム数だけスレッドを休止
	jsr ChangeBankOriginal
	dec $05B9				; 元処理
	rts

ShowTimer:
	txa						; レジスタ退避
	pha						; レジスタ退避

	lda $06B2
	ora $06B3
	bne ShowTimerNotInit	; 初期化判定
	jsr ChangeBankTimer		; バンク切替(タイム表示用)
	lda $06B0
	sta $06B2
	lda $06B1
	sta $06B3

ShowTimerNotInit:
	; タイム表示(y座標)
	lda #$10
	sta $0250
	sta $0254
	sta $0258
	sta $025C
	sta $0260
	
	; タイム表示(タイル)
	lda $06B2			; フレーム(タイム表示用)
	jsr hex_to_dec		; 16→10進数
	sta $06C2			; フレームタイルtmp(タイム表示用)

	lda $06B3			; 秒数(タイム表示用)
	jsr hex_to_dec		; 16→10進数
	sta $06C3			; 秒数タイルtmp(タイム表示用)

	lda $06C3			; 秒数タイルtmp(タイム表示用)
	lsr A
	lsr A
	lsr A
	lsr A
	tax
	jsr AdvanceTilePointer
	LDA TileTableNormal,x
	sta $0251			; 秒(2桁目)

	ldx #$0A
	jsr AdvanceTilePointer
	lda TileTableNormal,x
	sta $0259			; ’

	lda $06C3			; 秒数タイルtmp(タイム表示用)
	and #$0F
	tax
	jsr AdvanceTilePointer
	LDA TileTableNormal,x
	sta $0255			; 秒(1桁目)

	lda $06C2			; フレームタイルtmp(タイム表示用)
	lsr A
	lsr A
	lsr A
	lsr A
	tax
	jsr AdvanceTilePointer
	LDA TileTableNormal,x
	sta $025D			; フレーム(2桁目)

	lda $06C2			; フレームタイルtmp(タイム表示用)
	and #$0F
	tax
	jsr AdvanceTilePointer
	LDA TileTableNormal,x
	sta $0261			; フレーム(1桁目)
	
	; タイム表示(パレット)
	lda #$01
	sta $0252
	sta $0256
	sta $025A
	sta $025E
	sta $0262
	
	; タイム表示(x座標)
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

	pla						; レジスタ修復
	tax						; レジスタ修復
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

AdvanceTilePointer:			; 現在のロックマン状態に合わせてXレジスタ調整
	lda $9B					; Current Rush Adaptor (01 -> ジェット, 02 -> パワー)
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

TileTableNormal:										; ロックマン
	;  0    1    2    3    4    5    6    7    8    9    '
	db $72, $73, $74, $75, $76, $77, $78, $79, $7A, $7B, $7C

TileTableJet:											; ジェットロックマン
	;  0    1    2    3    4    5    6    7    8    9    '
	db $29, $2A, $39, $3D, $3E, $4D, $4E, $7C, $7D, $7E, $7F

TileTablePower:											; パワーロックマン
	;  0    1    2    3    4    5    6    7    8    9    '
	db $60, $61, $62, $70, $71, $72, $35, $45, $55, $73, $74

RestartHackStart:
	lda <$42				;
	and #$20				; SELECT押下でゲームオーバ画面表示
	beq RestartHackEnd
	lda #$03
	sta <$F0
RestartHackEnd:
	jmp $924D				; 元処理に返す

StageSelectHackStart:
	lda #$01				; E缶×1
	sta $06A1				;
	jsr ResetFlagsStart
	jsr ChangeBankOriginal
	rts

ResetFlagsStart:
	ldx #$03
	lda #$00
ResetClearFlagLoop:
	sta $0692,x				; ステージクリアフラグリセット
	dex
	bpl ResetClearFlagLoop
	ldx #$05
SeesawHeightResetLoop:
	sta $0643,x				; シーソー足場の高さリセット(Mr.X3)
	dex
	bpl SeesawHeightResetLoop
	sta <$51				; 現在ステージリセット
	jsr $CB28				; 元処理
	db $42					; 元処理
	rts

BossOrderDrawInit:
	LONG_CALL OrderInitDone
	jsr $C62B				; 元処理
	rts

TitleScreenInit:
	lda #$19				; 元処理
	sta $DC					; 元処理
	lda #$03
	sta $06B4				; 100%ルートフラグ(3:Any%/2:100%)
	rts

MuteFlagMusic:				; BGMフラグに応じてAレジスタのBGM再生orミュート
	pha
	lda $06B6				; BGMフラグ(0:ON/1:OFF)
	beq MuteFlagMusicPlay
	lda #$F0				; BGMなし
	sta <$DC
	pla
	rts
MuteFlagMusicPlay:
	pla
	sta <$DC
	rts

StageMusic:
	lda DefaultMusicTable,y
	jsr MuteFlagMusic		; BGMフラグに応じてAレジスタのBGM再生orミュート
	rts

DefaultMusicTable:
	db $01, $00, $04, $03, $02, $06, $07, $05	; 8ボスステージBGM
	db $09, $09, $09, $09, $0B, $0B, $0B, $0B	; 城ステージBGM

StageSelectMusic:
	lda #$0F
	jsr MuteFlagMusic		; BGMフラグに応じてAレジスタのBGM再生orミュート
	rts

PasswordMusic:
	lda #$15
	jsr MuteFlagMusic		; BGMフラグに応じてAレジスタのBGM再生orミュート
	rts

BossMusic:
	lda #$0C
	jsr MuteFlagMusic		; BGMフラグに応じてAレジスタのBGM再生orミュート
	rts

BossRushMusic:
	lda #$0B
	jsr MuteFlagMusic		; BGMフラグに応じてAレジスタのBGM再生orミュート
	rts

FinalBossMusic:
	lda #$18
	jsr MuteFlagMusic		; BGMフラグに応じてAレジスタのBGM再生orミュート
	rts

	FILL_TEST $3FFF40


;●バンク0D(完全空きのバンク)
	BANKORG_D $0D8000
	nop ;バンク先頭にロングコールできないため

GameoverHackStart:
	jsr SetAmmoStart
	lda #$02				; 元処理
	sta <$A9				; 元処理
	lda <$11
	rts

SelectHackStart:
	cpy #$05				; 真ん中チェック
	beq CenterPressed
	lda #$33				; 効果音(通常ステージ選択)
	sta <$DC				; 効果音設定
	lda StageTable,y		; ステージ番号(通常ステージ選択)
	sta <$51				; ステージ番号設定
	ldx #$00
	lda <$40
	and #$0F				; D-pad入力されていればパレット変更
	beq NoPaletteChange
	inx
NoPaletteChange:
	stx $06A0				; ステージクリア済フラグ(パレット変更用)
	ldx #$80
	lda <$42
	and #$30				; START/SELECT
	beq SelectHackEnd		; START/SELECTなら城ステージ
	lda #$3A				; 効果音(城ステージ選択)
	sta <$DC				; 効果音設定
	lda CastleStageTable,y	; ステージ番号(城ステージ選択)
	sta <$51				; ステージ番号設定
	lda $06B4				; 100%ルートフラグ(3:Any%/2:100%)
	cmp #$03
	beq SelectHackEnd		; Any%ならビートなし
	ldx #$1B
SelectHackEnd:
	stx $0691				; 武器エネルギー(ビート)
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
	lda #$F0				; 消音
	sta <$DC				; 効果音設定
	lda $06B6				; BGMフラグ(0:ON/1:OFF)
	eor #$01
	sta $06B6				; BGMフラグ(0:ON/1:OFF)
	bne OrderInitDone
	lda #$0F				; 消音
	sta <$DC				; 効果音設定
	jmp OrderInitDone

CenterPressedSelect:
	lda #$34				; 効果音
	sta <$DC				; 効果音設定
	inc $06B5				; ボス順(0:Wind First/1:Flame First/2:Knight First)
	lda $06B5
	cmp $06B4				; 100%ルートフラグ(3:Any%/2:100%)
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
	sta $0780				; bit6-0 -> 書き込むデータのバイト数bit6-0 -> 書き込むデータのバイト数
	lda #$20
	sta $0781				; VRAM書き込みアドレス(high)
	lda #$4A
	sta $0782				; VRAM書き込みアドレス(low)
DrawBossOrderLoop:
	lda BossOrderGfx,x
	sta $0783,y				; 書き込む値(byte0のbit6-0で指定した数だけ書き込む)
	inx
	iny
	cpy #$06
	bne DrawBossOrderLoop
	;lda #$09				; 書き込むバイト数(3 + 6)
	;sta <$47
CenterPressedDone:
	ldx #$00
	ldy #$00
	lda $06B4				; 100%ルートフラグ(3:Any%/2:100%)
	cmp #$03
	beq DrawCategoryAny		; Any%ならビートなし
	inx
	inx
	inx
	inx
DrawCategoryAny:
	lda #$04
	sta $0789				; bit6-0 -> 書き込むデータのバイト数bit6-0 -> 書き込むデータのバイト数
	lda #$20
	sta $078A				; VRAM書き込みアドレス(high)
	lda #$44
	sta $078B				; VRAM書き込みアドレス(low)
DrawCategoryLoop:
	lda CategoryGfx,x
	sta $078C,y				; 書き込む値(byte0のbit6-0で指定した数だけ書き込む)
	inx
	iny
	cpy #$04
	bne DrawCategoryLoop
	lda #$10				; 書き込むバイト数(3 + 6 + 3 + 4)
	sta <$47
;DrawMusic:
;	ldx $06B6				; BGMフラグ(0:ON/1:OFF)
;	lda #$01
;	sta $0790				; bit6-0 -> 書き込むデータのバイト数bit6-0 -> 書き込むデータのバイト数
;	lda #$20
;	sta $0791				; VRAM書き込みアドレス(high)
;	lda #$5B
;	sta $0792				; VRAM書き込みアドレス(low)
;	lda MusicGfx,x
;	sta $0793				; 書き込む値(byte0のbit6-0で指定した数だけ書き込む)
;
;	lda #$14				; 書き込むバイト数(3 + 6 + 3 + 4 + 3 + 1)
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
	;  ♪
    db $60
    ;
    db $10

SetAmmoStart:
	ldx <$51				; ステージ番号取得
	ldy #$00
AdvanceAmmoLoop:
	jsr AdvanceAmmoPointer
	dex 
	bpl AdvanceAmmoLoop
	ldx #$07
	lda $06B5				; ボス順(0:Wind First/1:Flame First/2:Knight First)
	beq WindAmmoLoop
	cmp #$01
	beq FlameAmmoLoop
KnightAmmoLoop:
	lda KnightAmmoTable1-1,y
	sta $0689,x				; 武器エネルギー設定
	dey
	dex
	bpl KnightAmmoLoop
	rts

WindAmmoLoop:
	lda WindAmmoTable1-1,y
	sta $0689,x				; 武器エネルギー設定
	dey
	dex
	bpl WindAmmoLoop
	rts

FlameAmmoLoop:
	lda FlameAmmoTable1-1,y
	sta $0689,x				; 武器エネルギー設定
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
	ldx <$51				; ステージ番号取得
	ldy #$00
	sty $0696				; エネルギーバランサー初期化
AdvanceClearFlagLoop:
	iny
	iny
	iny
	iny
	dex 
	bpl AdvanceClearFlagLoop
	ldx #$03
	lda $06B4				; 100%ルートフラグ(3:Any%/2:100%)
	cmp #$02
	beq SetClearFlagHundo
	lda $06B5				; ボス順(0:Wind First/1:Flame First/2:Knight First)
	beq WindClearFlagAnyLoop
	cmp #$01
	beq FlameClearFlagAnyLoop
KnightClearFlagAnyLoop:
	lda KnightClearFlagTableAny1-1,y
	sta $0692,x				; ステージクリアフラグ設定(Any%ルート)
	dey
	dex
	bpl KnightClearFlagAnyLoop
	rts

WindClearFlagAnyLoop:
	lda WindClearFlagTableAny1-1,y
	sta $0692,x				; ステージクリアフラグ設定(Any%ルート)
	dey
	dex
	bpl WindClearFlagAnyLoop
	rts

FlameClearFlagAnyLoop:
	lda FlameClearFlagTableAny1-1,y
	sta $0692,x				; ステージクリアフラグ設定(Any%ルート)
	dey
	dex
	bpl FlameClearFlagAnyLoop
	rts

SetClearFlagHundo:
	lda $06B5					; ボス順(0:Wind First/1:Flame First/2:Knight First)
	beq WindClearFlagHundoLoop	; ※Knight Firstで100%はできない
FlameClearFlagHundoLoop:
	lda FlameClearFlagTableHundo1-1,y
	sta $0692,x					; ステージクリアフラグ設定(100%ルート)
	dey
	dex
	bpl SetClearFlagHundo
	ldx #$00
	lda <$51
	cmp #$01 
	beq FlameYesEnegyBalancer	; ウインドあり
	cmp #$04					; ヤマトステージ以降ならエネルギーバランサー装備
	bcc FlameNoEnegyBalancer
	cmp #$05					; ヤマトステージ以降ならエネルギーバランサー装備
	beq WindNoEnegyBalancer
FlameYesEnegyBalancer:
	inx
FlameNoEnegyBalancer:
	stx $0696					; エネルギーバランサー
	rts

WindClearFlagHundoLoop:
	lda WindClearFlagTableHundo1-1,y
	sta $0692,x					; ステージクリアフラグ設定(100%ルート)
	dey
	dex
	bpl WindClearFlagHundoLoop
	ldx #$00
	lda <$51
	cmp #$04
	bcc WindNoEnegyBalancer
	cmp #$05					; ヤマトステージ以降ならエネルギーバランサー装備
	beq WindNoEnegyBalancer
WindYesEnegyBalancer:
	inx
WindNoEnegyBalancer:
	stx $0696					; エネルギーバランサー
	rts

SetCheckPointStart:
	lda #$00				; 中間ポイントデータ初期化
	sta $0684				; 中間復帰時の部屋番号
	sta $0685				; 中間復帰時のパターンテーブル書き込み番号
	sta $0686				; 中間復帰時のパレット変更番号
	lda <$42
	and #$60				; B or SELECT
	beq SetCheckPointEnd
	ldx <$51				; ステージ番号取得
	lda $06B4				; 100%ルートフラグチェック
	bne SetCheckPointHundo
SetCheckPointAny:
	lda CheckPointRoomTableAny,x
	sta $0684				; 中間復帰時の部屋番号
	lda CheckPointPatternTableAny,x
	sta $0685				; 中間復帰時のパターンテーブル書き込み番号
	lda CheckPointPaletteTableAny,x
	sta $0686				; 中間復帰時のパレット変更番号
SetCheckPointEnd:
	rts

SetCheckPointHundo:
	lda CheckPointRoomTableHundo,x
	sta $0684				; 中間復帰時の部屋番号
	lda CheckPointPatternTableHundo,x
	sta $0685				; 中間復帰時のパターンテーブル書き込み番号
	lda CheckPointPaletteTableHundo,x
	sta $0686				; 中間復帰時のパレット変更番号
	rts

StageTable:
	db $00, $01, $03, $FF, $02, $FF, $05, $FF	; 元データをこっちのバンクにもコピー
	db $04, $06, $07, $FF, $FF, $FF, $FF, $FF	; 元データをこっちのバンクにもコピー

CastleStageTable:
	db $08, $09, $0A, $FF, $0B, $FF, $0C, $FF
	db $0D, $0E, $0F, $FF, $FF, $FF, $FF, $FF

WindAmmoTable1:									; ブリザードマンステージ
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $80, $1B, $80, $1B, $80, $80, $80, $80	; 3

WindAmmoTable2:									; ウインドマンステージ
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $80, $80, $80, $80, $80, $80, $80, $80	; 1

WindAmmoTable3:									; プラントマンステージ
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $80, $1B, $1B, $1B, $80, $80, $80, $80	; 4

WindAmmoTable4:									; フレイムマンステージ
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $80, $1B, $80, $80, $80, $80, $80, $80	; 2

WindAmmoTable5:									; ヤマトマンステージ
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $80, $1B, $1B, $1B, $1B, $80, $1B, $80	; 6

WindAmmoTable6:									; トマホークマンステージ
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $80, $1B, $1B, $1B, $1B, $80, $80, $80	; 5

WindAmmoTable7:									; ナイトマンステージ
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $1B, $1B, $1B, $1B, $1B, $80, $1B, $80	; 7

WindAmmoTable8:									; ケンタウロスマンステージ
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $1B, $1B, $1B, $1B, $1B, $1B, $1B, $80	; 8

WindAmmoTable9:									; Mr.Xステージ1
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $1B, $1B, $1B, $1B, $1B, $1B, $1B, $1B

WindAmmoTable10:								; Mr.Xステージ2
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $1B, $1B, $1B, $13, $1B, $1B, $1B, $1B	; フレイム-8

WindAmmoTable11:								; Mr.Xステージ3
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $1B, $1B, $1B, $13, $1B, $1B, $08, $1B	; トマホーク-20

WindAmmoTable12:								; Mr.Xステージ4
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $1B, $1B, $1B, $13, $1B, $1B, $08, $1B	; Mr.Xステージ3と同じ

WindAmmoTable13:								; Wilyステージ1
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $1B, $1B, $1B, $13, $1B, $08, $08, $1B	; ナイト-20

WindAmmoTable14:								; Wilyステージ2
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $11, $1B, $1B, $13, $1B, $08, $08, $1B	; ヤマト-10

WindAmmoTable15:								; Wilyステージ3
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $11, $09, $1B, $0E, $1B, $08, $08, $1B	; フレイム-5,ウィンド-18

WindAmmoTable16:								; Wilyステージ4
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $0A, $02, $14, $07, $14, $01, $14, $14	; トマホークMAX-7,他-7,

FlameAmmoTable1:								; ブリザードマンステージ
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $80, $80, $80, $1B, $80, $80, $80, $80	; 2

FlameAmmoTable2:								; ウインドマンステージ
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $1B, $80, $1B, $1B, $1B, $1B, $1B, $1B	; 8

FlameAmmoTable3:								; プラントマンステージ
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $80, $80, $1B, $1B, $80, $80, $80, $80	; 3

FlameAmmoTable4:								; フレイムマンステージ
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $80, $80, $80, $80, $80, $80, $80, $80	; 1

FlameAmmoTable5:								; ヤマトマンステージ
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $80, $80, $1B, $1B, $1B, $80, $1B, $80	; 5

FlameAmmoTable6:								; トマホークマンステージ
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $80, $80, $1B, $1B, $1B, $80, $80, $80	; 4

FlameAmmoTable7:								; ナイトマンステージ
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $1B, $80, $1B, $1B, $1B, $80, $1B, $80	; 6

FlameAmmoTable8:								; ケンタウロスマンステージ
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $1B, $80, $1B, $1B, $1B, $1B, $1B, $80	; 7

FlameAmmoTable9:								; Mr.Xステージ1
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $1B, $1B, $1B, $1B, $1B, $1B, $1B, $1B

FlameAmmoTable10:								; Mr.Xステージ2
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $1B, $1B, $1B, $13, $1B, $1B, $1B, $1B	; フレイム-8

FlameAmmoTable11:								; Mr.Xステージ3
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $1B, $1B, $1B, $13, $1B, $1B, $08, $1B	; トマホーク-20

FlameAmmoTable12:								; Mr.Xステージ4
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $1B, $1B, $1B, $13, $1B, $1B, $08, $1B	; Mr.Xステージ3と同じ

FlameAmmoTable13:								; Wilyステージ1
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $1B, $1B, $1B, $13, $1B, $08, $08, $1B	; ナイト-20

FlameAmmoTable14:								; Wilyステージ2
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $11, $1B, $1B, $13, $1B, $08, $08, $1B	; ヤマト-10

FlameAmmoTable15:								; Wilyステージ3
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $11, $09, $1B, $0E, $1B, $08, $08, $1B	; フレイム-5,ウィンド-18

FlameAmmoTable16:								; Wilyステージ4
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $0A, $02, $14, $07, $14, $01, $14, $14	; トマホークMAX-7,他-7,

KnightAmmoTable1:								; ブリザードマンステージ
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $80, $1B, $80, $1B, $80, $1B, $80, $1B	; 5

KnightAmmoTable2:								; ウインドマンステージ
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $80, $80, $80, $80, $80, $1B, $80, $1B	; 3

KnightAmmoTable3:								; プラントマンステージ
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $80, $1B, $1B, $1B, $80, $1B, $80, $1B	; 6

KnightAmmoTable4:								; フレイムマンステージ
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $80, $1B, $80, $80, $80, $1B, $80, $1B	; 4

KnightAmmoTable5:								; ヤマトマンステージ
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $80, $1B, $1B, $1B, $1B, $1B, $1B, $1B	; 8

KnightAmmoTable6:								; トマホークマンステージ
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $80, $1B, $1B, $1B, $1B, $1B, $80, $1B	; 7

KnightAmmoTable7:								; ナイトマンステージ
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $80, $80, $80, $80, $80, $80, $80, $80	; 1

KnightAmmoTable8:								; ケンタウロスマンステージ
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $80, $80, $80, $80, $80, $1B, $80, $80	; 2

KnightAmmoTable9:								; Mr.Xステージ1
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $1B, $1B, $1B, $1B, $1B, $1B, $1B, $1B

KnightAmmoTable10:								; Mr.Xステージ2
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $1B, $1B, $1B, $13, $1B, $1B, $1B, $1B	; フレイム-8

KnightAmmoTable11:								; Mr.Xステージ3
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $1B, $1B, $1B, $13, $1B, $1B, $08, $1B	; トマホーク-20

KnightAmmoTable12:								; Mr.Xステージ4
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $1B, $1B, $1B, $13, $1B, $1B, $08, $1B	; Mr.Xステージ3と同じ

KnightAmmoTable13:								; Wilyステージ1
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $1B, $1B, $1B, $13, $1B, $08, $08, $1B	; ナイト-20

KnightAmmoTable14:								; Wilyステージ2
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $11, $1B, $1B, $13, $1B, $08, $08, $1B	; ヤマト-10

KnightAmmoTable15:								; Wilyステージ3
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $11, $09, $1B, $0E, $1B, $08, $08, $1B	; フレイム-5,ウィンド-18

KnightAmmoTable16:								; Wilyステージ4
	;  Y.S  W.S  B.A  F.B  P.B  K.C  S.T  C.F
	db $0A, $02, $14, $07, $14, $01, $14, $14	; トマホークMAX-7,他-7,

WindClearFlagTableAny1:							; ブリザードマンステージ
	db $00, $01, $01, $00

WindClearFlagTableAny2:							; ウインドマンステージ
	db $00, $00, $00, $00

WindClearFlagTableAny3:							; プラントマンステージ
	db $01, $01, $01, $00

WindClearFlagTableAny4:							; フレイムマンステージ
	db $00, $01, $00, $00

WindClearFlagTableAny5:							; ヤマトマンステージ
	db $03, $01, $01, $01

WindClearFlagTableAny6:							; トマホークマンステージ
	db $01, $01, $01, $01

WindClearFlagTableAny7:							; ナイトマンステージ
	db $03, $07, $01, $01

WindClearFlagTableAny8:							; ケンタウロスマンステージ
	db $03, $07, $01, $03

WindClearFlagTableAny9:							; Mr.Xステージ1～Wilyステージ4
	db $03, $07, $03, $03
	db $03, $07, $03, $03
	db $03, $07, $03, $03
	db $03, $07, $03, $03
	db $03, $07, $03, $03
	db $03, $07, $03, $03
	db $03, $07, $03, $03
	db $03, $07, $03, $03

FlameClearFlagTableAny1:						; 2 ブリザードマンステージ
	db $00, $00, $01, $00

FlameClearFlagTableAny2:						; 8 ウインドマンステージ
	db $03, $06, $03, $03

FlameClearFlagTableAny3:						; 3 プラントマンステージ
	db $01, $00, $01, $00

FlameClearFlagTableAny4:						; 1 フレイムマンステージ
	db $00, $00, $00, $00

FlameClearFlagTableAny5:						; 5 ヤマトマンステージ
	db $03, $00, $01, $01

FlameClearFlagTableAny6:						; 4 トマホークマンステージ
	db $01, $00, $01, $01

FlameClearFlagTableAny7:						; 6 ナイトマンステージ
	db $03, $06, $01, $01

FlameClearFlagTableAny8:						; 7 ケンタウロスマンステージ
	db $03, $06, $01, $03

FlameClearFlagTableAny9:						; Mr.Xステージ1～Wilyステージ4
	db $03, $07, $03, $03
	db $03, $07, $03, $03
	db $03, $07, $03, $03
	db $03, $07, $03, $03
	db $03, $07, $03, $03
	db $03, $07, $03, $03
	db $03, $07, $03, $03
	db $03, $07, $03, $03

KnightClearFlagTableAny1:						; 5 ブリザードマンステージ
	db $00, $01, $03, $02

KnightClearFlagTableAny2:						; 3 ウインドマンステージ
	db $00, $00, $02, $02

KnightClearFlagTableAny3:						; 6 プラントマンステージ
	db $01, $01, $03, $02

KnightClearFlagTableAny4:						; 4 フレイムマンステージ
	db $00, $01, $02, $02

KnightClearFlagTableAny5:						; 8 ヤマトマンステージ
	db $03, $01, $03, $03

KnightClearFlagTableAny6:						; 7 トマホークマンステージ
	db $01, $01, $03, $03

KnightClearFlagTableAny7:						; 1 ナイトマンステージ
	db $00, $00, $00, $00

KnightClearFlagTableAny8:						; 2 ケンタウロスマンステージ
	db $00, $00, $00, $02

KnightClearFlagTableAny9:						; Mr.Xステージ1～Wilyステージ4
	db $03, $07, $03, $03
	db $03, $07, $03, $03
	db $03, $07, $03, $03
	db $03, $07, $03, $03
	db $03, $07, $03, $03
	db $03, $07, $03, $03
	db $03, $07, $03, $03
	db $03, $07, $03, $03

WindClearFlagTableHundo1:						; 3 ブリザードマンステージ
	db $00, $01, $01, $00

WindClearFlagTableHundo2:						; 1 ウインドマンステージ
	db $00, $00, $00, $00

WindClearFlagTableHundo3:						; 4 プラントマンステージ
	db $01, $01, $01, $00

WindClearFlagTableHundo4:						; 2 フレイムマンステージ
	db $00, $01, $00, $00

WindClearFlagTableHundo5:						; 6 ヤマトマンステージ
	db $07, $01, $01, $01

WindClearFlagTableHundo6:						; 5 トマホークマンステージ
	db $01, $01, $01, $01

WindClearFlagTableHundo7:						; 7 ナイトマンステージ
	db $07, $07, $01, $01

WindClearFlagTableHundo8:						; 8 ケンタウロスマンステージ
	db $07, $07, $01, $07

WindClearFlagTableHundo9:						; Mr.Xステージ1～Wilyステージ4
	db $07, $07, $07, $07
	db $07, $07, $07, $07
	db $07, $07, $07, $07
	db $07, $07, $07, $07
	db $07, $07, $07, $07
	db $07, $07, $07, $07
	db $07, $07, $07, $07
	db $07, $07, $07, $07

FlameClearFlagTableHundo1:						; 2 ブリザードマンステージ
	db $00, $00, $01, $00

FlameClearFlagTableHundo2:						; 8 ウインドマンステージ
	db $07, $06, $07, $07

FlameClearFlagTableHundo3:						; 3 プラントマンステージ
	db $01, $00, $01, $00

FlameClearFlagTableHundo4:						; 1 フレイムマンステージ
	db $00, $00, $00, $00

FlameClearFlagTableHundo5:						; 5 ヤマトマンステージ
	db $07, $00, $01, $01

FlameClearFlagTableHundo6:						; 4 トマホークマンステージ
	db $01, $00, $01, $01

FlameClearFlagTableHundo7:						; 6 ナイトマンステージ
	db $07, $06, $01, $01

FlameClearFlagTableHundo8:						; 7 ケンタウロスマンステージ
	db $07, $06, $01, $07

FlameClearFlagTableHundo9:						; Mr.Xステージ1～Wilyステージ4
	db $07, $07, $07, $07
	db $07, $07, $07, $07
	db $07, $07, $07, $07
	db $07, $07, $07, $07
	db $07, $07, $07, $07
	db $07, $07, $07, $07
	db $07, $07, $07, $07
	db $07, $07, $07, $07

CheckPointRoomTableAny:
	;  ﾌﾞﾘ  ｳｲ   ﾌﾟﾗ  ﾌﾚ   ﾔﾏ   ﾄﾏ   ﾅｲ   ｹﾝ
	db $17, $14, $16, $16, $1C, $16, $16, $19
	;  X1   X2   X3   X4   W1   W2   W3   W4
	db $10, $10, $10, $14, $12, $0E, $08, $05

CheckPointRoomTableHundo:
	;  ﾌﾞﾘ  ｳｲ   ﾌﾟﾗ  ﾌﾚ   ﾔﾏ   ﾄﾏ   ﾅｲ   ｹﾝ
	db $17, $14, $16, $16, $1C, $1E, $19, $16
	;  X1   X2   X3   X4   W1   W2   W3   W4
	db $10, $10, $10, $14, $12, $0E, $08, $05

CheckPointPatternTableAny:
	;  ﾌﾞﾘ  ｳｲ   ﾌﾟﾗ  ﾌﾚ   ﾔﾏ   ﾄﾏ   ﾅｲ   ｹﾝ
	db $84, $8E, $93, $87, $98, $95, $00, $00
	;  X1   X2   X3   X4   W1   W2   W3   W4
	db $D7, $B8, $B4, $00, $8B, $B2, $A9, $BE

CheckPointPatternTableHundo:
	;  ﾌﾞﾘ  ｳｲ   ﾌﾟﾗ  ﾌﾚ   ﾔﾏ   ﾄﾏ   ﾅｲ   ｹﾝ
	db $84, $8E, $93, $87, $98, $95, $00, $00
	;  X1   X2   X3   X4   W1   W2   W3   W4
	db $D7, $B8, $B4, $00, $8B, $B2, $A9, $BE

CheckPointPaletteTableAny:
	;  ﾌﾞﾘ  ｳｲ   ﾌﾟﾗ  ﾌﾚ   ﾔﾏ   ﾄﾏ   ﾅｲ   ｹﾝ
	db $1C, $3D, $32, $1F, $5E, $95, $7B, $A9
	;  X1   X2   X3   X4   W1   W2   W3   W4
	db $6C, $00, $D0, $00, $81, $B8, $00, $18

CheckPointPaletteTableHundo:
	;  ﾌﾞﾘ  ｳｲ   ﾌﾟﾗ  ﾌﾚ   ﾔﾏ   ﾄﾏ   ﾅｲ   ｹﾝ
	db $1C, $3D, $32, $1F, $5E, $95, $7B, $A9
	;  X1   X2   X3   X4   W1   W2   W3   W4
	db $6C, $00, $D0, $00, $81, $B8, $00, $18

	FILL_TEST $0DA000