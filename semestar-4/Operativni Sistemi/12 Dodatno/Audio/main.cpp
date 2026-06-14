/*
    Napisati konkurentni program koji simulira audio podsistem racunara. Sistem se sastoji primarno
    od centralnog audio bafera koji sadrzi odredjeni broj semplova. Radi jednostavnosti, smatra se
    kao dato da je stopa semplovanja 32-bitna sa 8Khz. To znaci da 1 sekunda audio zapisa u ovom
    formatu je 8000 32-bitnih float vrednosti, odn. 32 kilobajta. Svaki sempl predstavlja 25ms
    odnosno 200 sempl vrednosti. Bafer audio uredjaja je dugacak 2 sekunde, odn. 16000 sempl vrednosti, 
    odn. 80 semplova, ali ovo treba da je podesivo. 
    
    Sempl sadrzi ne samo podatke, nego i trenutak u vremenu kada je namenjen da se 
    pusti. Radi jednostavnosti, predpostavimo da su ti trenuci uvek specificirani u jedinicama od 25ms
    pocevsi od nekog zamisljenog nultog momenta. 

    a) Dovrsiti funkciju koja generise sinusni ton date frekvencije, sa datom stopom semplovanja,
    za dat vremenski trenutak i smesta je u prosledjen bafer. Zatim pokrenuti vise niti koje paralelno
    u nekoliko bafera generisu tonove frekvencija 440Hz, 554.356Hz, 660Hz (pravimo akord). 

    b) Modifikovati i dovrsiti klasu Bafer tako da vodi racuna o:
        i) Popunjenosti, tako da ako se iz nje cita a prazna je ili se u nju pise a puna je, se 
        blokira. 
        ii) Redosledu, tako da se ubaceni semplovi uvek sortiraju po svom vremenu. 
        iii) Sumiranju: Semplovi namenjeni za isto vreme se sabiraju, vodeci racuna da je 
        1.0 maksimalna vrednost.
        iv) Prioritetu: Semplovi koji 'kasne' odnosno nalaze se u proslosti u odnosu na najstarije
        se odbacuju. 
    
    c) Napisati pozadinsku nit koja se aktivira na tajmer (koji okida svakih 25ms) i cita u vremenu
    najskoriji sempl koji se 'pusta' (ispisuje na ekran). Pozadinska nit, i pozadinska nit tajmera se
    moraju zavrsiti na zahtev glavne niti. 

    N.B. Zadatak C zavisi od barem parcijalne funkcionalnosti zadatka B koja moze, za potrebe
    zadatka da se simulira ako zadatak pod B nije uradjen. Ovo se ne preporucuje. 

    Detalje zadataka pod a, b, i c mozete videti u daljem tekstu koda gde su uvek oznaceni komentarima
    oblika 
        //TODO X Tekst 
    Gde je X ili A ili B ili C (u zavisnosti toga kom zadatku pripada), a tekst su instrukcije. 
    BONUS ZADATAK 1: Tako napraviti kod da se *sva* neophodna memorija za cuvanje uzoraka u audio baferu
    alocira na samom pocetku izvrsavanja, i da nema dalje dealokacije i alokacije tokom izvrsavanja.
    BONUS ZADATAK 2: Generisati audio fajl tona koji ovaj program generise uz opis toga kako ste ga
    napravili. 
*/
//I/O
#include <iostream>
#include <iomanip>

//STL
#include <list>

//Multithreading
#include <chrono>
#include <thread>
#include <mutex>
#include <condition_variable> 

//Other
#include <cmath>
#include <cstring>

using namespace std;
using namespace chrono;

struct Sample{
    float data[200];
    int time;
};

class Dijagnostika{
    private:
        mutex m;
    public:
        Dijagnostika() {}

        void stampajSample(Sample *s){
            cout << "Playing sample at " << s->time << endl;
            int p[20] = {0};
            for(int i = 0; i < 20; i++){
                float avg = 0;
                for(int j = 0; j < 10;j++){
                    avg += s->data[i * 10 + j];
                }
                avg = avg / 10.0f;
                int x = round((avg * 15.0f));
                p[i] = x;
            }
            for(int i = 4; i >= 0; i--){
                for(int j = 0; j < 20;j++){
                    if(p[j] > i * 3){
                        if(p[j] > i * 3 + 2){
                            cout << "#";
                        }else if(p[j] > i * 3 + 1){
                            cout << "-";
                        }else{
                            cout << "_";
                        }
                    }else{
                        cout << " ";
                    }
                }
                cout << "\n";
            }

            cout << endl;
        }

        void stampajSampleRaw(Sample *s){
            for(int i = 0; i < 200; i++){
                cout << s->data[i] << endl;
            }
        }

        void stampajPoruku(const char* tag, const char* msg){
            unique_lock<mutex> l(m);
            cout << "[" << tag << "] " << msg << endl;
        }
};

class Bafer {
    private:
        Dijagnostika& d;
        Sample* data;
        bool* freeMap;
        list<int> index; 
        int capacity;
        int n;
        mutex m;
        condition_variable full;
        condition_variable empty; 
        condition_variable cplay;
        bool doPlay;
        bool doZavrsi;
        void addSample(float* dest, float* src){
            for(int i = 0; i < 200; i++){
                dest[i] = fmin(1.0f, dest[i] + src[i]);
            }
        }
        int allocate(){
            int i = 0;
            while(i < capacity && !freeMap[i]) i++;
            if(i >= capacity){
                exit(1);
            }
            freeMap[i] = false;
            return i;
        }
        void deallocate(int i){
            freeMap[i] = true; 
        }
        void loadInternal(Sample& out){//nije thread-safe
            int i = index.front();
            index.pop_front();
            out.time = data[i].time;
            memcpy(out.data, data[i].data, 200 * sizeof(float));
            deallocate(i);
            n--;
        }
    public:
        Bafer(Dijagnostika& dd, int cap) : d(dd), n(0), capacity(cap), doPlay(false), doZavrsi(false){
            data = new Sample[cap];
            freeMap = new bool[cap];
            for(int i = 0; i < cap;i++){
                freeMap[i] = true;
            }
        }
        ~Bafer(){
            delete[] data;
            delete[] freeMap;
        }
        Dijagnostika& getDijagnostika(){
            return d;
        }
        void zavrsi(){
            unique_lock<mutex> l(m);
            doZavrsi = true;
            cplay.notify_one(); 
        }
        void store(Sample& in){
            unique_lock<mutex> l(m);
            while(n >= capacity){
                full.wait(l);
            }
            if(n == 0){
                int i = allocate();
                data[i].time = in.time;
                memcpy(data[i].data, in.data, 200 * sizeof(float));
                n++;
                index.push_front(i);
                empty.notify_one();
            }else{
                if(data[index.front()].time > in.time) return;//prekasno poslat
                bool flag = false;
                for(auto it = index.begin();it != index.end();it++){
                    if(data[*it].time == in.time){
                        addSample(data[*it].data, in.data);
                        flag = true; 
                        break;
                    }else if(data[*it].time > in.time){
                        int i = allocate();
                        data[i].time = in.time;
                        memcpy(data[i].data, in.data, 200 * sizeof(float));
                        index.insert(it, i);
                        flag = true;
                        n++;
                        break; 
                    }
                } 
                if(!flag){
                    int i = allocate();
                    data[i].time = in.time;
                    memcpy(data[i].data, in.data, 200 * sizeof(float));
                    index.push_back(i);
                    n++;
                }
            }

        }
        void load(Sample& out){
            unique_lock<mutex> l(m);
            while(n == 0) {
                empty.wait(l);
            }
            loadInternal(out);
            full.notify_one();
        }

        void play(){
            while(1){
                unique_lock<mutex> l(m);
                while(!doPlay && !doZavrsi){
                    cplay.wait(l);                
                }
                if(doZavrsi) return;
                doPlay = false;
                if(n == 0) continue;
                Sample s;
                loadInternal(s);
                d.stampajSample(&s);
                full.notify_one();

            }
        }

        void initiatePlay(){
            unique_lock<mutex> l(m);
            doPlay = true;
            cplay.notify_one();
        }
        void dumpBuffer(){
            while(n != 0){
                Sample s; 
                load(s);
                d.stampajSample(&s);
            }
        }

        void dumpBufferRaw(){
            while(n != 0){
                Sample s;
                load(s);
                d.stampajSampleRaw(&s);
            }
        }
};

void computeSample(double frequency, double time, double length, double sampleRate, double volume, float* data){
    //sracunati fazu
    double phase = (time * frequency);
    phase = phase - floor(phase);
    phase = phase * 2 * M_PI; 
    int n = ceil(length * sampleRate); 
    double incr = (2 * M_PI * frequency) / sampleRate;
    double t = phase;
    for(int i = 0; i < n; i++){
        *(data + i) = (float)(volume * ((sin(t) / 2) + 0.5));//ocuvati raspon od 0 do 1. 
        t+= incr;
    }
}

void testirajA(Dijagnostika& d){
    Sample s1, s2, s3;
    s1.time = 0;
    s2.time = 0;
    s3.time = 0;
    thread t1(computeSample, 440, 0, 0.025, 8000, 1.0, s1.data);
    thread t2(computeSample, 554.356, 0, 0.025, 8000, 1.0, s2.data);
    thread t3(computeSample, 660, 0, 0.025, 8000, 1.0, s3.data);
    t1.join();
    t2.join();
    t3.join();
    d.stampajSample(&s1);
    d.stampajSample(&s2);
    d.stampajSample(&s3);
}


void toneGenerator(double freq, double length, double volume, Bafer& b){
    int n = ceil(length / 0.025);
    for(int i = 0; i < n; i++){
        Sample s;
        s.time = i;
        computeSample(freq, i * 0.025, 0.025, 8000, volume, s.data);
        b.store(s);
    }
}

void testirajB(Bafer& b){
    thread t1(toneGenerator, 440.0, 1.0, 0.3, ref(b));
    thread t2(toneGenerator, 554.356, 1.0, 0.3, ref(b));
    thread t3(toneGenerator, 660.0, 1.0, 0.3, ref(b));
    t1.join();
    t2.join();
    t3.join();
    b.dumpBuffer();
}

void timerThread(Bafer& b, bool& active){
    while(active){
        this_thread::sleep_for(milliseconds(25));
        b.initiatePlay();
    }
}

void daemonThread(Bafer& b){
    b.play();
}

void testirajC(Bafer& b){
    bool running = true; 
    thread t1(toneGenerator, 440.0, 5.0, 0.3, ref(b));
    thread t2(toneGenerator, 554.356, 5.0, 0.3, ref(b));
    thread t3(toneGenerator, 660.0, 5.0, 0.3, ref(b));
    thread daemon(daemonThread, ref(b));
    thread timer(timerThread, ref(b), ref(running));
    daemon.detach();
    timer.detach();
    t1.join();
    t2.join();
    t3.join();
    char x;
    do {
        cin >> x;
    }while(x != 'q');
    running = false; 
    b.zavrsi();
}

void testirajSve(){
    Dijagnostika d;
    Bafer b(d, 80); 
    //testirajA(d);
    //testirajB(b);
    testirajC(b);
}

int main(){
    testirajSve();
    return 0;
}
