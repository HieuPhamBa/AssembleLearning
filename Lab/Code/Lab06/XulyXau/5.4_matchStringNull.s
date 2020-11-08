	; ;So sánh hai chuoi ket thúc null
	; TTL Ch6Ex7 
	; AREA RESET, DATA, READONLY	
	; DCD 0x20001000	
	; DCD Main
	
	; AREA Program, CODE, READONLY 
	
; Main 
	; LDR R0, =Data1 
	; LDR R1, =Data2 
	; LDR R2, =Match 
	; MOV R3, #0 
	; MOV R4, #0 
; Count1 
	; LDRB R5, [R0], #1 
	; CMP R5, #0 
	; BEQ Count2 
	; ADD R3, R3, #1
	; BAL Count1 
; Count2 
	; LDRB R5, [R1], #1 
	; CMP R5, #0 
	; BEQ Next 
	; ADD R4, R4, #1 
	; BAL Count2 
; Next CMP R3, R4 
	; BNE Done
	
	; CMP R3, #0 
	; BEQ Same 
	; LDR R0, =Data1 
	; LDR R1, =Data2 
	; ;if we got this far, we now need to check the string char by char
; Loop 
	; LDRB R5, [R0], #1 		
	; LDRB R6, [R1], #1 		
	; CMP R5, R6 				
	; BNE Done 				
	; SUBS R3, R3, #1 		
	; BEQ Same 				
							
	; BAL Loop
; Same 
	; MOV R2, #0 				
; Done 
	; ldr r8, =Match
	; STR R2, [r8] 		
	; SWI &11 
	
	; AREA Data1, DATA, READONLY
; Table1 DCB "Hello, World", 0 
	; ALIGN 
	
	; AREA Data2, DATA , READONLY
; Table2 DCB "Hello, worl", 0 

	; AREA Result, DATA 
	; ALIGN 
; Match DCD 0 

	; END