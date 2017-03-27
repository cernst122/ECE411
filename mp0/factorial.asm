ORIGIN 4x0000
; Simple  factorial program for MP0
; Results are stored in R2
; Factorial number is stored in Iter

SEGMENT  CodeSegment:
; Intialize Registers
LDR R1, R0, ITER
LDR R5, R0, NONE
LDR R2, R0, ONE

LOOP:
	AND R3, R3, R0
	ADD R3, R3, R1
	AND R4, R4, R0

	; Multiply values
	MULTIPLY:
		ADD R4, R4, R2
		ADD R3, R3, R5
		BRp MULTIPLY

	; Store result in R2 and loop
	AND R2, R2, R0
	ADD R2, R2, R4
	ADD R1, R1, R5
	BRp LOOP
	; If we are done, then halt
	BRnzp HALT

HALT:
	BRnzp HALT

; CHANGE THIS FOR NUMBER TO CALCULATE
ITER:   DATA2 4x0005
ONE:    DATA2 4x0001
NONE:   DATA2 4xFFFF
