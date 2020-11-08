	
	; ;tìm chieu dài cua mot chuoi ki tu ket thúc
	; TTL Ch6Ex1 - strlencr 
; CR  EQU 0x0D 
	; AREA RESET, DATA, READONLY
	
	; DCD 0x20001000
	; DCD Main
	
	; AREA Data1, DATA, READONLY
; xau	DCB "Hello, World", CR ;xau to chuc theo kt ket thuc 
	; ALIGN 
	
	; AREA Result, DATA
; CharCount DCB 0 				
	
	; AREA Program, CODE, READONLY 
	; ENTRY 

; Main 
	; LDR R0, =xau 	
	; LDR	R8, =Data1
	
	; MOV R1, #0 			

; Loop 
	; LDRB R2, [R0], #1 	
	; CMP R2, #CR 		
	; BEQ Done 			
	; ADD R1, R1, #1 		
	; BAL Loop2 			
; Done 
	; ldr r4, =CharCount
	; STR r1, [r4] 		
	; SWI &11	
	
	; END
