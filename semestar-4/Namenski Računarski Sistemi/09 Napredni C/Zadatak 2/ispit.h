#ifndef ISPIT_H_INCLUDED
#define ISPT_H_INCLUDED
#pragma pack(4)

typedef struct Ispit
{
    short dan;
    short mesec;
    short godina;
    char  ocena;
    int   sifraIspitnogRoka;
    char  profesor[20];
} ispit;


void ispisPodatke();

#endif
