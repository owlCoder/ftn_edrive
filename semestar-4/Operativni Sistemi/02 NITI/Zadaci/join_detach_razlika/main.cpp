/*
Napraviti konkurentni program koji stvara nit iz koje pita korisnika za visinu u centimetrima i potom ispisuje:
 “Vasa visina je <uneta_visina> cm.”

Testirati program tako što će main nit, koristeći objekat koji predstavlja novu nit, da pozove metodu join.
Potom promeniti taj poziv u poziv metode detach.
*/

#include <iostream>
#include <thread>

using namespace std;

void f() {
    int x;

    cout << "Unesite visinu\n>> ";
    cin >> x;
    cout << "\nVasa visina je " << x << "cm." << endl;
}

int main(void)
{
    thread(f).join();
    thread(f).detach();

    return 0;
}



