/*
Napraviti jednostavan program za prevođenje reči sa engleskog na srpski jezik.
Nakon unosa reči sa standardnog ulaza, ispisuje se prevod (ukoliko unesena reč postoji u rečniku).

Uneti 3 engleske reči i njihove prevode na srpski.
*/

#include <iostream>
#include <map>

using namespace std;

int main()
{
    string rec;
    map<string, string> recnik;

    recnik["red"] = "crveno";
    recnik["yellow"] = "zuto";
    recnik["green"] = "zeleno";

    while(cin >> rec) {
        map<string, string>::const_iterator it = recnik.find(rec);

        if(it != recnik.cend())
            cout << it -> second << endl;
        else
            cout << "Nema prevoda!" << endl;

        cout << endl;
    }

    return 0;
}
