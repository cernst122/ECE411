ORIGIN 4x0000 

SEGMENT  CodeSegment:
;; Going to do R4 = R1 + R3, but using NOT
;; This is to test the functionality of the JSR function.
;; NOTE: This is slightly different from the subraction example
;; This code does the negate operation twice (reverting the number to its previous state)
;; This code tests the ablity of JSR to be called from within a function.

;; Load initital Values (R1 = 7, R3, = 2, so at the end R4 = 9)
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
	;; Save R7!
	AND R6, R6, 0
	ADD R6, R7, 0
	JSR NEGATEB
	;; Restore R7
	AND R7, R7, 0
	ADD R7, R6, 0
	RET

NEGATEB:
	NOT R0, R0
	ADD R0, R0, 1
	RET
