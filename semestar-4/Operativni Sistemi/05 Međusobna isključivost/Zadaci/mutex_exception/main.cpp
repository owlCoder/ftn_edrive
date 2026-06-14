/*
Napraviti konkurentni program u kom se u funkciji niti pravi veliki niz od 1000000000000 elemenata.
Niz se pravi dinamicki. Kreiranje niza zastititi try - catch blokom. U okviru try catch bloka zakljucati
mutex pre pravljenja niza i otkljucati ga nakon pravljenja niza. Posmatrati ponasanje programa.

Nakon toga promeniti kod tako da se ne zakljucava mutex eksplicitno vec da se koristi klasa unique_lock.
*/

#include <iostream>
#include <thread>
#include <mutex>

using namespace std;

mutex m;

void f()
{
    int *niz;

    try
    {
        //unique_lock<mutex> l(m);
        m.lock();
        niz = new int[1000000000000];
        m.unlock(); // otkljucavanje propusnice
    }
    catch (const exception &e)
    {
        cout << "Alokacija memorije neuspesna!: " << e.what() << endl; // ispis greske
    }
}

int main()
{
    thread t1(f);
    thread t2(f);
    t1.join();
    t2.join();

    return 0;
}
