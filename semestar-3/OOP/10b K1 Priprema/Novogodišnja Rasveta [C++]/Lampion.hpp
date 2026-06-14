#ifndef LAMPION_HPP_INCLUDED
#define LAMPION_HPP_INCLUDED

#include "Fenjer.hpp"

class Lampion : public Fenjer {
    private:
        double cena;
        static int instanceLampiona;
    public:
        Lampion() : Fenjer(), cena(0) { instanceLampiona++; }
        Lampion(const Materijal materijal, const bool ispravan, const double cena) : Fenjer(materijal, ispravan), cena(cena) { instanceLampiona++; }
        ~Lampion() { instanceLampiona--; }

        double getCena() const { return cena; }
        int getInstanceLampiona() const { return instanceLampiona; }

        void setCena(const double cena) { this -> cena = cena; }

        bool popravi() {
            if(!ispravan) {
                ispravan = true;
                return true;
            }
            else {
                return false;
            }
        }

        void ispis() const {
            cout << "------------------------ LAMPION ------------------------" << endl;
            Fenjer::ispis();
            cout << "\tCena: " << cena << " RSD" << endl << endl;
        }
};


#endif // LAMPION_HPP_INCLUDED
