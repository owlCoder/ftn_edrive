/// 03 Zadatak 03
#include <stdio.h>
#include <stdlib.h>

void copyLEToLE(int x, void *copy)
{
    for(unsigned i = 0; i < sizeof(x); i++)
        *((char *) copy + i) = *((char *) &x + i);
}

void copyLEToBE(int x, void *copy)
{
    for(unsigned i = 0; i < sizeof(x); i++)
        *((char *) copy + i) = *((char *) &x + sizeof(x) - i - 1);
}

int Count(char* buffer)
{
    int brojac = 0;
    char LB = *buffer;
    short N = *(short *)(buffer + sizeof(char));
    double *brojevi = (double *)(buffer + sizeof(short) + sizeof(char));

    // Vratiti na Little Endian
    if(LB == 'B') {
        for(int i = 0; i < N; i++) {
            int br1 = brojevi[i];
            int br2 = brojevi[i + N];
            copyLEToBE(br1, &brojevi[i]);
            copyLEToBE(br2, &brojevi[i + N]);
        }
    }

    // Pronaci koliko je vecih brojeva u prvom nizu
    for(int i = 0; i < N; i++)
        if(brojevi[i] > brojevi[i + N])
           ++brojac;

    return brojac;
}

int main(void)
{
    short N;
    do {
        printf("Unesite broj elemenata niza: ");
        scanf("%hd", &N);
    } while(N <= 1);

    double *niz1 = (double *)malloc(sizeof(double) * N);
    double *niz2 = (double *)malloc(sizeof(double) * N);

    printf("\nNiz1: ");
    for(int i = 0; i < N; i++)
        scanf("%lf", (niz1 + i));

     printf("Niz2: ");
    for(int i = 0; i < N; i++)
        scanf("%lf", (niz2 + i));

    char *buffer = (char *)malloc(sizeof(char) + (short) + 2 * N * sizeof(double));
    char LB;

     do {
        printf("Unesite L ili B: ");
        scanf(" %c", &LB);
    } while(LB != 'L' && LB != 'B');

    buffer[0] = LB;
    *(short *)(buffer + 1) = N;
    double *brojevi = (double *)(buffer + 3);

    if(LB == 'B') {
        for(int i = 0; i < N; i++) {
            int br1 = niz1[i];
            int br2 = niz2[i];
            copyLEToBE(br1, &niz1[i]);
            copyLEToBE(br2, &niz2[i]);
        }
    }
    else {
        for(int i = 0; i < N; i++) {
            int br1 = niz1[i];
            int br2 = niz2[i];
            copyLEToLE(br1, &niz1[i]);
            copyLEToLE(br2, &niz2[i]);
        }
    }

    // Upis u buffer elemenata niza
    int j = 0;
    for(int i = 0; i < N; i++)
        brojevi[j++] = niz1[i];

    for(int i = 0; i < N; i++)
        brojevi[j++] = niz2[i];

    printf("\nVecih elemenata ima: %d\n", Count(buffer));

    free(niz1);
    free(niz2);
    free(buffer);

    return 0;
}
