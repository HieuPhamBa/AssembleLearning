	; TTL	4.21_wordtohex.s
	; AREA RESET, DATA, READONLY
		; DCD 0x20001000
		; DCD BATDAU
; Digit DCD &DEADBEEF

	; AREA Data1, DATA
; Digit1 DCD 123 ;0xDEADBEEF 

; Mask EQU 0x0000000F 

	; AREA Program, CODE, READONLY	
		; ENTRY
; BATDAU
	; LDR R1, Digit
	; MOV R4, #8
	; MOV R5, #28
; MainLoop
	; MOV R3, R1
	; MOV R3, R3, LSR R5
	; SUB R5, R5, #4
	; AND R3, R3, #Mask
	; CMP R3, #0xA
	; BLT ADD_0
	
	; ADD R3, R3, #"A"-"0"-0xA 
; ADD_0
	; ADD R3, R3, #"0"
	; MOV R0, R3
	; SWI &0
	; SUBS R4, R4, #1
	; BNE MainLoop
	; MOV R0, #&0D
	; SWI &0
	; SWI &1
	
	; END