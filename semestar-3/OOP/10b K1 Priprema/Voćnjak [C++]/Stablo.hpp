#ifndef STABLO_HPP_INCLUDED
#define STABLO_HPP_INCLUDED

#include "dinstring.hpp"
#include "list.hpp"

class Stablo {
    protected:
        DinString carstvo;
        DinString porodica;
        DinString rod;
        int lotBroj;
        static int rbrSadnice;
    public:
        Stablo() : carstvo(""), porodica(""), rod(""), lotBroj(0) { rbrSadnice++; }
        Stablo(const DinString &carstvo, const DinString &porodica, const DinString &rod, const int lotBroj) : carstvo(carstvo), porodica(porodica), rod(rod), lotBroj(lotBroj) { rbrSadnice++; }
        ~Stablo() { rbrSadnice--; }

        DinString getCarstvo() const { return carstvo; }
        DinString getPorodica() const { return porodica; }
        DinString getRod() const { return rod; }
        int getLotBroj() const { return lotBroj; }
        int getRbrSadnice() const { return rbrSadnice; }

        void setCarstvo(const DinString &carstvo) { this -> carstvo = carstvo; }
        void setPorodica(const DinString &porodica) { this -> porodica = porodica; }
        void setRod(const DinString &rod) { this -> rod = rod; }
        void setLotBroj(const int lotBroj) { this -> lotBroj = lotBroj; }

        virtual DinString getTipPloda() const = 0;
        virtual double getPrinos() const = 0;
        virtual DinString getTipStabla() const = 0;

        virtual void prevariOstream(ostream& os) const = 0;

        friend ostream& operator<<(ostream& os, const Stablo& stablo) {
            stablo.prevariOstream(os);
            return os;
        }
};

#endif // STABLO_HPP_INCLUDED
