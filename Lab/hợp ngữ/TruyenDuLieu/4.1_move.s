	; AREA RESET, DATA, READONLY
		; DCD 0x20001000
		; DCD Main
; value DCD 123

	; AREA MYDATA, DATA, READWRITE	
; result DCD 0
	
	; AREA MYCODE, CODE, READONLY
	; ENTRY
; Main
	; LDR R1, =value 	;lay dia chi
	; LDRB R2, [R1]	;nap 1 byte nho co dia chi chua trong R1
	; LDR R3, =result
	; STRB R2,[R3]
	; SWI &11
	
	; NOP
	
	; END	