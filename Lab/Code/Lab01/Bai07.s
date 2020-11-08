;; Tinh BCLN
;; Giai thuat eculid
;; while(a != b)
;;{
;;	if (a > b)
;;		a = a - b
;;	else if (a < b)
;;		b = b - a
;;}

	;AREA RESET, DATA, READONLY
		;DCD 0x20000000
		;DCD MAIN
		
;Num1 DCD 18
;Num2 DCD 16
	
	;AREA MAINSOURCE, CODE, READONLY
		;ENTRY
	
;; ket qua luu o R0	
;MAIN 
	;LDR R0, Num1 ; gan phan tu number 1, R0 = 18
	;LDR R1, Num2 ; gan phan tu number 2, R1 = 16

;VALIDATE
	;CMP R0, #0
	;BEL STOP
	
	;CMP R1, #0
	;BEL STOP
	
;LOOP
	;CMP R0, R1
	;BEQ STOP
	;BGT NEXT1
	;BLT NEXT2

;NEXT1
	;SUB R0, R1 ; R0 = R0 - R1
	;B LOOP
	
;NEXT2 
	;SUB R1, R0 ; R1 = R1 - R0
	;B LOOP

;STOP B STOP

	;END
