/*
Obrtanje niza
Napisati program u asemblerskom jeziku koji obrće redosled brojeva u nizu od 10 elemenata. Voditi računa o
poziciji elemenata niza u memoriji za podatke!
// .data
short N = 10;
short a[10] = { 15, 12, 6, 33, 23, 76, 1, -5, 65, 7};
// .text
int j = N-1;
int tmp = 0;
for(int i=0; i<j; i++, j--)
{
    tmp = a[i];
    a[i] = a[j];
    a[j] = tmp;
}
*/

data
    10 // N = 10
    15, 12, 6, 33, 23, 76, 1, -5, 65, 7
.text
/*
R0 - i - index niza koji se čita od početka
R1 - j - index niza koji se čita od nazad
R2 - tmp_i
R3 - tmp_j
*/
for_init:
    ld R1, R0 // R1 = N = j = 10
    inc R0, R0 // R0 = short* a = 1

for_test:
    sub R7, R1, R0 // i<j
    jmps for_end

for_body:
    ld R2, R0 // tmp_i = a[i]
    ld R3, R1 // tmp_j = a[j]
    st R3, R0 // a[i] = tmp_j
    st R2, R1 // a[j] = tmp_i

for_inc:
    inc R0, R0 // i++
    dec R1, R1 // j--
    jmp for_test

for_end:
end:
    jmp end // Beskonačna petlja