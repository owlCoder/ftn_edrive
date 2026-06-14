#ifndef PUTNIKDETE_HPP_INCLUDED
#define PUTNIKDETE_HPP_INCLUDED

#include "Putnik.hpp"

class PutnikDete : public Putnik {
    private:
        DinString mbRoditelja;
    public:
        PutnikDete() : Putnik(), mbRoditelja("/") { }
        PutnikDete(const int brojKarte, const VrstaKarte vrsta, const DinString &mb, const DinString &ime, const DinString &mbRoditelja) : Putnik(brojKarte, vrsta, mb, ime), mbRoditelja(mbRoditelja) { }
        PutnikDete(const Putnik &p, const DinString &mbRoditelja) : Putnik(p.getBrojKarte(), p.getVrstaKarte(), p.getMb(), p.getIme()), mbRoditelja(mbRoditelja) { }

        virtual DinString toString() const {
            cout << "DETE\n" << Putnik::toString() << Putnik::karta
                 << "\tM.B. Roditelja: " << mbRoditelja << endl;
            return "";
        }
};

#endif // PUTNIKDETE_HPP_INCLUDED
