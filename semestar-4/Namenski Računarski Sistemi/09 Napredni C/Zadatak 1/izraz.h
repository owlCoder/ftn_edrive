#ifndef IZRAZ_H_INCLUDED
#define IZRAZ_H_INCLUDED

#include <stdio.h>
#include <stdlib.h>

typedef struct Izraz
{
    short broj1;
    char  operacija;
    short broj2;
    int   rezultat;
} izraz;

void ispisNiz(char *buffer);
char *napraviNiz();

#endif
