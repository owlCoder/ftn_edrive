/*
Napraviti funkciju:

vector<int> min_n(const vector<int>& v,	int n);

Ova funkcija vraća vektor koji sadrži n najmanjih
elemenata iz vektora v.
Podrazumeva se: v.size()>=n
*/

#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

vector<int> min_n(const vector<int> &v,	int n) {

    vector<int> r(n);
    vector<int> tmp(v);

    sort(tmp.begin(), tmp.end());

    for(int i = 0; i < n; i++)
        r[i] = tmp[i];

    return r;
}

int main()
{
    const unsigned n = 3;
    const unsigned vel = 5;

    vector<int> v(vel);
    vector<int> r(n);

    cout << "VEKTOR v: ";
    for(unsigned i = 0; i < vel; i++)
        cin >> v[i];

    r = min_n(v, n);

    cout << "\n" << n << " najmanjih elemenata vektora v: ";
    for(int i = 0; i < n; i++)
        cout << r[i] << " ";

    return 0;
}
