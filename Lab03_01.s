;; So nguyen to 

	;AREA RESET, DATA, READONLY
		;DCD 0x20000000
		;DCD Main
	
	;AREA MainSource, CODE, READONLY
		;ENTRY
	
;Main
	;MOV R1, #23
	;MOV R2, #5
	
	;MOV R8, R1

	;BL SoNguyenTo
	;B KetThuc 
	
;; Ham kiem tra so trong thanh ghi R8 co phai so nguyen to khong?
;; Luu ket qua thanh ghi R7
;SoNguyenTo PROC 
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
	;BX LR
	;ENDP

;KetThuc B KetThuc
	;END