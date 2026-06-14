#ifndef BASE_H
#define BASE_H
#include "windows.h"

#define INPUT 1
#define OUTPUT 0
#define HIGH 1
#define LOW 0
#define A0 0

int const DIGITAL_NUM_PINS = 70;
int const ANALOG_NUM_PINS = 1;

typedef  struct{
       int mode[DIGITAL_NUM_PINS];
       int state[DIGITAL_NUM_PINS];
} digitalPinsType;

typedef struct{
       int mode[ANALOG_NUM_PINS];
       int state[ANALOG_NUM_PINS];
} analogPinsType;

void digitalWrite(int, int);

int digitalRead(int);

void analogWrite(int, int);

int analogRead(int);

void pinMode(int, int);

unsigned long millis();

void delay(unsigned long);

int map(int, int, int, int, int);

int random(int);

int random(int, int);

void executeSoftReset(unsigned options);

DWORD WINAPI mainLoop(LPVOID lpParam);

#endif // BASE_H
