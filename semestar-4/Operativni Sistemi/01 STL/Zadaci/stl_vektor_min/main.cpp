/*
Napraviti funkciju:

vector<int> min(const vector<int>& a, const vector<int>& b);

Ova funkcija vraća vektor koji sadrži minimume korespodentnih
elemenata vektora a i b.
Npr: r[0]=min(a[0],b[0]), r[1]=...
Podrazumeva se: a.size()==b.size()
*/

#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

vector<int> min(const vector<int> &a, const vector<int> &b) {
    vector<int> r(a.size());

    for(unsigned i = 0; i < a.size(); i++)
        r[i] = min(a[i], b[i]);

    return r;
}

int main()
{
    const unsigned n = 5;
    vector<int> a(n);
    vector<int> b(n);
    vector<int> r(n);

    cout << "VEKTOR a: ";
    for(unsigned i = 0; i < n; i++)
        cin >> a[i];

    cout << "VEKTOR b: ";
    for(unsigned i = 0; i < n; i++)
        cin >> b[i];

    r = min(a, b);

    cout << endl << "VEKTOR R: ";
    for(unsigned i = 0; i < n; i++)
        cout << r[i] << " ";

    return 0;
}
