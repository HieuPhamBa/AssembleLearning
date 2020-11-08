	; AREA RESET, DATA, READONLY
		; DCD 0x20001000
		; DCD BATDAU
		
	; AREA Data1, DATA
; Char DCB &37

	; AREA Data2, DATA
; Result DCB 0

	; AREA Program, CODE, READONLY
		; ENTRY
; BATDAU 
	; MOV R1, #-1
	; LDR R0, =Char 
	; SUBS R0, R0, #"0"
	; BCC Done
	; CMP R0, #9
	; BHI Done
	; MOV R1, R0
; Done 
	; LDR R1, =Result
	; SWI &11
	
	; END	