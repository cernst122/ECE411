ORIGIN 4x0000 

SEGMENT  CodeSegment:
;; Going to do R4 = R1 - R3, but using NOT
;; This is to test the functionality of the JSR function.

;; Load initital Values (R1 = 7, R3, = 2, so at the end R4 = 5)
;; Also Clear Regs first
AND R0, R0, 0
AND R1, R1, 0
AND R3, R3, 0
AND R4, R4, 0

ADD R1, R1, 7
ADD R3, R3, 2

;; Move Arguments to R0 Register
ADD R0, R3, 0

;; Call Function
JSR NEGATE

;; Move return val to dest
AND R3, R3, 0
ADD R3, R0, 0

;; Do Subtraction
ADD R4, R1, R3

	BRnzp HALT

;; Loop forever
HALT:
	BRnzp HALT

;; Uses the two's compliment method to make a number negative
;; Input is R0, Output is R0
NEGATE:
	NOT R0, R0
	ADD R0, R0, 1
	RET
