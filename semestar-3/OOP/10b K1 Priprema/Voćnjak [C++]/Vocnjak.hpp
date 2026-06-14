#ifndef VOCNJAK_HPP_INCLUDED
#define VOCNJAK_HPP_INCLUDED

#include "StabloJabuke.hpp"
#include "StabloSljive.hpp"

class Vocnjak {
    private:
        List<Stablo *> sadrzajVocnjaka;
        int godinaEksploatacije;
    public:
        Vocnjak() : sadrzajVocnjaka(), godinaEksploatacije(0) { }
        Vocnjak(const int godinaEksploatacije) : godinaEksploatacije(0) { }
        Vocnjak(const Vocnjak &v) : godinaEksploatacije(v.godinaEksploatacije) { }

        List<Stablo *> getSadrzajVocnjaka() const {
            return sadrzajVocnjaka;
        }

        bool dodajStablo(Stablo &s) {
            if(sadrzajVocnjaka.empty()) {
                return sadrzajVocnjaka.add(1, &s);
            }

            Stablo *tmp;

            for(int i = 1; i <= sadrzajVocnjaka.size(); i++) {
                sadrzajVocnjaka.read(i, tmp);

                if(tmp -> getLotBroj() == s.getLotBroj()) {
                    return false;
                }
            }
            return sadrzajVocnjaka.add(sadrzajVocnjaka.size() + 1, &s);
        }

        void sortiraj(const DinString &nacinSortiranja) {
            if(sadrzajVocnjaka.empty()) {
                cout << endl << "VOCNJAK JE PRAZAN!" << endl;
                return;
            }

            if(nacinSortiranja == "RASTUCE") {
                Stablo *s1, *s2;

                 for(int i = 1; i < sadrzajVocnjaka.size(); i++) {
                        for(int j = i + 1; j <= sadrzajVocnjaka.size(); j++) {
                            sadrzajVocnjaka.read(i, s1);
                            sadrzajVocnjaka.read(j, s2);

                            if(s1 -> getLotBroj() < s2 -> getLotBroj()) {
                                sadrzajVocnjaka.remove(i);
                                sadrzajVocnjaka.add(i, s2);
                                sadrzajVocnjaka.remove(j);
                                sadrzajVocnjaka.add(j, s1);
                            }
                        }
                    }
            }
            else if(nacinSortiranja == "OPADAJUCE") {
                Stablo *s1, *s2;

                for(int i = 1; i < sadrzajVocnjaka.size(); i++) {
                       for(int j = i + 1; j <= sadrzajVocnjaka.size(); j++) {
                            sadrzajVocnjaka.read(i, s1);
                            sadrzajVocnjaka.read(j, s2);

                            if(s1 -> getLotBroj() > s2 -> getLotBroj()) {
                                sadrzajVocnjaka.remove(i);
                                sadrzajVocnjaka.add(i, s2);
                                sadrzajVocnjaka.remove(j);
                                sadrzajVocnjaka.add(j, s1);
                            }
                        }
                    }
            }
            else {
                return;
            }
        }

        Stablo* pronadji(const int lotBrojStabla) {
            if(sadrzajVocnjaka.empty()) {
                return NULL;
            }
            else {
                Stablo *tmp;

                for(int i = 1; i <= sadrzajVocnjaka.size(); i++) {
                    sadrzajVocnjaka.read(i, tmp);

                    if(tmp -> getLotBroj() == lotBrojStabla) {
                        return tmp;
                    }
                }
                return NULL;
            }
        }

        int prebroj(const DinString &ts) const {
            if(sadrzajVocnjaka.empty()) {
                return 0;
            }
            else {
                Stablo *tmp;
                int brojStabla = 0;

                for(int i = 1; i <= sadrzajVocnjaka.size(); i++) {
                    sadrzajVocnjaka.read(i, tmp);

                    if(tmp -> getTipStabla() == ts) {
                        brojStabla++;
                    }
                }
                return brojStabla;
            }
        }

        friend ostream& operator<<(ostream &out, const Vocnjak &v) {
            if(v.sadrzajVocnjaka.empty()) {
                out << endl << "VOCNJAK JE PRAZAN!" << endl << endl;
            }
            else
            {
                out << "------------------------- VOCNJAK -----------------------" << endl;

                for(int i = 1; i <= v.sadrzajVocnjaka.size(); i++) {
                    Stablo *tmp;
                    v.sadrzajVocnjaka.read(i, tmp);
                    out << *tmp;
                }
            }

            return out;
        }
};

#endif // VOCNJAK_HPP_INCLUDED
