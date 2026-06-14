#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <ctype.h>

#include "ispit.h"
#pragma pack(4)

int Konverzija(char *string)
{
    int rezultat = 0, i = 0;

    while(string[i] != 0)
    {
        if(string[i] >= '0' && string[i] <= '9')
            rezultat = rezultat * 16 + string[i] - '0';
        else if(string[i] >= 'A' && string[i] <= 'F')
            rezultat = rezultat * 16 + string[i] - 'A' + 10;
        else if(string[i] >= 'a' && string[i] <= 'f')
            rezultat = rezultat * 16 + string[i] - 'a' + 10;
        else
            return -1;
        
        i++;
    }

    return rezultat;
}

char *UcitavanjePodatakaIUpisUBuffer()
{
    int brojStudenata, brojPredmeta;

    printf("\nUnesite broj predmeta i broj studenata: ");
    scanf("%d %d", &brojPredmeta, &brojStudenata);

    char *buffer = (char *) malloc(2 * sizeof(int) + brojPredmeta * brojStudenata * sizeof(ispit));
    *((int *) buffer)                = brojStudenata;
    *((int *)(buffer + sizeof(int))) = brojPredmeta;

    for(int i = 0; i < brojPredmeta; i++)
    {
        for(int j = 0; j < brojStudenata; j++)
        {
            int hexSifra  = -1;
            short *dan    = ((short *) (buffer + 2 * sizeof(int) + (i * brojStudenata + j) * sizeof(ispit)));
            short *mesec  = ((short *) (buffer + 2 * sizeof(int) + (i * brojStudenata + j) * sizeof(ispit) + 2));
            short *godina = ((short *) (buffer + 2 * sizeof(int) + (i * brojStudenata + j) * sizeof(ispit) + 4));
            char  *ocena  = ((char  *) (buffer + 2 * sizeof(int) + (i * brojStudenata + j) * sizeof(ispit) + 6));
            int   *sifra  = ((int   *) (buffer + 2 * sizeof(int) + (i * brojStudenata + j) * sizeof(ispit) + 8));
            char  *prof   = ((char  *) (buffer + 2 * sizeof(int) + (i * brojStudenata + j) * sizeof(ispit) + 12));

            /// DODAVANJE U BAFER UCITANOG ISPITA
            printf("\nStudent[%d]", i + 1);

            printf("\n\tDan, Mesec, Godina: ");
            scanf("%hd %hd %hd", dan, mesec, godina);

            printf("\tOcena: ");
            scanf(" %c", ocena);

           do
           {
               char sifraUnos[12];

               printf("\tSifra Ispitnog Roka: ");
               fflush(stdin);
               scanf(" %s", sifraUnos);
               printf("\n");

               hexSifra = Konverzija(sifraUnos);
           } while(hexSifra == -1);

           *sifra = hexSifra;

            printf("\tProfesor: ");
            scanf(" %s", prof);
        }
    }

    return buffer;
}

typedef int polozen(ispit);

int Polozio(ispit isp) { return isp.ocena > '5'; }

int Prebroj(char *buffer, polozen p)
{
    int brojStudenata = *((int *) buffer);
    int brojPredmeta  = *((int *)(buffer + sizeof(int)));
    int brojac        = 0;
    ispit *isp        = (ispit *)(buffer + 2 * sizeof(int));

    for(int j = 0; j < brojPredmeta; j++)
        for(int i = 0; i < brojStudenata; i++)
            if( p(isp[j * brojStudenata + i]) )
                brojac++;
    
    return brojac;
}

int main(void)
{
    char *buffer = UcitavanjePodatakaIUpisUBuffer();
    
    IspisiPodatke(buffer);
    printf("\nBroj ispita koji zadovoljavaju uslov: %d ispit/a.\n", Prebroj(buffer, Polozio));

    return 0;
}