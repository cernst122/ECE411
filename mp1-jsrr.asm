ORIGIN 4x0000 

SEGMENT  CodeSegment:
;; Going to do R4 = R1 + R3, but using NOT
;; This is to test the functionality of the JSRR function.
;; NOTE: This is slightly different from the subraction example
;; This code does the negate operation twice (reverting the number to its previous state)
;; In addition, the JSRR function is used to essentailly "RET" from the NEGATE function

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
	;; Here is where it's a bit different.
	;; Since we stored the return address in R6, we can call
	;; JSRR here and we should go back to our main body of code
	;; The only side effect is that R7 will now be essentially garbage
	;; But we don't jump anywhere else, so it is fine to do this
	JSRR R6

NEGATEB:
	NOT R0, R0
	ADD R0, R0, 1
	RET
