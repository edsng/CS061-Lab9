; Name & Email must be EXACTLY as in Gradescope roster!
; Name: Edward Song
; Email: esong029@ucr.edu
; 
; Assignment name: Lab 9
; Lab section: 023
; TA: James Luo
; 
; I hereby certify that I have not received assistance on this assignment,
; or used code, from ANY outside source other than the instruction team
; (apart from what was provided in the starter file).
;
;=================================================================================
.orig x3000

;=================================================
;Instructions
LD R6, STACK_ADDR

;This stack lab computes the polish notation of a set of calls
;push_val(4) pushes the value 4 onto the stack [4]
LD R4, SUB_PUSH_VAL_PTR
LD R0, DEC_4
jsrr R4

;push_val(3) pushes the value 3 onto the stack [4,3]
LD R4, SUB_PUSH_VAL_PTR
LD R0, DEC_3
jsrr R4

;push_val(2) pushes the value 2 onto the stack [4,3,2]
LD R4, SUB_PUSH_VAL_PTR
LD R0, DEC_2
jsrr R4


;add_val() pop 3,2 and push the result of 3+2 onto the stack [4,5]
LD R4, SUB_ADD_VAL_PTR
jsrr R4


;add_val() pop 4,5 and push the result of 4+5 onto the stack[9]
LD R4, SUB_ADD_VAL_PTR
jsrr R4


;move the top value of the stack into r4
LDR R4, R6, #0
ADD R6, R6, #1

HALT
;=================================================
;Local Data
SUB_PUSH_VAL_PTR .FILL x3400
SUB_ADD_VAL_PTR .FILL x3800
STACK_ADDR .FILL xFE00
DEC_4 .FILL #4
DEC_3 .FILL #3
DEC_2 .FILL #2

.END


;---------------------------------------------------------------------------------
; PUSH_VAL - push_val(int val) - pushes a value onto the stack
;
; parameter: R0 - input value
;
; returns: nothing
;---------------------------------------------------------------------------------
.orig x3400
PUSH_VAL
ADD R6, R6, #-1
STR R0, R6, #0

RET
.END


;---------------------------------------------------------------------------------
; ADD_VAL - add_val() - pops two values from the top of the stack and pushes the result of adding the poppped value into the stack
;
; returns: nothing
;---------------------------------------------------------------------------------
.orig x3800 ;; 
ADD_VAL
;Loads value of top of stack into R1
LDR R1, R6, #0
ADD R6, R6, #1

;Loads value of one before top of stack into R2
LDR R2, R6, #0
ADD R6, R6, #1

ADD R1, R1, R2

;Stores R1 into the stack
ADD R6, R6, #-1
STR R1, R6, #0

RET
.END


;---------------------------------------------------------------------------------
.orig x4200 ;;data you might need

.END


