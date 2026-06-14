#ifndef NITI_H
#define NITI_H

#include <thread>
#include <list>
#include "ispis.h"

// Implementacija pokretanja više niti koje treba da ispišu svoje redne brojeve (koristeći funkciju "ispisi")
//
// brojNiti - Broj niti koje je potrebno startovati
//
void izracunaj(int brojNiti)
{
    thread niti[brojNiti];

    for(int i = 0; i < brojNiti; i++)
        niti[i] = thread(ispisi, i + 1);

    for(int i = 0; i < brojNiti; i++)
        niti[i].join();
}

#endif // NITI_H
