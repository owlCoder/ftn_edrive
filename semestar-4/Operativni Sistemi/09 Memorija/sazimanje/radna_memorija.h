#ifndef RADNA_MEMORIJA_H_INCLUDED
#define RADNA_MEMORIJA_H_INCLUDED

#include "dijagnostika.h"
#include <list>
#include <condition_variable>

using namespace std;
using namespace chrono;

struct Blok
{
    int id_procesa = 0;
    int pozicija;
    int velicina;

    Blok(int p, int v) : pozicija(p), velicina(v) {}
};

class Radna_memorija
{
private:
    Dijagnostika& dijagnostika;
    list<Blok*> blokovi;
    mutex m;
    condition_variable cv, cv_sazimanje;
    bool zahtev = false;

    Blok *alociraj(int velicina)
    {
        list<Blok*>::iterator it;

        for (it = blokovi.begin(); it != blokovi.end(); it++)
            if (!(*it)->id_procesa && (*it)->velicina >= velicina)
                break;
        if (it == blokovi.end()) return nullptr;

        Blok *stari = *it;

        if (stari->velicina > velicina)
        {
            Blok *novi = new Blok(stari->pozicija, velicina);
            blokovi.insert(it, novi);

            stari->pozicija += velicina;
            stari->velicina -= velicina;
            return novi;
        }
        else
        {
            return stari;
        }
    }

    void oslobodi(Blok *blok)
    {
        blok->id_procesa = 0;

        for (auto it = blokovi.begin(); it != blokovi.end(); it++)
        {
            if ((*it)->id_procesa) continue;

            for (;;)
            {
                auto sledeci = next(it);
                if (sledeci == blokovi.end() || (*sledeci)->id_procesa)
                    break;

                Blok *blok = *sledeci;
                (*it)->velicina += blok->velicina;
                blokovi.erase(sledeci);
                delete blok;
            }
        }
    }

    vector<int> prikaz_memorije()
    {
        vector<int> prikaz;
        for (Blok *blok : blokovi)
            for (int i = 0; i < blok->velicina; i++)
                prikaz.push_back(blok->id_procesa);
        return prikaz;
    }

public:
    Radna_memorija(Dijagnostika& d, int ukupno_lokacija)
        : dijagnostika(d) {
        blokovi.push_back(new Blok(0, ukupno_lokacija));
    }

    Dijagnostika& getDijagnostika() {
        return dijagnostika;
    }

    // Metoda koju poziva nit koja simulira izvršenje procesa kako bi proces zauzeo potrebnu memoriju i krenuo sa radom
    //
    // id_procesa          - identifikator procesa
    // br_lokacija_procesa - ukupan broj lokacija memorije koje su neophodne za izvršenje procesa
    // trajanje            - koliko dugo se proces izvršava (u sekundama)
    //
    // Ukoliko trenutno nema na raspolaganju dovoljno slobodne memorije (moraju se zauzeti uzastopni okviri u memoriji!), potrebno je pozvati metodu dijagnostika.proces_ceka a nakon toga proces treba da čeka dok se memorija ne oslobodi.
    // Kada proces uspe da dođe do potrebne radne memorije, treba da se pozove dijagnostika.proces_zauzeo_okvire.
    // Kada se proces završi, potrebno je pozvati metodu dijagnostika.proces_zavrsio.
    // Metodu dijagnostika.ispisi_memoriju potrebno je pozvati u sledećim momentima: nakon što proces zauzme memoriju i nakon što proces oslobodi memoriju.
    void koristi(int id_procesa, int br_lokacija_procesa, int trajanje)
    {
        Blok *blok;
        {
            unique_lock<mutex> l(m);

            while (!(blok = alociraj(br_lokacija_procesa)))
            {
                dijagnostika.proces_ceka(id_procesa);
                cv.wait(l);
            }

            blok->id_procesa = id_procesa;
            dijagnostika.proces_zauzeo_okvire(
                id_procesa,
                blok->pozicija,
                blok->pozicija + blok->velicina
            );

            vector<int> prikaz = prikaz_memorije();
            dijagnostika.ispisi_memoriju(prikaz.begin(), prikaz.end());
        }
        this_thread::sleep_for(chrono::seconds(trajanje));
        {
            unique_lock<mutex> l(m);
            dijagnostika.proces_zavrsio(id_procesa);
            oslobodi(blok);

            vector<int> prikaz = prikaz_memorije();
            dijagnostika.ispisi_memoriju(prikaz.begin(), prikaz.end());
            cv.notify_all();

            zahtev = true;
            cv_sazimanje.notify_one();
        }
    }

    // Metoda koju poziva nit operativnog sistema koji se bavi sažimanjem memorije
    //
    // Nakon što je sažimanje obavljeno potrebno je pozvati metodu dijagnostika.sazimanje_obavljeno a nakon toga i metodu dijagnostika.ispisi_memoriju kako bi se prikazali efekti sažimanja memorije.
    void sazimanje()
    {
        unique_lock<mutex> l(m);
        while (!zahtev) cv_sazimanje.wait(l);
        zahtev = false;

        int slobodno = 0;
        auto it = blokovi.begin();

        while (it != blokovi.end())
        {
            if (!(*it)->id_procesa)
            {
                Blok *blok = *it;
                it = blokovi.erase(it);
                slobodno += blok->velicina;
                delete blok;
            }
            else
            {
                it++;
            }
        }

        int brojac = 0;

        for (Blok *blok : blokovi)
        {
            blok->pozicija = brojac;
            brojac += blok->velicina;
        }

        blokovi.push_back(new Blok(brojac, slobodno));

        dijagnostika.sazimanje_obavljeno();
        vector<int> prikaz = prikaz_memorije();
        dijagnostika.ispisi_memoriju(prikaz.begin(), prikaz.end());
        cv.notify_all();
    }
};

#endif // RADNA_MEMORIJA_H_INCLUDED
