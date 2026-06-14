/*
Izmeniti program data_race.cpp i realizovati zaštitu pristupa brojaču
uz pomoć klase mutex i njenih operacija lock() i unlock().
Primetiti koliko sada traje izvršavanje programa.
*/

#include <iostream>
#include <thread>
#include <mutex>

using namespace std;

const int ITERACIJA = 10000000;
int brojac = 0;

mutex m;

void increment()
{
    m.lock();  // zakljucava se propusnica dok se operacija ne zavrsi
    for(int i = 0; i < ITERACIJA; i++)
        ++brojac;
    m.unlock();
}

void decrement()
{
    m.lock();  // zakljucava se propusnica dok se operacija ne zavrsi
    for(int i = 0; i < ITERACIJA; i++)
        --brojac;
    m.unlock();
}

int main(void)
{
    thread t1(increment), t2(decrement);
    t1.join();
    t2.join();

    cout << "Brojac: " << brojac << endl;

    return 0;
}
