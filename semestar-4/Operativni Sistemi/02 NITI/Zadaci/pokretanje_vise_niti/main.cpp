/*
Napraviti konkurentni program koji pokreće više niti u petlji.
Svakoj niti proslediti njen redni broj prilikom kreiranja i svaka nit treba da
ispiše sopstveni redni broj u okviru tela niti.
*/

#include <iostream>
#include <thread>

using namespace std;

void f(int rbr) {
    cout << rbr;
}

int main(void)
{
    const int BROJ_NITI = 5;
    thread t[BROJ_NITI];

    for(int i = 0; i < BROJ_NITI; i++)
        t[i] = thread(f, i + 1);

    for(int i = 0; i < BROJ_NITI; i++)
        t[i].join();

    return 0;
}
