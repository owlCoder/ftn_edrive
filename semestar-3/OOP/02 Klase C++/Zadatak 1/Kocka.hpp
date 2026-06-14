#ifndef KOCKA_HPP
#define KOCKA_HPP


#include <iostream>
#include <cstdlib>
#include <ctime>

using namespace std;

class Kocka {
    private:
        unsigned vrednost;
    public:
        Kocka();
        Kocka(unsigned);
        Kocka(const Kocka&);
        void baci();
        int getVrednost() const;
};

#endif // KOCKA_HPP
