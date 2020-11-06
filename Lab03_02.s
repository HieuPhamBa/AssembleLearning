 ;;Cong so nguyen to tren ma tran

	;AREA RESET, DATA, READONLY
		;DCD 0x20000000
		;DCD Main

;MaTran
	;DCD 3, 4, 5
	;DCD 4, 17, 16
	;DCD 5, 18, 16

;ChieuDaiMT DCD 9

	;AREA MainSource, CODE, READONLY
		;ENTRY
	


;Main
	;MOV R1, #23
	;MOV R2, #5
	
	;MOV R8, R1

	;BL TongSoNTTrongMaTran
	;B KetThuc 
	 
;; Tong cac so nguyen to trong ma tran, ket qua qua luu R5
;TongSoNTTrongMaTran PROC
	;MOV R5, #0 ; Tong cac so nguyen to
	;LDR R4, =MaTran ; Con tro dau ma tran
	;MOV R3, #0 ; Index tu 0 -> Chieu dai cua ma tran
	;MOV R2, #0 ; Dia chi offset so voi phan tu dau tien
	
;LapCong 

	;CMP R3, #8
	;BGT KetThucTongMT
	
	;LDR R1, [R4, R2]
	
	;;Kiem tra R8 co phai SNT
	;MOV R8, R1
	
	;CMP R8, #2
	;BLT KhongPhaiSoNguyenTo
	
	;MOV R6, #2

;LapChiaHet
	;CMP R6, R8
	;BGE LaSoNguyenTo
	
	;MOV R10, R8
	;MOV R9, R6

	;;R10 = R10 % R9
;ChiaDu
	;CMP R10, R9
	;BLT KetThucChiaDu

;LapTru
	;SUB R10, R9
	;CMP R10, R9
	;BGE LapTru
	
;KetThucChiaDu
	;;END R10 = R10 % R9
	
	;CMP R10, #0
	;BEQ KhongPhaiSoNguyenTo
	
	;ADD R6, #1
	;B LapChiaHet
	
	
;LaSoNguyenTo
	;MOV R7, #1
	;B KetThucSoNguyenTo
	
;KhongPhaiSoNguyenTo
	;MOV R7, #0

;KetThucSoNguyenTo
	;ADD R2, #4
	;ADD R3, #1
	
	;CMP R7, #0
	;BEQ LapCong

;CongSoNguyenTo
	;ADD R5, R1
	;B LapCong
	

;KetThucTongMT
	;BX LR
	;ENDP

;KetThuc 
	;END