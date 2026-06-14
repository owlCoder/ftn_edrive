/*
Data je klasa Brojac.
U main funkciji napraviti objekat klase Brojac. Ispis vrednosti Brojaca radi posebna nit.
Napraviti nit koja vrsi ispis i proslediti joj Brojac.
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
            os << b.broj <<endl;

            return os;
        }
};

void f(Brojac &b)
{
    cout << "Brojac: " << b;
}

int main(void)
{
    Brojac b;
    thread t1(f, ref(b));
    t1.join();

    return 0;
}
