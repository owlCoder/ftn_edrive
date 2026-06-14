/*
    Napisati konkurentni program koji simulira audio podsistem racunara. Sistem se sastoji primarno
    od centralnog audio bafera koji sadrzi odredjeni broj semplova. Radi jednostavnosti, smatra se
    kao dato da je stopa semplovanja 32-bitna sa 8Khz. To znaci da 1 sekunda audio zapisa u ovom
    formatu je 8000 32-bitnih float vrednosti, odn. 32 kilobajta. Svaki sempl predstavlja 25ms
    odnosno 200 sempl vrednosti. Bafer audio uredjaja je dugacak 2 sekunde, odn. 16000 sempl vrednosti,
    odn. 80 frejmova, ali ovo treba da je podesivo.

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


    Detalje zadataka pod a, b, i c mozete videti u daljem tekstu koda gde su uvek oznaceni komentarima
    oblika
        //TODO X Tekst
    Gde je X ili A ili B ili C (u zavisnosti toga kom zadatku pripada), a tekst su instrukcije.
    BONUS ZADATAK 1: Tako napraviti kod da se *sva* neophodna memorija za cuvanje uzoraka u audio baferu
    alocira na samom pocetku izvrsavanja, i da nema dalje dealokacije i alokacije tokom izvrsavanja.
    BONUS DOMACI ZADATAK 2: Generisati audio fajl tona koji ovaj program generise uz opis toga kako ste ga
    napravili.
*/
//I/O
#include <iostream>
#include <iomanip>
#include <fstream>

//STL
#include <list>
#include <vector>

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

struct Frame
{
    float data[200];
    int time;
};

class Dijagnostika
{
private:
    mutex m;
public:
    Dijagnostika() {}
    /*
        stampajFrame uzme jedan uzorak audio signala i prikaze ga na ekranu "graficki"
        Uzme srednju vrednost delica sample-a (njih 20) i sracuna kolika je velicina proseka
        u skali od 0 do 15.

        Onda ga prikaze na 5 linija teksta u zavisnosti od jacine signala na sledeci nacin
        13-15|    | Prazno znaci da signal nije stigao dovde u jacini
        10-12| -  | Znak - znaci da je u ovoj kategoriji signal na poziciji 2, tj. 11
        07-09| #  | Znak # znaci da je signal stigao da i potpuno popunio ovaj nivo jacine
        04-06| #  | Znak # znaci da je signal stigao da i potpuno popunio ovaj nivo jacine
        01-03| #  | Znak # znaci da je signal stigao da i potpuno popunio ovaj nivo jacine
    */
    void stampajFrame(const Frame *s)
    {
        unique_lock<mutex> l(m);
        cout << "Playing sample at " << s->time << endl;
        int p[20] = {0};

        for(int i = 0; i < 20; i++)
        {
            float avg = 0;

            for(int j = 0; j < 10; j++)
            {
                avg += s->data[i * 10 + j];
            }

            avg = avg / 10.0f;
            int x = round((avg * 15.0f));
            p[i] = x;
        }

        for(int i = 4; i >= 0; i--)
        {
            for(int j = 0; j < 20; j++)
            {
                if(p[j] > i * 3)
                {
                    if(p[j] > i * 3 + 2)
                    {
                        cout << "#";
                    }
                    else
                        if(p[j] > i * 3 + 1)
                        {
                            cout << "-";
                        }
                        else
                        {
                            cout << "_";
                        }
                }
                else
                {
                    cout << " ";
                }
            }

            cout << "\n";
        }

        cout << endl;
    }

    //Stampanje uzorka za dijagnostiku u sirovoj formi, tj. kao brojevi.
    //Nema sinhronizaciju zato sto je tu samo za debugovanje
    void stampajFrameRaw(const Frame *s)
    {
        for(int i = 0; i < 200; i++)
        {
            cout << s->data[i] << endl;
        }
    }

    //sluzi za debagovanje
    void stampajPoruku(const char* tag, const char* msg)
    {
        unique_lock<mutex> l(m);
        cout << "[" << tag << "] " << msg << endl;
    }
};

class Bafer
{
private:
    Dijagnostika& d;
    int capacity;
    bool zahtev = false, kraj = false;
    Frame *frames;
    int size = 0;
    mutex m;
    condition_variable cv_full, cv_empty, cv_play;
    vector<short> all_samples;

    //TODO B,C Dodati po potrebi prosirenja
public:
    Bafer(Dijagnostika& dd, int cap)
        : d(dd), capacity(cap)
    {
        frames = new Frame[cap];
    }

    ~Bafer()
    {
        delete[] frames;
    }

    Dijagnostika& getDijagnostika()
    {
        return d;
    }

    void store(Frame &in)
    {
        unique_lock<mutex> l(m);
        if (size > 0 && in.time < frames->time) return;

        while (size >= capacity)
        {
            d.stampajPoruku("store", "ceka");
            cv_full.wait(l);
        }

        bool inserted = false;

        for (int i = 0; i < size; i++)
        {
            if (in.time == frames[i].time)
            {
                for (int j = 0; j < 200; j++)
                    frames[i].data[j] = min(1.0f, frames[i].data[j] + in.data[j]);
                inserted = true;
                break;
            }
            else if (in.time < frames[i].time)
            {
                memmove(frames + i + 1, frames + i, ((size++) - i) * sizeof(Frame));
                inserted = true;
                break;
            }
        }

        if (!inserted) frames[size++] = in;
        cv_empty.notify_one();
    }

    void load(Frame &out)
    {
        unique_lock<mutex> l(m);

        while (!size)
        {
            d.stampajPoruku("load", "ceka");
            cv_empty.wait(l);
        }

        out = *frames;
        memmove(frames, frames + 1, --size * sizeof(Frame));
        cv_full.notify_one();
    }

    void play()
    {
        for (;;)
        {
            {
                unique_lock<mutex> l(m);
                while (!zahtev && !kraj) cv_play.wait(l);
                if (kraj) break;
                zahtev = false;
            }

            Frame f;
            load(f);
            d.stampajFrame(&f);

            for (int i = 0; i < 200; i++)
                all_samples.push_back((short)(f.data[i] * 65535.0f));
        }
    }

    void initiatePlay()
    {
        unique_lock<mutex> l(m);
        zahtev = true;
        cv_play.notify_one();
    }

    void finish()
    {
        unique_lock<mutex> l(m);
        kraj = true;
        cv_play.notify_one();
    }

    void dumpBuffer()
    {
        for (int i = 0; i < size; i++)
            d.stampajFrame(frames + i);
    }

    void dumpBufferRaw()
    {
        for (int i = 0; i < size; i++)
            d.stampajFrameRaw(frames + i);
    }

    void saveAllSamples(const char *filename)
    {
        ofstream ofs(filename, ios::binary);
        unsigned data_size = all_samples.size() * 2;
        unsigned format_size = 16;
        unsigned total_size = data_size + format_size + 20;
        ofs.write("RIFF", 4);
        ofs.write((char*)&total_size, 4);
        ofs.write("WAVE", 4);
        ofs.write("fmt ", 4);
        ofs.write((char*)&format_size, 4);

        unsigned short type = 1, channels = 1;
        unsigned sample_rate = 8000, bitrate = 16 * 8000;
        unsigned short bytesps = 2, bitsps = 16;
        ofs.write((char*)&type, 2);
        ofs.write((char*)&channels, 2);
        ofs.write((char*)&sample_rate, 4);
        ofs.write((char*)&bitrate, 4);
        ofs.write((char*)&bytesps, 2);
        ofs.write((char*)&bitsps, 2);

        ofs.write("data", 4);
        ofs.write((char*)&data_size, 4);
        for (int i = 0; i < all_samples.size(); i++)
        {
            short sample = all_samples[i];
            ofs.write((char*)&sample, 2);
        }
    }
};

//Funkcija koja radi odgovarajucu matematiku koja racuna uzorak sinusnog tona datih parametara
//frequency - frekvencija koja se generise, u Hz
//time - Koliko se vec emituje zvuk (neophodno za racunanje faze tona) u sekundama
//length - Duzina uzorka koji se generise, u sekundama
//sampleRate - stopa uzorkovanja, u Hz
//volume - Jacina zvuka od 0 do 1.0
//data - gde da se smeste podaci
void computeFrame(double frequency, double time, double length, double sampleRate, double volume, float *data)
{
    //sracunati fazu
    double phase = (time * frequency);
    phase = phase - floor(phase);
    phase = phase * 2 * M_PI;
    int n = ceil(length * sampleRate);
    double incr = (2 * M_PI * frequency) / sampleRate;
    double t = phase;

    for(int i = 0; i < n; i++)
    {
        *(data + i) = (float)(volume * ((sin(t) / 2) + 0.5));//ocuvati raspon od 0 do 1.
        t += incr;
    }
}

void testirajA(Dijagnostika& d)
{
    Frame f[3];
    thread t1(computeFrame, 440.0, 0, 0.025, 8000.0, 1.0, f[0].data);
    thread t2(computeFrame, 554.356, 0, 0.025, 8000.0, 1.0, f[1].data);
    thread t3(computeFrame, 659.25, 0, 0.025, 8000.0, 1.0, f[2].data);
    t1.join();
    t2.join();
    t3.join();
    for (int i = 0; i < 3; i++) d.stampajFrameRaw(&f[i]);
}

void toneGenerator(double freq, double length, double volume, Bafer &b)
{
    int n = ceil(length / 0.025);

    for (int i = 0; i < n; i++)
    {
        double frame_len = min(0.025, length);
        Frame f;

        f.time = i;
        computeFrame(freq,
                     i * 0.025,
                     frame_len,
                     8000.0,
                     volume,
                     f.data);
        b.store(f);

        length -= frame_len;
    }
}

void testirajB(Bafer& b)
{
    thread t1(toneGenerator, 440.0, 1, 0.3, ref(b));
    thread t2(toneGenerator, 554.356, 1, 0.3, ref(b));
    thread t3(toneGenerator, 659.25, 1, 0.3, ref(b));
    t1.join();
    t2.join();
    t3.join();
    b.dumpBuffer();
}

//TODO C Napraviti ovde telo niti koje sluzi da automatski tempirano, 'pusta' (ispisuje na ekran)
//tekuci uzorak iz bafera svakih 25ms kroz initiatePlay.
void timerThread(Bafer &b, bool &running)
{
    while (running)
    {
        this_thread::sleep_for(chrono::milliseconds(25));
        b.initiatePlay();
    }
}

//Telo niti za pustanje zvuka
void daemonThread(Bafer& b)
{
    b.play();
}

void testirajC(Bafer& b)
{
    //TODO C pokrenuti 5 niti
    //Tri su generatori tona sa parametrima: 440.0Hz, 554.356Hz, 660.0Hz frekvencije
    //5.0s duzina
    //30% jacina zvuka
    //jedna je tajmerska nit
    //i konacna je nit za pustanje zvuka tj. ispis na ekran cije je telo 'daemonThread'
    //Nit za pustanje zvuka i nit za tajmer su pozadinske
    //TODO C Pustiti korisnika da prekine program na zahtev tako sto otkuca 'q'
    //TODO C Pred kraj izvrsavanja, zaustaviti pozadinske niti tako sto im se izda komanda.

    bool running = true;

    thread t1(toneGenerator, 440.0, 5, 0.3, ref(b));
    thread t2(toneGenerator, 554.356, 5, 0.3, ref(b));
    thread t3(toneGenerator, 659.25, 5, 0.3, ref(b));
    thread t4(daemonThread, ref(b));
    thread t5(timerThread, ref(b), ref(running));
    t1.join();
    t2.join();
    t3.join();

    running = false;
    b.finish();
    t4.join();
    t5.join();

    b.saveAllSamples("output.wav");
}

int main()
{
    Dijagnostika d;
    //testirajA(d);
    Bafer b(d, 80);
    //testirajB(b);
    testirajC(b);
    return 0;
}
