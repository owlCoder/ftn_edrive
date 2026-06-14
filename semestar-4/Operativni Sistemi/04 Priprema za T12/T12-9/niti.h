#ifndef NITI_H
#define NITI_H

#include <thread>
#include <map>
#include <list>
#include "obracun.h"

using namespace std;

double izracunaj(list<string> kupljeno, map<string, double> cenovnik)
{
    double ukupno = 0.;

    thread nit(obracunajUkupno, kupljeno, cenovnik, ref(ukupno));
    nit.join();

    return ukupno;
}

#endif // NITI_H
