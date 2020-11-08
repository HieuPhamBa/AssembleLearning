 	AREA RESET, DATA, READONLY
		DCD 0X20001000
		DCD Reset_Handler
A EQU 12
B EQU 8
	
	AREA MYCODE, CODE, READONLY

Reset_Handler
 	LDR R1, =A
	LDR R2, =B
	MOV R3, #0 ; bien temp
	
TimUCLN 	
	B	phanDu
tiep	
	MOV R3, R1   ; gan temp = phan du
	MOV R1, R2
	MOV R2, R3
	CMP R2, #0
	BNE TimUCLN	; NEU KHONG BANG THI QUAY VE TINH UCLN
	B TinhBCNN
	
phanDu
	SUB R1, R2
	CMP R1, R2
	BHS phanDu
	B	tiep

TinhBCNN
	LDR R4, =A   ; lay lai gia tri bien A, NEU K LAY LAI THI SE BI XUNG DOT
	LDR R5, =B	; lay lai gia tri bien B
	MUL R6, R4, R5	; R6 = R4 x R5
	SDIV R7, R6, R1	; R7 = R6/R1
	
STOP	
	B	STOP
	END