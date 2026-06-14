#ifndef PROGRAM_H_INCLUDED
#define PROGRAM_H_INCLUDED

#include "dijagnostika.h"
#include "naredba.h"
#include "povratna_vrednost.h"
#include <condition_variable>

using namespace std;

class Program {
private:
    Dijagnostika& dijagnostika;
    mutex m;
    condition_variable request, finished;
    int maxRam, zauzeto = 0, virtuelnaZauzeta = 0;

public:
    Program(Dijagnostika& d, int kapacitet) : dijagnostika(d), maxRam(kapacitet) {
        // Proširiti po potrebi ...
    }

    Dijagnostika& getDijagnostika() {
        return dijagnostika;
    }

    // Metoda koju poziva nit koja simulira izvršenje programa, kako bi zauzela potrebnu memoriju
    //
    // naredba - naredba koja se izvršava (naredba kojom se zauzima memorija)
    // Vraća instancu klase Povratna_vrednost koja sadrži opis zauzeća memorije NAKON izvršenja naredbe.
    Povratna_vrednost izvrsi_naredbu(Naredba naredba) {
        Povratna_vrednost p;
        int ima = naredba.ponavljanja, i = 0;

        //dijagnostika.pokrenuta_naredba(naredba);

        while(i++ < ima)
        {
            unique_lock<mutex> lock(m);
            int kolMem = naredba.kolicina_memorije;

            if(kolMem <= maxRam)
                maxRam -= kolMem;
            else
            {
                zauzeto = kolMem;
                request.notify_one();
                while(zauzeto) finished.wait(lock);
            }
        }

        //dijagnostika.izvrsena_naredba(naredba, maxRam, virtuelnaZauzeta);
        p.slobodno_ram = maxRam;
        p.zauzeto_u_virtuelnoj = virtuelnaZauzeta;

        return p;
    }

    // Metoda koju poziva nit koja simulira deo operativnog sistema koji se bavi zauzimanjem virtuelne memorije kako bi se zauzela određena količina VM
    // Potrebnu količinu VM (kao i bilo koju drugu neophodnu informaciju) preneti u nekom izabranom polju klase.
    int zauzmi_virtuelnu_memoriju() {
        unique_lock<mutex> lock(m);

        while(!zauzeto) request.wait(lock);

        virtuelnaZauzeta += zauzeto;
        zauzeto = 0;
        dijagnostika.izvrseno_zauzimanje_vm(virtuelnaZauzeta);
        finished.notify_one();

        return virtuelnaZauzeta;
    }
};

#endif // PROGRAM_H_INCLUDED
