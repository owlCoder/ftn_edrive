#ifndef BOJICA_HPP_INCLUDED
#define BOJICA_HPP_INCLUDED

#include "Olovka.hpp"
#include "dinstring.hpp"
#include "list.hpp"

enum Tip {DRVENA, VOSTANA};

class Bojica : public Olovka {
    private:
        Tip tip;
        DinString boja;
    public:
        Bojica() : Olovka(), tip(DRVENA), boja("CRVENA") { }
        Bojica(double cena, Tip tip, const DinString &boja) : Olovka(cena), tip(tip), boja(boja) { }

        Tip getTip() const { return tip; }
        DinString getBoja() const { return boja; }

        void setTip(const Tip tip) { this -> tip = tip; }
        void setBoja(const DinString &boja) { this -> boja = boja; }

        bool postaviCenu() {
            double novaCena = 0.0;

            cout << "Unesite novu cenu\n>> ";
            cin >> novaCena;

            if(novaCena > 0.0) {
                cena = novaCena;
                return true;
            }
            else {
                return false;
            }
        }

        friend ostream& operator<<(ostream &out, const Bojica &b) {
            out << "---------------------------- BOJICA ----------------------------" << endl;
            out << "Cena: " << b.cena << endl;
            out << "Tip: "  << (b.tip == DRVENA ? "DRVENA" : "VOSTANA") << endl;
            out << "Boja: " << b.boja << endl << endl;

            return out;
        }
};


#endif // BOJICA_HPP_INCLUDED
