; ; 4.18 Chuong trinh tim so chan dau tien trong chuoi so tu nhien 
; ; khi tim thay so chan dau tien thi thoat khoi vong lap
; ; dung break
; ;Khai bao doan du lieu
	; AREA    RESET, DATA, READONLY
		; DCD  0x20001000     
		; DCD  Start  
  
; ; Khai bao' chuoi~ 
; chuoi
	; DCD 1,5,8,3,5,0,1,5,2
	
; ;Khai bao doan ma lenh
	; AREA    DoanMa, CODE, READONLY
   	  ; ENTRY
   	  
; Start

; soluongPT	EQU	9
	
	; MOV R1, #0 ; luu gia tri phan tu
	; LDR R2, =chuoi
	; MOV R3, #0; offset = 0
	; LDR R4, =soluongPT ; r3 = 9

; lapDuyet
	; LDR R5, [R2, R3]  ; R5 = gtri phan tu dau tien trong chuoi
	; MOV R6, R5	
	
	; CMP	R6, #0
	; BEQ	soChan
	; CMP R6, #1
	; BEQ tangDem
	
; lapTru				;kiem tra so chan >= 2
	; SUB R6, #2
	; CMP R6, #2
	; BGE lapTru
	; CMP R6, #0
	; BEQ soChan
	; B	tangDem

; soChan
	; B	ketThuc		;break
	
; tangDem
	; ADD	R3, #4
	; SUB	R4, #1
	; CMP	R4, #0
	; BEQ	ketThuc
	; B	lapDuyet

; ketThuc
	; MOV R1, R5	

	; NOP
	; END	