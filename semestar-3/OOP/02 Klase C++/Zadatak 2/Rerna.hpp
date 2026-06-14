#ifndef RERNA_HPP
#define RERNA_HPP

#include <iostream>
using namespace std;

#define MIN_TEMP 0
#define MAX_TEMP 220
#define KORAK 20

enum StanjeRerne {UKLJUCENA, ISKLJUCENA, POKVARENA};

class Rerna
{
    private:
        StanjeRerne trenutnoStanje;
        int temperatura;
    public:
        Rerna();

        bool ukljuci();
        bool iskljuci();
        bool pokvari();
        bool popravi();

        bool pojacajTemperaturu();
        bool smanjiTemperaturu();

        StanjeRerne getTrenutnoStanje() const;
        int getTemperatura() const;
};

void ispisiRernu(const Rerna &);
int meni();

#endif // RERNA_HPP
