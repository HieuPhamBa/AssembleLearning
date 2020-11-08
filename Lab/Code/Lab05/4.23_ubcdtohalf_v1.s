	; TTL	4.23_ubcdtohalf_v1.s
	; AREA RESET, DATA, READONLY
	; DCD 0x20001000
	; DCD batdau
	
	; AREA Data1, DATA
; BCDNum DCB &02, &09, &07, &01

	; AREA Data2, DATA
; Result DCD 0
	
	; AREA MYCODE, CODE, READONLY
		; ENTRY
; batdau 
	; LDR R0, =BCDNum
	; MOV R5, #4
	; MOV R1, #0
	; MOV R2, #0
; Loop
	; ADD R1, R1, R1
	; MOV R3, R1
	; MOV R3, R3, LSL #2
	; ADD R1, R1, R3
	; LDR R4, [R0], #1
	; ADD R1, R1, R4
	; SUBS R5, R5, #1
	; BNE Loop
	; LDR R1, =Result
	; SWI &11
	
	; END	