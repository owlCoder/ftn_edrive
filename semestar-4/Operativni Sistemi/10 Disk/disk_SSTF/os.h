#ifndef OS_H_INCLUDED
#define OS_H_INCLUDED

#include "dijagnostika.h"
#include <list>
#include <condition_variable>

using namespace std;
using namespace chrono;

struct Zahtev
{
    int id_procesa, broj_staze;
    bool zavrsen = false;
    condition_variable cv;

    Zahtev(int pid, int t) : id_procesa(pid), broj_staze(t) {}
};

class OS
{
private:
    Dijagnostika& dijagnostika;
    list<Zahtev*> zahtevi;
    mutex m;
    condition_variable cv;
    bool kraj = false;
    int trenutna;

public:
    OS(Dijagnostika& d, int t) : dijagnostika(d), trenutna(t)
    {
        // Proširiti po potrebi ...
    }

    Dijagnostika& getDijagnostika()
    {
        return dijagnostika;
    }

    // Metoda koju poziva nit koja simulira izvršenje procesa, kako bi se uputio zahtev ka U/I uređaju
    //
    // id_procesa - ID procesa koji upućuje zahtev
    // broj_staze - broj staze diska kojoj nit želi da pristupi
    //
    // Metoda treba da formira novi zahtev i uputi ga U/I uređaju na obradu. Proces će biti blokiran dok god se ovaj zahtev ne izvrši. Pre nego što stupi u blokadu, potrebno je pozvati dijagnostika.proces_ceka.
    void uputi_UI_zahtev(int id_procesa, int broj_staze)
    {
        Zahtev *z = new Zahtev(id_procesa, broj_staze);
        unique_lock<mutex> l(m);
        zahtevi.push_back(z);
        cv.notify_one();
        while (!z->zavrsen) z->cv.wait(l);
        delete z;
    }

    // Metoda koju poziva nit koja simulira deo operativnog sistema koji upravlja diskom, kako bi se obradio jedan pristigli zahtev
    //
    // Prema uslovima zadatka, metoda treba da obradi zahtev koji je najranije pristigao.
    //
    // Povratna vrednost metode treba da bude broj staze koji je obrađen.
    int obradi_zahtev()
    {
        Zahtev *z;
        {
            unique_lock<mutex> l(m);
            while (zahtevi.empty() && !kraj) cv.wait(l);
            if (kraj) return -1;

            auto najblizi = zahtevi.begin();
            for (auto it = next(zahtevi.begin()); it != zahtevi.end(); it++)
            {
                if (abs((*it)->broj_staze - trenutna) < abs((*najblizi)->broj_staze - trenutna))
                    najblizi = it;
            }

            z = *najblizi;
            zahtevi.erase(najblizi);
        }
        this_thread::sleep_for(chrono::milliseconds(300));
        {
            unique_lock<mutex> l(m);
            z->zavrsen = true;
            z->cv.notify_one();
            return trenutna = z->broj_staze;
        }
    }

    // Metoda koja postavlja signal za kraj izvršavanja i pokreće obrađivač iz čekanja kako bi program mogao da se završi
    void zavrsi()
    {
        unique_lock<mutex> l(m);
        kraj = true;
        cv.notify_one();
    }
};

#endif // OS_H_INCLUDED
