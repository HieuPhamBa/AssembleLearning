;; Tim max min trong 1 chuoi so

	;AREA RESET, DATA, READONLY
		;DCD 0x20000000
		;DCD MAIN
	
;Chuoi DCD 1, 3, 5, -6, 2
;SoPhanTu DCD 4

	;AREA MAINSOURCE, CODE, READONLY
		;ENTRY
	
;; R0 luu gia tri max
;; R1 luu gia tri min
;; R2 luu gia tri offset
;; R3 luu gia tri dem n - 1
;; R4 llu con tro dau mang
;MAIN 
	;LDR R4, =Chuoi
	;LDR R3, SoPhanTu
	
	;LDR R1, [R4]
	;LDR R0, [R4]
	
	;MOV R2, #0


;LOOP
	;CMP R3, #0
	;BEQ STOP
	
	;LDR R2, [R4], #4
	;SUB R3, 1
	
	;CMP R2, R0 ; khi R2 < R0 => SET MAX 
	;BGT SETMAX
	
	;CMP R2, R1 ; khi R2 > R0 => SET MIN 
	;BLT SETMIN
	
	;B LOOP
	
;SETMAX
	;MOV R0, R2 ; R0 = R2
	;B LOOP
	
;SETMIN
	;MOV R1, R2
	;B LOOP

;STOP B STOP
	;END
	