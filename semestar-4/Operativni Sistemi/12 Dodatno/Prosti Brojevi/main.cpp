/*
    Napisati konkurentni program koji koristi vise niti da generise i smesti u memoriju proste brojeve.
    Program se sastoji od tri faze, a, b, i c. Svaku od tih faza testira po jedna funkcija koja je 
    makar parcijalno data.

    a) Napisati funkciju koja racuna proste brojeve pocevsi od neke vrednosti i koja se izvrsava dok ne
    generise specificiran broj prostih brojeva. Test pokrece ovu funkciju vise puta, paralelno i ispisuje
    rezultat. Prosti brojevi su oni koji su deljivi samo sa jedan i samim sobom, tj. 23 je prost broj
    zato sto je deljiv samo sa 1 i 23. 49 nije prost broj posto je osim sa 1 i 49 deljiv i sa 7. 
    
    b) Dovrsiti klasu Memorija koja sluzi da alocira i dealocira regione memorije specificirane duzine.
    Memorijom se upravlja u jedinicama koje u velicini odgovaraju 1 int broju. Metod alokacije je
    first-fit. Klasa mora biti thread-safe i blokirati ako memorije nema. Kada se memorija dealocira
    samo markirati odsecak kao slobodan, bez komprimovanja. Na pocetku evidencije, sva memorije je u
    jednom velikom, slobodnom odsecku. Koliko memorije ima se specificira prilikom stvaranja promenljive
    tipa 'Memorija'.
    
    c) Napisati funkciju koja se izvrsava kao detach-ovana, daemon-nit koja, kada se to od nje
    zatrazi, preko metode u klasi Memorija, vrsi kompakciju memorije, tj. susedne odsecke memorije
    izmedju kojih nema alociranog prostora pretvara u jedan veliki odsecak. Obezbediti ovoj niti
    da se moze na zahtev korisnika ugasiti. Komprimovanje ovde ne radi realokaciju nicega, sve sto radi
    jeste detektuje situacije gde imamo susedne odsecke koji su slobodni i spaja ih. Napisati tajmer
    koji poziva kompakciju memorije svakih deset sekundi. 


    Detalje zadataka pod a, b, i c mozete videti u daljem tekstu koda gde su uvek oznaceni komentarima
    oblika 
        //TODO X Tekst 
    Gde je X ili A ili B ili C (u zavisnosti toga kom zadatku pripada), a tekst su instrukcije. 
*/

//I/O
#include <iostream>
#include <iomanip>

//STL
#include <list>

//THREADING
#include <chrono>
#include <thread>
#include <mutex>
#include <condition_variable>

using namespace std;
using namespace chrono;

struct Odsecak{
    int* m;
    int n;
    bool free;
};

class Dijagnostika{
    private:
        mutex m;
    public:
        Dijagnostika() {}
        void stampajRezultate(const char* tag, int n, int* mem){
            unique_lock<mutex> l(m);
            cout << "[" << tag << "] Rezultati: " << endl;
            for(int i = 1; i <= n; i++){
                 cout << setfill(' ') << setw(8) << mem[i-1] << " ";
                 if(i % 9 == 0) cout << endl;
            }
            cout << endl;
        }

        void stampajMapuMemorije(list<Odsecak>::iterator begin, list<Odsecak>::iterator end){
            unique_lock<mutex> l(m);
            int j = 1;
            char c = 'a';
            const char offset = 'A' - 'a';
            for(auto it = begin; it != end; it++){
                for (int i = 0; i < it->n; i++){
                    if(it->free) cout << (char)(c + offset);
                    else cout << c;
                    if(j % 8 == 0) cout << " ";
                    if(j >= 72) {
                        cout << endl;
                        j = 0;
                    }
                    j++;
                }
                c++;
            }
            cout << endl;
        }

        void stampajPoruku(const char* tag, const char* msg){
            unique_lock<mutex> l(m);
            cout << "[" << tag << "] " << msg << endl;
        }
};

class Memorija{
    private:
        Dijagnostika& d;
        int kapacitet;
        int* mem;
        list<Odsecak> evidencija;
        mutex m;
        condition_variable c;
        condition_variable compactCommand; 
        bool zavrseno;
        bool doCompaction;
        list<Odsecak>::iterator firstFit(int n){//nije thread-safe!
            for(auto it = evidencija.begin();it != evidencija.end();it++){
                if(it->free && it->n == n){
                    it->free = false; 
                    return it;
                } else if(it->free && it->n > n){
                    int n2 = it->n;
                    it->n = n;
                    it->free = false; 
                    Odsecak o = {m: it->m + n, n: n2 - n, free: true};
                    it = evidencija.insert(++it, o);
                    it--;
                    return it;
                }
            }
            return evidencija.end();
        }
        void free(int* p){//nije thread-safe
            for(auto it = evidencija.begin();it!= evidencija.end();it++){
                if(it->m == p){
                    it->free = true;
                    break;
                }
            }
        }
        void compact(){//nije thread-safe
            for(auto it = evidencija.begin();it!= evidencija.end();){
                auto next = ++it; //Dobijemo iterator na sledeću stvar
                it--; //Zato što ne možemo da napišemo it + 1, morali smo da it povećamo, pa ga sad smanjujemo
                if(next == evidencija.end()){ //stigli smo do kraja
                    it++;
                    continue;
                }
                if((!it->free) || (!next->free)){  //Ako barem jedan od odsečaka nije slobodan, onda nema šta da kompaktiramo
                    it++;
                    continue;
                }
                while(it->m + it->n == next->m && next->free){
                    it->n = it->n + next->n; //Uništimo jedan odsečak i dodamo ga na prethodni
                    next = evidencija.erase(next);
                }
                it = next;//Ovo je skok na sledeći 
            }
        }
    public:
        Memorija(int k, Dijagnostika& dd) : kapacitet(k), d(dd), zavrseno(false), doCompaction(false){
            mem = new int[k];//k celih brojeva
            Odsecak o = {m: mem, n: k, free: true}; //na pocetku to je samo jedan odsecak gde je sve slobodno
            evidencija.push_front(o);
        }
        ~Memorija(){
            evidencija.clear();
            delete [] mem;
        }
        Dijagnostika& getDijagnostika() const{
            return d;
        }

        void zavrsi(){
            zavrseno = true;
            compactCommand.notify_one(); 
        }

        void initiateCompaction(){
            doCompaction = true;
            compactCommand.notify_one();
        }

        void stampajMapuMemorije(){
            d.stampajMapuMemorije(evidencija.begin(), evidencija.end());
        }

        int* alociraj(int n, const char* tag = "Unknown"){//ovo mora biti thread-safe
            unique_lock<mutex> l(m);
            list<Odsecak>::iterator it;
            while((it = firstFit(n)) == evidencija.end()){
                d.stampajPoruku(tag, "Nit ceka..."); //Nit čeka da bude oslobođena
                c.wait(l);
            }
            d.stampajPoruku(tag, "Nit zauzela memoriju");
            return it->m;
        }
        void dealociraj(int* p, const char* tag = "Unknown"){//ovo mora biti thread-safe
            unique_lock<mutex> l(m);
            d.stampajPoruku(tag, "Nit dealocira memoriju");
            free(p);
            c.notify_all();
        }
        void kompaktiraj(){
            while(true){
                unique_lock<mutex> l(m);
                while(!doCompaction && !zavrseno)
                    compactCommand.wait(l);
                if(zavrseno) return;
                doCompaction = false;
                d.stampajPoruku("COMPACTION DEAMON", "Running compaction...");
                stampajMapuMemorije();
                compact();
                d.stampajPoruku("COMPACTION DEAMON", "After compaction:");
                stampajMapuMemorije();
                c.notify_all();
            }
        }
};
void racunaj(int od, int n, int* gde){
    int x = od;
    int i = 0;
    EXIT: while(i < n){
        for(int j = 2;j < x;j++){ //namerno neefikasan algoritam
            if(x % j == 0){
                x++;
                goto EXIT;//jedan od par primera kada je GOTO prihvatljiv.
            }
        }
        *gde++ = x;
        i++;
        x++;
    }
}

void compactionDeamon(Memorija& mem){
    mem.kompaktiraj();
}

void calculationThread(const char* threadName, Memorija& mem, int n){
    for(int i = 0; i < n; i++){
        int s = rand() % 257 + 256;
        int* x = mem.alociraj(s, threadName);
        racunaj(rand() % 10000, s, x);
        mem.getDijagnostika().stampajRezultate(threadName, s, x);
        mem.dealociraj(x, threadName);
    }
}

void timerThread(Memorija& mem, bool& active){
    do{
        this_thread::sleep_for(seconds(10));
        mem.initiateCompaction();
    }while(active);
}

void testirajA(Dijagnostika& d){
    int* mem = new int[1024];
    int* p[8];
    thread t[8];
    for(int i = 0; i < 8; i++){
        p[i] = mem + (i * 128);
        t[i] = thread(racunaj, i * 2000, 128, ref(p[i]));
    }
    for(int i = 0; i < 8; i++){
        t[i].join();
    }
    d.stampajRezultate("TEST1", 1024, mem);
    delete [] mem;
}

void testirajB(Memorija& mem){//Ovo je predvidjeno da izazove mrtvu petlju. 
    thread t[10];
    char tags[10][10];
    for(int i = 0; i < 10;i++){
        sprintf(tags[i], "BTEST_%d", i);
        int n = rand() % 6 + 1;
        t[i] = thread(calculationThread, ref(tags[i]), ref(mem), n);
    }
    for(int i = 0; i < 10; i++){
        t[i].join();
    }
}

void testirajC(Memorija& mem){//Ovo se uspesno zavrsava
    thread t[10];
    char tags[10][10];
    for(int i = 0; i < 10;i++){
        sprintf(tags[i], "CTEST_%d", i);
        int n = rand() % 6 + 1;
        t[i] = thread(calculationThread, ref(tags[i]), ref(mem), n);
    }
    thread cd(compactionDeamon, ref(mem));
    cd.detach();
    bool runTimer = true;
    thread timer(timerThread, ref(mem), ref(runTimer));
    timer.detach();
    for(int i = 0; i < 10; i++){
        t[i].join();
    }
    mem.zavrsi();
    runTimer = false;
}

void testirajSve(){
    Dijagnostika d;
    Memorija mem(1024, d);
    //testirajA(d);
    //testirajB(mem);
    testirajC(mem);
}

int main(){
    testirajSve();
    return 0; 
}
