/// 02 Zadatak 02
#include <stdio.h>
#include <stdlib.h>

int *CalculateMinMax(char *buffer)
{
    int *rezultat = (int *) malloc(2 * sizeof(int));
    short N = *((short *) buffer);

    rezultat[0] = *((int *)(buffer + sizeof(short)));
    rezultat[1] = *((int *)(buffer + sizeof(short)));

    for(short i = 1; i < N; i++)
    {
        int brojevi = *((int *)(buffer + sizeof(short) + i * sizeof(int)));
        if(brojevi < rezultat[0])
            rezultat[0] = brojevi;

        if(brojevi > rezultat[1])
            rezultat[1] = brojevi;
    }
    return rezultat;
}

int main(void)
{
    short N = 0;
    char *buffer = NULL;

    do
    {
        printf("\nUnesite N\n>> ");
        scanf("%hu", &N);
    } while(N <= 1);

    buffer = (char *) malloc(N * sizeof(int) + sizeof(short));
    *((short *)(buffer)) = N;

    printf("\nUnos niza\n>> ");
    for(int i = 0; i < N; i++)
        scanf("%d", ((int *)(buffer + sizeof(short) + i * sizeof(int))));

    int *rezultat = CalculateMinMax(buffer);
    printf("\nMin = %d, Max = %d\n", rezultat[0], rezultat[1]);

    free(rezultat);

    return 0;
}
