#ifndef CENOVNIK_H
#define CENOVNIK_H

#include <iostream>
#include <string>
#include <map>

using namespace std;

typedef map<string, double>::const_iterator cit;

void nadjiPovoljno(map<string, double> a, map<string, double> b, map<string, double> &jeftino)
{
    for(cit it = a.cbegin(); it != a.cend(); it++)
        for(cit jt = b.cbegin(); jt != b.cend(); jt++)
            if(it -> first == jt -> first) { // DA LI SU PRONADJENI ISTI PROIZVODI
                if(it -> second < jt -> second) // DA LI JE PRVA CENA MANJA NEGO DRUGA
                    jeftino.insert({it -> first, it -> second}); // PRVA CENA JE POVOLJNIJA
                else
                    jeftino.insert({jt -> first, jt -> second}); // DRUGA CENA JE POVOLJNIJA
            }
}

#endif // CENOVNIK_H
