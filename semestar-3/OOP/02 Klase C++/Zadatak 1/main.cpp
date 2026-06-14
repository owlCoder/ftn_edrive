/*
    Napisati klasu Kocka koja modeluje kocku za igru.

    IMPLEMENTIRATI:
        - prazan konstruktor
        - konstruktor sa parametrima
        - konstruktor kopije
        - metodu void baci()
        - metodu int getVrednost() const
        - slobodnu funkciju int meni()

        - prazan konstruktor podesava stranu kocke na 1
        - koristiti rand() funkciju [rand() % (X - Y + 1) + Y;
        - X = 6; Y = 1

        - int meni() pokazuje listu operacija i kao povratnu vrednost
        - vraca koja se operacija nad klasom izvršava
*/

#include "kocka.hpp"

int meni();
void odabranaOperacija(Kocka &k, unsigned);

int main(void)
{
    Kocka k1;
    Kocka k2(3);
    Kocka k3(k2);

    srand(time(0));

    unsigned n;

    do
    {
        n = meni();
        odabranaOperacija(k1, n);
    } while(n != 3);

    return 0;
}

int meni()
{
    int n = -1;

    do
    {
        cout << "\n1 - Bacanje kocke\n2 - Prikaz kocke\n3 - Kraj\n>> ";
        cin >> n;
    } while(n < 1 && n > 3);

    return n;
}

void odabranaOperacija(Kocka &k, unsigned n)
{
    if(n == 3)
        return;
    else if(n == 2)
    {
        cout << "\nTrenutna vrednost na kockici\n>> " << k.getVrednost() << endl;
    }
    else if(n == 1)
    {
        k.baci();
        cout << endl << "Kocka je bacena!" << endl;
    }
}
