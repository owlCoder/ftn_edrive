#ifndef DEDAMRAZ_HPP_INCLUDED
#define DEDAMRAZ_HPP_INCLUDED

#include "NovogodisnjiPaketic.hpp"
#include "list.hpp"

class DedaMraz {
    private:
        List<NovogodisnjiPaketic> paketici;
    public:
        DedaMraz() : paketici() { }

        bool dodaj(const DinString &opis, const Dete &d , int uzrast, Pol pol) {
            int brojPaketicaUVreci = 0;

            NovogodisnjiPaketic paketic(opis, d, uzrast);
            NovogodisnjiPaketic tmp; // trenutni paketic koji citamo/gledamo
            paketic.isporuci();

            if(paketici.empty()) { // vreca je prazna
                if(paketici.add(1, paketic))
                    return true;
            }
            else { // ima barem jedan ili vise paketica u vreci
                for(int i = 1; i <= paketici.size(); i++) {
                    paketici.read(i, tmp);
                    // p1 p2 p3
                    // tmp = p1
                    if(tmp.getNamenjen().getPol() == pol)
                        brojPaketicaUVreci++;
                }

                if(brojPaketicaUVreci < 5)
                    return paketici.add(paketici.size() + 1, paketic);
            }
            return false;
        }

        bool izbaci(int minBrojGodina) {
            NovogodisnjiPaketic tmp;

            for(int i = 1; i <= paketici.size(); i++) {
                paketici.read(i, tmp);

                if(tmp.getMinimalniUzrast() < minBrojGodina)
                    return paketici.remove(i);
            }
            return false;
        }

        double prosecanMinimalanUzrast() {
            double prosek = 0.0;

            for(int i = 1; i <= paketici.size(); i++) {
                NovogodisnjiPaketic tmp;
                paketici.read(i, tmp);

                prosek += tmp.getMinimalniUzrast();
            }
            return prosek / paketici.size();
        }

        void ispisi() const {
            cout << "-------------------- DEDA MRAZ --------------------" << endl;
            if(paketici.empty()) {
                    cout << "VRECA JE PRAZNA!" << endl << endl;
            }
            else {
                for(int i = 1; i <= paketici.size(); i++) {
                    NovogodisnjiPaketic tmp;
                    paketici.read(i, tmp);

                    tmp.ispisi();
                }
            }
        }
};

#endif // DEDAMRAZ_HPP_INCLUDED
