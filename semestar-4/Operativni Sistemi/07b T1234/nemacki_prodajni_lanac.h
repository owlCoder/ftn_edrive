#ifndef NEMACKI_PRODAJNI_LANAC_H_INCLUDED
#define NEMACKI_PRODAJNI_LANAC_H_INCLUDED

#include <mutex>
#include <condition_variable>
#include <random>
#include <algorithm>
#include <vector>
#include <thread>

#include "kupac.h"

using namespace std;
using namespace chrono;
using namespace this_thread;

class Eksamarket
{
    private:
        Kupac &kupac;
        vector<bool> kasaRadi;
        vector<bool> zauzetaKasa;
        vector<int>  zauzetostReda;
        vector<condition_variable> red;
        int brojKasa;
        mutex m;

    public:
        Eksamarket(Kupac &k, int broj_kasa) : kupac(k), kasaRadi(broj_kasa, false),
                                              zauzetaKasa(broj_kasa, false), zauzetostReda(broj_kasa, 0), red(broj_kasa)
        {
            brojKasa = broj_kasa;

            kasaRadi[0] = kasaRadi[1] = true;
            srand(time(NULL));
        }

        ~Eksamarket() {}

	/**
	Kupac dolazi na kase i zauzima prvu slobodnu kasu koja je aktivna.
	Ako ne postoje takve kase odlazi na cekanje u najkraci red cekanja aktivne kase.

	pozvati Kupac.prilazi_kasama na pocetku
	pozvati Kupac.ceka ako kupac odlazi na cekanje na nekoj kasi
	pozvati Kupac.kupuje kada kupac zauzme kasu i pocne sa kupovinom
	pozvati Kupac.odlazi kada kupac zavrsi kupovinu
	@param id - r. br. kupca
	*/
        void kupovina(int id)
        {
            kupac.prilazi_kasama(id);

            unique_lock<mutex> lock(m);                                             /// KRITICNA SEKCIJA, PROPUSNICA SE ZAKLJUCAVA

            int kasa = -1, najmanjiRed = -1;                                        /// KUPCI PRI DOLASKU ZAUZIMAJU PRVU SLOBODNU KASU KOJA RADI I SLOBODNA JE.
                                                                                    /// AKO NEMA KASE KOJA RADI I SLOBODNA JE, STAJU U RED NA KASU.
            for (int i = 0; i < brojKasa; i++)
            {
                if (kasaRadi[i])
                {
                    if (kasa == -1)                                                 /// PRETPOSTAVKA JE DA JE PRVA AKTIVNA KASA, KASA SA NAJMANJIM REDOM
                        kasa = i, najmanjiRed = zauzetostReda[i];
                    else if (!zauzetaKasa[i])                                       /// AKO KASA NIJE AKTIVNA, KOD NJE NE CEKA NIJEDAN KUPAC I IMA NAJMANJI RED = 0
                        kasa = i, najmanjiRed = 0;
                    else if (zauzetostReda[i] < najmanjiRed)                        /// POSTOJI LI KASA KOJA JE AKTIVNA I CIJI JE RED NAJMANJI U ODNOSU NA SVE OSTALE AKTIVNE KASE
                        kasa = i, najmanjiRed = zauzetostReda[i];
                }
            }

            while(zauzetaKasa[kasa])                                                /// SVE DOK JE KASA ZAUZETA KUPAC CEKA U REDU
            {
                zauzetostReda[kasa]++;
                kupac.ceka(id, kasa, zauzetostReda[kasa]);
                red[kasa].wait(lock);                                               /// KADA SE KASA OSLOBODI, KUPAC MOZE PRISTUPITI PLACANJU
                zauzetostReda[kasa]--;
            }

            zauzetaKasa[kasa] = true;                                               /// TRENUTNI KUPAC ZAUZIMA ODABRANU KASU

            lock.unlock();                                                          /// PRIVREMENO OTKLJUCAVAMO PROPUSNICU
            kupac.kupuje(id, kasa);
            sleep_for(seconds(1));                                                  /// KUPOVINA TRAJE 1 SEKUNDU
            lock.lock();                                                            /// ZAKLJUVACAMO PROPUSNICU

            zauzetaKasa[kasa] = false;                                              /// KUPOVINA JE ZAVRSENA, KASA VISE NIJE ZAUZETA
            kupac.odlazi(id, kasa);
            red[kasa].notify_one();                                                 /// OBAVESTAVAMO SLEDECEG KUPCA DA MOZE PRISTUPITI KASI
        }

	/**
	Na svakih 1s treba jednu aktivnu kasu deaktivirati i jednu neaktivnu kasu aktivirati.

	pozvati Kupac.smena_kasa nakon sto se po jedna kasa aktivira i deaktivira
	*/
        void smena_kasa()
        {
            int otvorena, zatvorena;

            while(true)
            {
                sleep_for(seconds(1));                                              /// KASE SE NAIZMENICNO OTVARAJU/ZATVARAJU NA 1 SEKUNDU
                unique_lock<mutex> lock(m);                                         /// KRITICNA SEKCIJA - PRISTUP DELJENIM RESURISIMA

                do
                {
                    otvorena = rand() % (brojKasa - 1);
                } while(!kasaRadi[otvorena]);                                       /// PRONALIZMO NASUMICNU KASU KOJA JE OTVORENA, NJU CEMO ZATVORITI

                do
                {
                    zatvorena = rand() % (brojKasa - 1);
                } while(kasaRadi[zatvorena]);                                       /// PRONALIZMO NASUMICNU KASU KOJA JE ZATVORENA, NJU CEMO OTVORITI

                kasaRadi[otvorena]  = false;                                        /// AKTIVNU KASU ZATVARAMO
                kasaRadi[zatvorena] = true;                                         /// NEAKTIVNU KASU OTVARAMO

                kupac.smena_kasa(otvorena, zatvorena);
            }
        }
};

#endif // NEMACKI_PRODAJNI_LANAC_H_INCLUDED
