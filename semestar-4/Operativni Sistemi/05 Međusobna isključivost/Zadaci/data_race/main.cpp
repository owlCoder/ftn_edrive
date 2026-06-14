/*
Kreirati globalnu celobrojnu promeljivu brojač. Nakon toga kreirati 2 funkcije inkrement i dekrement koje povećavaju i
smanjuju dati brojač ITERACIJA puta, pri čemu je ITERACIJA konstanta koja predstavlja proizvoljno velik broj
(npr. 100000000). Kreirati jednu nit od funkcije inkrement i jednu nit od funkcije dekrement.

Nakon završatka rada niti ispisati vrednosti brojača. Da li je data vrednost očekivana?
*/

#include <iostream>
#include <thread>
#include <mutex>

using namespace std;

const int ITERACIJA = 10000000;
int brojac = 0;

void increment()
{
    for(int i = 0; i < ITERACIJA; i++)
        ++brojac;
}

void decrement()
{
    for(int i = 0; i < ITERACIJA; i++)
        --brojac;
}

int main(void)
{
    thread t1(increment), t2(decrement);
    t1.join();
    t2.join();

    cout << "Brojac: " << brojac << endl;

    return 0;
}
