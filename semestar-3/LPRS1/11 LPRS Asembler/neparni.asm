.data
    10   // m[0] - broj elemenata
    8    // m[1] - početak niza
    6
    3
    7
    5
    11
    8
    23
    1
    3
.text
    sub R5, R5, R5      // adresa za upis
    sub R0, R0, R0      // Za prolazak kroz niz
    sub R4, R4, R4      // bit maska
    sub R7, R7, R7      // neparni = 0
    ld  R3, R0          // R0 <= mem[0] - broj elemenata niza
begin:
    inc R5, R5          // Pozicioniran na '10'
    inc R5, R5          // Pozicioniran na '8'
    add R5, R5, R5      // Pozicija na 16
    dec R5, R5          // Pozicija 0xF --> 15  
    inc R4, R4          // bit maska 0x1
    ld R3, R0           // R3 = N = 10, prva vrednost u memoriji je broj elemenata
for:
    inc R0, R0          // R0 - adresa elementa niza iz memorije
    sub R2, R3, R0      // for(i = 0, i<10, i++)
    jmps endB           // ako je i > N , kraj
    ld R1, R0           // R1 = a[i]
    and R1, R1, R4      // AKO JE LSB == '1' --> neparni++
    jmpz for            // paran broj - ne brojimo ga
    jmpnz NEPARAN       // neparan broj - broji se
NEPARAN:
    inc R7, R7          // neparni++
    jmp for
endB:
    st R5, R7          // R7 u memoriju na lokaciji 0xF
    jmp end
end:
    jmp end            // Beskonačna petlja.
