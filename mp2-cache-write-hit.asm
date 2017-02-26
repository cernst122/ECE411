ORIGIN 0
SEGMENT CodeSegment:
;; Test writing directly to the cache on a hit

Start:
;; Grab Two memory values
AND R0, R0, R0
LEA R0, DSG
LDR R4, R0, G40
LDR R5, R0, G42

;; Modify them
ADD R4, R4, 1
ADD R5, R5, 1

;; This should write within the cache since we
;; have already loaded the information (hence a hit)
;; Storing the modififed values will ensure we have 
;; correctly done in cache writes
STR R4, R0, G40
STR R5, R0, G42

;; After writing the values in the cache, we can load them
;; back into registers to double check values
LDR R1, R0, G40
LDR R2, R0, G42

BRnzp Halt

Halt:   BRnzp Halt

SEGMENT DSG:
G40: DATA2 4x00C2;
G42: DATA2 4x0148;
G44: DATA2 4x1122;
G46: DATA2 4x3344;
G48: DATA2 4x5566;
G4A: DATA2 4x7788;
G4C: DATA2 4x99AA;
G4E: DATA2 4xBBCC;
