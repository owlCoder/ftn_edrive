/*
Napraviti konkurentni program koji u funkciji visina pita korisnika koliko je visok.
Nakon toga korisnik unosi svoju visinu. Na kraju u funkciji se ispisuje uneta visina.

Sprečiti štetno preplitanje na terminalu korišćenjem klase mutex.

Kreirati 2 niti od date funkcije. Ispratiti ispis.
*/

#include <iostream>
#include <thread>
#include <mutex>

using namespace std;

mutex m;

void f() {

   int x;

   unique_lock<mutex> l(m);
   cout << "Unesite vasu visinu: ";
   cin >> x;
   cout << "Vasa visina je " << x << "cm." << endl << endl;
}

int main() {
   thread t1(f);
   thread t2(f);
   t1.join();
   t2.join();
}
