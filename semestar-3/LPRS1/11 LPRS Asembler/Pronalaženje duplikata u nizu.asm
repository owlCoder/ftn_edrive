/*
Pronalaženje duplikata u nizu
Napisati program u asemblerskom jeziku koji proverava da li u zadatom nizu od 10 elemenata ima duplikata.
Napraviti novi niz sa duplikatima i upisati ih u memoriju za podatke nakon prvog niza (na adresu 11)
*/
/*
// .data
short N = 10;
short a[10] = { 65, 1, 6, -1, 6, 3, 5, -2, 65, 3};
short b[10];
// .text
short k = 0;
for (short i = 0; i < N; i++)
for(short j = i + 1; j < N; j++)
 if(a[i] == a[j])
{
b[k] = a[i];
k++;
}

    R0 - i - index niza
    R1 - j - index sledećeg elementa
    R2 - N = 10
    R3 - k - index novog niza
    R4 - short* a - adresa niza
    R5 - short* b - adresa novog niza

*/
.data
    10 // N = 10
    65, 1, 6, -1, 6, 3, 5, -2, 65, 3
.text

begin:
    ld R2, R0 // R2 = N = 10
    inc R4, R0 // R4 = short* a = 1
    add R5, R4, R2 // R5 = short* b = 11
    // sub R3, R3, R3 // k = 0

for_i_init:
// sub R0, R0, R0 // i = 0

for_i_test:
    sub R7, R0, R2 // i < N
    jmpz for_i_end

for_i_body:
for_j_init:
    inc R1, R0 // R1 = j = i + 1

for_j_test:
    sub R7, R1, R2 // j < N
    jmpz for_j_end

for_j_body:
    add R6, R4, R0
    ld R6, R6 // R6 = a[i]
    add R7, R4, R1
    ld R7, R7 // R7 = a[j]
    sub R7, R7, R6 // if a[i] == a[j]
    jmpz DUPLIKAT
    jmpnz for_j_inc

DUPLIKAT:
    add R7, R5, R3
    st R6, R7 // mem[k] = a[i]
    inc R3, R3 // k++

for_j_inc:
    inc R1, R1 // j++
    jmp for_j_test

for_j_end:
for_i_inc:
    inc R0, R0 // i++
    jmp for_i_test

for_i_end:
end:
    jmp end // Beskonačna petlja