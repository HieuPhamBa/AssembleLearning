; ;4.10 Viet chuong trinh tinh tong so chan, so le <=N
; ;Khai bao doan du lieu
	; AREA	RESET, DATA, READONLY
		; DCD 0x20001000 ; stack pointer value when stack is empty
		; DCD Start ; reset vector
	
; ; Khai bao doan ma lenh
	; AREA	DoanCode, CODE, READONLY	
		; ENTRY ;Khai bao diem vao chuong trinh
; ;---------------------
; ; Bat dau doan code (Diem vao chuong trinh)

; Start	
; ;---------------------
	; MOV	R1, #10;	so N
	; MOV	R2, #0;		chua tong

	; MOV	R0, #2
	
	; CMP	R0, #1
	; BEQ	TongLe
	; CMP	R0, #2
	; BEQ	TongChan
	; ;default
	; B KetThuc

; TongLe
	; MOV	R3, #1;		bien chay
; LapTinh
	; CMP	R3, #10
	; BGT	KetThuc
	; ADD	R2, R1
	; ADD	R3, #2
	; B	LapTinh
	
; TongChan
	; MOV	R3, #2;		bien chay
; LapTinhChan
	; CMP	R3, #10
	; BGT	KetThuc
	; ADD	R2, R1
	; ADD	R3, #2
	; B	LapTinhChan
; KetThuc

	; NOP
	; END ; ket thuc chuong trinh
; ;---------------------