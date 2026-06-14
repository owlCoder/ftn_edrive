#ifndef STABLOJABUKE_HPP_INCLUDED
#define STABLOJABUKE_HPP_INCLUDED

#include "Stablo.hpp"

enum BojaJabuke {CRVENA, ZELENA, ZUTA};

class StabloJabuke : public Stablo {
    private:
        DinString tipStabla;
        int starost;
        DinString datumSadnje;
        BojaJabuke bojaJabuke;
        static int brojSadnice;
    public:
        StabloJabuke() : Stablo(), tipStabla("JABUKA"), starost(1), datumSadnje("01.01.2022."), bojaJabuke(ZELENA) { brojSadnice++; }
        StabloJabuke(const DinString &carstvo, const DinString &porodica, const DinString &rod, const int lotBroj, const DinString &tipStabla, const int starost, const DinString &datumSadnje, const BojaJabuke bojaJabuke) :
                     Stablo(carstvo, porodica, rod, lotBroj), tipStabla(tipStabla), starost(starost), datumSadnje(datumSadnje), bojaJabuke(bojaJabuke) { brojSadnice++; }
        StabloJabuke(const StabloJabuke &s) :Stablo(s.carstvo, s.porodica, s.rod, s.lotBroj), tipStabla(s.tipStabla), starost(s.starost), datumSadnje(s.datumSadnje), bojaJabuke(s.bojaJabuke) { brojSadnice++; }
        ~StabloJabuke() { brojSadnice--; }

        DinString getTipStabla() const { return tipStabla; }
        int getStarost() const { return starost; }
        DinString getDatumSadnje() const { return datumSadnje; }
        BojaJabuke getBojaJabuke() const { return bojaJabuke; }
        int getBrojSadnice() const { return brojSadnice; }

        void setTipStabla(const DinString &tipStabla) { this -> tipStabla = tipStabla; }
        void setStarost(const int starost) { this -> starost = starost; }
        void setDatumSadnje(const DinString &datumSadnje) { this -> datumSadnje = datumSadnje; }
        void setBojaJabuke(const BojaJabuke bojaJabuke) { this -> bojaJabuke = bojaJabuke; }

        DinString getTipPloda() const {
            DinString boja;

            if(bojaJabuke == ZELENA)
                boja = "ZELENA";
            else if(bojaJabuke == ZUTA)
                boja = "ZUTA";
            else
                boja = "CRVENA";

            return boja + " " + tipStabla;
        }

        double getPrinos() const {
            double koeficijentPrinosaSorte = 0.0;

            if(bojaJabuke == ZELENA)
                koeficijentPrinosaSorte = 22.9;
            else if(bojaJabuke == ZUTA)
                koeficijentPrinosaSorte = 31.5;
            else
                koeficijentPrinosaSorte = 24.5;

            return (starost * 0.8) * koeficijentPrinosaSorte;
        }

        StabloJabuke& operator=(const StabloJabuke &s) {
            carstvo     = s.carstvo;
            porodica    = s.porodica;
            rod         = s.rod;
            lotBroj     = s.lotBroj;
            tipStabla   = s.tipStabla;
            starost     = s.starost;
            datumSadnje = s.datumSadnje;
            bojaJabuke  = s.bojaJabuke;

            return *this;
        }

        friend ostream& operator<<(ostream &out, const StabloJabuke &s) {
            out << "------------------------------ STABLO JABUKE ------------------------------" << endl;
            out << "\tCarstvo: " << s.carstvo << endl;
            out << "\tPorodica: " << s.porodica << endl;
            out << "\tRod: " << s.rod << endl;
            out << "\tLot. broj: " << s.lotBroj << endl;
            out << "\tTip stabla: " << s.tipStabla << endl;
            out << "\tStarost: " << s.starost << endl;
            out << "\tDatum sadnje: " << s.datumSadnje << endl;
            out << "\tBoja jabuke: " << (s.bojaJabuke == ZELENA ? "ZELENA" : (s.bojaJabuke == ZUTA ? "ZUTA" : "CRVENA")) << endl << endl;

            return out;
        }

        void prevariOstream(ostream &out) const {
            out << "------------------------------ STABLO JABUKE ------------------------------" << endl;
            out << "\tCarstvo: " << carstvo << endl;
            out << "\tPorodica: " << porodica << endl;
            out << "\tRod: " << rod << endl;
            out << "\tLot. broj: " << lotBroj << endl;
            out << "\tTip stabla: " << tipStabla << endl;
            out << "\tStarost: " << starost << endl;
            out << "\tDatum sadnje: " << datumSadnje << endl;
            out << "\tBoja jabuke: " << (bojaJabuke == ZELENA ? "ZELENA" : (bojaJabuke == ZUTA ? "ZUTA" : "CRVENA")) << endl << endl;
        }

};

#endif // STABLOJABUKE_HPP_INCLUDED
