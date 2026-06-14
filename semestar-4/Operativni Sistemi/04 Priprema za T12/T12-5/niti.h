#ifndef NITI_H
#define NITI_H

#include <iostream>
#include <thread>
#include <map>

using namespace std;

#include "recnik.h"

// Implementacija pokretanja dodatne niti koja treba da napravi novi rečnik (koristeći funkciju "napraviRecnik")
//
// brojNiti - Broj niti koje je potrebno startovati
map<string, string> izracunaj(map<string, string> engSrp)
{
    map<string, string> srpEng;

    thread nit(napraviRecnik, engSrp, ref(srpEng));
    nit.join();

    return srpEng;
}

#endif // NITI_H
