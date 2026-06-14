/*
Korisnik treba da unese 5 celih brojeva koristeći tastaturu (standardni ulaz).
Korišćenjem STL algoritma, među tih 5 brojeva potrebno je pronaći najveći.
*/

#include <iostream>
#include <algorithm>

using namespace std;

int main()
{
    vector<int>brojevi(5);

    for(int i = 0; i < 5; i++)
        cin >> brojevi[i];

    cout << endl << "MAX: " << *max_element(brojevi.cbegin(), brojevi.cend()) << endl;

    return 0;
}
