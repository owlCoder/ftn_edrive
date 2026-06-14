#ifndef NOVOGODISNJIPAKETIC_HPP_INCLUDED
#define NOVOGODISNJIPAKETIC_HPP_INCLUDED

#include "Paketic.hpp"

class NovogodisnjiPaketic : public Paketic {
    private:
        int minimalanUzrast;
        // svako staticko polje SVAKI KONSTRUKTOR UVECAVA ZA 1 (napravljeniNovogodisnjiPaketici++;)
        // DESTRUKTOR SMANJUJE ZA 1 (napravljeniNovogodisnjiPaketici--;)
        static int napravljeniNovogodisnjiPaketici; // staticko polje
    public:
        // KONSTRUKTOR BEZ PARAMETARA
        NovogodisnjiPaketic() : Paketic(), minimalanUzrast(0) {
            napravljeniNovogodisnjiPaketici++;
        }

        // KONSTRUKTOR SA PARAMETRIMA
        NovogodisnjiPaketic(const DinString &opis, const Dete &d, int minimalanUzrast) : Paketic(opis, d), minimalanUzrast(minimalanUzrast) {
            napravljeniNovogodisnjiPaketici++;
        }

        // DESTRUKTOR
        ~NovogodisnjiPaketic() {
            napravljeniNovogodisnjiPaketici--;
        }

        // GET METODE
        int getMinimalniUzrast() const { return minimalanUzrast; }
        int getNapravljeniNovogodisnjiPaketici() const { return napravljeniNovogodisnjiPaketici; }

        // METODA ZA ISPORUKU NOV. PAKETICA
        bool isporuci() {
            bool statusPaketica = Paketic::spakuj();  // ako je status true, paketic je spakovan i spreman za isporuku
            bool zasluzeno = namenjen.getZasluzenNovogodisnjiPaketic();

            if(statusPaketica == true && zasluzeno == true) {
                status = ISPORUCEN;
                cout << "Novogodisnji paketic ce uskoro biti isporucen." << endl
                     << "Primalac je: " << namenjen.getNadimak() << endl << endl;

                return true;
            }
            else {
                cout << "Novogodisnji paketic ne moze biti isporucen!" << endl << endl;
                return false;
            }
        }

        // PREKLOPLJEN OPERATOR ISPISA
        /*
        friend ostream& operator<<(ostream &izlaz, const NovogodisnjiPaketic &n) {
            izlaz << "----------------- NOVOGODISNJI PAKETIC -----------------" << endl
                  << "\tOpis: " << n.opis << endl
                  << "\tStatus: " << n.status << endl
                  << "\tMin. uzrast: " << n.minimalanUzrast << endl
                  << n.namenjen << endl;

            return izlaz;
        }
        */
        void ispisi() const {
            string statusPaketica;
            switch(status) {
                case ISPORUCEN:  statusPaketica = "ISPORUCEN.";  break;
                case NAPRAVLJEN: statusPaketica = "NAPRAVLJEN."; break;
                case SPAKOVAN:   statusPaketica = "SPAKOVAN.";   break;
                default:         statusPaketica = "NEPOZNAT.";
            }
            cout << "----------------- NOVOGODISNJI PAKETIC -----------------" << endl
                  << "\tOpis: " << opis << endl
                  << "\tStatus: " << statusPaketica << endl
                  << "\tMin. uzrast: " << minimalanUzrast << endl
                  << namenjen << endl;
        }
};

#endif // NOVOGODISNJIPAKETIC_HPP_INCLUDED
