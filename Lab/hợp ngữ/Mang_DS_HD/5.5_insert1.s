	; ;TTL 5.5_insert1.s
	; AREA RESET, DATA, READONLY
		; DCD 0x20001000 ; stack pointer value when stack is empty
		; DCD Main
		
	; AREA Data1, DATA
; Start DCD &4 ;length of list
	; DCD &5376 ;items
	; DCD &7615
	; DCD &138A
	; DCD &21DC
; Store % &20 ;reserve 20 bytes of storage

	; AREA Data2, DATA
; NewItem DCD &16FA
; List    DCD Start

	; AREA Program, CODE, READONLY
	 
	 ; ENTRY

; Main
	 ; LDR R0, =List ;load the start address of the list
	 ; LDR R1, =NewItem ;load the new item
	 ; LDR R3, [R0] ;copy the list counter
	 ; LDR R2, [R0], #4 ;init counter and increment pointer
	 ; LDR R4, [R0], #4
; Loop
	 ; CMP R1, R4 ;does the item match the list?
	 ; BEQ Done ;found it - finished
	 ; SUBS R2, R2, #1 ;no - get the next item
	 ; LDR R4, [R0], #4 ;get the next item
	 ; BNE Loop ;and loop

	 ; SUB R0, R0, #4 ;adjust the pointer
	 ; ADD R3, R3, #1 ;increment the number of items
	 ; ldr r5, =Start
	 ; STR R3, [r5] ;and store it back
	 ; STR R1, [R0] ;store the new item at the end of the list

; Done SWI &11

	; nop

	; END