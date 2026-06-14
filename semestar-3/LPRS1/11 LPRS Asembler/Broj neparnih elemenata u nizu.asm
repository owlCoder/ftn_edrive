/*
short isEven(short el) {
    return (el % 2 != 0 ? 1 : 0);
}

void main() {
    short* p_result = 0x050;
    short* p_done = 0x080;
    short N = 20;
    short a[] = {20590, 25312, 17168, 14675, 11588,
                 12132, 13177, 30854, 2690, 8241,
                 23335, 1754, 29835, 19197, 22232, 
                 11977, 31980, 19601, 3786, 29568
                };

    // prebroj neparne brojeve u nizu
    short cnt = 0;
    for(short i = 0; i != N; i++) {
        short elem_a = a[i];

        if(isEven(elem_a))
            cnt++;
    }

    *p_result = cnt;
    *p_done = 1;
}
*/
.data
    0x050
    0x080
    20
    20590, 25312, 17168, 14675, 11588,
    12132, 13177, 30854, 2690, 8241,
    23335, 1754, 29835, 19197, 22232, 
    11977, 31980, 19601, 3786, 29568
.text
    /*  
        R1 - N
        R2 - i
        R3 - cnt
        R4 - tmp
        R5 - mask
        R6 - *p_result
        R7 - *p_done
    */
main:
    inc R0, R0  /* mem[1]      */
    inc R0, R0  /* mem[2]      */

    ld R1, R0   /* R1 = N = 20 */

    inc R0, R0  /* mem[3]      */

    /* Indeks 23 je kraj niza a, indeks 3 je početak niza a */
    mov R2, R0  /* R2 = 20     */

    inc R5, R5  /* bitmask 0x1 */
    inc R1, R1  /* 21          */
    inc R1, R1  /* 22          */
    inc R1, R1  /* 23          */
    
for:
    sub R4, R1, R2
    jmpz upis_rezultata

    ld R4, R2  /* a[i] u R4   */

    /* ako je broj neparan u R4 biće rezultat 1 
       ako je rezultat 0 onda je broj paran
    */
    and R4, R4, R5
    jmpnz neparan

    inc R2, R2  /* i++   */
    jmp for

neparan:
    inc R3, R3  /* cnt++ */
    inc R2, R2  /* i++   */
    jmp for

upis_rezultata:
    sub R0, R0, R0  /* R0 = 0 */
    ld  R6, R0      /* 0x0100 */

    inc R0, R0
    ld  R7, R0      /* 0x0200 */

    st  R3, R6      /* 0x0100 = cnt */
    st  R0, R7      /* 0x0200 = 1   */

end:
    jmp end
