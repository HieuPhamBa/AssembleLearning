		; TTL Ch4Ex7 - bigger
	; AREA RESET, DATA, READONLY
		; DCD 0X20001000
		; DCD Main
; Value1 DCD &12345678 ; Value to be compared
; Value2 DCD &87654321 ; Value to be compared

	; AREA MYDATA, DATA, READWRITE
; Result	DCD 0;

	; AREA Program, CODE, READONLY
 ; ENTRY

; Main
	; LDR R1, Value1 ; Load the first value to be compared
	; LDR R2, Value2 ; Load the second value to be compared
	; CMP R1, R2 ; Compare them
	; BHI Done ; If R1 contains the highest
	; MOV R1, R2 ; otherwise overwrite R1
; Done
	; LDR R0,= Result
	; STR R1,[R0] ; Store the result
	; SWI &11
	; END