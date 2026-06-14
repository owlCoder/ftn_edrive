#include "operacije.h"

int main(void)
{
    int running = 1;
	int userInput;

	FILE *fajl = NULL;

    char txt[20];
    
    printf("\nUnesite naziv ulazne txt datoteke: ");
    scanf("%s", txt);
    getc(stdin);

    // podaci ucitani u binarnu datoteku
    citajTextUpisUBinarnu(txt);
    printf("\n");

	while (running) 
    {
		printf("Odaberite opciju:\n");
		printf("1 - Otvaranje datoteke\n");
		printf("2 - Formiranje datoteke\n");
		printf("3 - Pretraga datoteke po auto id\n");
		printf("4 - Unos sloga\n");
		printf("5 - Ispis svi slogova\n");
		printf("6 - Brisanje auta koji je bio duze od pola sata\n");
		printf("7 - Prebroj/Pronadji po parking mestu\n");
		printf("8 - Ispis auta po zoni\n");
		printf("0 - Izlaz\n");

		if (fajl == NULL) 
        {
			printf("!!! PAZNJA: datoteka jos uvek nije otvorena !!!\n");
		}

        scanf("%d", &userInput);
		getc(stdin);

        switch(userInput)
        {
            case 1:
				{
					char filename[20];
					printf("Unesite ime datoteke za otvaranje: ");
					scanf("%s", &filename[0]);
					fajl = otvoriDatoteku(filename);
                    printf("\n");
					break;
				}
			case 2:
				{
					char filename[20];
					printf("Unesite ime datoteke za kreiranje: ");
					scanf("%s", filename);
					kreirajPraznuDatoteku(filename);
                    printf("\n");
					break;
				}
			case 3:
				{
                    int autoId;
                    printf("Unesite id auta kojeg trazite: ");
                    scanf("%d", &autoId);
                    SLOG *trazeni = pronadjiSlog(fajl, autoId);
                    if(trazeni == NULL)
                        printf("Ne postoji auto sa %d!\n", autoId);
                    else
                    {
                        printf("%-5s %-20s %-16s %-2s %-2s %-2s", "IDA", "MARKA", "MODEL", "PV", "ZP", "PM\n");
                        ispisiSlog(trazeni);
                        printf("\n");
                    }
                    break;
                }
            case 4:
                {
                    SLOG temp;

                    printf("Unesite id, marku, model, minuta parkirano, parking mesto, zonu: ");
                    scanf("%d %s %s %d %d %d", 
                    &temp.autoId,
                    temp.marka,
                    temp.model,
                    &temp.parkiranMinuta,
                    &temp.parkingMesto,
                    &temp.zona);

                    temp.deleted = 0;

                    dodajSlog(fajl, &temp);
                    break;
                }
            case 5:
                {
                    ispisiSveSlogove(fajl);
                    break;
                }
            case 6:
                {
                    obrisiSlogLogickiDuzePolaSata(fajl);
                    break;
                }
            case 7:
                {
                    int tip_pm;
                    printf("Unesite tip parking mesta: ");
                    scanf("%d", &tip_pm);
                    PrebrojPronadjiAutaParkingMesto(fajl, tip_pm);
                    break;
                }
            case 8:
                {
                    int zona;
                    printf("Unesite zonu parkinga: ");
                    scanf("%d", &zona);
                    IspisiAutaUOdredjenojZoni(fajl, zona);
                    break;
                }
            case 0:
				{
					//zatvori datoteku
					if (fajl != NULL) {
						fclose(fajl);
					}
					//i zavrsi program
					running = 0;
				}
        }
    }

    return 0;
}