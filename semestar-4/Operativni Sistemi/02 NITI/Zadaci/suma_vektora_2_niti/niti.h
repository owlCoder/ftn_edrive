#ifndef NITI_H_INCLUDED
#define NITI_H_INCLUDED

#include <vector>
#include <thread>

#include "suma_vektora.h"

using namespace std;

// v - vektor čije elemente treba sumirati
// povratna vrednost - suma svih elemenata vektora,
// izračunata pokretanjem 2 niti (svaka treba da obradi jednu polovinu elemenata)
double sumiraj(vector<double> v) {
    const unsigned polovina = v.size() / 2;
    thread t1, t2;
    double z1, z2;

    t1 = thread(f, v.begin(), v.begin() + polovina, ref(z1));
    t2 = thread(f, v.begin() + polovina, v.end(), ref(z2));

    t1.join();
    t2.join();

    return z1 + z2;
}

#endif // NITI_H_INCLUDED
