	; TTL	4.27_mul16.s
	; AREA RESET, DATA, READONLY		
		; DCD 0x20001000
		; DCD Main

; Number1 DCD &706F ;a 16 bit binary number
; Number2 DCD &0161 ;another

	; AREA Data2, DATA, READWRITE
; Result DCD 0 ;storage for result		
		
	; AREA Program, CODE, READONLY
			; ENTRY			

; Main
		; LDR R0, =Number1 ;load first number
		; LDR R1, =Number2 ;and second
		; MUL R0, R1, R0 ;x:= y * x
		; MUL R0, R0, R1 ;won’t work - not allowed
		; LDR R2, =Result
		; STR R0, [R2]
		
		; SWI &11 ;all done

		; NOP
	; END