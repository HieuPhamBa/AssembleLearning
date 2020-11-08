;; Tong ma tran cac so chia het cho 5
;; 5, 10
;; 6, 1 => Tong = 15

	;AREA RESET, DATA, READONLY
		;DCD 0x20000000	  ; DCD gia tri nguyen $ byte, 0x200000000 gia tri khoi dau stack
		;DCD MAIN		  ; dau la ham chinh

;MATRAN 
	;DCD 2, 5, 7, 8
	;DCD 3, -10, 6, 9
	;DCD 5, 6, 8, 15

;SOLUONGPHANTU EQU 12

	;AREA MAINSOURCE, CODE, READONLY
		;ENTRY

;; dau tien duyet lan luot ma tran, tinh tong cac so chia 5.
;; tong se luu vao R0
;; dau mang se luu vao R1
;; tong so luong phan tu R2
;; phan tu load tu offset luu vao R3
;MAIN 
	;MOV R0, #0
	;MOV R3, #0

	;LDR R1, =MATRAN
	;LDR R2, =SOLUONGPHANTU
	
;LOOP
	;CMP R2, #0
	;BEQ STOP

	;LDR R3, [R1], #4; R3 = gia tri cua R1, dia chi cua R1 = dia chi R1 + 4
	;SUB R2, #1

	;BL KIEMTRA
	
	;CMP R6, #1
	;BEQ TONGSOCHIAHETCHO5

	;B LOOP

;TONGSOCHIAHETCHO5
	;ADD R0, R3
	;B LOOP

;; Kiem tra phan tu trong R3 chia het cho 5 hay khong
;; Ket qua luu thanh R6 ( 1 la co, 0 la ko chia het )
;KIEMTRA	PROC
	;MOV R6, #0
	;MOV R7, #5

	;SDIV R4, R3, R7 ; R4 = R3 / 5
	;MLS R5, R4, R7, R3	; R5 = R4 * 5 - R3

	;CMP R5, #0
	;BEQ CHIAHETCHO5
	;B EXIT

;CHIAHETCHO5
	;MOV R6, #1
 
;EXIT
	;BX LR ; Return 
	;ENDP

;STOP B STOP

	;END
	