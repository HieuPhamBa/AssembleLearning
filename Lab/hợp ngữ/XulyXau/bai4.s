; ;supress leading zeros in a string 
; ;ngan các so không o dau trong mot chuoi
		; TTL Ch6Ex4 
		
; Blank	EQU	 ' '
; Zero 	EQU '0' 

		; AREA RESET, DATA, READONLY		
		; DCD 0x20001000
		; DCD Reset_handler
		
		; AREA Program, CODE, READONLY 
		; ENTRY 
		; EXPORT Reset_handler
; Reset_handler

	; LDR R0, =Data1 			
	; MOV R1, #Zero 			
	; MOV R3, #Blank 			
; Loop 
	; LDRB R2, [R0], #1 		
	; CMP R2, R1 				
	; BNE Done 				
	; SUB R0, R0, #1 			
	; STRB R3, [R0] 			
	; ADD R0, R0, #1 			
	; BAL Loop 				
; Done 
	; SWI &11 				
	
	; AREA Data1, DATA
; Table 
	; DCB "000007000" 
	; ALIGN 

	; AREA Result, DATA 
; Pointer DCD 0 				
	; ALIGN 
	
	; END
