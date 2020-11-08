;; Tong cac so trong ma tran
;; ma tran: 4, 5 => Tong chan = 12, tong le = 8
;; 		   3, 8
;;---------------------------------------------

	;AREA RESET, DATA, READONLY
		;DCD 0x20000000 ; khi bao stack 
		;DCD MAIN
	
;MATRAN 
	;DCD 1, 2, 3
	;DCD 10, 5, 20
	;DCD 4, 6, 0

;SOLUONGPTU EQU 9

	;AREA MAINSOURCE, CODE, READONLY
		;ENTRY
	
;; R0 tong cac so chan
;; R1 tong cac so le
;; R2 la con tro dau mang
;; R3 so luong phan tu
;; R4 phan tu offset, phan tu duoc load ra
;MAIN
	;MOV R0, #0
	;MOV R1, #0
	;MOV R4, #0
	
	;LDR R2, =MATRAN
	;LDR R3, =SOLUONGPTU
	
;LOOP
	;CMP R3, #0
	;BEQ STOP

	;LDR R4, [R2], #4 ; R4 = R2, dia chi R2 = dia chi R2 + 4
	;SUB R3, #1
	
	;BL KIEMTRACHANLE
	
	;CMP	R6, #1
	;BEQ TONGSOCHAN
	;BNE TONGSOLE

	;B LOOP

;TONGSOLE
	;ADD R1, R4 ; R1 = R1 + R4
	;B LOOP

;TONGSOCHAN
	;ADD R0, R4 ; R0 = R0 + R4
	;B LOOP
	
;; Ham kiem tra chan le 
;; Ket qua luu R6 (1 la het, 0 ;a ko)
;KIEMTRACHANLE PROC
	;MOV R6, #0
	;MOV R5, #2
	
	;SDIV R8, R4, R5 ; R8 = R4 / 2
	;MLS R9, R8, R5, R4 ; R9 = R8 * R5 - R4
	
	;CMP R9, #0
	;BEQ SOCHAN
	
	;B KETTHUCHAM

;SOCHAN
	;MOV R6, #1
	;B KETTHUCHAM
	
;KETTHUCHAM
	;BX LR
	;ENDP
	
;STOP B STOP
	;END
