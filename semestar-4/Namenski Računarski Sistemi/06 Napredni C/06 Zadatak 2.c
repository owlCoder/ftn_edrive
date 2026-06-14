/// 06 Zadatak 02
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#pragma pack(4)

typedef struct
{
    char ime[12];
    char prezime[12];
    char pol;
    short danR, mesecR, godinaR;
    char JMBG[14];
} Osoba;

void ispisStariju(char *buffer)
{
    int maxOsobaIndex = 0;

    for(int i = 1; i < *(short *) buffer; i++)
    {
        short *dan1    = (short *) &buffer[26 + maxOsobaIndex * sizeof(Osoba) + sizeof(short)];
        short *mesec1  = (short *) &buffer[28 + maxOsobaIndex * sizeof(Osoba) + sizeof(short)];
        short *godina1 = (short *) &buffer[30 + maxOsobaIndex * sizeof(Osoba) + sizeof(short)];

        short *dan2    = (short *) &buffer[26 +             i * sizeof(Osoba) + sizeof(short)];
        short *mesec2  = (short *) &buffer[28 +             i * sizeof(Osoba) + sizeof(short)];
        short *godina2 = (short *) &buffer[30 +             i * sizeof(Osoba) + sizeof(short)];

        if(!(*godina1  < *godina2 ||
             *godina1 == *godina2 &&  *mesec1 <  *mesec2 ||
             *godina1 == *godina2 &&  *mesec1 == *mesec2 && *dan1 < *dan2))
            maxOsobaIndex = i;
    }

    printf("Ime: %s\nPrezime: %s\nPol: %c\nJMBG: %s\n",
           buffer + maxOsobaIndex * sizeof(Osoba) + sizeof(short),
           buffer + maxOsobaIndex * sizeof(Osoba) + sizeof(short) + 12,
         *(buffer + maxOsobaIndex * sizeof(Osoba) + sizeof(short) + 24),
           buffer + maxOsobaIndex * sizeof(Osoba) + sizeof(short) + 32);
}

int main(void)
{
    Osoba o[3];
    char *buffer = (char *)malloc(sizeof(o) + 2);

    o[0] = (Osoba) {
        "Danijel",
        "Jovanovic",
        'M',
        12,
        1,
        2001,
        "0123456789123"
    };

    o[1] = (Osoba) {
        "Milena",
        "Kovac",
        'Z',
        15,
        1,
        2000,
        "0123666789123"
    };

    o[2] = (Osoba) {
        "Marijana",
        "Lenic",
        'Z',
        1,
        1,
        2002,
        "0163666789123"
    };
    
    *((short *) buffer) = 3;
    memcpy(buffer + 2, &o, sizeof(o));

    ispisStariju(buffer);
    free(buffer);

    return 0;
}