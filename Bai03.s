;; Tong cac co < n chia het cho 5
	;AREA RESET, DATA, READONLY
		;DCD 0x20000000
		;DCD Start
	
	;AREA MAINSOURCE, CODE, READONLY
		;ENTRY
		
;N EQU 10	
	
;Start
	;MOV R0, N
	;MOV R1, #0
	;MOV R2, #5

;Loop
	;CMP R2, R0
	;BGT Stop
	;ADD R1, R2
	;ADD R2, #5
	;B Loop

;Stop B Stop
	;END
	