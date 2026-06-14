#ifndef MEMORIJA_H_INCLUDED
#define MEMORIJA_H_INCLUDED

#include <mutex>

using namespace std;

class Memorija
{
    char *sadrzaj;
    mutex m;

public:
    Memorija(int bajtova) { sadrzaj = new char[bajtova]; }
    ~Memorija() { delete[] sadrzaj; }

    char citaj(int adresa)
    {
        this_thread::sleep_for(chrono::milliseconds(300));
        unique_lock<mutex> l(m);
        return sadrzaj[adresa];
    }

    void pisi(int adresa, char vrednost)
    {
        this_thread::sleep_for(chrono::milliseconds(300));
        unique_lock<mutex> l(m);
        sadrzaj[adresa] = vrednost;
    }
};

#endif // MEMORIJA_H_INCLUDED
