#ifndef PERNICA_HPP_INCLUDED
#define PERNICA_HPP_INCLUDED

#include "Bojica.hpp"

class Pernica {
    private:
        List<Bojica> bojice;
        List<Bojica> bojiceNaAkciji;
        static int drvenihBojicaNaAkciji;
    public:
        Pernica() : bojice(), bojiceNaAkciji() { }
        bool dodajUPonudu(const Bojica b) {
            if(b.getTip() == DRVENA) {
                return bojice.add(bojice.size() + 1, b);
            }
            else if(b.getTip() == VOSTANA) {
                return bojice.add(1, b);
            }
            else {
                return false;
            }
        }
        bool akcija(const DinString &bojaBojice) {
            if(bojice.empty()) {
                return false;
            }
            else {
                Bojica tmp;
                for(int i = 1; i <= bojice.size(); i++) {
                    bojice.read(i, tmp);

                    if(tmp.getBoja() == bojaBojice && tmp.postaviCenu() && bojice.remove(i)) {
                        cout << endl << "USPESNA REALIZACIJA AKCIJE!" << endl << endl;
                        if(tmp.getTip() == DRVENA)
                            drvenihBojicaNaAkciji++;

                        return bojiceNaAkciji.add(1, tmp);
                    }
                    else {
                        cout << endl << "AKCIJA NIJE PRIMENJENA!" << endl << endl;
                        return false;
                    }
                }
            }
            return false;
        }

        friend ostream& operator<<(ostream &out, const Pernica &p) {
            out << "BROJ DRVENIH BOJICA NA AKCIJI: " << p.drvenihBojicaNaAkciji << endl;
            out << "LISTA BOJICA JE: " << p.bojice << endl << endl;
            out << "LISTA BOJICA NA AKCIJI JE: " << p.bojiceNaAkciji << endl << endl;

            return out;
        }
};

#endif // PERNICA_HPP_INCLUDED
