#ifndef RC_H_INCLUDED
#define RC_H_INCLUDED

#include "student.h"
#include <mutex>
#include <condition_variable>

using namespace std;

#define MAX 50 //maksimalni broj racunara u ucionici

class RC
{
private:
    Student &student;
    bool slobodni[MAX];
    condition_variable cv;
    int brojSlobodnih;
    int brojRacunara;
    mutex m;
public:
    RC(Student &st, int br) : student(st), brojRacunara(br)
    {
        brojRacunara = br; // ukupan broj racunara je prosledjen spolja pri instanciranju
        brojSlobodnih = brojRacunara; // inicijalno su svi racunari slobodni

        for (int i = 0; i < brojSlobodnih; ++i) // za svaki racunar se evidentira da je slobodan
            slobodni[i] = true;
    }

    // Metoda koju poziva nit koja simulira studenta kako bi student zauzeo mesto za racunarom.
    // Ova metoda je blokirajuca - ako nema slobodnih mesta, ona ce cekati dok se neko ne oslobodi.
    //
    // rbr - Redni broj studenta
    //
    // Potrebno je pozvati metodu student.ceka kada su racunari zauzeti i student mora da ceka.
    // Potrebno je pozvati metodu student.zauzeo kada student zauzme racunar.
    int zauzmi(int rbr)
    {
        unique_lock<mutex> l(m);

        while(brojSlobodnih == 0) {
            cv.wait(l);
            student.ceka(rbr);
        }

        int retVal;
        for(int i = 0; i < brojRacunara; i++)
            if(slobodni[i])
        {
            student.zauzeo(rbr, i);
            slobodni[i] = false;
            retVal = i + 1;
            break;
        }
        --brojSlobodnih;

        return retVal;
    }

    // Metoda koju poziva nit koja simulira studenta kako bi oslobodio racunar koji je prethodno zauzeo.
    //
    // rbr         - Redni broj studenta
    // id_racunara - Redni broj racunara kojeg student oslobadja (prethodno je zauzeo taj racunar)
    //
    // Potrebno je pozvati metodu student.oslobodio kada student oslobodi racunar.
    void oslobodi(int rbr, int id_racunara)
    {
        unique_lock<mutex> l(m);
        ++brojSlobodnih;
        student.oslobodio(rbr, id_racunara - 1);
        slobodni[id_racunara - 1] = true;
        cv.notify_one();
    }
};

#endif // RC_H_INCLUDED
