#ifndef MAGISTRALA_H_INCLUDED
#define MAGISTRALA_H_INCLUDED

#include "dijagnostika.h"
#include <condition_variable>

using namespace std;

// Klasa magistrale (sabirnice). Glavna deljena promenljiva za sinhronizaciju pristupa procesora memoriji i dma kontroleru.
class Magistrala
{
public:
    // Stanja sabirnice - slobodna, čitanje iz memorije, pisanje u memoriju, dma transfer. Primetiti sličnost sa stanjima iz zadatka "multiprocesor":
    enum Stanje { SLOBODNA, MEM_CITAJ, MEM_PISI, DMA};

    // Struktura u koju se beleže parametri DMA transfera. Odakle, kome i koliko bajtova se čita ili piše.
    struct DMA_transfer
    {
        int odakle;
        int koliko;
        int kome;
    };

private:
    Dijagnostika& dijagnostika;
    Memorija &memorija;
    Stanje stanje = SLOBODNA;
    mutex m;
    DMA_transfer *active = nullptr;
    condition_variable cv, cv_dma;

    void zauzmi(Stanje novo_stanje)
    {
        {
            unique_lock<mutex> l(m);
            while (stanje != SLOBODNA) cv.wait(l);
            stanje = novo_stanje;
        }
        this_thread::sleep_for(chrono::milliseconds(700));
    }

    void oslobodi()
    {
        unique_lock<mutex> l(m);
        stanje = SLOBODNA;
        cv.notify_one();
    }

public:
    Magistrala(Dijagnostika& d, Memorija& mem) : dijagnostika(d), memorija(mem)
    {
        // Proširiti po potrebi ...
    }

    Dijagnostika& getDijagnostika()
    {
        return dijagnostika;
    }

    char citaj_memoriju(int adresa)
    {
        zauzmi(MEM_CITAJ);
        char vrednost = memorija.citaj(adresa);
        oslobodi();
        return vrednost;
    }

    void pisi_u_memoriju(int adresa, char vrednost)
    {
        zauzmi(MEM_PISI);
        memorija.pisi(adresa, vrednost);
        oslobodi();
    }

    void dma(DMA_transfer transfer)
    {
        zauzmi(DMA);

        unique_lock<mutex> l(m);
        active = new DMA_transfer(transfer);
        cv_dma.notify_one();
    }

    DMA_transfer okidac_dma_kontrolera()
    {
        DMA_transfer backup;
        {
            unique_lock<mutex> l(m);
            while (active == nullptr) cv_dma.wait(l);

            for (int i = 0; i < active->koliko; i++)
            {
                int index = active->odakle < active->kome ? active->koliko - i - 1 : i;
                memorija.pisi(active->kome + index, memorija.citaj(active->odakle + index));
            }

            backup = *active;
            delete active;
            active = nullptr;
        }
        oslobodi();
        return backup;
    }

    void zavrsi()
    {
        // Implementirati ...
    }
};

#endif // MAGISTRALA_H_INCLUDED
