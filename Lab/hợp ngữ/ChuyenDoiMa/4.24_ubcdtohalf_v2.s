	; AREA RESET, DATA, READONLY
	; DCD 0x20000000
	; DCD BATDAU
	
	; AREA Data1, DATA
; Digit DCD &0C
	; AREA Data2, DATA
; Result DCD 0


	; AREA Program, CODE, READONLY
	; ENTRY
	
; BATDAU
	; LDR R0, =Digit
	; LDR R1, =Result
	; CMP R0, #0xA
	; BLT ADD_0
	; ADD R0, R0, #"A"-"0"-0xA
; ADD_0
	; ADD R0, R0, #"0"
	; STR R0, [R1]
	; SWI &11
	
	; END	