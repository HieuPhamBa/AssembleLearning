	; ;Set the parity bit on a series of characters store the amended string in Result 
	; ; Ðat bit chan le trên mot loat các ký tu luu tru chuoi sua doi trong Ket qua
	; TTL Ch6Ex5 
	; AREA RESET, DATA, READONLY
		; DCD 0x20001000
		; DCD Main
	
	; AREA Program, CODE, READONLY 
	; ENTRY 
	
; Main 
	; LDR R0, =Data1 
	; LDR R5, =Pointer
	; LDRB R1, [R0], #1 
	; CMP R1, #0 
	; BEQ Done 
; MainLoop 
	; LDRB R2, [R0], #1 
	; MOV R6, R2 
	; MOV R2, R2, LSL #24 
	; MOV R3, #0 
	; MOV R4, #7 
; ParLoop 
	; MOVS R2, R2, LSL #1 
	; BPL DontAdd 
	; ADD R3, R3, #1 
; DontAdd 
	; SUBS R4, R4, #1 
	; BNE ParLoop
	; TST R3, #1 
	; BEQ Even 
	; ORR R6, R6, #0x80 
	; STRB R6, [R5], #1 
	; BAL Check 
; Even STRB R6, [R5], #1 
; Check SUBS R1, R1, #1 
	; BNE MainLoop 
; Done SWI &11 
	; AREA Data1, DATA 
	
; Table DCB 6
	; DCB 0x31 
	; DCB 0x32 
	; DCB 0x33 
	; DCB 0x34 
	; DCB 0x35 
	; DCB 0x36 
	; AREA Result, DATA 
	; ALIGN 
; Pointer DCD 0 

	; END