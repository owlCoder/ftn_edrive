#ifndef DATA_H_INCLUDED
#define DATA_H_INCLUDED

#include <iostream>
#include <string>
#include <cmath>
#include <ctime>
#include <tasks.h>
#include <arduinoPlatform.h>
#include <list>

using namespace std;

#define START_GENERATION 1
#define STOP_GENERATION  0

enum generation_type {SAME, RANDOM, SIN};

typedef struct dataGenStruct
{
    generation_type gt;
    int startInt, endInt;
    float error;
} dataGenStruct;

void startStopDataGeneration(bool, generation_type, int, int, float, long);

bool available();
char *read();
char *readAll();
void clear();
int slogSize();

#endif // DATA_H_INCLUDED
