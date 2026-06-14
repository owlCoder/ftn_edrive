#ifndef PUTNIK_HPP_INCLUDED
#define PUTNIK_HPP_INCLUDED

#include "Karta.hpp"
#include "dinstring.hpp"

class Putnik {
    protected:
        Karta karta;
        DinString mb;
        DinString ime;
    public:
        Putnik() : karta(), mb("/"), ime("/") { }
        Putnik(const int brojKarte, const VrstaKarte vrsta, const DinString &mb, const DinString &ime) : karta(brojKarte, vrsta), mb(mb), ime(ime) { }

        DinString getMb() const { return mb; }
        DinString getIme() const { return ime; }
        int getBrojKarte()  const { return karta.getBroj(); }
        VrstaKarte getVrstaKarte() const { return karta.getVrsta(); }


        virtual DinString toString() const {
            return "\tIme: " + ime + "\n\tM.B: " + mb + "\n";
        }

        friend ostream& operator<<(ostream &out, const Putnik &p) {
            out << p.toString() << p.karta;

            return out;
        }
};

#endif // PUTNIK_HPP_INCLUDED
