;doan du lieu
	area RESET, data, readonly
		dcd	0x20001000
		dcd	bdDoanCode
;------------------------------------------
;khai bao cac vung nho
;<tenVungNho> <TuKhoa> {gia tri khoi tao}
arNum4	dcd 1, 2, 4, 5, -10, 7, -5, 6 ;...moi phan tu 4 byte
arNum1	dcb 1, 2, 4, 5, 10, 7, 5, 6 ;...moi phan tu 1 byte
arNum2	dcw 1, 2, 4, 5, 10, 7, 5, 6 ;...moi phan tu 2 byte
arNum8	dcq 1, 2, 4, 5, 10, 7, 5, 6 ;...moi phan tu 8 byte
;---------------------------------------------------------------
;doan code
	area doanCode, code, readonly
; khai bao cac hang so
MAX	equ	8 ;dinh nghia hang MAX = 8
		entry
bdDoanCode
;---------------------------------------------------------
;LAB2
; bai 1: tinh tong cac so trong 1 chuoi so
; input:
;	- chuoi so duoc chua trong vung nho (vi du: arNum4)
; output:
;	- tong: chua trong thanh ghi R0
; thuat toan:
;	- R1: chua bien chay tu 1 - Max
;	- R2: chua Max
;	- R3: chua gia tri cua phan tu hien tai
;	- R4: chua dia chi cua phan tu dau tien

;nap so phan tu Max vao thanh ghi R2
	ldr	R2, =MAX 
	
	mov R0, #0
	mov R1, #1
	ldr	R4, =arNum4 ;nap dia chi cua byte dau tien cung vung nho arNum4 vao R4
LapTinhTong
	;cac buoc: 1. nap so tu bo nho vao thanh ghi; 2 cong trong cac thanh ghi
	;	3 thay doi bien dem; 4 so sanh va lap
	ldr	R3, [R4] ;nap 4 byte tu bo nho vao thanh ghi. Dia chi byte dau chua trong R4
	add R0, R3
	add R1, #1
	add R4, #4
	
	cmp R1, R2
	ble LapTinhTong
	;ket thuc lap: R0 = tong cac phan tu trong chuoi


; ; bai 6 ---------------------------------------------------
	; ;tinh tong 1 + X2 + X3 + ... + Xn
	; ;gia su: 
	; ;	- R1: chua x
	; ;	- R2: chua N
	; ;	- R3: bien chay cho vong lap trong
	; ;	- R4: bien chay cho vong lap ngoai
	; ;	- R5: chua luy thua cua X
	; ;	- R0: chua tong
	; mov R1, #2
	; mov R2, #6
	; mov R0, #1
	
	; mov R4, #2
; LapNgoai
	; mov R5, #1
	; mov R3, #1
; LapTrong
		; mul R5, R1
		; add R3, #1
		; cmp R3, R4
		; ble LapTrong
		; ;ket thuc LapTrong
	; add R0, R5
	; add	R4, #1
	; cmp R4, R2
	; ble	LapNgoai
	; ;ket thuc lap ngoai
; ; ket thuc bai 6 -------------------------------------------	

; ; bai 7: tim uoc chung lon nhat cua 2 so ---------------------
; ; input: 
; ;	- R1: chua so thu nhat
; ;	- R2: chua so thu 2
; ; output:
; ;	- R0: chua UCLN
; ;--------------------------------------
	; mov R1, #25
	; mov R2, #15

; LapTimUCLN
	; cmp R1, R2
	; beq	Bang
	; bgt LonHon
	; ; truong hop R1 < R2
	; sub R2, R2, R1 ;R2 = R2-R1
	; b LapTimUCLN
; LonHon	
	; sub R1, R1, R2 ;R1 = R1-R2
	; b LapTimUCLN
	
; Bang
; ; ket thuc: UCLN chua trong R1/R2
	; mov R0, R1
;-------------------------------------------------------------
	end