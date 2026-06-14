/// 09 Zadatak 01
#include <stdio.h>
#include <stdlib.h>
#include "izraz.h"
#pragma pack(4)

void IspisiNiz(char *buffer)
{
    izraz *niz = (izraz *)(buffer + sizeof(int));
    for(int i = 0; i < *(int *) buffer; i++)
        printf("%d %c %d = %d\n", niz[i].broj1, niz[i].operacija, niz[i].broj2, niz[i].rezultat);
    
    printf("\n");
}

char *NapraviNiz()
{
    char *nizIzraza = (char *) malloc(4 * sizeof(izraz) + sizeof(int));
    izraz *niz      = (izraz *) (nizIzraza + sizeof(int));
    *((int *) nizIzraza) = 4;

    niz[0] = (izraz) {11, '+', 4, 0};
    niz[1] = (izraz) {11, '-', 4, 0};
    niz[2] = (izraz) {11, '*', 4, 0};
    niz[3] = (izraz) {11, '/', 4, 0};

    return nizIzraza;
}