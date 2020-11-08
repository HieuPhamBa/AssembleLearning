 	; AREA RESET, DATA, READONLY
		; DCD 0X20001000
		; DCD Main
; value dcd 123

	; AREA MYDATA, DATA, READWRITE	
; result dcd 0
	
	; AREA MYCODE, CODE, READONLY
	 
; Main
	; LDR r1, =value 	; lay dia chi
	; LDR r2, [r1]	;nap gia tri tu dia chi value
	; MVN r2,r2		;thuc hien not R2 = not r2
	; LDR r3, =result	;lay dia chi cua result
	; STR r2,[r3]	;luu gia tri value vao gia tri r3, ma r3 chua dia chi result, luc nay result se luu gia tri value
	; SWI #11
	
	; NOP
	; END