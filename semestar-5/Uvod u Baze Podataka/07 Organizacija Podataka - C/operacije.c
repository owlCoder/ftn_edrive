#include "operacije.h"

// citanje iz txt datoteku i upis u binarnu
void citajTextUpisUBinarnu(char *filename)
{
    FILE *fajl = fopen(filename, "r");

    if(fajl == NULL)
    {
        printf("Error opening text file!\n");
        return;
    }
    else
        printf("Text file opened successfuly!\n");

    // kreiranje prazne binarne datoteke
    kreirajPraznuDatoteku("automobili.dat");
    FILE *binarna = otvoriDatoteku("automobili.dat");

    if(binarna == NULL)
    {
        printf("Error opening binary file!\n");
        return;
    }
    
    printf("Binary file opened!\n");

    // citanje red po red iz txt datoteke
    SLOG *temp = (SLOG *) malloc(sizeof(SLOG));
    fseek(fajl, 0, SEEK_SET);

    while(fscanf(fajl, "%d %s %s %d %d %d %d", 
                  &temp -> autoId,
                  temp -> marka,
                  temp -> model,
                  &temp -> parkiranMinuta,
                  &temp -> parkingMesto,
                  &temp -> zona,
                  &temp -> deleted) != EOF)
        dodajSlog(binarna, temp);

    fflush(binarna);
    fclose(binarna);
}

FILE *otvoriDatoteku(char *filename)
{
    FILE *fajl = fopen(filename, "rb+");

    if(fajl == NULL)
        printf("Error opening file!\n");
    else
        printf("File opened successfuly!\n");
    
    return fajl;
}

void kreirajPraznuDatoteku(char *filename)
{
    FILE *fajl = fopen(filename, "wb");

    if(fajl == NULL)
        printf("Error opening file\n");
    else
    {
        BLOK blok;
        
        blok.slogovi[0].autoId = KRAJ_DATOTEKE;
        fwrite(&blok, sizeof(BLOK), 1, fajl);
        fclose(fajl);

        printf("File create successfully\n");
    }
}

SLOG *pronadjiSlog(FILE *fajl, int autoId)
{
    if(fajl == NULL)
        return NULL;

    fseek(fajl, 0, SEEK_SET);
    BLOK blok;

    while(fread(&blok, sizeof(BLOK), 1, fajl))
    {
        for(int i = 0; i < FAKTOR_BLOKIRANJA; i++)
        {
            if(blok.slogovi[i].autoId == KRAJ_DATOTEKE)
                return NULL;

            if(blok.slogovi[i].autoId == autoId && !blok.slogovi[i].deleted)
            {
                SLOG *slog = (SLOG *) malloc(sizeof(SLOG));
                memcpy(slog, &blok.slogovi[i], sizeof(SLOG));

                return slog;
            }
        }
    }
}

void dodajSlog(FILE *fajl, SLOG *slog)
{
    if(fajl == NULL)
    {
        printf("File not opened!\n");
        return;
    }

    SLOG *stari = pronadjiSlog(fajl, slog -> autoId);

    if(stari != NULL)
    {
        printf("Slog already exist\n");
        return;
    }

    BLOK blok;
    fseek(fajl, -sizeof(BLOK), SEEK_END);
    fread(&blok, sizeof(BLOK), 1, fajl);

    int i;
    for(i = 0; i < FAKTOR_BLOKIRANJA; i++)
    {
        if(blok.slogovi[i].autoId == KRAJ_DATOTEKE)
        {
            memcpy(&blok.slogovi[i], slog, sizeof(SLOG));
            break;
        }
    }

    i++;

    if(i < FAKTOR_BLOKIRANJA)
    {
        blok.slogovi[i].autoId = KRAJ_DATOTEKE;
        fseek(fajl, -sizeof(BLOK), SEEK_CUR);
        fwrite(&blok, sizeof(BLOK), 1, fajl);
        fflush(fajl);
    }
    else
    {
        fseek(fajl, -sizeof(BLOK), SEEK_CUR);
        fwrite(&blok, sizeof(BLOK), 1, fajl);

        BLOK novi;
        novi.slogovi[0].autoId = KRAJ_DATOTEKE;
        fwrite(&novi, sizeof(BLOK), 1, fajl);
    }

    if (ferror(fajl)) {
		printf("Error writing to file\n");
	} else {
		printf("New slog added\n");
	}
}

void ispisiSveSlogove(FILE *fajl)
{
    if(fajl == NULL)
    {
        printf("File not opened\n");
        return;
    }

    BLOK trenutni;
    int rbrBloka = 0;
    fseek(fajl, 0, SEEK_SET);

    printf("%-5s %-20s %-16s %-2s %-2s %-2s", "IDA", "MARKA", "MODEL", "PV", "ZP", "PM\n");
    while(fread(&trenutni, sizeof(BLOK), 1, fajl))
    {
        for(int i = 0; i < FAKTOR_BLOKIRANJA; i++)
        {
            if(trenutni.slogovi[i].autoId == KRAJ_DATOTEKE)
            {
                //printf("B%d S%d *\n", rbrBloka, i);
                break;
            }

            if(!trenutni.slogovi[i].deleted)
            {
                //printf("B%d S%d ", rbrBloka, i);
                ispisiSlog(&trenutni.slogovi[i]);
            }
        }

        rbrBloka++;
    }
}

void ispisiSlog(SLOG *slog)
{
    printf("%-5d %-20s %-16s %-2d %-2d %-2d\n",
           slog -> autoId,
           slog -> marka,
           slog -> model,
           slog -> parkiranMinuta,
           slog -> zona,
           slog -> parkingMesto
          );
}

// obrisati logicki auto koji je bio na parkingu duze od pola sata
void obrisiSlogLogickiDuzePolaSata(FILE *fajl)
{
    if(fajl == NULL)
    {
        printf("File not opened\n");
        return;
    }

    fseek(fajl, 0, SEEK_SET);
    BLOK blok;

    while(fread(&blok, sizeof(BLOK), 1, fajl))
    {
        for(int i = 0; i < FAKTOR_BLOKIRANJA; i++)
        {
            if(blok.slogovi[i].autoId == KRAJ_DATOTEKE)
            {
                printf("No Slog found in file.");
                return;
            }

            if(blok.slogovi[i].parkiranMinuta >= 30 && !blok.slogovi[i].deleted)
            {
                blok.slogovi[i].deleted = 1;
                fseek(fajl, -sizeof(BLOK), SEEK_CUR);
                fwrite(&blok, sizeof(BLOK), 1, fajl);
                fflush(fajl);

                printf("Slog logically deleted\n");
                return;
            }
        }
    }
}

// pronaci sva auta koja su bila parkirana na odredjenom 
// parking mestu, prebrojati koliko ih ima, ispisati na
// konzolu i u datoteku "auto_count_pmesto.dat"
void PrebrojPronadjiAutaParkingMesto(FILE *fajl, int tip_pm)
{
    if(fajl == NULL)
    {
        printf("File not opened\n");
        return;
    }

    fseek(fajl, 0, SEEK_SET);
    BLOK blok;
    int brojPojava = 0;

    kreirajPraznuDatoteku("auto_count_pmesto.dat");
    FILE *noviFajl = otvoriDatoteku("auto_count_pmesto.dat");

    if(noviFajl == NULL)
    {
        printf("Error creating new file\n");
        return;
    }

    printf("%-5s %-20s %-16s %-2s %-2s %-2s", "IDA", "MARKA", "MODEL", "PV", "ZP", "PM\n");
    while(fread(&blok, sizeof(BLOK), 1, fajl))
    {
        for(int i = 0; i < FAKTOR_BLOKIRANJA; i++)
        {
            if(blok.slogovi[i].autoId == KRAJ_DATOTEKE)
            {
                printf("No Slog found in file.");
                return;
            }

            if(blok.slogovi[i].parkingMesto == tip_pm && !blok.slogovi[i].deleted)
            {
                ispisiSlog(&blok.slogovi[i]);
                printf("\n");

                // dodavanje sloga u novu datoteku
                dodajSlog(noviFajl, &(blok.slogovi[i]));

                brojPojava += 1;
            }
        }
    }

    printf("\nBroj pojava je: %d\n", brojPojava);

    fclose(noviFajl);
}

// ispisati auta po odredjenoj zoni
void IspisiAutaUOdredjenojZoni(FILE *fajl, int zona)
{
    if(fajl == NULL)
    {
        printf("File not opened\n");
        return;
    }

    fseek(fajl, 0, SEEK_SET);
    BLOK blok;

    printf("%-5s %-20s %-16s %-2s %-2s %-2s", "IDA", "MARKA", "MODEL", "PV", "ZP", "PM\n");
    while(fread(&blok, sizeof(BLOK), 1, fajl))
    {
        for(int i = 0; i < FAKTOR_BLOKIRANJA; i++)
        {
            if(blok.slogovi[i].autoId == KRAJ_DATOTEKE)
            {
                printf("No Slog found in file.\n");
                return;
            }

            if(blok.slogovi[i].zona == zona && !blok.slogovi[i].deleted)
            {
                ispisiSlog(&blok.slogovi[i]);
                printf("\n");
            }
        }
    }
}