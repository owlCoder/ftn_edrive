/// 05 Zadatak 03
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char *Konverzija(int n)
{
    char binarni[33], *bin;
    int mask  = 1, indeks_poslednje_1 = 0;

    binarni[32] = '\0';

    for(int i = 0; i < 32; i++)
    {
        if( (n & mask) == 0)
            binarni[31 - i] = '0';
        else
        {
            binarni[31 - i] = '1';
            indeks_poslednje_1 = i;
        }
        mask <<= 1;
    }

    bin = (char *) malloc(indeks_poslednje_1 + 2);
    memcpy(bin, &binarni[31 - indeks_poslednje_1], indeks_poslednje_1 + 2);

    return bin;
}

int main(void)
{
    int n;
    char *binarni;

    printf("Unos broja\n>> ");
    scanf("%d", &n);

    binarni = Konverzija(n);
    printf("\nBinarno\n>> %s\n", binarni);

    free(binarni);

    return 0;
}