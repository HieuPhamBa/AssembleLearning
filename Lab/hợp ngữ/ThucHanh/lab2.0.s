	;doan du lieu
	area RESET, data, readwrite
		dcd 0x20001000
		dcd diemBDCode
; khai bao cac vung nho chua chuoi so, ma tran, v.v.
arNums	dcd 1, 2, -3, 4, 5, 9, 8, -6, 1, 6 ;moi phan tu 4byte
	;arNums = dia chi cua byte dau tien cua phan tu dau tien

	;cac cach khai bao va truy cap khac:
arNums1	dcb 1, 2, -3, 4, 5, 9, 8, -6, 1, 6 ;moi phan tu 1byte
arNums2	dcw 1, 2, -3, 4, 5, 9, 8, -6, 1, 6 ;moi phan tu 2byte
;arNums8	dcq 1, 2, -3, 4, 5, 9, 8, -6, 1, 6 ;moi phan tu 8byte

	;doan code
	area doanCode, code, readonly
		entry
		
		export diemBDCode
diemBDCode
MAX	equ	10

	;Bai 1: Tinh tong cac so trong chuoi so
	; input: 
	;	- chuoi so: arNums
	; output:
	;	- R0: chua tong cac so trong chuoi
	; thuc thi:
	;	- R1: chua dia chi cua phan tu hien tai
	;	- R4: chua gia tri cua phan tu hien tai
	;	- R2: chua chi so cua phan tu hien tai
	;	- R3: chua tong so phan tu	
	;----------------------------------------
	mov	R0, #0
	mov R2, #0
	ldr	R1, =arNums ;nap dia chi vung nho arNums vao R1
	ldr	R3, =MAX ;nap gia tri hang MAX vao R3
	
LapTinhTong
	ldr	R4, [R1] ;nap gia tri chua trong vung nho co dia chi
				; chua trong R1 vao R4
	add R0, R4
	
	add R1, #4 ;tang dia chia
	add	R2, #1 ;tang chi so cua phan tu
	
	cmp R2, R3
	blt	LapTinhTong

	nop
	end