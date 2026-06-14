#ifndef OBRACUN_H
#define OBRACUN_H

#include <string>
#include <map>
#include <list>

using namespace std;

void obracunajUkupno(list<string> kupljeno, map<string, double> cenovnik, double &ukupno)
{
    for(auto it = kupljeno.cbegin(); it != kupljeno.cend(); it++)
        for(auto jt = cenovnik.cbegin(); jt != cenovnik.cend(); jt++) 
            if(*it == jt -> first) {
                ukupno += jt -> second;
                break; // NEMA POTREBE ICI DALJE, NASLI SMO CENU
            }
}

#endif // OBRACUN_H
