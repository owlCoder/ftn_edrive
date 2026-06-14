#ifndef STABLOSLJIVE_HPP_INCLUDED
#define STABLOSLJIVE_HPP_INCLUDED

#include "Stablo.hpp"

class StabloSljive : public Stablo {
        private:
        DinString tipStabla;
        int starost;
        DinString datumSadnje;
        static int brojSadnice;
        bool zdravo;
    public:
        StabloSljive() : Stablo(), tipStabla("SLJIVA"), starost(1), datumSadnje("01.01.2022."), zdravo(true) { brojSadnice++; }
        StabloSljive(const DinString &carstvo, const DinString &porodica, const DinString &rod, const int lotBroj, const DinString &tipStabla, const int starost, const DinString &datumSadnje, const bool zdravo) :
                     Stablo(carstvo, porodica, rod, lotBroj), tipStabla(tipStabla), starost(starost), datumSadnje(datumSadnje), zdravo(zdravo) { brojSadnice++; }
        StabloSljive(const StabloSljive &s) :Stablo(s.carstvo, s.porodica, s.rod, s.lotBroj), tipStabla(s.tipStabla), starost(s.starost), datumSadnje(s.datumSadnje), zdravo(s.zdravo) { brojSadnice++; }
        ~StabloSljive() { brojSadnice--; }

        DinString getTipStabla() const { return tipStabla; }
        int getStarost() const { return starost; }
        DinString getDatumSadnje() const { return datumSadnje; }
        bool getZdravo() const { return zdravo; }
        int getBrojSadnice() const { return brojSadnice; }

        void setTipStabla(const DinString &tipStabla) { this -> tipStabla = tipStabla; }
        void setStarost(const int starost) { this -> starost = starost; }
        void setDatumSadnje(const DinString &datumSadnje) { this -> datumSadnje = datumSadnje; }
        void setZdravo(const bool zdravo) { this -> zdravo = zdravo; }

        DinString getTipPloda() const {
            return tipStabla;
        }

        double getPrinos() const {
            double koeficijentPrinosaSorte = 12.45;
            int uzeto = brojSadnice, generacija = 0;

            while(uzeto >= 0) {
                generacija++;
                uzeto -= 3;
            }

            while(generacija >= 0) {
                koeficijentPrinosaSorte *= 0.97;
                generacija--;
            }

            return (starost * 0.65) * koeficijentPrinosaSorte;
        }

        bool hemijskiTretman() {
            if(zdravo) {
                return false;
            }
            else {
                zdravo = true;
                return true;
            }
        }

        friend ostream& operator<<(ostream &out, const StabloSljive &s) {
            out << "------------------------------ STABLO SLJIVE ------------------------------" << endl;
            out << "\tCarstvo: " << s.carstvo << endl;
            out << "\tPorodica: " << s.porodica << endl;
            out << "\tRod: " << s.rod << endl;
            out << "\tLot. broj: " << s.lotBroj << endl;
            out << "\tTip stabla: " << s.tipStabla << endl;
            out << "\tStarost: " << s.starost << endl;
            out << "\tDatum sadnje: " << s.datumSadnje << endl;
            out << "\tZdravo: " << (s.zdravo == true ? "DA" : "NE") << endl << endl;

            return out;
        }

        void prevariOstream(ostream &out) const {
            out << "------------------------------ STABLO SLJIVE ------------------------------" << endl;
            out << "\tCarstvo: " << carstvo << endl;
            out << "\tPorodica: " << porodica << endl;
            out << "\tRod: " << rod << endl;
            out << "\tLot. broj: " << lotBroj << endl;
            out << "\tTip stabla: " << tipStabla << endl;
            out << "\tStarost: " << starost << endl;
            out << "\tDatum sadnje: " << datumSadnje << endl;
            out << "\tZdravo: " << (zdravo == true ? "DA" : "NE") << endl << endl;

        }
};


#endif // STABLOSLJIVE_HPP_INCLUDED
