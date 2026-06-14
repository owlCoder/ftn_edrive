/// 01 Ambulanta

#include <iostream>
#include <thread>
#include <mutex>
#include <condition_variable>
#include <chrono>
#include <string>

using namespace std;
using namespace chrono;
using namespace this_thread;

enum Pol {MUSKI       = 0, 
          ZENSKI      = 1};
const int M_MESTA     = 1;
const int Z_MESTA     = 2;
const int M_STUDENATA = 3;
const int Z_STUDENATA = 5;

class Student
{
    private:
        string nazivPola(Pol p)
        {
            if(p == MUSKI)
                return string("muski");
            else
                return string("zenski");
        }

    public:
        void ceka(int rbr, Pol p)
        {
            cout << "Student sa rednim brojem " << rbr << " (pol: " << nazivPola(p) << ") ceka." << endl;
        }

        void ulazi(int rbr, Pol p)
        {
            cout << "Student sa rednim brojem " << rbr << " (pol: " << nazivPola(p) << ") ulazi u ordinaciju." << endl;
        }
};

class StudentskaAmbulanta
{
    private:
        Student &student;
        int brojSlobodnihMesta[2];
        condition_variable ambulantaSlobodna[2];
        mutex m;

    public:
        StudentskaAmbulanta(Student &st, int muskih, int zenskih) : student(st)
        {
            brojSlobodnihMesta[0] = muskih;
            brojSlobodnihMesta[1] = zenskih;
        }

        void udji(int rbr, Pol p)
        {
            unique_lock<mutex> lock(m);
            while(brojSlobodnihMesta[p] == 0)
            {
                ambulantaSlobodna[p].wait(lock);
                student.ceka(rbr, p);
            }

            student.ulazi(rbr, p);
            brojSlobodnihMesta[p]--;
        }

        void izadji(int rbr, Pol p)
        {
            unique_lock<mutex> lock(m);
            brojSlobodnihMesta[p]++;
            ambulantaSlobodna[p].notify_one();
        }
};

void student(StudentskaAmbulanta &sa, int indeks, Pol p)
{
    sa.udji(indeks, p);
    sleep_for(seconds(1 + indeks % 3));
    sa.izadji(indeks, p);
}

void testirajSve()
{
    Student s;
    StudentskaAmbulanta sa(s, M_MESTA, Z_MESTA);
    thread t[M_STUDENATA + Z_STUDENATA];

    for(int i = 0; i < M_STUDENATA; i++)
        t[i] = thread(student, ref(sa), i, Pol::MUSKI);

    for(int i = 0; i < Z_STUDENATA; i++)
        t[M_STUDENATA + i] = thread(student, ref(sa), i, Pol::ZENSKI);

    for(int i = 0; i < M_STUDENATA  + Z_STUDENATA; i++)
        t[i].join();
}

int main(void)
{
    testirajSve();

    return 0;
}


/// 02 ATLETIKA
#include <iostream>
#include <thread>
#include <mutex>
#include <condition_variable>
#include <chrono>
#include <string>

using namespace std;
using namespace chrono;
using namespace this_thread;

enum NA_REDU {SKAKAC, BACAC};
const int BROJ_SKAKACA = 10;
const int BROJ_BACACA  = 10;
typedef system_clock::time_point timePoint;

struct PovratnaVrednost
{
    int rezultat;
    duration<double, milli> trajanje;
};

class Takmicar {
    public:
        void skakac_ceka(int rbr) 
        {
            cout << "Takmicar sa brojem " << rbr << " (skakac) ceka da stupi na zaletiste." << endl;
        }

        void bacac_ceka(int rbr) 
        {
            cout << "Takmicar sa brojem " << rbr << " (bacac) ceka da stupi na zaletiste." << endl;
        }

        void skakac_skace(int rbr) 
        {
            cout << "Takmicar sa brojem " << rbr << " (skakac) stupio je na zaletiste." << endl;
        }

        void bacac_baca(int rbr) 
        {
            cout << "Takmicar sa brojem " << rbr << " (bacac) stupio je na zaletiste." << endl;
        }

        void skakac_zavrsio(int rbr, PovratnaVrednost rez) 
        {
            cout << "Takmicar sa brojem " << rbr << " skocio " << rez.rezultat << " metara"
                << ", a cekao " << rez.trajanje.count() << " milisekundi. " << endl;
        }

        void bacac_zavrsio(int rbr, PovratnaVrednost rez) 
        {
            cout << "Takmicar sa brojem " << rbr << " bacio koplje " << rez.rezultat << " metara"
                << ", a cekao " << rez.trajanje.count() << " milisekundi. " << endl;
        }
};

class AtletskaStaza
{
    private:
        Takmicar &takmicar;
        NA_REDU naRedu;
        bool slobodno;
        int skakacaCeka, bacacaCeka;
        condition_variable skakaci, bacaci;
        mutex m;

    public:
        AtletskaStaza(Takmicar &t) : takmicar(t)
        {
            naRedu = SKAKAC;
            skakacaCeka = 0;
            bacacaCeka  = 0;
            slobodno = true;
        }

        PovratnaVrednost skaci(int rbr)
        {
            timePoint dosao = system_clock::now();

            unique_lock<mutex> lock(m);
            while(!slobodno || naRedu != SKAKAC)
            {
                skakacaCeka++;
                takmicar.skakac_ceka(rbr);
                skakaci.wait(lock);
                skakacaCeka--;
            }

            slobodno = false;

            lock.unlock();
            takmicar.skakac_skace(rbr);
            sleep_for(seconds(2));
            timePoint zavrsio = system_clock::now();
            lock.lock();

            slobodno = true;

            if(bacacaCeka > 0)
            {
                naRedu = BACAC;
                bacaci.notify_one();
            }
            else
            {
                naRedu = SKAKAC;
                skakaci.notify_one();
            }

            PovratnaVrednost p;

            p.rezultat = rand() % 10;
            p.trajanje = zavrsio - dosao;
            takmicar.skakac_zavrsio(rbr, p);

            return p;
        }

        PovratnaVrednost baciKoplje(int rbr)
        {
            timePoint dosao = system_clock::now();

            unique_lock<mutex> lock(m);

            while(!slobodno || naRedu != BACAC)
            {
                bacacaCeka++;
                takmicar.bacac_ceka(rbr);
                bacaci.wait(lock);
                bacacaCeka--;
            }
            
            slobodno = false;

            lock.unlock();
            takmicar.bacac_baca(rbr);
            sleep_for(seconds(1));
            timePoint zavrsio = system_clock::now();
            lock.lock();

            slobodno = true;

            if(skakacaCeka > 0)
            {
                naRedu = SKAKAC;
                skakaci.notify_one();
            }
            else
            {
                naRedu = BACAC;
                bacaci.notify_one();
            }

            PovratnaVrednost p;

            p.rezultat = rand() % 100;
            p.trajanje = zavrsio - dosao;
            takmicar.skakac_zavrsio(rbr, p);

            return p;
        }
};

void skakac(AtletskaStaza &a, int rbr)
{
    a.skaci(rbr);
}

void bacac(AtletskaStaza &a, int rbr)
{
    a.baciKoplje(rbr);
}

int main(void)
{   
    Takmicar t;
    AtletskaStaza staza(t);
    thread skakaci[BROJ_SKAKACA];
    thread bacaci[BROJ_BACACA];

    for(int i = 0; i < 10; i++)
    {
        skakaci[i] = thread(skakac, ref(staza), i + 1);
        bacaci[i]  = thread(bacac, ref(staza), i + 1);
    }

    for (int i = 0; i < BROJ_BACACA; ++i)
        bacaci[i].join();

    for (int i = 0; i < BROJ_SKAKACA; ++i)
        skakaci[i].join();

    return 0;
}

/// 03 BIBLIOTEKA
#include <iostream>
#include <thread>
#include <mutex>
#include <condition_variable>
#include <chrono>
#include <string>

using namespace std;
using namespace chrono;
using namespace this_thread;

class Primerak
{
    public:
        void ceka(int rbr) 
        {
        cout << "Clan sa rednim brojem " << rbr << " ceka na slobodan primerak knjige." << endl;
        }

        void iznajmljen(int rbr) 
        {
            cout << "Clan sa rednim brojem " << rbr << " iznajmio je primerak knjige." << endl;
        }

        void vracen(int rbr) 
        {
            cout << "Clan sa rednim brojem " << rbr << " vratio je primerak knjige." << endl;
        }
};

class Biblioteka
{
    private:
        Primerak &p;
        int slobodnihPrimeraka;
        condition_variable cv;
        mutex m;

    public:
        Biblioteka(Primerak &pr, int broj) : p(pr), slobodnihPrimeraka(broj) {}

        void iznajmi(int rbr)
        {
            unique_lock<mutex> lock(m);

            while(slobodnihPrimeraka == 0)
            {
                p.ceka(rbr);
                cv.wait(lock);
            }

            p.iznajmljen(rbr);
            slobodnihPrimeraka--;
        }

        void vrati(int rbr)
        {
            unique_lock<mutex> lock(m);
            slobodnihPrimeraka++;
            p.vracen(rbr);
            cv.notify_one();
        }
};

void clan(Biblioteka &b, int brojClanskeKarte)
{
    b.iznajmi(brojClanskeKarte);
    sleep_for(seconds(rand() % 4 + 1));
    b.vrati(brojClanskeKarte);
}

int main(void)
{
    Primerak p;
    Biblioteka b(p, 3);
    thread clanovi[10];

    for(int i = 0; i < 10; i++)
        clanovi[i] = thread(clan, ref(b), i + 1);

    for(int i = 0; i < 10; i++)
        clanovi[i].join();

    return 0;
}

/// 04 Parking X3
#include <iostream>
#include <thread>
#include <mutex>
#include <condition_variable>
#include <chrono>
#include <string>

using namespace std;
using namespace chrono;
using namespace this_thread;

const int AUTOMOBILA = 12;

class Automobil
{
    public:
        void ceka(int rbr, int ulaz) 
        {
            cout << "Automobil "<< rbr <<" ceka kako bi usao na parking, na ulazu "<< ulaz <<endl;
        }

        void zauzima(int rbr) 
        {
            cout << "Automobil " << rbr <<" je zauzeo parking." << endl;
        }

        void napusta(int rbr) 
        {
            cout << "Automobil "<< rbr << " je napustio parking." << endl;
        }
};

class Parking
{
    private:
        Automobil &a;
        int trenutniUlaz;
        bool slobodno;
        condition_variable ulazi[3];
        mutex m;

    public:
        Parking(Automobil &au) : a(au), slobodno(true), trenutniUlaz(0) {}

        void udji(int rbr, int ulaz)
        {
            unique_lock<mutex> lock(m);

            while(!slobodno || ulaz != trenutniUlaz)
            {
                a.ceka(rbr, ulaz);
                ulazi[ulaz].wait(lock);
            }

            a.zauzima(rbr);
            slobodno = false;
            trenutniUlaz = (trenutniUlaz + 1) % 3;
        }

        void izadji(int rbr)
        {
            unique_lock<mutex> lock(m);
            a.napusta(rbr);
            slobodno = true;
            ulazi[trenutniUlaz].notify_one();
        }
};

void automobil(Parking &p, int ulaz, int ostajemNaParkingu, int rba)
{
    p.udji(rba, ulaz);
    sleep_for(seconds(ostajemNaParkingu));
    p.izadji(rba);
}

int main(void)
{
    Automobil a;
    Parking p(a);
    thread t[AUTOMOBILA];

    for(int i = 0; i < AUTOMOBILA; i++)
        t[i] = thread(automobil, ref(p), i % 3, (i % 2) + 1, i + 1);

    for(int i = 0; i < AUTOMOBILA; i++)
        t[i].join();

    return 0;
}

/// 05 POSTA
#include <iostream>
#include <thread>
#include <mutex>
#include <condition_variable>
#include <chrono>
#include <string>

using namespace std;
using namespace chrono;
using namespace this_thread;

const int KLIJENATA = 7;

struct PovratnaVrednost
{
    int salter;
    int uplaceno;

    PovratnaVrednost(int s, int u) : salter{s}, uplaceno{u} {}
};

class Klijent
{
    public:
        void ceka(int rbr, int svota) 
        {
        cout << "Klijent broj: " << rbr << " ceka na salteru, zeli da uplati " << svota << " hiljada dinara." << endl;
        }

        void uplacuje(int rbr, int salter, int svota) 
        {
            cout << "Klijent broj: " << rbr << " (" << svota << ") salter " << salter << endl;
        }

        void napusta(int rbr, int salter, int ukupno_uplaceno) 
        {
            cout << "Klijent broj: " << rbr << " napusta salter " << salter << " (ukupno uplaceno na salteru: " << ukupno_uplaceno << ")" << endl;
        }
};

class Posta
{
    private:
        Klijent &k;
        int uplaceno[2];
        bool salterZauzet[2];
        condition_variable red;
        mutex m;

    public:
        Posta(Klijent &kl) : k(kl) 
        {
            uplaceno[0] = 0;
            uplaceno[1] = 0;
            salterZauzet[0] = false;
            salterZauzet[1] = false;
        }

        void uplati(int rbr, int svota)
        {
            unique_lock<mutex> lock(m);
            while(salterZauzet[0] && salterZauzet[1])
            {
                k.ceka(rbr, svota);
                red.wait(lock);
            }

            int salter = salterZauzet[0] ? 1 : 0;
            salterZauzet[salter] = true;

            k.uplacuje(rbr, salter, svota);

            lock.unlock();
            sleep_for(seconds(svota));
            lock.lock();

            uplaceno[salter] += svota;
            salterZauzet[salter] = false;
            k.napusta(rbr, salter, uplaceno[salter]);
            red.notify_one();
        }
};

void klijent(Posta &p, int svota, int rbk)
{
    p.uplati(rbk, svota);
}

int main(void)
{
    Klijent k;
    Posta p(k);
    thread t[KLIJENATA];

    for(int i = 0; i < KLIJENATA; i++)
        t[i] = thread(klijent, ref(p), i * 3 % 4 + 1, i + 1);

    for(int i = 0; i < KLIJENATA; i++)
        t[i].join();

    return 0;
}

/// 06 RACUNARI
#include <iostream>
#include <thread>
#include <mutex>
#include <condition_variable>
#include <chrono>
#include <string>

using namespace std;
using namespace chrono;
using namespace this_thread;

#define MAX 50
const int STUDENATA = 10;

class Student
{
    public:
        void ceka(int rbr)
        {
            cout << "Student " << rbr << " ceka jer nema slobodnih racunara." << endl;
        }

        void zauzeo(int rbr, int idRacunara)
        {
            cout << "Student " << rbr << " seo za racunar " << idRacunara << "." << endl;
        }

        void oslobodio(int rbr, int idRacunara)
        {
            cout << "Student " << rbr << " zavrsio rad na racunaru " << idRacunara << " i napusta ucionicu." << endl;
        }
};

class RC
{
    private:
        Student &s;
        int brojSlobodnih, brojRacunara;
        bool slobodni[MAX];
        condition_variable cv;
        mutex m;

    public:
        RC(Student &st, int br) : s(st)
        {
            brojRacunara = br;
            brojSlobodnih = brojRacunara;

            for(int i = 0; i < brojSlobodnih; i++)
                slobodni[i] = true;
        }

        int zauzmi(int rbr)
        {
            unique_lock<mutex> lock(m);
            int retVal;

            while(brojSlobodnih == 0)
            {
                s.ceka(rbr);
                cv.wait(lock);
            }

            for(int i = 0; i < brojRacunara; i++)
                if(slobodni[i])
                {
                    s.zauzeo(rbr, i);
                    slobodni[i] = false;
                    retVal = i + 1;
                    break;
                }
            --brojSlobodnih;

            return retVal;
        }

        void oslobodi(int rbr, int idRacunara)
        {
            unique_lock<mutex> lock(m);
            ++brojSlobodnih;
            s.oslobodio(rbr, idRacunara - 1);
            slobodni[idRacunara - 1] = true;
            cv.notify_one();
        }
};

void student(RC &rc, int brojIndeksa)
{
    int idRacunara = rc.zauzmi(brojIndeksa);
    sleep_for(seconds(rand() % 5 + 1));
    rc.oslobodi(brojIndeksa, idRacunara);
}

int main(void)
{
    Student s;
    RC rc(s, 3);
    thread t[STUDENATA];

    for(int i = 0; i < STUDENATA; i++)
        t[i] = thread(student, ref(rc), i + 1);

     for(int i = 0; i < STUDENATA; i++)
        t[i].join(); 

    return 0;
}


/// 07 SKLADISTE
#include <iostream>
#include <thread>
#include <mutex>
#include <condition_variable>
#include <chrono>
#include <string>
#include <vector>
#include <algorithm>

using namespace std;
using namespace chrono;
using namespace this_thread;

const int BROJ_RAMPI = 2;
const int KAMIONA = 10;

string tipRobe(bool zapaljivo) 
{
    if(zapaljivo)
        return string("zapaljive");
    else
        return string("obicne");
}

class Kamion
{
    public:
        void ceka(int rbr, int kolicina, bool zapaljivo)
        {
            cout << "Kamion broj: " << rbr << " ceka da se oslobodi rampa. Nosi " << kolicina << " T " << tipRobe(zapaljivo) << " robe." << endl;
        }

        void istovara(int rbr, int kolicina, bool zapaljivo, int rampa)
        {
            cout << "Kamion broj: " << rbr << " istovara se na rampi " << rampa << ". Nosi " << kolicina << " T " << tipRobe(zapaljivo) << " robe." << endl;
        }

        void odlazi(int rbr) 
        {
            cout << "Kamion broj: " << rbr << " je zavrsio istovar i odlazi." << endl;
        }
};

class Skladiste
{
    private:
        Kamion &k;
        int brojZapaljivih;
        vector<bool> zauzeta;
        condition_variable cv[2];
        mutex m;

    public:
        Skladiste(Kamion &ka) : k(ka), zauzeta(BROJ_RAMPI), brojZapaljivih(0) {}

        void istovari(int rbr, int kolicina, bool zapaljivo)
        {
            vector<bool>::iterator it;
            
            {
                unique_lock<mutex> lock(m);

                while( (it = find(zauzeta.begin(), zauzeta.end(), false)) == zauzeta.end())
                {
                    k.ceka(rbr, kolicina, zapaljivo);

                    if(zapaljivo)
                    {
                        brojZapaljivih++;
                        cv[1].wait(lock);
                        brojZapaljivih--;
                    }
                    else
                        cv[0].wait(lock);
                }
                *it = true;
            }
        
            k.istovara(rbr, kolicina, zapaljivo, it - zauzeta.begin());
            sleep_for(seconds(kolicina));

            {
                unique_lock<mutex> lock(m);
                *it = false;
                k.odlazi(rbr);

                if(brojZapaljivih)
                    cv[1].notify_one();
                else
                    cv[0].notify_one();
            }
        }
};

void kamion(Skladiste &s, int kolicina, bool zapaljivo, int rbk)
{
    s.istovari(rbk, kolicina, zapaljivo);
}

int main(void)
{
    Kamion k;
    Skladiste s(k);
    thread t[KAMIONA];
    vector<int> tezine = {1, 5, 4, 6, 2, 5, 6, 3, 4, 2};

     for(int i = 0; i < KAMIONA; i++)
        t[i] = thread(kamion, ref(s), tezine[i], i % 2, i + 1);
    
    for(int i = 0; i < KAMIONA; i++)
        t[i].join();

    return 0;
}

/// 08 SOPING
#include <iostream>
#include <thread>
#include <mutex>
#include <condition_variable>
#include <chrono>
#include <string>

using namespace std;
using namespace chrono;
using namespace this_thread;

const int KUPACA = 10;

struct PovratnaVrednost
{
    bool kupio;
    duration<double, milli> cekaoNaKabinu;
};

class Kupac {
    public:
        void ceka(int rbr) 
        {
            cout << "Kupac " << rbr << " ceka jer su kabine za probu zauzete." << endl;
        }

        void proba_odecu(int rbr) 
        {
            cout << "Kupac " << rbr << " ulazi u kabinu za probu odece." << endl;
        }

        void zavrsio(int rbr, PovratnaVrednost pv) 
        {
            if (pv.kupio)
                cout << "Kupac " << rbr << " je kupio odecu. Cekao na kabinu: "
                    << pv.cekaoNaKabinu.count() << " milisekundi." << endl;
            else 
            {
                cout << "Kupac " << rbr << " nije kupio odecu. Cekao na kabinu: "
                    << pv.cekaoNaKabinu.count() << " milisekundi." << endl;
                this_thread::sleep_for(seconds(1));
            }
        }
};

class Prodavnica
{
    private:
        Kupac &k;
        int slobodnihMesta;
        condition_variable cv;
        mutex m;

    public:
        Prodavnica(Kupac &ku, int n) : k(ku), slobodnihMesta(n) {}

        PovratnaVrednost kupi(int rbr)
        {
            PovratnaVrednost pv;
            unique_lock<mutex> lock(m);
            system_clock::time_point dosao = system_clock::now();

            while(slobodnihMesta == 0)
            {
                k.ceka(rbr);
                cv.wait(lock);
            }

            pv.cekaoNaKabinu = system_clock::now() - dosao;
            slobodnihMesta--;
            k.proba_odecu(rbr);

            lock.unlock();
            sleep_for(seconds(1));
            lock.lock();

            pv.kupio = rand() % 2;
            slobodnihMesta++;
            k.zavrsio(rbr, pv);
            cv.notify_one();

            return pv;
        }
};

void kupac(Prodavnica &p, int idKupca)
{
    PovratnaVrednost pv;

    do
    {
        pv = p.kupi(idKupca);

        if(!pv.kupio)
            sleep_for(seconds(1));
    } while(!pv.kupio);
}

int main(void)
{
    Kupac k;
    Prodavnica p(k, 3);
    thread kupci[KUPACA];

    for (int i = 0; i < KUPACA; ++i)
        kupci[i] = thread(kupac, ref(p), i + 1);

    for (int i = 0; i < KUPACA; ++i)
        kupci[i].join();

    return 0;
}

/// 09 TENIS
#include <iostream>
#include <thread>
#include <mutex>
#include <condition_variable>
#include <chrono>
#include <string>

using namespace std;
using namespace chrono;
using namespace this_thread;

typedef system_clock::time_point timePoint;
#define MAX_TERENA 30

struct Podaci
{
    duration<double, milli> trajanje;
    timePoint dosao;
    timePoint pocetak;
};

class Mec
{
    public:
        void ceka(int rbr, int teren) 
        {
        cout << "Mec " << rbr << " mora da saceka posto je teren " << teren << " zauzet." << endl;
        }

        void pocinje(int rbr, int teren) 
        {
            cout << "Mec " << rbr << " na terenu " << teren << " upravo pocinje." << endl;
        }

        void zavrsen(int rbr, Podaci p) 
        {
            duration<double, milli> cekao = p.pocetak - p.dosao;
            cout << "Mec " << rbr << " je zavrsen. Trajao je: " << p.trajanje.count() << " milisekundi. Takmicari su na pocetak meca cekali " << cekao.count() << " milisekundi. " << endl;
        }
};

class TeniskiKlub
{
    private:
        Mec &mec;
        bool slobodni[MAX_TERENA];
        condition_variable uslovi[MAX_TERENA];
        mutex m;

    public:
        TeniskiKlub(Mec &m, int ukupnoTerena) : mec(m)
        {
            for(int i = 0; i < ukupnoTerena; i++)
                slobodni[i] = true;
        }

        void odigrajMec(int brojMeca, int naTerenu)
        {
            Podaci p;

            {
                p.dosao = system_clock::now();

                unique_lock<mutex> lock(m);
                while(!slobodni[naTerenu])
                {
                    mec.ceka(brojMeca, naTerenu);
                    uslovi[naTerenu].wait(lock);
                }

                p.pocetak = system_clock::now();
                slobodni[naTerenu] = false;
                mec.pocinje(brojMeca, naTerenu);
            }

            sleep_for(seconds(rand() % 5 + 1));
            p.trajanje = system_clock::now() - p.pocetak;
            mec.zavrsen(brojMeca, p);

            unique_lock<mutex> lock(m);
            slobodni[naTerenu] = true;
            uslovi[naTerenu].notify_one();
        }
};

void mec(TeniskiKlub &tk, int brojMeca, int naTerenu)
{
    tk.odigrajMec(brojMeca, naTerenu);
}

int main(void)
{
    Mec m;
    TeniskiKlub tk(m, 3);

    int brojTakmicara = 20, brojMeceva = 10;
    thread mecevi[brojMeceva];

    for(int i = 0; i < brojMeceva; i++)
        mecevi[i] = thread(mec, ref(tk), i, i % 3);

    for(int i = 0; i < brojMeceva; i++)
        mecevi[i].join();

    return 0;
}

/// 10 TRZNI CENTAR

#include <iostream>
#include <thread>
#include <mutex>
#include <condition_variable>
#include <chrono>
#include <string>

using namespace std;
using namespace chrono;
using namespace this_thread;

const int KUPACA = 10;

class Kupac
{
    public:
        void ceka(int rbr, int kasa) 
        {
            cout << "Kupac " << rbr << " mora da ceka da se kasa " << kasa << " oslobodi." << endl;
        }

        void kupuje(int rbr, int kasa, int kolicina) 
        {
            cout << "Kupac " << rbr << " dolazi na kasu " << kasa << " da bi kupio " << kolicina << " artikala." << endl;
        }

        void zavrsio(int rbr) 
        {
            cout << "Kupac " << rbr << " je zavrsio." << endl;
        }
};

class TrzniCentar
{
    private:
        Kupac &kupac;
        int cekaju[2];
        bool kasaSlobodna[2];
        condition_variable redovi[2];
        mutex m;

    public:
        TrzniCentar(Kupac &k) : kupac(k)
        {
            kasaSlobodna[0] = kasaSlobodna[1] = true;
            cekaju[0] = cekaju[1] = 0;
        }

        int kupi(int rbr, int brojArtikala)
        {
            unique_lock<mutex> lock(m);

            int mojaKasa;

            if(cekaju[0] <= cekaju[1])
                mojaKasa = 0;
            else
                mojaKasa = 1;

            while(!kasaSlobodna[mojaKasa])
            {
                kupac.ceka(rbr, mojaKasa);
                cekaju[mojaKasa]++;
                redovi[mojaKasa].wait(lock);
                cekaju[mojaKasa]--;
            }

            kasaSlobodna[mojaKasa] = false;
            kupac.kupuje(rbr, mojaKasa, brojArtikala);

            lock.unlock();
            sleep_for(seconds(brojArtikala));
            lock.lock();

            kasaSlobodna[mojaKasa] = true;
            kupac.zavrsio(rbr);
            redovi[mojaKasa].notify_one();

            return mojaKasa + 1;
        }
};

void kupac(TrzniCentar &t, int kolicina, int rbk)
{
    t.kupi(rbk, kolicina);
}

int main(void)
{
    Kupac k;
    TrzniCentar p(k);
    thread t[KUPACA];

    for (int i = 0; i < KUPACA; i++)
        t[i] = thread(kupac, ref(p), i + 1, i + 1);

    for (int i = 0; i < KUPACA; i++)
        t[i].join();

    return 0;
}
