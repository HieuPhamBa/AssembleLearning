; ; 4.19 Chuong trinh tinh tong cac so chan, so le trong 1 chuoi so tu nhien
; ; khi tim thay so chan dau tien thi thoat khoi vong lap
; ; dung break
; ;Khai bao doan du lieu
	; AREA    RESET, DATA, READONLY
		; DCD  0x20001000     
		; DCD  Start  
  
; ; Khai bao' chuoi~ 
; chuoi
	; DCD 1,1,6,1,2,0,7,0,2
	
; ;Khai bao doan ma lenh
	; AREA    DoanMa, CODE, READONLY
   	  ; ENTRY
   	  
; Start

; soluongPT	EQU	9

	; MOV R0, #0 ; tong chan = 0
	; MOV R1, #0 ; tong le = 0
	; LDR R2, =chuoi
	; MOV R3, #0; offset = 0
	; LDR R4, =soluongPT ; r4 = 9

; lapDuyet
	; LDR R5, [R2, R3]  ; R5 = gtri phan tu dau tien cua chuoi
	; MOV R6, R5
	; CMP R6, #0
	; BEQ setChan
	; CMP R6, #1
	; BEQ setLe
	
; lapTru
	; SUB R6, #2
	; CMP R6, #0
	; BEQ setChan
	; CMP R6, #1
	; BEQ setLe
	; B 	lapTru

; setChan
	; ADD R0, R5 ; sumChan += R5
	
	; ADD R3, #4
	; SUB R4, #1
	; CMP R4, #0
	; BEQ	ketThuc
	; B lapDuyet	;continue

; setLe
	; ADD R1, R5 ; sumLe += R5
	
	; ADD R3, #4
	; SUB R4, #1
	; CMP R4, #0
	; BGT lapDuyet	;continue

; ketThuc
	; NOP
	; END	