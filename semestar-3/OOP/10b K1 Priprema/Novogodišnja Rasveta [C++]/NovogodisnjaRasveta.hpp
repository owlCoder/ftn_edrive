#ifndef NOVOGODISNJARASVETA_HPP_INCLUDED
#define NOVOGODISNJARASVETA_HPP_INCLUDED

#include "list.hpp"
#include "Lampion.hpp"

class NovogodisnjaRasveta {
    private:
        List<Lampion *> lampioni;
        int kapacitet;
    public:
        NovogodisnjaRasveta() : lampioni(), kapacitet(5) { }

        int getKapacitet() const { return kapacitet; }
        void setKapacitet(const int kapacitet) { this -> kapacitet = kapacitet; }

        bool dodaj(Lampion &l) {
            if(lampioni.size() >= kapacitet) {
                cout << endl << "KAPACITET JE POPUNJEN!" << endl << endl;
                return false;
            }
            else {
                if(!l.getIspravan()) {
                    l.popravi();
                }

                if(l.getIspravan() && (l.getMaterijal() == STIROPOR)) {
                    return lampioni.add(1, &l);
                }
                else  if(l.getIspravan() && (l.getMaterijal() != STIROPOR)) {
                    return lampioni.add(lampioni.size() + 1, &l);
                }
                else {
                    return false;
                }
            }
        }

        void sortiraj() {
            int izbor;
            cout << endl << "ODABIR SORTIRANJA [0 - OPADAJUCE; 1 - RASTUCE]\n>> ";
            cin  >> izbor;

            if(izbor == 0) {
                if(lampioni.empty()) {
                    cout << endl << "NEMA LAMPIONA!" << endl;
                    return;
                }
                else if(lampioni.size() >= 2) {
                    Lampion *l1, *l2;

                    for(int i = 1; i < lampioni.size(); i++) {
                        for(int j = i + 1; j <= lampioni.size(); j++) {
                            lampioni.read(i, l1);
                            lampioni.read(j, l2);

                            if(l1 -> getCena() < l2 -> getCena()) {
                                lampioni.remove(i);
                                lampioni.add(i, l2);
                                lampioni.remove(j);
                                lampioni.add(j, l1);
                            }
                        }
                    }
                }

                Lampion *l1;

                // ISPIS LAMPIONA
                for(int i = 1; i <= lampioni.size(); i++) {
                        lampioni.read(i, l1);
                        l1 -> ispis();
                }

            }
            else if(izbor == 1) {
                if(lampioni.empty()) {
                    cout << endl << "NEMA LAMPIONA!" << endl;
                    return;
                }
                else if(lampioni.size() >= 2) {
                    Lampion *l1, *l2;

                    for(int i = 1; i < lampioni.size(); i++) {
                        for(int j = i + 1; j <= lampioni.size(); j++) {
                            lampioni.read(i, l1);
                            lampioni.read(j, l2);

                            if(l1 -> getCena() > l2 -> getCena()) {
                                lampioni.remove(i);
                                lampioni.add(i, l2);
                                lampioni.remove(j);
                                lampioni.add(j, l1);
                            }
                        }
                    }
                }

                Lampion *l1;

                // ISPIS LAMPIONA
                for(int i = 1; i <= lampioni.size(); i++) {
                        lampioni.read(i, l1);
                        l1 -> ispis();
                }
            }
            else {
                cout << endl << "NEVALIDNA VREDNOST VRSTE SORTIRANJA!" << endl << endl;
            }
        }

        void sprovediAkciju(double procenat) {
            double smanjenje = 1.0 - (procenat / 100);
            Lampion *tmp;

            for(int i = 1; i <= lampioni.size(); i++) {
                lampioni.read(i, tmp);
                tmp -> setCena(tmp -> getCena() * smanjenje);
            }
        }

        friend ostream& operator<<(ostream &out, const NovogodisnjaRasveta &nr) {
            out << endl << "------------------------------------ NOVOGODISNJA RASVETA --------------------------------" << endl << endl;
            // ISPIS LAMPIONA
                for(int i = 1; i <= nr.lampioni.size(); i++) {
                        Lampion *l1;
                        nr.lampioni.read(i, l1);
                        l1 -> ispis();
                }

            return out;
        }
};

#endif // NOVOGODISNJARASVETA_HPP_INCLUDED
