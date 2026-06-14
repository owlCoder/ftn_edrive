#ifndef NITI_H
#define NITI_H

#include <thread>
#include <map>
#include "cenovnik.h"

using namespace std;

map<string, double> izracunaj(map<string, double> &a, map<string, double> &b)
{
    map<string, double> jeftino;

    thread nit(nadjiPovoljno, a, b, ref(jeftino));
    nit.join();

    return jeftino;
}

#endif // NITI_H
