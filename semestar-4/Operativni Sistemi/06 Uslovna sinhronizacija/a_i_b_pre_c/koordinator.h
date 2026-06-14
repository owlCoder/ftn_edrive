#ifndef KOORDINATOR_H_INCLUDED
#define KOORDINATOR_H_INCLUDED

#include <mutex>
#include <condition_variable>
using namespace std;

class Koordinator
{
        const int cekam_niti;                       // Konstanta koja govori koliko niti se ceka na
                                                    // zavrsetak pre nego sto se aktivira poslednja.
        int zavrseno_niti;                          // Brojac koji govori koliko je niti zavrseno.
                                                    // Uporedjuje se sa konstantom cekam_niti.
        mutex m;                                    // Mutex i uslovna promenljiva.
                                                    // Neophodni UVEK za eksplicitnu sinhronizaciju izmedju niti.
        condition_variable c;
    public:
        // Konstruktor. Ceka se niti koliko se prosledi.
        Koordinator(int cn) : cekam_niti(cn), zavrseno_niti(0) { }

        // Funkcija koju na svom KRAJU zovu niti (a i b) koje ne cekaju (izvrsavaju se odmah).
        void zavrsio()
        {
            unique_lock<mutex> lock(m);
            if(++zavrseno_niti == cekam_niti)       // Provera brojaca. Ukoliko je zavrseno niti == cekam_niti,
                                                    // obavestavaju se sve niti (c)
                c.notify_all();                     // koje cekaju da se prethodne niti (a i b) zavrse.
                                                    // Ovo se naziva i barijera.
        }

        void cekam()                                // Funkcija koju na svom POCETKU zovu niti (c) koje cekaju
                                                    // (ne izvrsavaju se odmah).
        {
            unique_lock<mutex> lock(m);
            while(!(zavrseno_niti == cekam_niti))   // Provera brojaca. Ukoliko zavrseno_niti != cekam_niti,
                                                    // nit pozivaoc (c) ulazi
                c.wait(lock);                       // u cekanje ispunjenosti uslova. Mora WHILE.
                                                    // Jos jedan tip uslova osim enumeracije
        }                                           // jeste brojac (kao ovde). Takodje moguci su i
                                                    // bool uslovi.
};

#endif // KOORDINATOR_H_INCLUDED
