/*
Napisati program koji omogućava evidentiranje fakultetskih učionica.

Za svaku učionicu potrebno je evidentirati naziv učionice, kvadraturu i sve računare koji se nalaze u učionici.
Za svaki računar evidentiraju se podaci o hard disku i procesoru.

U okviru main funkcije, definisati jednu učionicu koja sadrži dva računara.
Zatim je potrebno na konzolu ispisati hard disk i procesor svakog računara u učionici.
*/

#include <iostream>
#include <list>

using namespace std;

class Racunar
{
    public:
        string hdd, procesor;
        Racunar(string hd, string cpu) : hdd(hd), procesor(cpu) { }

        friend ostream &operator<<(ostream &out, const Racunar &r) {
            out << "HDD: " << r.hdd << endl << "CPU: " << r.procesor << endl;
            return out;
        }
};

class Ucionica {
    private:
        string naziv;
        float kvadratura;
        list<Racunar> racunari;

    public:
        Ucionica(string n, float k) : naziv(n), kvadratura(k) { }

        void ubaci(const Racunar &r) {
            racunari.push_back(r);
        }

        friend ostream &operator<<(ostream &out, const Ucionica &u) {
            out << "---------------------------- UCIONICA ----------------------------";
            out << endl << "Naziv: " << u.naziv << endl << "Kvadratura: " << u.kvadratura << endl << endl;

            unsigned i = 1;

            for(auto it = u.racunari.cbegin(); it != u.racunari.cend(); it++)
                out << "RACUNAR[" << i++ << "]: " << *it << endl;

            return out;
        }
};

int main()
{
    Racunar r1("Hitachi", "AMD"), r2("WD", "Intel"), r3("Seagate", "AMDs");
    Ucionica u1("NTP-316", 25);
    Ucionica u2("NTP-317", 30);

    u1.ubaci(r1);
    u1.ubaci(r2);

    u2.ubaci(r3);
    u2.ubaci(r1);

    cout << u1 << u2;

    return 0;
}
