/*
        Napisati program koji prati stanje pwm signala na pinu 26 i
        ispisuje njegovu dužinu trajanja. Za generisanje signala koristiti funkciju
        pwmRandom() sa parametrima 26 i 2000.
*/
#include<arduinoPlatform.h>
#include<tasks.h>
#include<interrupts.h>
#include<stdio.h>
#include<serial.h>
#include <data.h>
#include<pwm.h>

extern serial Serial;

int myPIN = 26;
int oldState, periodTime, startTime, elapsedTime;

void brojevi(int id, void * tptr)
{
    // promenljiva za preskakanje prvog intervala, koji nije potpun
    static int first = true;
    int newState = digitalRead(myPIN);
	if (oldState == 1  && newState == 0) 
        {
                elapsedTime = millis() - startTime;
	} 
        else if (oldState == 0 && newState ==1) 
        {
        int time = millis();
        periodTime = time - startTime;
        startTime = time;

        if (!first) 
        {
           Serial.print(elapsedTime);
           Serial.print(' ');
           Serial.println(periodTime);
        }
        first = false;
	}
	oldState = newState;
}

void setup()
{
  Serial.begin(9600);
  pwmRandom(myPIN, 2000);
  oldState = digitalRead(myPIN);
  startTime = millis();
  elapsedTime = 0;
  periodTime = 0;

  createTask(brojevi, 1, TASK_ENABLE, NULL);
}

void loop()
{

}
