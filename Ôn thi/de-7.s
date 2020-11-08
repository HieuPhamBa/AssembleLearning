;DE 7
;1. TIM GIA TRI LON NHAN OR NHO NHAT CUA SO CHAN TRONG CHUOI SO
;2.	TINH TONG SNT TRONG 1 CHUOI

	AREA RESET, DATA, READONLY
	EXPORT _VECTOR
_VECTOR
	DCD 0x20001000
	DCD RESET_HANDLER
	
	
	AREA MYDATA, DATA, READONLY
ARR DCD 1,2,3,4,5,3,6
	
	AREA MYCODE, CODE, READONLY
;CHIA HET CHO 2
TONG PROC
	LDR R5,[R0], #4
Div2
	MOV R6, #2
	UDIV R7, R5, R6
	MLS R8, R7, R6, R5
	CMP R8, #0
	BEQ XuLy
	B Exit
XuLy
	CMP R9, #0
	BEQ GanGT
	CMP R5, R1		;SS MAX
	BGT Max
SS
	CMP R5, R2		;SS MIN
	BLT Min
	B Exit
Max
	MOV R1, R5		;MAX = R5
	B SS
Min
	MOV R2, R5		;MIN = R5
	B Exit
GanGT
	MOV R2, R5		;GAN MIN
	MOV R1, R5		;GAN MAX
	ADD R9, R9, #1	;TANG CHECK
Exit
	ADD R4, R4, #1
	CMP R4, #7
	BLE TONG
	BX LR
		ENDP
		
;TONG CAC SO NGUYEN TO
TONGSNT PROC
	LDR R5, [R0], #4
	MOV R6, #1
Lap
	ADD R6, R6, #1
	CMP R6, R5
	BLT ChiaDu
	BGT Exit2
	BEQ XuLy2
ChiaDu
	UDIV R7, R5, R6
	MLS R8, R7, R6, R5
	CMP R8, #0
	BEQ Exit2
	B Lap
XuLy2
	ADD R3, R3, R5
	B Exit2
Exit2
	ADD R4, R4, #1
	CMP R4, #7
	BLE TONGSNT
	BX LR
		ENDP
		
RESET_HANDLER	
MAIN PROC
	LDR R0,=ARR
	MOV R1, #0		;MAX
	MOV R2, #0		;MIN
	MOV R9, #0		;CHECK
	MOV R4, #1		;TONG SNT
	BL TONG
	LDR R0,=ARR
	MOV R4, #1	
	BL TONGSNT
		ENDP
		END		;HamChoiqh
	
