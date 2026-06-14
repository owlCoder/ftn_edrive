/// 03 Zadatak 02
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

void LE_BE(char *buffer)
{
    int broj1 = *((int *)(buffer + 2 * sizeof(char)));
    int broj2 = *((int *)(buffer + 2 * sizeof(char) + sizeof(int)));

    if(*buffer == 'B')
    {
        copyLEToBE(broj1, buffer + 2 * sizeof(char));
        copyLEToBE(broj2, buffer + 2 * sizeof(char) + sizeof(int));
    }
    else
    {
        copyLEToLE(broj1, buffer + 2 * sizeof(char));
        copyLEToLE(broj2, buffer + 2 * sizeof(char) + sizeof(int));
    }
}

float Calculate(char *buffer)
{
    float rezultat = 0.0;
    int broj1 = *((int *)(buffer + 2 * sizeof(char)));
    int broj2 = *((int *)(buffer + 2 * sizeof(char) + sizeof(int)));

    LE_BE(buffer);

    broj1 = *((int *) (buffer + 2 * sizeof(char)));
    broj2 = *((int *) (buffer + 2 * sizeof(char) + sizeof(int)));

    if( *(buffer + sizeof(char)) == '+')
        rezultat = broj1 + broj2;
    else if( *(buffer + sizeof(char)) == '-')
        rezultat = broj1 - broj2;
    else if( *(buffer + sizeof(char)) == '*')
        rezultat = broj1 * broj2;
    else
        rezultat = broj1 / broj2;

    return rezultat;
}

int main(void)
{
    char *buffer = (char *) malloc(2 * sizeof(char) + 2 * sizeof(int));
    float rezultat, r;

    do {
        printf("Unesite L ili B: ");
        scanf(" %c", buffer);
        fflush(stdin);
    } while(*buffer != 'L' && *buffer != 'B');

     do {
        printf("Unesite +, -, *, /: ");
        scanf(" %c", (buffer + sizeof(char)));
        fflush(stdin);
    } while(*(buffer + sizeof(char)) != '+' && *(buffer + sizeof(char)) != '-'
         && *(buffer + sizeof(char)) != '*' && *(buffer + sizeof(char)) != '/');

    printf("Unesite 2 broja: ");
    scanf("%d %d", (int *)(buffer + 2 * sizeof(char)),
                   (int *)(buffer + 2 * sizeof(char) + sizeof(int)));

    LE_BE(buffer);

    rezultat = Calculate(buffer);
    r = rezultat;

    printf("\nRezultat: %.2f\n", r);

    free(buffer);

    return 0;
}
