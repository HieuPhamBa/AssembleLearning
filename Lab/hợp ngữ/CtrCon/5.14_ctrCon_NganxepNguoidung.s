	; TTL	Ch10Ex5
		; AREA RESET,DATA,READONLY
		; EXPORT __vectors
; __vectors
	; DCD 0x20001000
	; DCD Reset_Handler

	; AREA	Data1, DATA , READWRITE
; Number 		DCD		&4CD0	;number   to   convert
; String  	DCB		4	;counted   string   for result

	
; Mask		EQU		0x0000000F	;bit mask  for  masking  out  lower nibble
; StackSize 	EQU 	0x400		;kích thước stack


	; AREA Stack, DATA, READWRITE
; StackStart 	SPACE 	StackSize  ;;khai báo vùng nhớ tack
; TopStack					   ;;con trỏ đỉnh stack
	
	; AREA	DoanMa, CODE, READONLY
	; EXPORT Reset_Handler
	; ENTRY	

; ;;;;converts a 16 bit hex value to an ASCII string
; ;;;;debug -> chỉ lấy được địa chỉ của vùng nhớ
; ;;;;sử dụng stack người dùng
; ;;;;kết quả không thỏa mãn yêu cầu đề bài
; Reset_Handler		
	; LDR R11, =TopStack
	; LDR	R0, =Number	;Load number to register
	; LDR	R1, =String	;load  address  of string
	; STR	R1,  [R11], #-4	;and store it
	; STR	R0,  [R11], #-4	;and store number  to  stack
	; BL	Binhex	;branch/link
	; ; SWI	&11	;all done

; Binhex
	; MOV	R8, R11	;save  stack  pointer  for later
	
	; MOV	R1, #4	;init   counter
	; ADD	R11, R11, #4	;adjust   pointer
	; LDR	R2, [R11], #4	;get  the  number
	; LDR	R4, [R11]	;get  the  address  of  the  string
	; ADD	R4, R4, #4	;move  past the end  of where  the string is to be stored
	
; Loop
	; MOV	R0, R2	;copy  the  number
	; AND	R0, R0, #Mask	;get  the  low  nibble
	; BL	Hexdigit	;convert  to ASCII
	; STRB	R0, [R4], #-1	;store  it
	; MOV	R2, R2, LSR #4	;shift   to   next  nibble
	
	; SUBS	R1, R1, #1	;decr   counter
	; CMP R1, #0
	; BNE	Loop	;loop  while  still  elements  left

	; LDM	R8, {R0-R6,R14}	;restore    the   registers
	; BX 	LR	;return   from   subroutine
	
; Hexdigit
	; CMP	R0, #0xA	;is the  number  0  ... 9?
	; BLE	Addz	;if  so,   branch
	; ADD	R0,  R0,  #"A"  - "0" - 0xA	;adjust  for  A  ... F

; Addz
	; ADD	R0, R0, #"0"	;change  to ASCII
	; BX 	LR	;return   from   subroutine

	; NOP
	; END