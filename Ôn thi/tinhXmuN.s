	AREA RESET, DATA, READONLY
	   DCD 0x20001000
	   DCD Reset_Handler
X EQU 10
N EQU 5
	AREA MYCODE, CODE, READONLY

Reset_Handler
	MOV R0,#1;offset  , tich nen la 1
	LDR R1, =X; tro den dia chi X
	LDR R2, =N; tro den dia cho N
	MOV R3, #1;i chay

LOOP
	CMP R3, R2 ; so sanh i vs N
	BGT STOP;neu lon hon thi dung lai
	MUL R0,R1; nhan tich vs X
	ADD R2,#1; tang bien i
	B LOOP
STOP
	B STOP	

	END	