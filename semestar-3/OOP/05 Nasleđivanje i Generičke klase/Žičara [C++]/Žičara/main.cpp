#include "Zicara.hpp"

int main(void)
{
    // KARTA
    Karta k1, k2(2, LETO), k3(3, LETO), k4(k1);

    k1.getBroj();
    k1.getVrsta();
    k4.setBroj(4);
    k4.setVrsta(LETO);

    cout << k1 << endl;
    cout << k2 << endl;
    cout << k3 << endl;
    cout << k4 << endl;

    // PUTNIK
    Putnik p1, p2(5, LETO, "190100113598", "Ime");
    Putnik p3(40, LETO, "3203232", "Ime2");

    p1.getMb();
    p1.getVrstaKarte();
    p1.getIme();
    p1.getBrojKarte();

    cout << endl << p2 << endl;

    // PUTNIK DETE
    PutnikDete pd1, pd2(6, LETO, "12345", "Roditelj", "10101");
    PutnikDete pd3(p2, "12345");

    pd1.toString();
    pd3.toString();


    // ZICARA
    Zicara<SKI, 2, 30> z1;

    cout << endl << z1;
    z1.otvori();
    cout << endl << z1;
    z1.zatvori();
    cout << endl << z1;

    // nemaju kartu za sezonu leto
    z1.dodajPutnika(p1);
    z1.dodajPutnika(pd1);

    z1.dodajPutnika(pd3);
    z1.dodajPutnika(pd2);
    z1.dodajPutnika(p2);
    z1.dodajPutnika(p3);
    cout << endl << z1;

    z1.otvori();
    cout << (z1.preveziTuru() == true ? "TURA PREVEZENA!" : "NEUSPESAN PREVOZ!") << endl;
    cout << endl << z1;

    return 0;
}
