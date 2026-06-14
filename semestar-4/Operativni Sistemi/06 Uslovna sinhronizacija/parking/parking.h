#ifndef PARKING_H_INCLUDED
#define PARKING_H_INCLUDED

#include "automobil.h"
#include <mutex>
#include <condition_variable>

using namespace std;

class Parking {
    private:
        Automobil &automobil;
        bool slobodno;
        mutex m;
        condition_variable cv;
    public:
        Parking(Automobil &a) : automobil(a), slobodno(true) { }

        // Metoda koju poziva nit koja simulira kretanje automobila kako bi automobil pokusao da se parkira.
        // Ako je parking zauzet, izvrsenje ove metode ce trajati dok se parking ne oslobodi i auto se parkira.
        //
        // rbr - Redni broj automobila
        //
        // Potrebno je pozvati metodu automobil.ceka kada je parking zauzet i auto mora da ceka.
        // Potrebno je pozvati metodu automobil.parkira kada auto uspe da se parkira.
        void udji(int rbr)
        {
            unique_lock<mutex> l(m);
            if(!slobodno)
            {
                automobil.ceka(rbr);
                while(!slobodno)
                {
                    /*
                    l.unlock();
                    l.lock();
                    */
                    cv.wait(l);
                }
            }

            automobil.parkira(rbr);
            slobodno = false;
        }

        // Metoda koju poziva nit koja simulira kretanje automobila kada auto izlazi sa parkinga (nakon sto je bio parkiran).
        //
        // rbr - Redni broj automobila
        //
        // Potrebno je pozvati metodu automobil.napusta kada auto napusta parking mesto.
        void izadji(int rbr) {
            unique_lock<mutex> l(m);
            automobil.napusta(rbr);
            slobodno = true;
            cv.notify_one(); /// BUDJENJE JEDNE NITI
        }
};

#endif // PARKING_H_INCLUDED
