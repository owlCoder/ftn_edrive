#include "televizor.hpp"

Televizor::Televizor()
{
    stanje = ISKLJUCEN;
    kanal = 1;
    zvuk = 0;
}

Televizor::Televizor(const Televizor &t)
{
    stanje = t.stanje;
    kanal = t.kanal;
    zvuk = t.zvuk;
}

bool Televizor::ukljuci()
{
    bool uspesno = false;

    if(stanje == ISKLJUCEN)
    {
        stanje = UKLJUCEN;
        uspesno = true;
    }
    return uspesno;
}

bool Televizor::iskljuci()
{
    bool uspesno = false;

    if(stanje == UKLJUCEN)
    {
        stanje = ISKLJUCEN;
        zvuk = 0;
        kanal = 1;
        uspesno = true;
    }
    return uspesno;
}

bool Televizor::pokvari()
{
    bool uspesno = false;

    if(stanje != POKVAREN)
    {
        stanje = POKVAREN;
        zvuk = 0;
        kanal = 1;
        uspesno = true;
    }

    return uspesno;
}

bool Televizor::popravi()
{
    bool uspesno = false;

    if(stanje == POKVAREN)
    {
        stanje = ISKLJUCEN;
        zvuk = 0;
        kanal = 1;
        uspesno = true;
    }

    return uspesno;
}

bool Televizor::pojacajZvuk()
{
    bool uspesno = false;

    if(stanje == UKLJUCEN && zvuk + 1 <= 20)
    {
        ++zvuk;
        uspesno = true;
    }
    return uspesno;
}

bool Televizor::smanjiZvuk()
{
    bool uspesno = false;

    if(stanje == UKLJUCEN && zvuk - 1 >= 0)
    {
        --zvuk;
        uspesno = true;
    }
    return uspesno;
}

bool Televizor::sledeciKanal()
{
    bool uspesno = false;

    if(stanje == UKLJUCEN && kanal + 1 <= 5)
    {
        ++kanal;
        uspesno = true;
    }
    return uspesno;
}

bool Televizor::prethodniKanal()
{
    bool uspesno = false;

    if(stanje == UKLJUCEN && kanal - 1 >= 1)
    {
        --kanal;
        uspesno = true;
    }
    return uspesno;
}

// SLOBODNE FUNKCIJE
string stanjeToStr(const StanjeTelevizora stanje)
{
    if(stanje == UKLJUCEN)
        return "UKLJUCEN";
    else if(stanje == ISKLJUCEN)
        return "ISKLJUCEN";
    else if(stanje == POKVAREN)
        return "POKVAREN";
    else
        return "Undefined";
}

void ispis(const Televizor &t)
{
    cout << "\nStanje: " << stanjeToStr(t.getStanje()) << endl;
    cout << "Kanal: " << t.getKanal() << endl;
    cout << "Zvuk: " << t.getZvuk() << endl;
}

int meni()
{   int n;

    cout << endl << " ---------- TELEVIZOR -----------" << endl;
    cout << " | \t1 - ukljuci()\t\t|" << endl;
    cout << " | \t2 - iskljuci()\t\t|" << endl;
    cout << " | \t3 - pokvari()\t\t|" << endl;
    cout << " | \t4 - popravi()\t\t|" << endl;
    cout << " | \t5 - pojacajZvuk()\t|" << endl;
    cout << " | \t6 - smanjiZvuk()\t|" << endl;
    cout << " | \t7 - sledeciKanal()\t|" << endl;
    cout << " | \t8 - prethodniKanal()\t|" << endl;
    cout << " | \t9 - Kraj\t\t|" << endl;
    cout << " --------------------------------" << endl;

    do
    {
        cout << ">> ";
        cin >> n;
    } while(n < 1 || n > 9);

    return n;
}
