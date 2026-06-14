/* Napisati program za rad sa kvadratnom matricom koja je realizovana kao
dinamički alociran dvodimenzionalan niz.
IMPLEMENTIRATI
- Funkciju za unos elemenata
- Funkciju koja, na osnovu zadate vrednosti, vraća sumu elemenata
1. iznad dijagonale
2. ispod dijagonale
3. na dijagonali
NAPOMENA
- Kvadratna matrica je matrica kod koje je broj redova jednak broju kolona
- Korisnik unosi dimenziju matrice
*/

#include "matrica.hpp"

int main(void)
{
    unsigned n = unosN();
    unsigned **matrica = new unsigned*[n];
    unsigned izbor = 0;

    cout << endl << "UNOS MATRICE" << endl;

    for(unsigned i = 0; i < n; i++)
        matrica[i] = new unsigned[n];

    unosMatrice(matrica, n);

    cout << endl << "MATRICU KOJU STE UNELI" << endl;
    for(unsigned i = 0; i < n; i++)
    {
        for(unsigned j = 0; j < n; j++)
            cout << matrica[i][j] << " ";
        cout << endl;
    }

    do {
        cout << endl << "1 - SUMA NA DIJAGONALI\n2 - SUMA IZNAD DIJAGONALE\n3 - SUMA ISPOD DIJAGONALE\n>> ";
        cin >> izbor;
    } while(izbor < 1 || izbor > 3);

    cout << endl;
    izborOpcije(izbor, matrica, n);

    // OSLOBADJANJE MEMORIJE U DINAMICKOJ ZONI
    for(unsigned i = 0; i < n; i++)
        delete[] matrica[i];
    delete[] matrica;

    return 0;
}
