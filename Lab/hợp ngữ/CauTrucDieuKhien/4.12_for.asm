; ;	tinh N!
; ;Khai bao doan du lieu
	; AREA    RESET, DATA, READONLY
		; DCD  0x20001000     
		; DCD  Start  
	; ;khai bao vung nho
; soN	DCD	5
; ;bien	DCD	123


; ;Khai bao doan ma lenh
	; AREA    DoanMa, CODE, READONLY
   	  ; ENTRY   	  
; Start
	; LDR	R1, soN ;nap hang vao R1
		
	; ;tinh tong
	; MOV	R0, #1	;chua tong
	; MOV	R3, #2	;bien chay
; lapCong
	; CMP	R3, R1
	; BGT	KetThuc
	; MUL R0, R3
	; ADD R3, #1
	; B 	lapCong
	
; KetThuc
; stop	B 	stop
	; END	