#ifndef OS_H_INCLUDED
#define OS_H_INCLUDED

#include "dijagnostika.h"
#include "proces.h"
#include <condition_variable>
#include <mutex>
#include <queue>

using namespace std;
using namespace chrono;

struct UI_zahtev {                            /// Struktura UI zahteva. Neophodna radi efikasne obrade zahteva.
                                              /// Moguce su i drugacije
	condition_variable cv;                    /// implementacije. Npr. odvojeni redovi cekanja, integera i bool-ova ali je efikasnije
	                                          /// spakovati sve u jednu strukturu i onda date strukture (tj. pokazivace na njih)
                                              /// stavljati u red (queue).
    int id_procesa;                           /// Svaki zahtev mora imati CV na kojoj se ceka, id_procesa koji ceka kao i

	bool obradjen;                            /// bool flag da li je zahtev obradjen ili nije

	UI_zahtev(int i): id_procesa(i), obradjen(false) { }
};

class OS {
private:
    Dijagnostika &dijagnostika;
    int maksUzastopnihInstrukcija;
    int aktivniProces;
    queue<UI_zahtev *> redUIZahteva; /// RED POKAZIVACA NA UI ZAHTEVE
    condition_variable spremni;      /// RED SPREMNI PROCESA
    condition_variable ui;           /// CEKANJE UI UREDJAJA DA NEKO ZATRAZI OPERACIJU
    mutex m;
    bool zavrsen;

public:
    // d                 - Referenca na objekat Dijagnostika, koji služi za ispis stanja simulacije
    // maks_uzastopnih_i - Maksimalan dozvoljen broj uzastopnih STANDARD instrukcija, nakon kojeg obavezno sledi preključivanje
    OS(Dijagnostika &d, int maks_uzastopnih_i) : dijagnostika(d) {
        maksUzastopnihInstrukcija = maks_uzastopnih_i;
        aktivniProces = -1;
        zavrsen = false;
    }

    // Pomoćna metoda koja vraća objekat klase Dijagnostika koji služi za ispis stanja simulacije
    Dijagnostika & getDijagnostika() {
        return dijagnostika;
    }

    // Metoda koju poziva nit koja simulira proces kako bi se izvršile sve instrukcije procesa.
    //
    // p - Struktura koja sadrži opis procesa (ID procesa i instrukcije koje treba izvršiti)
    //
    // Ukoliko proces ne može da se izvrši (procesor je zauzet), proces mora da se uveže u red spremnih i treba pozvati metodu dijagnostika.proces_ceka.
    // Ukoliko dođe do toga da izvršenje procesa prestaje (dostignut je maksimalan dozvoljen broj uzastopnih STANDARD instrukcija ili su sve instrukcije procesa izvršene), potrebno je pozvati dijagnostika.proces_oslobadja_procesor.
    // Kada se izvrši STANDARD instrukcija nekog procesa, potrebno je pozvati dijagnostika.proces_izvrsio_standardnu.
    // Kada se izvršava UI instrukcija, potrebno je pozvati par metoda: dijagnostika.proces_ceka_na_UI kada se pokrene U/I operacija (nakon čega sledi čekanje na U/I podsistem) i dijagnostika.proces_zavrsio_UI kada se završi U/I operacija.
	void izvrsi_proces(Proces &p) {
        int uzastopnihInstrukcija = 0; /// BROJ UZASTOPNIH IZVRSENIH INSTRUKCIJA

        for(vector<INS_TYPE>::iterator it = p.instrukcije.begin(); it != p.instrukcije.end(); it++)
        {
            unique_lock<mutex> lock(m); /// KRITICNA SEKCIJA

            /// PROCES MORA DA SACEKA AKO JE PROCESOR TRENUTNO ZAUZET DODELJEN JE NEKOM DRUGOM PROCESU
            while( (aktivniProces != p.id) && (aktivniProces != -1) )
            {
                dijagnostika.proces_ceka(p.id);
                spremni.wait(lock);
            }

            aktivniProces = p.id; /// PROCES PREUZIMA PROCESOR

            if(*it == STANDARD)
            {
                lock.unlock();
                this_thread::sleep_for(milliseconds(rand() % 41 + 10));
                lock.lock();

                dijagnostika.proces_izvrsio_standardnu(p.id);

                /// AKO JE IZVRSEN MAX BROJ UZASTOPNIH INSTRUKCIJA ILI SU
                /// IZVRSENE SVE INSTRUKCIJE AKTIVNOG PROCESA
                /// OSLOBADJA SE PROCESOR
                if(++uzastopnihInstrukcija == maksUzastopnihInstrukcija
                   || it == p.instrukcije.end() - 1)
                {
                    dijagnostika.proces_oslobadja_procesor(p.id);
                    uzastopnihInstrukcija = 0;
                    aktivniProces = -1; /// TRENUTNO NIJE AKTIVAN NIJEDAN PROCES

                    spremni.notify_one(); /// AKTIVACIJA SLEDECEG PROCESA IZ REDA SPREMNIH

                    lock.unlock();
                    this_thread::sleep_for(milliseconds(100));
                    lock.lock();

                    dijagnostika.proces_zavrsio(p.id);
                }
            }
            else /// U PITANJU JE UI ZAHTEV
            {
                /// FORMIRA SE NOVI UI ZAHTEV
                UI_zahtev *zahtev = new UI_zahtev(p.id);

                redUIZahteva.push(zahtev);
                ui.notify_one();
                dijagnostika.proces_ceka_na_UI(p.id);

                while(!zahtev -> obradjen)
                {
                    /// TREBA CEKATI SVE DOK SE UI ZAHTEV NE OBRADI
                    /// TADA RESETOVATI INSTRUKCIJE I AKTIVNI PROCES
                    zahtev -> cv.wait(lock);

                    uzastopnihInstrukcija = 0;
                    aktivniProces = -1;
                    spremni.notify_one(); /// SLEDECI SPREMAN PROCES MOZE DA KRENE U IZVRSAVANJE
                }
                dijagnostika.proces_zavrsio_UI(p.id);

                delete zahtev;
            }
        }
	}

	/// METODA KOJA ZAVRSAVA PROGRAM
	void zavrsi() {
        zavrsen = true;
        ui.notify_one();
	}

    // Metoda koju poziva nit koja simulira obrađivač U/I zahteva kako bi se obradili trenutno pohranjeni U/I zahtevi.
    //
    // Potrebno je pozvati dijagnostika.ui_ceka kada ne postoje trenutno pohranjeni U/I zahtevi i obrađivač čeka na prvi.
    // Potrebno je pozvati dijagnostika.ui_zapocinje kada obrađivač krene u obradu U/I zahteva. Kada obrađivač završi taj zahtev, potrebno je pozvati dijagnostika.ui_zavrsio.
	void obradi_zahteve() {
        while(true)
        {
            unique_lock<mutex> lock(m); /// KRITICNA SEKCIJA

            while(redUIZahteva.empty() && !zavrsen)
            {
                dijagnostika.ui_ceka();
                ui.wait(lock);
            }

            if(zavrsen)
                return;

            UI_zahtev *zahtev = redUIZahteva.front();
            redUIZahteva.pop();
            dijagnostika.ui_zapocinje(zahtev -> id_procesa);

            lock.unlock();
            this_thread::sleep_for(milliseconds(rand() % 200 + 100));
            lock.lock();

            zahtev -> obradjen = true;
            zahtev -> cv.notify_one();
            dijagnostika.ui_zavrsio(zahtev -> id_procesa);
        }
	}
};

#endif // OS_H_INCLUDED
