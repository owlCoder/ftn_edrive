#include "Bojica.hpp"
#include "Pernica.hpp"

int Pernica::drvenihBojicaNaAkciji = 0;

int main(void)
{
    Bojica b1, b2(100, VOSTANA, "PLAVA");

    b1.setBoja("ZELENA");
    b2.setTip(VOSTANA);
    cout << "B1: " << b1.getBoja() << ", " << b1.getTip() << endl << endl;

    cout << (b1.postaviCenu() == true ? "\nCENA IZMENJENA!\n" : "\nNEGATIVNA CENA!\n") << endl;
    cout << b1 << b2 << endl;


    Pernica p;

    p.dodajUPonudu(b1);
    p.dodajUPonudu(b2);
    p.akcija("PLAVA");

    cout << endl << p << endl << endl;

    return 0;
}
