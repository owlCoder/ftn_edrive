#ifndef NITI_H_INCLUDED
#define NITI_H_INCLUDED

#include <vector>
#include <thread>
#include <algorithm>

#include "suma_vektora.h"

using namespace std;

// v - vektor čije elemente treba sumirati
// n - koliko niti treba pokrenuti
// povratna vrednost - suma svih elemenata vektora, izračunata pokretanjem n niti (svaka nit treba da obradi jedan deo elemenata)
double sumiraj(vector<double> v, int n) {
    const unsigned deoNiza = v.size() / n;
    thread t[n];
    vector<double> z(n);

    for(int i = 0; i < n; i++) {
        if(i == n - 1)
            t[i] = thread(f, v.begin() + i * deoNiza, v.end(), ref(z[i]));
        else
            t[i] = thread(f, v.begin() + i * deoNiza, v.begin() + (i + 1) * deoNiza, ref(z[i]));
    }

    for(int i = 0; i < n; i++)
        t[i].join();

    return accumulate(z.begin(), z.end(), 0);
}

#endif // NITI_H_INCLUDED
