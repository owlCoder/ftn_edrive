#ifndef SKLADISTE_H_INCLUDED
#define SKLADISTE_H_INCLUDED

#include "kamion.h"
#include <vector>
#include <condition_variable>
#include <mutex>
#include <algorithm>

const int BROJ_RAMPI = 2;

using namespace std;
using namespace chrono;

class Skladiste
{
private:
    Kamion &kamion;
    vector<bool> zauzeta;
    mutex m;
    condition_variable cv[2];
    int brojZapaljivih;

public:
    Skladiste(Kamion &k) : kamion(k), zauzeta (BROJ_RAMPI), brojZapaljivih(0)
    {
        // Prosiriti po potrebi ...
    }

    // Metoda koju poziva nit koja simulira kretanje kamiona kada on pokusava da istovari robu.
    // Metoda je blokirajuca - ako su sve rampe za istovar zauzete, izvrsenje ce blokirati dok se neka ne oslobodi.
    //
    // rbr       - Redni broj kamiona
    // kolicina  - Kolicina robe koja se prevozi (u tonama)
    // zapaljivo - Ukazuje na to da li je roba koja se prevozi zapaljiva (takva roba ima prioritet pri istovaru!)
    //
    // Potrebno je pozvati metodu kamion.ceka kada su rampe zauzete i kamion mora da ceka.
    // Potrebno je pozvati metodu kamion.istovara kada zapocne istovar robe iz kamiona (primetiti da ta metoda zahteva da joj se prosledi indeks rampe na kojoj se obavlja istovar!)
    // Potrebno je pozvati metodu kamion.odlazi kada je kamion zavrsio istovar i odlazi.
    void istovari(int rbr, int kolicina, bool zapaljivo)
    {
        vector<bool>::iterator it;

        {
            unique_lock<mutex> l(m);
            while( (it = find(zauzeta.begin(), zauzeta.end(), false)) == zauzeta.end())
            {
                kamion.ceka(rbr, kolicina, zapaljivo);

                if(zapaljivo)
                {
                    brojZapaljivih++;
                    cv[1].wait(l);
                    brojZapaljivih--;
                }
                else
                {
                    cv[0].wait(l);
                }

            }
            *it = true;
        }

        kamion.istovara(rbr, kolicina, zapaljivo, it - zauzeta.begin());
        this_thread::sleep_for(seconds(kolicina));

        {
            unique_lock<mutex> l(m);
            *it = false;

            kamion.odlazi(rbr);

            if(brojZapaljivih)
                cv[1].notify_one();
            else
                cv[0].notify_one();
        }
    }
};

#endif // SKLADISTE_H_INCLUDED
