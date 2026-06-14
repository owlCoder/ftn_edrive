/*
Napraviti program koji prihvata proizvoljan broj linija sa standardnog ulaza i
zatim ih ispisuje u redosledu kojim su uneti.
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
    for(auto it = linije.cbegin(); it != linije.cend(); it++)
        cout << *it << endl;

    return 0;
}
