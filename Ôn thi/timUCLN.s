	 AREA RESET, DATA, READONLY
	 DCD 0x20001000
	 DCD Reset_Handler

A EQU 15
B EQU 10

	AREA MYCODE, CODE, READONLY

Reset_Handler
	LDR R1, =A; TRO DEN A
	LDR R2, =B; TRO DEN B
	MOV R3, #0; bien temp 

TimUCLN 	
	B	phanDu
tiep	
	MOV R3, R1   ; gan temp = phan du
	MOV R1, R2
	MOV R2, R3
	CMP R2, #0
	BNE TimUCLN	
	B STOP
	
phanDu
	SUB R1, R2
	CMP R1, R2
	BHS phanDu
	B	tiep
STOP
	B STOP
	END