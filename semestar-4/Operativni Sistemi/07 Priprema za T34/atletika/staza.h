#ifndef STAZA_H_INCLUDED
#define STAZA_H_INCLUDED

#include "povratna.h"
#include "takmicar.h"
#include <mutex>
#include <condition_variable>

using namespace std;
using namespace chrono;

class Atletska_staza {
private:
    Takmicar &takmicar;
    enum NAREDU {SKAKAC, BACAC};
    NAREDU naRedu;
    bool slobodno;
    int skakacaCeka, bacacCeka;
    mutex m;
    condition_variable skakaci, bacaci;

public:
    Atletska_staza(Takmicar& tak) : takmicar(tak) {
        naRedu = SKAKAC;
        skakacaCeka = 0;
        bacacCeka  = 0;
        slobodno = true;
    }

    // Metoda koju poziva nit koja simulira skakaca kako bi takmicar obavio skok.
    // Ukoliko je zaletiste zauzeto, ova metoda ce stajati blokirana dok se ono ne oslobodi i takmicar obavi nastup.
    //
    // rbr - Redni broj takmicara
    //
    // Potrebno je pozvati metodu takmicar.skakac_ceka kada skakac ne moze da stupi na zaletiste.
    // Potrebno je pozvati metodu takmicar.skakac_skace kada skakac stupi na zaletiste, pre skoka.
    // Potrebno je pozvati metodu takmicar.skakac_zavrsio kada je skakac zavrsio i kada treba prikazati njegov rezultat.
    Povratna_vrednost skaci(int rbr) {
        system_clock::time_point dosao = system_clock::now(); /// POCETAK DOLASKA NA STAZU

        unique_lock<mutex> l(m); /// KRITICNA SEKCIJA

        while(!slobodno || naRedu != SKAKAC)
        {
            skakacaCeka++;   /// POVECATI BROJ SKAKACA KOJI CEKAJU
            takmicar.skakac_ceka(rbr);
            skakaci.wait(l); /// CEKATI DOK SE STAZA NE OSLODI, KADA SE OSLOBODI - SKACI
            skakacaCeka--;   /// SKAKAC SPREMAN DA SKOCI
        }
        slobodno = false;    /// ZAUZIMANJE STAZE ZA SKAKACA

        l.unlock();
        takmicar.skakac_skace(rbr);
        this_thread::sleep_for(seconds(2)); /// SKAKAC SKACE 2 SEKUNDE
        system_clock::time_point zavrsio = system_clock::now(); /// VREME ODLASKA SA STAZE
        l.lock();

        slobodno = true;    /// STAZA JE PONOVO SLOBODNA
        if(bacacCeka > 0)
        {
            naRedu = BACAC;
            bacaci.notify_one();
        }
        else
        {
            naRedu = SKAKAC;
            skakaci.notify_one();
        }

        Povratna_vrednost pv;
        pv.rezultat = rand() % 10;
        pv.trajanje = zavrsio - dosao;

        takmicar.skakac_zavrsio(rbr, pv);

        return pv;
    }

    // Metoda koju poziva nit koja simulira bacaca kako bi takmicar obavio bacanje.
    // Ukoliko je zaletiste zauzeto, ova metoda ce stajati blokirana dok se ono ne oslobodi i takmicar obavi nastup.
    //
    // rbr - Redni broj takmicara
    //
    // Potrebno je pozvati metodu takmicar.bacac_ceka kada bacac ne moze da stupi na zaletiste.
    // Potrebno je pozvati metodu takmicar.bacac_skace kada bacac stupi na zaletiste, pre skoka.
    // Potrebno je pozvati metodu takmicar.bacac_zavrsio kada je bacac zavrsio i kada treba prikazati njegov rezultat.
    Povratna_vrednost baciKoplje(int rbr) {
        system_clock::time_point dosao = system_clock::now(); /// POCETAK DOLASKA NA STAZU

        unique_lock<mutex> l(m); /// KRITICNA SEKCIJA

        while(!slobodno || naRedu != BACAC)
        {
            bacacCeka++;     /// POVECATI BROJ BACACA KOJI CEKAJU
            takmicar.bacac_ceka(rbr);
            bacaci.wait(l);  /// CEKATI DOK SE STAZA NE OSLODI, KADA SE OSLOBODI - BACI KOPLJE
            bacacCeka--;    /// BACAC SPREMAN DA BACI KOPLJE
        }
        slobodno = false;    /// ZAUZIMANJE STAZE ZA BACACA

        l.unlock();
        takmicar.bacac_baca(rbr);
        this_thread::sleep_for(seconds(1)); /// BACAC BACA KOPLJE 1 SEKUNDU
        system_clock::time_point zavrsio = system_clock::now(); /// VREME ODLASKA SA STAZE
        l.lock();

        slobodno = true;    /// STAZA JE PONOVO SLOBODNA
        if(skakacaCeka > 0)
        {
            naRedu = SKAKAC;
            skakaci.notify_one();
        }
        else
        {
            naRedu = BACAC;
            bacaci.notify_one();
        }

        Povratna_vrednost pv;
        pv.rezultat = rand() % 100;
        pv.trajanje = zavrsio - dosao;

        takmicar.skakac_zavrsio(rbr, pv);

        return pv;
    }
};

#endif // STAZA_H_INCLUDED
