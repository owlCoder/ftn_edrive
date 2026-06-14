#ifndef ISPIS_H
#define ISPIS_H

#include <iostream>
#include <sstream>

using namespace std;

// Funkcija koja će biti iskorišćena kao funkcija niti - ispisuje redni broj na konzolu
//
// rbr - Redni broj koji funkcija ispisuje na ekran
//
void ispisi(int rbr)
{
    stringstream ss;
	ss << "Redni broj: " << rbr << endl;
	cout << ss.str();
}

#endif // ISPIS_H
