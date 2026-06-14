.data
    0x1A            /* 26 decimal */
    0x20            /* 32 decimal */
    5
    -1, -2, -3, -4, 6

.text
    ld  R1, R0      /* R1 = 0x1A */
    inc R0, R0      /* mem[1]    */

    ld R2, R0       /* R2 = 0x20 */
    inc R0, R0      /* mem[2]    */

    ld R3, R0       /* R3 = 5    */

    mov R5, R2      /* R5 = 32   */

    inc R0, R0      /* RO = a[0] */
main:
    /*  R1 - p_result = 0x1A
        R2 - p_done   = 0x20
        R3 - N = 5
        R4 - i = 0
        R5 - pow
        R6 - res
        R7 - slobodan
    */

for:
    sub R7, R4, R3 
    jmpz mem_write

    ld  R7, R0     /* U R7 smesti vrednost a[i] */

    add R6, R6, R7 /* res = res + a[i] */

    inc R0, R0     /* sledeci element */
    inc R4, R4     /* i++ */
    jmp for
  
mem_write:
    add R6, R6, R5      /* res = res + pow */
    ashr R6, R6         /* res = res / 2   */
    ashr R6, R6         /* res = res / 2   */

    st  R6, R1          /* *p_result = res */

    sub R0, R0, R0     /* R0 = 0           */
    inc R0, R0         /* R0 = 1           */

    st  R0, R2         /* *p_done = 1      */

end:
    jmp end