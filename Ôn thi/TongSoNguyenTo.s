;; Tong so nguyen to trong day 
	
	;AREA RESET, DATA, READONLY
		;DCD 0x20000000
		;DCD START

;MATRAN
	;DCD 2, 3, 4
	;DCD 8, 7, 9
	;DCD 10, 11, 12
;TONGSOPTU DCD 9

	;AREA MAINSOURCE, CODE, READONLY
		;ENTRY

;START

;; R0 tong cac so nguyen to
;; R1 phan tu dau mang
;; R2 do dai mang
;; R3 phan tu offset, phan tu dc load ra
;MAIN PROC 
	;MOV R0, #0
	;MOV R3, #0
	
	;LDR R1, =MATRAN
	;LDR R2, TONGSOPTU
	
;LOOP
	;CMP R2, #0
	;BEQ KETTHUCHAMMAIN

	;LDR R3, [R1], #4	; R3 = R1, dia chi R1 =  dia chi R1 + 4
	;SUB R2, #1
	
	;BL KIEMTRASONGUYENTO
	
	;CMP R7, #1
	;BEQ CONGSONGUYENTO
	
	;B LOOP

;CONGSONGUYENTO
	;ADD R0, R3
	;B LOOP
	
;KETTHUCHAMMAIN
	;B STOP
	;ENDP

;; Kiem tra so nguyen so luu thanh R3, ket qua luu thanh R7
;; Chia phan tu trong R1 tu 1->R3-1
;; R7 la phan tu luu 1 -> R3, 1
;KIEMTRASONGUYENTO PROC
	;CMP R3, #0       ; Neu R3 = 0 (0 khong la so nguyen to)
	;BEL KHONGLASONT  
	
	;CMP R3, #2 		 ; Neu R3 <=2 (1, 2 la so nguyen to)
	;BLT LASONT
	
	;MOV R4, R3 		 ; Gan R4 = R3

;; lap N-1 den 2
;LAPCHIA
	;CMP R4, #2 		 ; So sanh R4 voi 2
	;BLE LASONT       ; Neu R4 <= 2 => R4 khong chia het so nao tu 2 => n-1, R4 la so nguyen to
						
	;SUB R4, #1

;;Kiem tra phan du = 0?
	;SDIV R5, R3, R4	 ; R5 = R3 / R4
	;MLS R6, R5, R4, R3 ; R6 = R5 * R4 - R3
	
	;CMP R6, #0
	;BEQ KHONGLASONT
	
	;B LAPCHIA
	
;KHONGLASONT 
	;MOV R7, 0
	;B KETTHUCKIEMTRASNT
	
;LASONT 
	;MOV R7, 1
	;B KETTHUCKIEMTRASNT
	
;KETTHUCKIEMTRASNT
	;BX LR
	;ENDP

;STOP B STOP

	;END
