	.inesprg $20 ; プログラムバンク数
	.ineschr $01 ; キャラクタバンク数
	.inesmir 0 ;

	.inesmap 119 ; MMC3→119

	.bank 0
	.org $0000

	.incbin  "rm6.prg"
	.include "src/mylib.asm"
	.include "src/mylib_r6.asm"
	.include "src/main.asm"