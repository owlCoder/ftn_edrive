#include "Kocka.hpp"

Kocka::Kocka()
{
    vrednost = 1;
}

Kocka::Kocka(unsigned vrednost)
{
    this -> vrednost = vrednost;
}

Kocka::Kocka(const Kocka &k)
{
    vrednost = k.vrednost;
}

void Kocka::baci()
{
    vrednost = rand() % 6 + 1;
}

int Kocka::getVrednost() const
{
    return vrednost;
}
