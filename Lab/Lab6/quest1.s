  .text 
  .global _start
  .extern printf
  
_start: 
/* do something first 
if (i == 4)
    f = g + 1;
else
    f = g - 2;*/
    ADR X20, f 
    ADR X21, i 
    ADR X22, g 
    LDUR X24,[X20, #0]
    LDUR X25,[X21, #0]
    LDUR X26,[X22,#0]
    SUB X23, X25, #4
    CBNZ X23, ELSE
    ADD X24, X26, #1
    STUR X24, [X20, #0]
    b EXIT
ELSE:
    SUB X24, X26, #2
    STUR X24, [X20, #0]
EXIT:

    ADR X0, msg
    LDUR X1, [X20, #0]
    bl printf
    mov x0, #0     
    mov w8, #93  
    svc #0
.data
    /* initialized data */
    msg: .ascii "f is %d\n\0"
    i: .int 4
    f: .int 0
    g: .int 5
.end
