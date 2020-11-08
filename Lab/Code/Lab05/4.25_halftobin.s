	; TTL	4.25_halftobin.s
	; AREA RESET, DATA, READONLY
	; DCD 0x20001000
	; DCD batdau
	
	; AREA Data1, DATA
; Number DCD &31D2
	; AREA Data2, DATA
; String DCB 16

	; AREA Program, CODE, READONLY
	; ENTRY
	
; batdau
	; LDR R0, =String
	; ADD R0, R0, #16
	; LDR R6, =String
	; MOV R3, #"0"
	; LDR R1, =Number
; Loop
	; MOVS R1, R1, ROR #1
	; BCS Loopend
	; STRB R3, [R0], #-1
	; BAL Decr
; Loopend
	; STRB R2, [R0], #-1
; Decr
	; SUBS R6, R6, #1
	; BNE Loop
	; SWI &11
	
	; END	