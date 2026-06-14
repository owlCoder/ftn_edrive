#include "matrica.hpp"

unsigned unosN()
{
    unsigned n = 0;
    do {
        cout << "DIMENZIJA MATRICE\n>> ";
        cin >> n;
    } while(n < 1);

    return n;
}

void unosMatrice(unsigned **matrica, const unsigned n)
{
    for(unsigned i = 0; i < n; i++)
        for(unsigned j = 0; j < n; j++)
        {
            cout << "matrica[" << i << "][" << j << "] = ";
            cin >> matrica[i][j];
        }
}

unsigned sumaDijagonala(unsigned **matrica, const unsigned n)
{
    unsigned suma = 0;
    for(unsigned i = 0; i < n; i++)
        for(unsigned j = 0; j < n; j++)
            if(i == j)
                suma += matrica[i][j];
    return suma;
}

unsigned sumaIznad(unsigned **matrica, const unsigned n)
{
    unsigned suma = 0;
    for(unsigned i = 0; i < n; i++)
        for(unsigned j = 0; j < n; j++)
            if(j > i)
                suma += matrica[i][j];
    return suma;
}

unsigned sumaIspod(unsigned **matrica, const unsigned n)
{
    unsigned suma = 0;
    for(unsigned i = 0; i < n; i++)
        for(unsigned j = 0; j < n; j++)
            if(j < i)
                suma += matrica[i][j];
    return suma;
}

void izborOpcije(unsigned izbor, unsigned **matrica, const unsigned n)
{
    if(izbor == 1)
    {
        unsigned suma = sumaDijagonala(matrica, n);
        cout << endl << "SUMA DIJAGONALE\n>> " << suma << endl;
    }
    else if(izbor == 2)
    {
        unsigned suma = sumaIznad(matrica, n);
        cout << endl << "SUMA IZNAD DIJAGONALE\n>> " << suma << endl;
    }
    else if(izbor == 3)
    {
        unsigned suma = sumaIspod(matrica, n);
        cout << endl << "SUMA ISPOD DIJAGONALE\n>> " << suma << endl;
    }
    else
        cout << "Wrong choices make no sense :)" << endl;
}
