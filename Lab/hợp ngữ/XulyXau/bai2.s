	; ; Find the length of a null terminated string 
	; ;Tìm chieu dài cua mot chuoi null cham dut
	; TTL Ch6Ex1 - strlencr 
; CR  EQU 0x0D 
	; AREA RESET, DATA, READONLY
	; EXPORT __vectors
; __vectors
	; DCD 0x20001000
	; DCD Reset_handler
	; AREA Data1, DATA, READONLY
; Table DCB "Hello, World", CR 
	; ALIGN 
	; AREA Result, DATA
; CharCount DCB 0 				
	; AREA Program, CODE, READONLY 
	; ENTRY 
	; EXPORT Reset_handler
; Reset_handler
; Main 
	; LDR R0, =Data1 		
	; MOV R1, #0 			
; Loop 
	; LDRB R2, [R0], #1 	
	; CMP R2, #CR 		
	; BEQ Done 			
	; ADD R1, R1, #1 		
	; BAL Loop 			
; Done 
	; ldr r4, =CharCount
	; STR r1, [r4] 		
	; SWI &11
	
	
	; END