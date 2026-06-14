/*
Napraviti konkurentni program koji modeluje klasu brojača. Interfejs klase sadrži sledeće metode:

class Brojac {
   public:
      void inc();
      void dec();
      friend ostream& operator<<(ostream& , Brojac& );
};

Metode inc i dec povećavaću i smanjuju vrednost brojača respektivno.
Operator << služi za ispis brojača na ekran.

Klasa treba da zaštiti konzistentnost brojača u datim metodama uz pomoć klasa mutex i unique_lock.

Kreirati 1 globalni objekat brojača kome će pristupati 2 niti.

Kreirati 2 niti pri čemu jedna nit poziva metodu uvećavanja brojača 1000000 puta
a druga metodu smanjivanja brojača 1000000 puta. Na kraju programa ispisati konačnu
vrednost brojača nakon uvećavanja i smanjivanja.
*/

#include <iostream>
#include <thread>
#include <mutex>

using namespace std;

class Brojac
{
    private:
        mutex m;  // propusnica pripada klasi i obezbedjuje sprecavanje stetnog
                  // preplitanja pri vrsenju operacija nad objektima klase
        int broj; // vrednost Brojaca
    public:
        Brojac() : broj(0) {} //inicijalno je Brojac nula
        void inc()
        {
            unique_lock<mutex> l(m);    // operacija povecava Brojac, ali pre toga zakljucava propusnicu
                                        // i na taj nacin sprecava stetno preplitanja pri izmeni Brojaca
            ++broj;
        }

        void dec()
        {
            unique_lock<mutex> l(m);    // operacija smanjuje Brojac, ali pre toga zakljucava propusnicu
                                        // i na taj nacin sprecava stetno preplitanja pri izmeni Brojaca
            --broj;
        }

        friend ostream& operator<<(ostream& os, Brojac& b)   //preklopljen operator za ispis objekta klase Brojac.
        {
            unique_lock<mutex> l(b.m);  // zakljucava se propusnica da bi se sprecilo stetno preplitanje
            os << b.broj << endl;

            return os;
        }
};

void f1(Brojac &b)
{
    for(int i = 0; i < 10000000; i++)
        b.inc();
}

void f2(Brojac &b)
{
    for(int i = 0; i < 10000000; i++)
        b.dec();
}

int main(void)
{
    Brojac b;
    thread t1(f1, ref(b)), t2(f2, ref(b));
    t1.join();
    t2.join();

    cout << "Brojac: " << b;

    return 0;
}
