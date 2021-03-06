; CHUAN HOA XAU
	AREA RESET, DATA, READONLY
		DCD 0X20002000
		DCD MAIN
	AREA DATA1, DATA, READONLY
CR 0X00
DT1 DCB "    THIEN    MENH    ", CR; XAU KET THUC VOI KI TU NULL

	AREA DATA2, DATA, READWRITE
DT2 DCB CR; KETQUA PHAI LA "THIEN MENH"

	AREA HUU, CODE, READONLY
	ENTRY
MAIN
	LDR R0, =DT1
	LDR R1, =DT2
LOOP1; XOA CACH 
	LDRB R2, [R0], #1
	CMP R2, #32; SO SANH VOI DAU CACH
	BEQ LOOP1
	CMP R2, #CR
	BEQ STOP
	STRB R2, [R1], #1
	B LOOP2
LOOP2; DE 1 CACH GIUA
	LDRB R2, [R0], #1
	STRB R2, [R1], #1; CO KHA NANG LUU 1 DAU CACH O CUOI CHUOI
	CMP R2, #32; SO SANH VOI DAU CACH
	BEQ LOOP1
	B LOOP2
STOP; XOA CACH CUOI, THEM NULL VAO VA END
	SUB R1, #1
	MOV R2, #CR
	STRB R2, [R1]
	END