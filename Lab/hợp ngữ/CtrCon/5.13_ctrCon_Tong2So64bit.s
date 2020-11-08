	; AREA RESET, DATA,READONLY
	; DCD 0x20001000
	; DCD Reset_Handler
	; ALIGN
; Value1 DCD &0420147A, &EB529CB8 ;number1 to add 
; Value2 DCD &3020EB85, &20473118 ;number2 to ad
	
	; AREA Program, CODE, READONLY
	; ENTRY 
	; export Reset_Handler
	
; ADD64	PROC
	; LDR R5, =Value1
	; LDR R0, [R5], #4
	; LDR R1, [R5], #4
	; LDR R5, =Value2
	; LDR R2, [R5], #4
	; LDR R3, [R5], #4
	
	; ADDS R1, R1, R3 ;add LS bytes & set carry flag 
	; BCC Next ;branch if carry bit not set 
	; ADD R0, R0, #1 ;otherwise add the carry 

; Next 
	; ADD R0, R0, R2 ;add MS bytes 
	
	; BX 	LR
	; ENDP

; Reset_Handler  
	; BL ADD64 

; STOP
	; nop
	; END 