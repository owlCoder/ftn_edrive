#include "arduinoPlatform.h"
#include "windows.h"
#include <time.h>
#include <demo.h>
#include<serial.h>

extern serial Serial;

digitalPinsType digitalPins;
analogPinsType analogPins;

void digitalWrite(int pin, int value)
{
    if (pin>=0 && pin<=DIGITAL_NUM_PINS){
        if (value==LOW)
            digitalPins.state[pin] = value;
        else
            digitalPins.state[pin] = HIGH;
    } else if (pin==A0 && value>=0 && value<=1023){
        analogPins.state[A0] = value;
    }
}

int digitalRead(int pin)
{
    if (pin>=0 && pin<=DIGITAL_NUM_PINS)
        return digitalPins.state[pin];
    else
        return LOW;
}

int analogRead(int pin)
{
    if (pin==A0)
        return analogPins.state[A0];
    else
        return LOW;
}

void analogWrite(int pin, int value){
   if (pin==A0 && value>=0 && value<=1023){
        analogPins.state[A0] = value;
   } else if (pin>=0 && pin<=DIGITAL_NUM_PINS){
         if (value>=0&&value<=127)
            digitalPins.state[pin] = LOW;
         else if(value>=128&&value<=255)
            digitalPins.state[pin] = HIGH;
   }
}

void pinMode(int pin, int pmode)
{
    if (pin>=0 && pin<=DIGITAL_NUM_PINS)
        digitalPins.mode[pin] = pmode;
    else if (pin==A0)
        analogPins.mode[pin] = pmode;
}

unsigned long millis(){
  return (unsigned long) clock();
};

void delay(unsigned long ms){
    unsigned long startTime = millis();
    while (millis()-startTime<ms);
}

int random(int n){
   return rand()%n;
};

int random(int l, int d){
   return rand()%(d-l)+l;
};

int map(int value, int int1begin, int int1end, int int2begin, int int2end){
   return int2begin + ((float)value-int1begin)*((float)int2end-int2begin)/(int1end-int1begin);
}

void executeSoftReset(unsigned options){
   Serial.writeln("Sistem je resetovan!");
};

DWORD WINAPI mainLoop(LPVOID lpParam)
{
    srand(time(0));
    setup();
    while (true){
        loop();
        delay(1);
    }
}


