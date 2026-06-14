#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>

#define KRAJ_DATOTEKE -1
#define FAKTOR_BLOKIRANJA 5

typedef struct Slog
{
    int autoId;
    char marka[20 + 1];
    char model[16 + 1];
    int parkiranMinuta;
    int zona;
    int parkingMesto; // 1, 2, 3
    int deleted;
} SLOG;

typedef struct Blok
{
    SLOG slogovi[FAKTOR_BLOKIRANJA];
} BLOK;

