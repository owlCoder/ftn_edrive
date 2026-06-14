#ifndef TENISKI_KLUB_H_INCLUDED
#define TENISKI_KLUB_H_INCLUDED

#include "podaci.h"
#include "mec.h"
#include <mutex>
#include <condition_variable>

#define MAX_TERENA 30

using namespace std;

class Teniski_klub {                             // Klasa deljenog resursa. Pravi se maksimalno 30 terena, ali ce u realnosti biti samo 3 terena.
private:
    Mec &mec;
    mutex m;
    condition_variable uslovi[MAX_TERENA];
    bool slobodni[MAX_TERENA];
public:
    Teniski_klub(Mec &m, int ukupno_terena) : mec(m) {
        for(int i = 0; i < ukupno_terena; i++)
            slobodni[i] = true;
    }

    // Metoda koju poziva nit koja simulira mec kako bi izvrsila teniski mec.
    // Metoda je blokirajuca - ako je zeljeni teren zauzet, izvrsenje ce blokirati dok se on ne oslobodi.
    //
    // broj_meca - Redni broj meca
    // na_terenu - Indeks terena na kojem mec treba da se odigra
    //
    // Potrebno je pozvati metodu mec.ceka kada je izabrani teren zauzet i mec mora da ceka.
    // Potrebno je pozvati metodu mec.pocinje kada se isprazni izabrani teren i mec moze da pocne.
    // Potrebno je pozvati metodu mec.zavrsen kada se mec zavrsi i mogu se proslediti izmereni vremenski intervali.
    void odigraj_mec(int broj_meca, int na_terenu) {
        Podaci p;

        {
            p.dosao = system_clock::now();

            unique_lock<mutex> l(m);
            while(!slobodni[na_terenu])
            {
                mec.ceka(broj_meca, na_terenu);
                uslovi[na_terenu].wait(l);
            }

            p.pocetak = system_clock::now();
            slobodni[na_terenu] = false; /// ZAUZIMA SE TEREN ZA MEC

            mec.pocinje(broj_meca, na_terenu);
        }

        this_thread::sleep_for(seconds(rand() % 5 + 1));
        p.trajanje = system_clock::now() - p.pocetak;
        mec.zavrsen(broj_meca, p);

        unique_lock<mutex> l(m);
        slobodni[na_terenu] = true; /// OSLOBADJA SE TEREN
        uslovi[na_terenu].notify_one();
    }
};

#endif // TENISKI_KLUB_H_INCLUDED
