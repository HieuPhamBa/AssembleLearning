	; TTL Ch4Ex4.3 - nibble 	
	; AREA RESET, DATA, READONLY
		; DCD 0X20001000
		; DCD Main
; Mask DCW &000F ; Bitmask = %0000000000001111 	
; Value DCB &5F
	; ALIGN
	; AREA MYDATA, DATA, READWRITE
; Result	DCD 0;		
	; AREA Program, CODE, READONLY
	; ENTRY 
; Main
	; LDR R1, Value ; Load the value to be disassembled 
	; LDR R2, Mask ; Load the bitmask 
	; MOV R3, R1, LSR #0x4 ; Copy just the high order nibble into R3 
	; MOV R3, R3, LSL #0x8 ; Now left shift it one byte 	
	; AND R1, R1, R2 ; AND the original number with the bitmask 
	; ADD R1, R1, R3 ; Add the result of that to 14 ; What we moved into R3 
	; LDR R5, =Result
	; STR R1, [R5]; Store the result 
	; SWI &11 
 ; ; Value to be shifted 

 	; END