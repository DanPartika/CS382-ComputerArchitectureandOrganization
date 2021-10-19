  .text 
  .global _start
  .extern printf
  
_start: 
/* do something first 
Write a program that adds all integers from 1 to 10 and prints the result.*/
    MOV X19, #1 /*num added */
    MOV X20, #11 /*sum */
    MOV X21, #0
    
Loop:
    ADD X21, X21, X19 # fdsf
    ADD X19, X19, #1
    SUB X22, X19, X20
    CBNZ X22, Loop

EXIT:
    ADR X0, msg
    MOV X1, X21
    bl printf

    mov x0, #0     
    mov w8, #93  
    svc #0
    
.data
    /* initialized data */
    msg: .ascii "result from adding all integers from 1 to 10 is %d\n\0"
.end
