#include "Rerna.hpp"

Rerna::Rerna()
{
    trenutnoStanje = ISKLJUCENA;
    temperatura = MIN_TEMP;
}

bool Rerna::ukljuci()
{
    bool uspesno = false;

    if(trenutnoStanje == ISKLJUCENA)
    {
        trenutnoStanje = UKLJUCENA;
        temperatura += KORAK;
        uspesno = true;
    }
    return uspesno;
}

bool Rerna::iskljuci()
{
    bool uspesno = false;

    if(trenutnoStanje == UKLJUCENA)
    {
        trenutnoStanje = ISKLJUCENA;
        temperatura = MIN_TEMP;
        uspesno = true;
    }
    return uspesno;
}

bool Rerna::pokvari()
{
    bool uspesno = false;
    if(trenutnoStanje != POKVARENA)
    {
        trenutnoStanje = POKVARENA;
        temperatura = MIN_TEMP;
        uspesno = true;
    }
    return uspesno;
}

bool Rerna::popravi()
{
    bool uspesno = false;
    if(trenutnoStanje == POKVARENA)
    {
        trenutnoStanje = ISKLJUCENA;
        temperatura = MIN_TEMP;
        uspesno = true;
    }
    return uspesno;
}

bool Rerna::pojacajTemperaturu()
{
    bool uspesno = false;
    if(trenutnoStanje == UKLJUCENA
        && temperatura + KORAK <= MAX_TEMP)
    {
        temperatura += KORAK;
        uspesno = true;
    }
    return uspesno;
}

bool Rerna::smanjiTemperaturu()
{
    bool uspesno = false;
    if(trenutnoStanje == UKLJUCENA
        && temperatura - KORAK >= MIN_TEMP)
    {
        temperatura -= KORAK;
        uspesno = true;
    }
    return uspesno;
}

StanjeRerne Rerna::getTrenutnoStanje() const
{
    return trenutnoStanje;
}

int Rerna::getTemperatura() const
{
    return temperatura;
}

void ispisiRernu(const Rerna &r)
{
    cout << "----------- RERNA -----------" << endl;
    cout << "TEMP: " << r.getTemperatura() << " C" << endl;
    StanjeRerne ts = r.getTrenutnoStanje();
    cout << "STANJE: " << (ts == UKLJUCENA ? "UKLJUCENA" : (ts == ISKLJUCENA ? "ISKLJUCENA" : "POKVARENA"));
    cout << endl << "-----------------------------" << endl;
}

int meni()
{
    int n = -1;

    cout << "----------- RERNA -----------" << endl;
    cout << "1 - Ukljuci rernu\n2 - Iskljuci rernu\n";
    cout << "3 - Pokvari rernu\n4 - Popravi rernu\n";
    cout << "5 - Pojacaj temperaturu\n6 - Smanji temperaturu\n";
    cout << "7 - Prikaz stanja\n8 - Kraj\n>> ";
    cin >> n;

    return n;
}
