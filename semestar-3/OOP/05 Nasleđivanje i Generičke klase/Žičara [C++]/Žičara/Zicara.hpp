#ifndef ZICARA_HPP_INCLUDED
#define ZICARA_HPP_INCLUDED

#include "PutnikDete.hpp"
#include "list.hpp"

enum StanjeZicare {OTVORENA, ZATVORENA};

template<VrstaKarte SEZONA, int BROJ_SEDISTA, int INTERVAL>
class Zicara {
    private:
        List<Putnik *> putnici;
        StanjeZicare stanje;
        int ukupnoVoznji;
        int ukupnoMinuta;
    public:
        Zicara() : putnici(), stanje(ZATVORENA), ukupnoVoznji(0), ukupnoMinuta(0) { }

        void otvori() {
            stanje = OTVORENA;
            ukupnoVoznji = 0;
            ukupnoMinuta = 0;
        }

        void zatvori() {
            stanje = ZATVORENA;
            putnici.clear();
        }

        bool dodajPutnika(Putnik &p) {
            if(putnici.empty()) {
                return putnici.add(1, &p);
            }
            else {
                Putnik *tmp;
                for(int i = 1; i <= putnici.size(); i++) {
                    putnici.read(i, tmp);

                    if(tmp -> getMb() == p.getMb()) {
                        return false;
                    }
                }
                return putnici.add(putnici.size() + 1, &p);
            }
        }

        int brojPutnika() const { return putnici.size(); }

        bool preveziTuru() {
            if(stanje == ZATVORENA) {
                return false;
            }
            else {
                if(brojPutnika() == 0) {
                    return false;
                }

                // UKLANJAJU SE PUTNICI KOJI NEMAJU VALIDNE KARTE
                Putnik *tmp;
                for(int i = 1; i <= putnici.size(); i++) {
                    putnici.read(i, tmp);

                    if(tmp -> getVrstaKarte() != SEZONA) {
                        putnici.remove(i);
                    }
                }

                if(brojPutnika() < BROJ_SEDISTA) {
                    ukupnoVoznji += brojPutnika();
                    ukupnoMinuta += INTERVAL;

                    putnici.clear(); // posto ima manje putnika
                                     // svi ce biti prevezeni
                    return true;
                }
                else {
                    int brojPrevezenih = BROJ_SEDISTA;
                    for(int i = 1; i <= brojPrevezenih; i++) {
                        putnici.remove(1);
                    }

                    ukupnoVoznji += brojPrevezenih;
                    ukupnoMinuta += INTERVAL;

                    return true;
                }
            }
        }

        friend ostream& operator<<(ostream &out, const Zicara &z) {
            out << "------------------------------- ZICARA ------------------------------" << endl;
            out << "\tSezona: " << (SEZONA == LETO ? "LETO": (SEZONA == SKI ? "SKI" : "SKI_OPENING"));
            out << "\n\tBroj sedista: " << BROJ_SEDISTA;
            out << "\n\tInterval: " << INTERVAL;
            out << "\n\tStanje: " << (z.stanje == OTVORENA ? "OTVORENA" : "ZATVORENA");
            out << "\n\tUkupan broj voznji: " << z.ukupnoVoznji << " voznji";

            int sati = z.ukupnoMinuta / 60;
            int minuta = z.ukupnoMinuta - (sati * 60);

            out << "\n\tUkupno radno vreme: " << sati << "h " << minuta << "m";
            out << "\n\tPutnika u redu: " << z.brojPutnika() << " putnika" << endl << endl;

            Putnik *tmp;
            for(int i = 1; i <= z.brojPutnika(); i++) {
                z.putnici.read(i, tmp);
                out << *tmp << endl;
            }
            out << endl;

            return out;
        }
};

#endif // ZICARA_HPP_INCLUDED
