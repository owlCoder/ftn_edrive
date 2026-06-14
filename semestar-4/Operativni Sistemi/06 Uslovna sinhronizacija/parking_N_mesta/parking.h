#ifndef PARKING_H_INCLUDED
#define PARKING_H_INCLUDED

#include "automobil.h"
#include <mutex>
#include <condition_variable>

using namespace std;

class Parking
{
private:
    Automobil &automobil;
    int slobodno;
    mutex m;
    condition_variable cv;

public:
    Parking(Automobil &a, int kapacitet) : automobil(a)
    {
        slobodno = kapacitet;
    }

    // Metoda koju poziva nit koja simulira kretanje automobila kako bi automobil pokusao da se parkira.
    // Ako je parking zauzet, izvrsenje ove metode ce trajati dok se parking ne oslobodi i auto se parkira.
    // rbr - Redni broj automobila
    // Potrebno je pozvati metodu automobil.ceka kada je parking zauzet i auto ne moze da se parkira.
    // Potrebno je pozvati metodu automobil.parkira kada auto uspe da se parkira.
    void udji(int rbr)
    {
        unique_lock<mutex> l(m); /// KRITICNA SEKCIJA
        while (slobodno == 0)    /// SVE DOK SE MESTO NE OSLOBODI (SLOBODNO > 0)
            cv.wait(l);          /// CEKAJ

        --slobodno;              /// MESTO SE ZAUZELO, BROJ SL. PARKING MESTA SMANJI ZA 1
        automobil.parkira(rbr);  /// ISPIS NA KONZOLU KOJI SE AUTOMOBIL PARKIRAO

    }

    // Metoda koju poziva nit koja simulira kretanje automobila kada auto izlazi sa parkinga (nakon sto je bio parkiran).
    // rbr - Redni broj automobila
    // Potrebno je pozvati metodu automobil.napusta kada auto napusta parking mesto.
    void izadji(int rbr)
    {
        unique_lock<mutex> l(m);
        automobil.napusta(rbr);
        cv.notify_one();         /// OSLOBODILO SE JEDNO PARKING MESTO, PROBUDI JEDNU NIT
        ++slobodno;              /// I NAZNACI DA JE TO MESTO SLOBODNO
    }
};

#endif // PARKING_H_INCLUDED
