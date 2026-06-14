/*
Napisati funkciju za izračunavanje svote novca potrebne za kupovinu karata za
bioskop.
Funkcija ima dva parametra za broj karata i cenu jedne karte. Ukoliko se cena
karte ne navede koristi se podrazumevana cena koja iznosi 50 dinara.
Testirati implementiranu funkciju.
*/

#include <iostream>
using namespace std;

double cenaKarti(const int brojKarata, double cena = 50)
{
    return cena <= 0 || brojKarata <= 0 ? 0 : brojKarata * cena;
}

int main()
{
    int brojKarata = 0;
    char izbor;

    cout << "UNESITE BROJ KARATA\n>> ";
    cin >> brojKarata;

    do {
        cout << endl << "UNOS CENE [y/n] ?\n>> ";
        cin >> izbor;
    } while(izbor != 'y' && izbor != 'n');

    if(izbor == 'y')
    {
        double cena = 0.0;

        cout << endl << "CENA KARTE\n>> ";
        cin >> cena;

        cout << endl << "POTREBNO ZA KARTE: " << cenaKarti(brojKarata, cena) << " RSD" << endl;
    }
    else
        cout << endl << "POTREBNO ZA KARTE: " << cenaKarti(brojKarata) << " RSD" << endl;

    return 0;
}
