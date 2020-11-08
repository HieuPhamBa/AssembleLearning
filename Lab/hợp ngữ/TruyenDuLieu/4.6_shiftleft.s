		; TTL Ch4Ex5 - shiftleft

	; AREA RESET, DATA, READONLY
		; DCD 0X20001000
		; DCD main
; value dcd 123

	; AREA MYDATA, DATA, READWRITE	
; result dcd 0
	; ALIGN
	; AREA MYCODE, CODE, READONLY
	; ENTRY

; main
	 ; ldr r1, =value
	 ; ldr r2, [r1]
     ; mov r3, r2, LSL #0x1	;dich trai r2 1 bit
     ; ldr r4, =result		
	 ; str r3, [r4]			;luu ket qua
	 ; nop 
	 ; end