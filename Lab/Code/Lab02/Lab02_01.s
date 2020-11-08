;; Tong cac phan tu trong chuoi
	;AREA RESET, DATA, READONLY
		;DCD 0x20000000
		;DCD MAIN
	
;Chuoi DCD 4, 5, 6, 7, 8
;SoLuongPhanTu DCD 5

	;AREA MAINSOURCE, CODE, READONLY
		;ENTRY

;; Tong luu o R0
;; R1 se dau chuoi
;; R2 se la chieu dai Chuoi
;; R3 se la offset, phan tu duoc load ra
;MAIN 
	;MOV R0, #0
	;MOV R3, #0
	
	;LDR R1, =Chuoi
	;LDR R2, SoLuongPhanTu

;; Lap tu 1->n den khi ket thuc chieu dai cua chuoi
;LOOP
	;LDR R3, [R1], #4
	;ADD R0, R3
	
	;SUB R2, #1

	;CMP R2, 0
	;BEQ STOP
	
	;B LOOP
	
;STOP B STOP
	;END
	
	
	

