#ifndef PARKING_H_INCLUDED
#define PARKING_H_INCLUDED

#include "automobil.h"
#include <mutex>
#include <condition_variable>

using namespace std;

class Parking
{
    Automobil &automobil;
    bool slobodno;
    mutex m;
    condition_variable cv[3];
    int trenutni_ulaz;
public:

public:
    Parking(Automobil &a) : automobil(a), slobodno(true)
    {
        // Prosiriti po potrebi ...
    }

    // Metoda koju poziva nit koja simulira kretanje automobila kada on pokusava da udje na parking.
    // Metoda je blokirajuca - ukoliko nema slobodnog mesta, izvrsenje je u blokadi dok se ono ne oslobodi.
    //
    // rbr  - Redni broj automobila
    // ulaz - Ulaz na koji automobil pokusava da udje
    //
    // Potrebno je pozvati metodu automobil.ceka kada automobil ne moze da pridje parkingu i mora da ceka.
    // Potrebno je pozvati metodu automobil.zauzima kada automobil zauzme parking mesto.
    void udji(int rbr, int ulaz)
    {
        unique_lock<mutex> l(m);

        if(!slobodno)
        {
            automobil.ceka(rbr, ulaz);
            while(!slobodno || ulaz != trenutni_ulaz)
            {
                automobil.ceka(rbr, ulaz);
                cv[ulaz].wait(l);
            }
        }

        automobil.zauzima(rbr);
        slobodno = false;
        trenutni_ulaz = (trenutni_ulaz + 1) % 3;
    }

    // Metoda koju poziva nit koja simulira kretanje automobila kada on napusta parking na koji je prethodno usao.
    //
    // rbr  - Redni broj automobila
    //
    // Potrebno je pozvati metodu automobil.napusta kada automobil napusti parking mesto.
    void izadji(int rbr)
    {
        unique_lock<mutex> l(m);
        automobil.napusta(rbr);
        cv[trenutni_ulaz].notify_one();
        slobodno = true;
    }
};

#endif // PARKING_H_INCLUDED
