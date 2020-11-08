;doan du lieu
	area reset, data, readonly
		dcd	0x20001000
		dcd	bdDoanCode
		
;khai bao cac vung nho
;arMangSo4 dcd 1, 2, 6, 8, 9, 9, 1, 2, -8, 10; moi phan tu 4byte

;cac khai bao vi du khac
; arMangSo1 dcb 1, 2, 6, 8, 9, 9, 1, 2, -8, 10; moi phan tu 1byte
; arMangSo2 dcw 1, 2, 6, 8, 9, 9, 1, 2, -8, 10; moi phan tu 2byte
; arMangSo8 dcq 1, 2, 6, 8, 9, 9, 1, 2, -8, 10; moi phan tu 8byte

;khai bao ma tran
arMatran	
	dcd	1, 5, 8
	dcd	6, 8, 17
	dcd	8, 9, 1
	
;doan code
	area doanCode, code, readonly
		entry
		
bdDoanCode
;SoPhanTu equ	10 ;khai bao hang so
SoPhanTuMaTran equ	9 ;khai bao hang so
	; ;Bai 1: Tinh tong cac so trong 1 chuoi so
	; ; input:
	; ;	- Chuoi so duoc chua trong bo nho. Vi du: arMangSo4
	; ; output:
	; ;	- R0: chua tong
	; ; Thuc hien:
	; ;	- R1: chua so phan tu cua chuoi
	; ;	- R2: chua chi so cua phan tu hien tai
	; ;	- R3: chua dia chi cua phan tu hien tai
	; ;	- R4: chua gia tri cua phan tu hien tai
	; ;--------------------------------------------------------
	; mov R0, #0
	; ldr	R1, =SoPhanTu ;nap gia tri cua hang so vao R1
	; mov	R2, #1
	; ldr	R3, =arMangSo4 ;nap dia chi cua vung nho arMangSo4 vao R3
	
; LapTinhTong
	; ldr	R4, [R3] ;nap gia tri (chua trong vung nho co dia chi R3) vao R4
	; add	R0, R4
	
	; add	R2, #1
	; add R3, #4
	; cmp R2, R1
	; ble	LapTinhTong
	; ; ket thuc lap, tong chua trong R0
	;------------------------------------------------------
	
	; Bai 2.6: Tim tong, min, max tren cheo chinh, cheo phu
	; Input: ma tran trong bo nho
	; Ouput: 
		; - R0: chua tong cac phan tu tren cheo chinh
		; - R1: chua min
		; - R2: chua max
	; Thuc hien:
		; - R3: so phan tu tren 1 dong
		; - R4: bien chay - i
		; - R5: dia chi cua phan tu hien tai
		; - R7: chua gia tri cua phan tu hien tai
	; ---------------------------------------------------	
	mov R0, #0
	mov R3, #3
	mov	R4, #0	
LapTinhTongTrenCheoChinh
	ldr	R5, =arMatran
	;chi so cua phan tu tren cheo chinh a[i,i]=i*SoPTtrenDong+i 
	; R6 chua chi so hien tai
	mov R6, R4
	mul	R6, R3
	add R6, R4
	;tinh dia chi offset tu chi so
	mov R8, #4
	mul R6, R8
	add R5, R6	
	;nap phan tu vao thanh ghi
	ldr R7, [R5]	
	;cong
	add R0, R7	
	;tang bien dem va so sanh
	add R4, #1
	cmp R4, R3
	blt	LapTinhTongTrenCheoChinh
	;ket thuc: R0 = tong cac phan tu tren cheo chinh
	
	end