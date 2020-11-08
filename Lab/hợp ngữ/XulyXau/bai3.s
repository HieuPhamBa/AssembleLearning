; ;tìm chieu dài cua mot chuoi
	; TTL Ch6Ex3 4
; Blank EQU " " 
	; AREA RESET, DATA, READONLY	
	; DCD 0x20001000
	; DCD Main
	
	; AREA Program, CODE, READONLY 
	; ENTRY 

; Main 
	; LDR R0, =Data1 		
	; MOV R1, #Blank 		
; Loop 
	; LDRB R2, [R0], #1 	
	; CMP R2, R1 			
	; BEQ Loop 				
	; SUB R0, R0, #1 		
	; ldr r3, =Pointer	
	; STR R0, [r3] 	
	; SWI &11
	; AREA Data1, DATA, READONLY
; Table 
	; DCB " 7 " 
	; ALIGN 
	; AREA Result, DATA 
; Pointer 
	; DCD 0 				
	; ALIGN 
	
	; END