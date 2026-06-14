#ifndef PROCESOR_H_INCLUDED
#define PROCESOR_H_INCLUDED

#include "dijagnostika.h"
#include <condition_variable>

using namespace std;
using namespace chrono;

class Procesor {
    private:
        Dijagnostika &dijagnostika;
        bool prekid;
        bool procesorZauzet;
        condition_variable obradjivac_prekida;
        condition_variable procesi;
        mutex m;

    public:
        Procesor(Dijagnostika &d) : dijagnostika(d) {
            prekid = false;
            procesorZauzet = false;
        }

        // Pomoćna metoda koja vraća referencu na objekat Dijagnostika asociran sa ovim objektom
        Dijagnostika& getDijagnostika() {
            return dijagnostika;
        }

        // Metoda koju poziva nit koja simulira proces, kako bi se izvršile sve naredbe procesa.
        //
        // id           - id procesa
        // broj_naredbi - ukupan broj naredbi koje ovaj proces izvršava
        //
        // Ukoliko je procesor već zauzet i ne mogu se izvršavati naredbe procesa, potrebno je pozvati
        // metodu dijagnostika.proces_ceka a nakon toga proces treba da pređe u stanje čekanja.
        // Kada proces uspe da zauzme procesor, pre izvršenja naredbe treba da se pozove dijagnostika.proces_izvrsava.
        // Nakon što je proces izvršio naredbu, potrebno je pozvati dijagnostika.proces_zavrsio.
        void izvrsi_proces(int id, int broj_naredbi) {
            for(int i = 0; i < broj_naredbi; i++) /// IZVRSAVAMO NAREDBU PO NAREDBU
            {
                unique_lock<mutex> lock(m); /// KRITICNA SEKCIJA

                while(procesorZauzet)
                {
                    dijagnostika.proces_ceka(id);
                    procesi.wait(lock); /// SACEKATI SVE DOK SE PROCESOR NE OSLOBODI
                }

                procesorZauzet = true;

                lock.unlock();
                this_thread::sleep_for(seconds(1));
                lock.lock();

                dijagnostika.proces_izvrsava(id, i);
                procesorZauzet = false;

                if(prekid) /// DESIO SE PREKID
                {
                    /// OBAVESTI OBRADJIVACA PREKIDA
                    obradjivac_prekida.notify_one();
                }
                else
                {
                    procesi.notify_one();
                    dijagnostika.proces_zavrsio(id, i);
                }

                lock.unlock();
                this_thread::sleep_for(milliseconds(100));
            }
        }

        // Metoda koju poziva nit koja simulira obrađivač U/I prekida kako bi se inicirao i obradio prekid.
        //
        // Ukoliko je procesor već zauzet i ne može se obaviti obrađivanje prekida, potrebno je pozvati metodu
        // dijagnostika.obradjivac_ceka a nakon toga obrađivač treba da pređe u stanje čekanja, dok se procesor ne oslobodi.
        // Kada obrađivač uspe da zauzme procesor, pre obrade prekida treba da se pozove dijagnostika.obradjivac_izvrsava.
        // Nakon što je obrađivač završio obradu, potrebno je pozvati dijagnostika.obradjivac_zavrsio.
        void prekini() {
            unique_lock<mutex> lock(m);
            prekid = true; /// DESIO SE PREKID (VESTACKI)
            dijagnostika.iniciran_prekid();

            while(procesorZauzet)
            {
                obradjivac_prekida.wait(lock);
                dijagnostika.obradjivac_ceka();
            }

            procesorZauzet = true; /// ZAUZMI PROCESOR ZA OBRADU PREKIDA
            dijagnostika.obradjivac_izvrsava();

            lock.unlock();
            this_thread::sleep_for(milliseconds(300));
            lock.lock();

            /// PREKID JE OBRADJEN, NASTAVI DALJE SA RADOM PROCESORA
            dijagnostika.obradjivac_zavrsio();
            procesorZauzet = false;
            prekid = false;
            procesi.notify_one();
        }
};

#endif // PROCESOR_H_INCLUDED
