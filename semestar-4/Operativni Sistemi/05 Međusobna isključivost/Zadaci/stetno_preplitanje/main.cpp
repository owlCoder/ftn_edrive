/*
Napraviti konkurentni program koji u funkciji visina pita korisnika koliko je visok.
Nakon toga korisnik unosi svoju visinu. Na kraju u funkciji se ispisuje uneta visina.

Kreirati 2 niti od date funkcije. Ispratiti ispis.
*/

#include <iostream>
#include <thread>
#include <mutex>

using namespace std;

mutex m;

void f() {

   int x;
   cout << "Unesite vasu visinu: ";
   cin >> x;
   cout << endl << "Vasa visina je " << x << "cm." << endl;
}

int main() {
   thread t1(f);
   thread t2(f);
   t1.join();
   t2.join();
}
