#include <stdio.h>
#include "ispit.h"

void IspisiPodatke(char *buffer)
{
    int brojStudenata = *((int*) buffer);
    int brojPredmeta  = *((int*) (buffer + sizeof(int)));
    ispit* is = (ispit *) (buffer + 2 * sizeof(int));

    printf("\n------------- Ispis podataka o ispitima -------------\n");
    printf("Broj studenata: %d\n", brojStudenata );
    printf("Broj predmeta: %d\n", brojPredmeta);
    printf("-------------------- Ispis studenata ----------------\n");

    for(int j = 0; j < brojPredmeta; j++)
    {
        for(int i = 0; i < brojStudenata; i++)
        {
            printf("%hd.%hd.%hd. %c %d (hex: %x) %s\n",
                    is[j * brojStudenata + i].dan, 
                    is[j * brojStudenata + i].mesec,
                    is[j * brojStudenata + i].godina,
                    is[j * brojStudenata + i].ocena,
                    is[j * brojStudenata + i].sifraIspitnogRoka, 
                    is[j * brojStudenata + i].sifraIspitnogRoka, 
                    is[j * brojStudenata + i].profesor);
        }
        printf("-----------------------------------------------------\n");
    }
}