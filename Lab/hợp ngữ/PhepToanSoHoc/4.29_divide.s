	; TTL	4.29_divide.s
	; AREA RESET, DATA, READONLY
		; EXPORT __Vectors
; __Vectors
		; DCD 0x20001000
		; DCD Reset_Handler

; Number1 DCD &0075CBB1 ;a 16 bit binary number
; Number2 DCD &0141 ;another

		; AREA Data2, DATA, READWRITE
; Quotient DCD 0 ;storage for result
; Remain DCD 0 ;storage for remainder		

		; AREA Program, CODE, READONLY
		; ENTRY
		; EXPORT Reset_Handler
		
; Reset_Handler
		; LDR R0, =Number1 ;load first number
		; LDR R1, =Number2 ;and second
		; MOV R3, #0 ;clear register for quotient
; Loop
		; CMP R1, #0 ;test for divide by 0
		; BEQ Err
		; CMP R0, R1 ;is the divisor less than the dividend?
		; BLT Done ;if so, finished
		; ADD R3, R3, #1 ;add one to quotient
		; SUB R0, R0, R1 ;take away the number you first thought of
		; B Loop ;and loop
; Err
		; MOV R3, #0xFFFFFFFF ;error flag (-1)
; Done
		; LDR R7, =Remain ;store the remainder
		; STR R0,[R7]
		; LDR R7, =Quotient ;and the quotient
		; STR R3,[R7]
		; SWI &11 ;all done
	; END