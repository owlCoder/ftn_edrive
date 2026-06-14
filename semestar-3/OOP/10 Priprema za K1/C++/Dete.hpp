#ifndef DETE_HPP_INCLUDED
#define DETE_HPP_INCLUDED

#include "dinstring.hpp"

enum Pol {DECAK, DEVOJCICA};

class Dete {
    protected:
        DinString nadimak;
        Pol pol;
        int uzrast;
        bool zasluzenNovogodisnjiPaketic;
    public:
        Dete() : nadimak(""), pol(DECAK), uzrast(0), zasluzenNovogodisnjiPaketic(false) { }
        Dete(const DinString & nadimak, Pol pol, int uzrast, bool znp) : nadimak(nadimak), pol(pol), uzrast(uzrast), zasluzenNovogodisnjiPaketic(znp) { }
        Dete(const Dete &d) : nadimak(d.nadimak), pol(d.pol), uzrast(d.uzrast), zasluzenNovogodisnjiPaketic(d.zasluzenNovogodisnjiPaketic) { }

        // GET METODE
        DinString getNadimak() const { return nadimak; }
        Pol getPol() const { return pol; }
        int getUzrast() const { return uzrast; }
        bool getZasluzenNovogodisnjiPaketic() const { return zasluzenNovogodisnjiPaketic; }

        // SET METODE
        void setNadimak(DinString nadimak) { this -> nadimak = nadimak; }
        void setPol(Pol pol) { this -> pol = pol; }
        void setUzrast(int uzrast) { this -> uzrast = uzrast; }
        void setZasluzenNovogodisnjiPaketic(bool znp) { zasluzenNovogodisnjiPaketic = znp; }

        // PREKLOPLJEN OPERATOR ISPISA
        friend ostream& operator<<(ostream &izlaz, const Dete &d) {
            /* ----- PRVI NACIN -----
            string pol, zasluzenPaketic;

            if(d.pol == DECAK)
                pol = "DECAK";
            else if(d.pol == DEVOJCICA)
                pol = "DEVOJCICA";
            else
                pol = "NEPOZNATO";

            if(d.zasluzenNovogodisnjiPaketic == true)
                zasluzenPaketic = "ZASLUZEN JE PAKETIC!";
            else
                zasluzenPaketic = "NIJE ZASLUZEN PAKETIC!";

            //////////////////////// NE PRIPADA ELSE /////////////////////////////
            izlaz << "DETE" << endl
              << "\tNadimak: " << d.nadimak << endl
              << "\tPol: " << pol << endl
              << "\tUzrast: " << d.uzrast << endl
              << "\tZasluzen paketic: " << zasluzenPaketic << endl << endl;
            */

            // DRUGI NACIN
            izlaz << "------------------------ DETE ------------------------" << endl
                  << "\tNadimak: " << d.nadimak << endl
                  << "\tPol: " << (d.pol == DECAK ? "DECAK" : "DEVOJCICA") << endl
                  << "\tUzrast: " << d.uzrast << endl
                  << "\tZasluzen paketic: "
                  << (d.zasluzenNovogodisnjiPaketic == true ? "ZASLUZEN JE PAKETIC!" : "NIJE ZASLUZEN PAKETIC!") << endl << endl;

            return izlaz;
        }
};

#endif // DETE_HPP_INCLUDED
