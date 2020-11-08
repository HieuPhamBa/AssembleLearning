	AREA RESET, DATA, READONLY
		 DCD 0x20001000
		 DCD Reset_Handler
N EQU 10;gan hang so 

	AREA MYCODE, CODE, READONLY
		 ENTRY
Reset_Handler
	MOV R0,#1; offset, luu giai thua  , giai thua cua 0 la 1
	LDR R1,=N; tro den dia chi n
	MOV R2,#1;bien chay i

LOOP
	MUL R0,R2
	ADD R2,#1;
	CMP R2, R1
	BLE LOOP
STOP
	B STOP
	END