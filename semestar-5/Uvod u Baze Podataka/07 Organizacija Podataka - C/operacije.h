#include "struktura_podataka.h"

// citanje iz txt datoteku i upis u binarnu
void citajTextUpisUBinarnu(char *filename);

FILE *otvoriDatoteku(char *filename);
void kreirajPraznuDatoteku(char *filename);
SLOG *pronadjiSlog(FILE *fajl, int autoId);
void dodajSlog(FILE *fajl, SLOG *slog);
void ispisiSveSlogove(FILE *fajl);
void ispisiSlog(SLOG *slog);

// obrisati logicki auto koji je bio na parkingu duze od pola sata
void obrisiSlogLogickiDuzePolaSata(FILE *fajl);

// pronaci sva auta koja su bila parkirana na odredjenom 
// parking mestu, prebrojati koliko ih ima, ispisati na
// konzolu i u datoteku "auto_count_pmesto.dat"
void PrebrojPronadjiAutaParkingMesto(FILE *fajl, int tip_pm);

// ispisati auta po odredjenoj zoni
void IspisiAutaUOdredjenojZoni(FILE *fajl, int zona);