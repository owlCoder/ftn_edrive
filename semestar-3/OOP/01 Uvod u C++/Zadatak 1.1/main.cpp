/* 1-1 ZADATAK
C++
Napisati program koji pronalazi najveći broj među pozitivnim brojevima koje
korisnik unosi preko konzole. Za kraj unosa se koristi 0.
*/

#include <iostream>

using namespace std;

int main(void)
{
    int broj = -1, maks = 0;

    do {
        do {
            cout << "Pozitivan broj ili 0 za kraj\n>> ";
            cin >> broj;
        } while(broj < 0);

        if(broj == 0) {
            break;
        }
        else if(broj > 0) {
            if(broj > maks) {
                maks = broj;
            }
        }
    } while(broj > 0);

    cout << endl << "MAKS\n>> " << maks;

    return 0;
}
