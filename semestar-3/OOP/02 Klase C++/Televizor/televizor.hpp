#ifndef TELEVIZOR_HPP
#define TELEVIZOR_HPP

#include <iostream>
using namespace std;

enum StanjeTelevizora {UKLJUCEN, ISKLJUCEN, POKVAREN};

class Televizor
{
    private:
        StanjeTelevizora stanje;
        int zvuk, kanal;

    public:
        Televizor();
        Televizor(const Televizor &);

        bool ukljuci();
        bool iskljuci();
        bool pokvari();
        bool popravi();

        bool pojacajZvuk();
        bool smanjiZvuk();
        bool sledeciKanal();
        bool prethodniKanal();

        StanjeTelevizora getStanje() const { return stanje; }
        int getZvuk() const { return zvuk; }
        int getKanal() const { return kanal; }
};

string stanjeToStr(const StanjeTelevizora);
void ispis(const Televizor &);
int meni();

#endif // TELEVIZOR_HPP
