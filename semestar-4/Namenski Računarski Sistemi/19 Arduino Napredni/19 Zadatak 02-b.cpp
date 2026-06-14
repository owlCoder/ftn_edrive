#include "data.h"
#pragma pack(4)

typedef struct slog
{
    char datum[15], vreme[15];
    int broj;
    // dopuna sloga
    short UV, pritisak;
} Slog;

list<Slog *> slogovi;
int genOneId = -1;
int sameNum  = -1000000000;
int cnt      =  1;
int err      =  0;
#define M_PI2 3.141592653589793238
dataGenStruct dg;
double x = -M_PI2 / 2;

double sine(double n, float greska, int paramLow, int paramHigh)
{
    double ret = sin(x) * (paramHigh - paramLow) / 2 + (paramHigh + paramLow) / 2;
    x += 0.2;

    return ceil(ret);
}

void getDateTime(char *datum, char *vreme)
{
    time_t     now = time(0);
    struct tm  tstruct;
    char       d[20];
    char       v[15];

    tstruct = *localtime(&now);
    strftime(d, sizeof(d), "%d.%m.%Y.", &tstruct);
    strftime(v, sizeof(v), "%X",        &tstruct);

    strcpy(datum, d);
    strcpy(vreme, v);

}


void generateSameNumber(int startInt, int endInt, float error)
{
    if(sameNum == -1000000000)
    {
        srand(time(NULL));
        Slog *novi = new Slog;
        getDateTime(novi -> datum, novi -> vreme);
        novi -> broj = random(startInt, endInt);
        sameNum = novi -> broj;

        slogovi.push_back(novi);
    }
    else
    {
        Slog *novi = new Slog;

        getDateTime(novi -> datum, novi -> vreme);
        int x = random(0, 100);
        if (x < 100 * error)
            novi -> broj = random(startInt, endInt);
        else
            novi -> broj = sameNum;

        slogovi.push_back(novi);
    }
}

void generateRandomNumber(int startInt, int endInt, float error)
{
    Slog *novi = new Slog;

    getDateTime(novi -> datum, novi -> vreme);
    novi -> broj = random(startInt, endInt);

    slogovi.push_back(novi);
}

void generateSinNumber(int startInt, int endInt, float error)
{
    Slog *novi = new Slog;

    getDateTime(novi -> datum, novi -> vreme);
    novi -> broj = sine(cnt, error, startInt, endInt);
    cnt++;

    if(novi -> broj > endInt)
        novi -> broj -= endInt;

    if(random(0, 100) < 100 * error)
        novi -> broj = random(startInt, endInt);

    slogovi.push_back(novi);
}

void generateOne(int id, void *tptr)
{
    dataGenStruct *dg = (dataGenStruct *) tptr;

    if(dg -> gt == SAME)
        generateSameNumber(dg -> startInt, dg -> endInt, dg -> error);
    else if(dg -> gt == RANDOM)
        generateRandomNumber(dg -> startInt, dg -> endInt, dg -> error);
    else if(dg -> gt == SIN)
        generateSinNumber(dg -> startInt, dg -> endInt, dg -> error);
}

bool available()
{
    auto it = slogovi.cbegin();
    int  i = 0;

    while(it != slogovi.cend())
    {
        it++;
        i++;
    }

    return (i >= 1 ? true : false);
}

char *read()
{
    if(available())
    {
        auto it = slogovi.begin();
        string gen = "";
        gen +=       string((*it) -> datum);
        gen +=       + " ";
        gen +=       string((*it) -> vreme);
        gen +=        " ";
        gen +=       to_string((*it) -> broj);

        char *str = new char[gen.length()];
        strcpy(str, gen.c_str());

        slogovi.remove(*it);
        delete *it;

        return str;
    }
    else
        return NULL;
}

char *readAll()
{
    if(available())
    {
        unsigned velicina = slogovi.size();
        int i = 0;
        char *buffer = new char[sizeof(int) + velicina * sizeof(Slog)];

        *((int *) buffer) = (int) velicina;
        Slog *s = (Slog *) (buffer + sizeof(int));

        while(available())
        {
            auto it = slogovi.begin();

            strcpy(s[i].vreme, (*it) -> vreme);
            strcpy(s[i].datum, (*it) -> datum);
            s[i].broj = (*it) -> broj;

            // dopuna sloga
            s[i].UV = random(0, 9);
            s[i].pritisak = random(950, 1050);

            slogovi.remove(*it);
            delete *it;
            i++;
        }

        return buffer;
    }
    else
        return NULL;
}

void clear()
{
    auto it = slogovi.begin();

    while(it != slogovi.cend())
    {
        slogovi.remove(*it);
        delete *it;
        it++;
    }
}

int slogSize(){
   return sizeof(Slog);
}

void startStopDataGeneration(bool gen, generation_type gt, int startInt, int endInt, float error, long taskDiffer_t)
{
    srand(time(NULL));
    dg.gt = gt;
    dg.startInt = startInt, dg.endInt = endInt;
    dg.error = error;

    if(gen == START_GENERATION)
    {
        if(genOneId == -1)
            genOneId = createTask(generateOne, taskDiffer_t, TASK_ENABLE, &dg);
        else
            setTaskState(genOneId, TASK_ENABLE);
    }
    else
    {
        setTaskState(genOneId, TASK_DISABLE);
    }
}
