; ; Chuong trinh tim gia tri lon nhat, nho nhat trong chuoi so
; ;Khai bao doan du lieu
	; AREA    RESET, DATA, READONLY
		; DCD  0x20001000     
		; DCD  Start  
  
; ; Khai bao' chuoi~ 
; chuoi	
	; DCD	1,2,-1,4,3
	
; ;Khai bao doan ma lenh
	; AREA    DoanMa, CODE, READONLY
   	; ENTRY
	  
; Start
; soluongPT	EQU	5

	; ; coi MAX = R1 va MIN = R2
	; MOV R1, #0   ; max
	; MOV R2, #0	 ; min
	; LDR	R3, =chuoi	; gan' address chuoi
	; MOV	R0, #0		; gan' offset = 0
	; LDR	R4, =soluongPT	; soluongPT = 5
	
; loopWhile
	; CMP R4, #0	;kiem tra dieu kien dung
	; BEQ	EndWhile
	
	; LDR	R5, [R3, R0]
	; CMP R5, R1
	; BGT setMax
; setMin	;nho hon hoac bang thi setMin
	; MOV R2, R5
	; B next
; setMax	
	; MOV R1, R5
; next	
	; ADD	R0, #4
	; SUB R4, #1
	; B	loopWhile
	
; EndWhile
	; B EndWhile
	; END	