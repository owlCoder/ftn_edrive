#ifndef MEMORIJA_H_INCLUDED
#define MEMORIJA_H_INCLUDED

#include <mutex>
#include <condition_variable>

#include "dijagnostika.h"

using namespace std;
using namespace chrono;

enum Stanje {SLOBODAN, CITANJE, UPIS };

const int VELICINA_RECI = 4; /// VELICINA RECI JE 4 BAJTA

/// STRUKTURA KOJA MODELUJE PRISTUP MEMORIJI TJ. JEDNOJ MEMORIJSKOJ RECI
typedef struct Pristup
{
    Stanje stanje;
    int aktivnihCitaca; /// BROJ AKTIVNIH CITACA NA MEMORIJSKOJ RECI
    int citacaCeka;     /// BROJ CITACA KOJI CEKAJU NA CITANJE DATE RECI
    condition_variable citanje; /// KONDICIONA VARIJABLA U KOJU UVEZUJEMO ONE KOJI ZELE DA CITAJU REC
    condition_variable pisanje; /// KONDICIONA VARIJABLA U KOJU UVEZUJEMO ONE KOJI ZELE DA PISU U DATU REC

    /// KONSTRUKTOR ZA POCETNO STANJE
    Pristup() : stanje(SLOBODAN), aktivnihCitaca(0), citacaCeka(0) { }
} Pristup;

class Memorija {
    private:
        Dijagnostika &dijagnostika;
        Pristup pristup;
        mutex m;
        vector<char> mem; /// MEMORIJA JE PREDSTAVLJENA VEKTOROM KARAKTERA
        vector<Pristup *> pristupi; /// VEKTOR POKAZIVACA NA STRUKTURU PRISTUP KOJA BELEZI PRISTUPE MEMORIJI
    public:
        Memorija(Dijagnostika &d, int bajtova) : dijagnostika(d), mem(bajtova) {
            /// BROJ RECI SE ZAOKRUZUJE NA VISI CELI BROJ
            int reci = (bajtova + (VELICINA_RECI - 1)) / VELICINA_RECI;

            for(int i = 0; i < reci; i++)
                pristupi.push_back(new Pristup);
        }

        /// DESTRUKTOR JE POTREBAN DA BI ZAUZELI DINAMICKI ALOCIRANU MEMORIJU
        /// ZA VEKTOR KOJI BELEZI PRISTUPE
        ~Memorija() {
            for(vector<Pristup *>::iterator it = pristupi.begin(); it !=  pristupi.end(); it++)
                delete *it;
        }

        // Metoda koju poziva nit koja simulira proces koji pristupa memoriji kako bi obavila čitanje iz nje
        //
        // rbp    - Redni broj procesa
        // adresa - Lokacija sa koje se čita vrednost prethodno upisana u memoriju
        //
        // Potrebno je pozvati dijagnostika.proces_ceka_citanje kada je memorijska reč zaključana i proces mora da čeka.
        // Potrebno je pozvati dijagnostika.proces_procitao onda kada je ostvaren pristup memoriji i kada je vrednost učitana iz nje.
        char citaj(int rbp, int adresa) {
            int rec = adresa / VELICINA_RECI;

            unique_lock<mutex> lock(m); /// KRITICNA SEKCIJA

            while(pristupi[rec] -> stanje == UPIS)
            {
                /// AKO JE TRENUTNO AKTIVAN UPIS U MEMORIJU
                /// POTREBNO JE SACEKATI DA SE UPIS ZAVRSI, PA TEK
                /// PRISTUPITI CITANJU
                /// KAKO JE METODA CITAJ POZVANA OD STRANE "CITAOCA"
                /// SVAKI POZIV SE BELEZI DOK SE NE OSLOBODI MEMORIJA
                /// ZATO IDE ONIHKOJICEKAJU++
                /// SACEKAJ DOK SE NE ZAVRSI
                /// JEDAN MANJE SADA CEKA --> ZATO IDE --
                dijagnostika.proces_ceka_citanje(rbp, adresa);
                (pristupi[rec] -> citacaCeka)++;
                pristupi[rec] -> citanje.wait(lock);
                (pristupi[rec] -> citacaCeka)--;
            }

            (pristupi[rec] -> aktivnihCitaca)++;
            pristupi[rec] -> stanje = CITANJE;

            lock.unlock();
            this_thread::sleep_for(seconds(1));
            lock.lock();

            /// AKO VISE NEMA AKTIVNIH CITALACA, PROCES JE USPESNO ISCITAO
            /// OSLOBADJA SE PRISTUP MEMORIJI I OBAVESTAVA SE DA JE MEMORIJA DOSTUPNA ZA
            /// NOVE OPERACIJE CITANJA/UPISA
            if(--(pristupi[rec] -> aktivnihCitaca) == 0)
            {
                dijagnostika.proces_procitao(rbp, adresa, mem[adresa]);
                pristupi[rec] -> pisanje.notify_one();
                pristupi[rec] -> stanje = SLOBODAN;
            }

            return mem[adresa];
        }

        // Metoda koju poziva nit koja simulira proces koji pristupa memoriji kako bi obavila upis u nju
        //
        // rbp      - Redni broj procesa
        // adresa   - Lokacija u koju se upisuje nova vrednost
        // vrednost - Vrednost koja se upisuje u memoriju
        //
        // Potrebno je pozvati dijagnostika.proces_ceka_upis kada je memorijska reč zaključana i proces mora da čeka.
        // Potrebno je pozvati dijagnostika.proces_upisao onda kada je ostvaren pristup memoriji i kada je vrednost upisana u nju.
        void pisi(int rbp, int adresa, char vrednost) {
             int rec = adresa / VELICINA_RECI;

            unique_lock<mutex> lock(m); /// KRITICNA SEKCIJA

            while(pristupi[rec] -> stanje != SLOBODAN)
            {
                /// AKO JE TRENUTNO MEMORIJA ZAUZETA
                /// POTREBNO JE SACEKATI DA SE ONA OSLOBODI PA TEK
                /// ONDA PRISTUPITI ISTOJ
                dijagnostika.proces_ceka_upis(rbp, adresa);
                pristupi[rec] -> pisanje.wait(lock);
            }

            /// PRIPREMA ZA UPIS U MEMORIJU
            pristupi[rec] -> stanje = UPIS; /// PRELAZ U STANJE UPISA

            lock.unlock();
            this_thread::sleep_for(seconds(1));
            lock.lock();

            pristupi[rec] -> stanje = SLOBODAN; /// MEMORIJA VISE NIJE ZAUZETA
            mem[adresa] = vrednost; /// UPISUJE SE NOVA VREDNOST U MEMORIJU
            dijagnostika.proces_upisao(rbp, adresa, mem[adresa]);

            if(pristupi[rec] -> citacaCeka != 0)
                pristupi[rec] -> citanje.notify_all();
            else
                pristupi[rec] -> pisanje.notify_one();
        }
};

#endif // MEMORIJA_H_INCLUDED
