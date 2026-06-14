/// 02 Zadatak 01
#include <stdio.h>
#include <stdlib.h>

enum operacija {SABIRANJE, ODUZIMANJE, MNOZENJE, DELJENJE};

float *Calculate(char *buffer)
{
    int *operandi = (int *)(buffer + sizeof(char));
    float *rezultat = (float *) malloc(sizeof(float));

    if(*buffer == SABIRANJE)       *rezultat = (float)(operandi[0] + operandi[1]);
    else if(*buffer == ODUZIMANJE) *rezultat = (float)(operandi[0] - operandi[1]);
    else if(*buffer == MNOZENJE)   *rezultat = (float)(operandi[0] * operandi[1]);
    else if(*buffer == DELJENJE)   *rezultat = (float)(operandi[0] / operandi[1]);
    else                           *rezultat = 0.0;

    return rezultat;
}

void OperacijaIOperandi(char *buffer)
{
    char operacija;

    do {
        printf("\nOdabir operacije (+, -, *, /)\n>> ");
        scanf(" %c", &operacija);
    } while(operacija != '+' && operacija != '-' &&
            operacija != '*' && operacija != '/');

    if(operacija == '+')      *buffer = SABIRANJE;
    else if(operacija == '-') *buffer = ODUZIMANJE;
    else if(operacija == '*') *buffer = MNOZENJE;
    else                      *buffer = DELJENJE;

    int broj1, broj2;

    printf("\nUnesite 2 broja\n>> ");
    scanf("%d %d", &broj1, &broj2);

    *((int *)(buffer + 1)) = broj1;
    *((int *)(buffer + 5)) = broj2;
}

int main(void)
{
    char *buffer = (char *) malloc(sizeof(char) + 2 * sizeof(int));
    float *rezultat = NULL;

    OperacijaIOperandi(buffer);
    rezultat = Calculate(buffer);

    printf("\nRezultat: %.3f", *rezultat);

    free(buffer);
    free(rezultat);

    return 0;
}