;; Tinh tong 1 + 2^2 + 3^3 + ... + N^N

	;AREA RESET, DATA, READONLY
		;DCD 0x20000000
		;DCD MAIN
	
;X DCD 2
;N DCD 3
	
	;AREA MAINCODE, CODE, READONLY
		;ENTRY
		
;MAIN
	;LDR R1, X ; X = 2
	;MOV R2, #1 ; SUM = 1
	;MOV R3, #2 ; I = 2
	;MOV R4, #1
	;LDR R6, N

;LOOP 
	;CMP R3, R6 
	;BGT STOP
	;MOV R5, R3 ; J = I

;TinhNMuN
	;CMP R5, #0
	;BEQ NEXT
	;MUL R4, R1
	;SUB R5, 1
	;B TinhNMuN

;NEXT
	;ADD R2, R4
	;ADD R3, 1
	;MOV R4, 1
	;B LOOP

;STOP B STOP
	;END

