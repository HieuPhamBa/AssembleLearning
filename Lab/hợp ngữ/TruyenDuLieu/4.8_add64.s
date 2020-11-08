		; TTL Ch4Ex8 - add64
	; AREA RESET, DATA, READONLY
		; DCD 0X20001000
		; DCD Main
; Value1 DCD &12A2E640, &22100123
; Value2 DCD &001019BF, &40023F51 	
	; AREA MYDATA, DATA, READWRITE
; Result	DCD 0;	
	; AREA Program, CODE, READONLY
	; ENTRY
; Main 
  ; LDR R0, =Value1 ; Pointer to first value 
  ; LDR R1, [R0] ; Load first part of value1 
  ; LDR R2, [R0, #4] ; Load lower part of value1 
  ; LDR R0, =Value2 ; Pointer to second value 
  ; LDR R3, [R0] ; Load upper part of value2 
  ; LDR R4, [R0, #4] ; Load lower part of value2 
  ; ADDS R6, R2, R4 ; Add lower 4 bytes and set carry flag 
  ; ADC R5, R1, R3 ; Add upper 4 bytes including carry 1
  ; LDR R0, =Result ; Pointer to Result 
  ; STR R5, [R0] ; Store upper part of result 
  ; STR R6,[R0, #4] 
  ; SWI &10	
	
	; END 