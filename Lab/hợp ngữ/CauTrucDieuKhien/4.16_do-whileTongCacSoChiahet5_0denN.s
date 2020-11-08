; ; 4.16 chuong trinh tinh tong cac trong chuoi chia het cho 5
; ; Y tuong: Moi~ lan` tang bien len 5 roi them vao Sum neu' bien >N thi` dung`.

; ;Khai bao doan du lieu
	; AREA	RESET, DATA, READONLY
		; DCD 0x20001000 ; stack pointer value when stack is empty
		; DCD Start ; reset vector
; ;bien don
; bien	DCD	123

; SIZE	DCD 3
; xauCoDinh DCB	'a', 'b', 'c'

; xauCoKTKetThuc1	DCB	'a', '0'
; xauCoKTKetThuc2	DCB	'a', 'b', '0'

; ;khai bao mang		
; chuoiSo DCD	1, 5, 8, 9, 10, 11

; ;mang 2 chieu - matran, 
; matran	DCD	1, 2, 3, 4, 5
		; DCD	1, 2, 3, 4, 5
		; DCD	1, 2, 3, 4, 5
		
; soPT	EQU	6

; ; Khai bao doan ma lenh
	; AREA	DoanMa, CODE, READONLY
		; ENTRY ;Khai bao diem vao chuong trinh

; Start
	; MOV R0, #0; tong
	; LDR	R1, =soPT;	so phan tu
	; MOV	R2, #0 ;bien chay
	
	; LDR R3, =chuoiSo;	R3=dia chi cua phan tu dau tien
	
; LapTinh
	; CMP	R2, R1
	; BGE	STOP
	
	; MOV	R5, #4
	; MUL R5, R2
	; LDR	R4, [R3, R5]	;lay phan tu hien tai, nap vao R4
	
	; ;check chia 5
	; MOV	R6, R4
; LapChia
	; SUB R6, #5
	; CMP R6, #5
	; BGE	LapChia ;ket qua R6 chua phan du
	
	; CMP	R6, #0
	; BNE	TangDem
	; ADD	R0, R4
; TangDem
	; ADD	R2, #1
	; B	LapTinh
	
; STOP	B	STOP

	; END ; ket thuc chuong trinh