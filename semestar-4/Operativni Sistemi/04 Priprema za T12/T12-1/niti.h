#ifndef NITI_H
#define NITI_H

#include <thread>
#include <vector>
#include "sabiranje.h"

using namespace std;

// Implementacija sabiranja korespondentnih elemenata celih vektora A i B
// pokretanjem onoliko niti koliko ima elemenata u vektorima
//
// a - Vektor A
// b - Vektor B
//
// Rezultat izvršavanja treba da bude vector<int> koji sadrži rezultat sabiranja korespondentnih elemenata.
//

typedef vector<int>::const_iterator cit;

vector<int> izracunaj(vector<int> &a, vector<int> &b)
{
    vector<int> rez(a.size());

    const unsigned BROJ_NITI = a.size();
    thread niti[BROJ_NITI];

    cit pa = a.cbegin();
    cit pb = b.cbegin();
    auto pr = rez.begin();

    for(unsigned i = 0; i < BROJ_NITI; i++, pa++, pb++, pr++)
        niti[i] = thread(saberiPar, pa, pb, pr);

    for(unsigned i = 0; i < BROJ_NITI; i++)
        niti[i].join();

    return rez;
}

#endif // NITI_H
