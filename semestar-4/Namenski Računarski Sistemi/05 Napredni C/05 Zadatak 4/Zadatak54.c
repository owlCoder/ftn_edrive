/// 05 Zadatak 04
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int Konverzija(char *binarni)
{
    int dekatni = 0, maska = 1, i = strlen(binarni) - 1;

    while(i >= 0)
    {
        if(binarni[i] == '1')
            dekatni |= maska;

        maska <<= 1;
        i--;
    }

    return dekatni;
}

int main(void)
{
    char binarni[33];

    printf("Unos binarnog broja\n>> ");
    scanf("%s", binarni);

    printf("\nDekadni broj\n>> %d\n", Konverzija(binarni));

    return 0;
}