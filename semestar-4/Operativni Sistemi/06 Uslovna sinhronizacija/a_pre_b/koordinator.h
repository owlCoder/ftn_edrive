#ifndef KOORDINATOR_H_INCLUDED
#define KOORDINATOR_H_INCLUDED

#include <mutex>
#include <condition_variable>

using namespace std;

class Koordinator {
   enum redosled {PRVI, DRUGI};         // Enumeracija koja ce govoriti koja nit je na redu (tip uslova).
   redosled na_redu_je;                 // Eksplicitni uslov. U zavisnosti od vrednosti ovog uslova nit b ce morati da ceka.
   mutex m;
   condition_variable c;                // Uslovna promenljiva. Koristi se za sinhronizaciju pristupa kriticnoj sekciji izmedju
                                        // niti a i b.
public:
   Koordinator() : na_redu_je(PRVI) {}  // Konstruktor klase Koordinator. Na pocetku je na redu PRVI (nit a).

   void prvi_zavrsio() {                // Funkcija koja se poziva kada se zavrsi prva nit (nit a).
      unique_lock<mutex> lock(m);       // Zakljucavanje mutexa (ulazak u kriticnu sekciju).
      c.notify_one();                   // Notifikacija niti koja ceka (niti b).
      na_redu_je = DRUGI;               // Promena uslova (na redu je sada DRUGI). Linija iznad i ova su MOGLE BITI U OBRNUTOM
   }                                    // REDOSLEDU jer tek po izlasku iz kriticne sekcije nit a otpusta propusnicu.

   void drugi_ceka() {                  // Funkcija koja se poziva na pocetku druge niti (niti b).
      unique_lock<mutex> lock(m);
      while( !(na_redu_je == DRUGI) )   // Provera uslova cekanja. Ukoliko je na_redu_je != DRUGI ->
         c.wait(lock);                  // druga nit (nit b) ulazi u cekanje. Kod provere uslova MORA stojati while (ne if)
   }                                    // da bi se predupredila lazna budjenja (spurious wakeups).
};

#endif // KOORDINATOR_H_INCLUDED
