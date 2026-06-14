/// 04 Zadatak 01
#include <stdio.h>
#include <stdlib.h>

char *konverzija(int x)
{
    char *binarni = (char *) malloc(4 * sizeof(int) + 1);
    int n = 4 * sizeof(int) - 1;

    binarni[0] = x < 0 ? '1' : '0';

    for(int i = n; i > 0; i--)
    {
        if(x % 2 == 0)
            binarni[i] = '0';
        else
            binarni[i] = '1';

        x /= 2;
    }

    binarni[n + 1] = '\0';

    return binarni;
}

int main(void)
{
    int x;

    printf("Unesite broj: ");
    scanf("%d", &x);

    char *bin = konverzija(x);
    printf("DEK: %d --> BIN: %s\n", x, bin);
    free(bin);

    return 0;
}