  .text 
  .global _start
  .extern printf
  
_start: 
/* do something first 
if (a + b == 14)
    c = 3;
else
    c = -2;*/
    ADR X20, a
    ADR X21, _b 
    ADR X22, c
    LDUR X24,[X20, #0]
    LDUR X25,[X21, #0]

    ADD X23, X24, X25
    SUB X23, X23, #14
    CBNZ X23, ELSE
    MOV X19, #3
    STUR X19,[X22,#0]
    b EXIT
ELSE:
    MOV X19, #-2
    STUR X19, [X22,#0]
EXIT:
    ADR X0, msg
    LDUR X1, [X22, #0]
    bl printf
    mov x0, #0     
    mov w8, #93  
    svc #0
.data
    /* initialized data */
    msg: .ascii "c is %d\n\0"
    a: .quad 3
    _b: .quad 14
    c: .quad
.end
