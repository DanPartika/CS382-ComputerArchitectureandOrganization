  .text 
  .global _start
  .extern printf
  
_start: 
/* do something first
 Write a program that adds the digits of your CWID number and prints the result. */
MOV X9, #0
ADR X10, CWID
MOV X11, #8
    
Loop:
    LDUR X13,[X10,#0]
    ADD X9, X9, X13
    ADD X10,X10,#8
    SUB X11,X11,#1
    CBNZ X11, Loop

EXIT:
    ADR X0, msg
    MOV X1, X9
    bl printf
    mov x0, #0     
    mov w8, #93  
    svc #0
    
.data
    /* initialized data */
    msg: .ascii "result from adding all integers from CWID is %d\n\0"
    CWID: .quad 1,0,4,6,5,8,7,2
.end
