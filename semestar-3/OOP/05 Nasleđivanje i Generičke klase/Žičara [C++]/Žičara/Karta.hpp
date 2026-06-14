#ifndef KARTA_HPP_INCLUDED
#define KARTA_HPP_INCLUDED

#include <iostream>
using namespace std;

enum VrstaKarte {LETO, SKI, SKI_OPENING};

class Karta {
    private:
        int brojKarte;
        VrstaKarte vrsta;
    public:
        Karta() : brojKarte(1), vrsta(SKI) { }
        Karta(const int brojKarte, const VrstaKarte vrsta) : brojKarte(brojKarte), vrsta(vrsta) { }
        Karta(const Karta &k) : brojKarte(k.brojKarte), vrsta(k.vrsta) { }

        int getBroj() const { return brojKarte; }
        VrstaKarte getVrsta() const { return vrsta; }

        void setBroj(const int brojKarte) { this -> brojKarte = brojKarte; }
        void setVrsta(const VrstaKarte vrsta) { this -> vrsta = vrsta; }

        friend ostream& operator<<(ostream &out, const Karta &k) {
            out << "--------------------------- KARTA ---------------------------" << endl;
            out << "\tBroj karte: " << k.brojKarte << endl;
            out << "\tVrsta karte: ";
            out << (k.vrsta == LETO ? "LETO"
                 : (k.vrsta == SKI ? "SKI" : "SKI_OPENING"));
            out << endl;

            return out;
        }
};

#endif // KARTA_HPP_INCLUDED
