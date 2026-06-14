/*
// .data
short* p_result = 0x1A;
short* p_done = 0x20;
short N = 5;
short a[5] = {-1, -2, -3, -4, 6};
*/
.data
    0x1A
    0x20
    5
    -1, -2, -3, -4, 6
/*
// .text
    short res = 0;
    short pow = 0;
    pow = 2ᶺN;
    for (short i = 0; i<N; i++)
    {
        res += a[i];
    }
    res += pow;
    res /= 4;
    *p_result = res;
    *p_done = 1;
*/
.text
    ld R1, R0       /* R1 = 0x1A */
    inc R0, R0      /* mem[1]    */

    ld R2, R0       /* R2 = 0x20 */
    inc R0, R0      /* mem[2]    */

    ld R3, R0       /* R3 = 5    */

    sub R5, R5, R5  /* R5 = 0    */
    mov R5, R0      /* R5 = 2    */
main:
    /*  R1 - p_result = 0x1A
        R2 - p_done   = 0x20
        R3 - N = 5
        R4 - N copy
        R5 - pow
        R6 - res
        R7 - slobodan
    */
    sub R4, R4, R4   /* R4 = 0     */
    inc R4, R4       /* R4 = 1     */

pow:
    sub R7, R4, R3   /* N copy <= N */
    jmpz for_init

    /* 2 ^ N, N = 5 => 2^5 = 32 */
    add R5, R5, R5  /* R5 = 2 + 2, 4 + 4, ...  */

    dec R3, R3      /* N copy -- */
    jmp pow
    /* MOZE i ASHL --> MNOZENJE SA 2 je shift ulevo */
    /* TAkoDJE MOZE se dodati i R2 jer je u njemu 0x20 tj 32 ! */

for_init:
    sub R4, R4, R4  /* R4 = i = 0 */
    sub R0, R0, R0  /* R0 = 0     */
    sub R6, R6, R6  /* R6 = 0     */
    inc R0, R0 
    inc R0, R0      /* mem[2]     */
    ld  R3, R0      /* R3 = N = 5 */
    inc R0, R0      /* a[0]       */
    jmp for_body

for_body:
    sub R7, R4, R3   /* i < N     */
    jmpz mem_write

    ld R7, R0        /* R7 = a[i] */
    add R6, R6, R7   /* res = res + a[i] */

    inc R4, R4       /* i--       */
    inc R0, R0       /* a++ */
    jmp for_body

mem_write:
    /*
        res += pow;
        res /= 4;
        *p_result = res;
        *p_done = 1;
    */
    add R6, R6, R5  /* res = res + pow */
    ashr R6, R6     /* R6 /= 2 */
    ashr R6, R6     /* R6 /= 2 */

    st  R6, R1      /* 0x1A = res */
    mov R0, R6      /* R0 = R6 */

    sub R7, R7, R7
    inc R7, R7
    st  R7, R2      /* *p_done = 1 */
    jmp end

end:
    jmp end