; ;4.11 Chuong trinh xac dinh dau
; ;Khai bao doan du lieu
	; AREA	RESET, DATA, READONLY
		; DCD 0x20001000 ; stack pointer value when stack is empty
		; DCD Start ; reset vector
	
; SoNguyen	DCD  10

; ; Khai bao doan ma lenh
	; AREA	DoanCode, CODE, READONLY	
		; ENTRY ;Khai bao diem vao chuong trinh		
; Start
	; LDR	R0, =SoNguyen
	; LDR R1, [R0]
	
	; CMP R1, #0
	; BEQ	Bang0
	; BGT	LonHon0
	
; Bang0
	; MOV	R2, #0
	; B	KetThuc
	
; LonHon0
	; MOV	R2, #1
	; B	KetThuc
	
; NhoHon0
	; MOV	R2, #-1	

; KetThuc
	; END ; ket thuc chuong trinh