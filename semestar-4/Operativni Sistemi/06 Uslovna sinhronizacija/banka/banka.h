#ifndef BANKA_H_INCLUDED
#define BANKA_H_INCLUDED

#include "valuta.h"
#include "kredit.h"
#include <mutex>
#include <condition_variable>
#include <vector>

using namespace std;

class Banka {
private:
    Kredit &kredit;
    mutex m;
    int dsaldo;
    int esaldo;
    condition_variable dLikvidan, eLikvidan;

public:
    Banka(Kredit &kr, int inicijalni_dsaldo, int inicijalni_esaldo)
        : kredit(kr) {
        dsaldo = inicijalni_dsaldo;
        esaldo = inicijalni_esaldo;
    }

    // Metoda koju poziva nit koja simulira klijenta banke, kada klijent zatrazi kredit od banke.
    // Ukoliko banka nema odgovarajuca sredstva kako bi omogucila kredit, metoda ce blokirati dok se ta sredstva ne oslobode.
    // rbr - Redni broj klijenta
    // svota - Novcani iznos koji je potreban klijentu
    // valuta - Valuta u kojem je novcani iznos
    // Potrebno je pozvati metodu kredit.ceka kada nema sredstava odgovarajuce valute da se odobri kredit.
    // Potrebno je pozvati metodu kredit.dobio kada se kredit realizuje.
    void uzmi_kredit(int rbr, int svota, Valuta valuta) {
        unique_lock<mutex> l(m);
        int saldo = 0;
        if(valuta == DINAR)
        {
            while(dsaldo < svota)
            {
                dLikvidan.wait(l);
                kredit.ceka(rbr, svota, valuta);
            }

            dsaldo -= svota;
            saldo = dsaldo;
            kredit.dobio(rbr, svota, saldo, valuta);
        }
        else
        {
            while(esaldo < svota)
            {
                eLikvidan.wait(l);
                kredit.ceka(rbr, svota, valuta);
            }

            esaldo -= svota;
            saldo = esaldo;
            kredit.dobio(rbr, svota, saldo, valuta);
        }
    }

    // Metoda koju poziva nit koja simulira klijenta banke, kada klijent vrati kredit koji je prethodno uzeo od banke.
    // rbr - Redni broj klijenta
    // svota - Novcani iznos koji je potreban klijentu
    // valuta - Valuta u kojem je novcani iznos
    // Potrebno je pozvati metodu kredit.vratio kada je kredit vracen.
    void vrati_kredit(int rbr, int svota, Valuta valuta) {
        unique_lock<mutex> l(m);
        int saldo = 0;

        if(valuta == DINAR)
        {
            dsaldo += svota;
            saldo = dsaldo;
            kredit.vratio(rbr, svota, saldo, valuta);
            dLikvidan.notify_all();
        }
        else
        {
            esaldo += svota;
            saldo = esaldo;
            kredit.vratio(rbr, svota, saldo, valuta);
            eLikvidan.notify_all();
        }
    }
};

#endif // BANKA_H_INCLUDED
