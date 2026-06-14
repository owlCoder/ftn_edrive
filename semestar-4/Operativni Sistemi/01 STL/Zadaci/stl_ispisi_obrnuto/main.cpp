/*
Napraviti program koji prihvata proizvoljan broj linija sa standardnog ulaza i zatim ih ispisuje u obrnutom redosledu
(poslednja prihvaćena linija se ispisuje prva).
*/

#include <iostream>
#include <list>

using namespace std;

int main()
{
    string linija;
    list<string> linije;

    while(getline(cin, linija))
        linije.push_back(linija);

    cout << "\nISPIS" << endl;
    for(auto it = linije.crbegin(); it != linije.crend(); it++)
        cout << *it << endl;

    return 0;
}
