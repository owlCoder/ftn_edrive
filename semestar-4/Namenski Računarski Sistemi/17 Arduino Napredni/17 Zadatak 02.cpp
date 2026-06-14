/*
    Napisati program koji prati stanje pwm signala na pinu 26 i
    ispisuje njegovu dužinu trajanja. Za generisanje signala koristiti funkciju
    pwm() sa parametrima 26, 2000, 750 i 0.2. U slučaju da se generisani signal
    razlikuje za više od 10% u odnosu na prethodna 2 signala, ispisati da je
    došlo do greške, prijaviti redni broj greške kao i procenat greške u ukupnom
    signalu.
*/
#include<arduinoPlatform.h>
#include<tasks.h>
#include<interrupts.h>
#include<stdio.h>
#include<serial.h>
#include<pwm.h>

extern serial Serial;

int myPIN = 26;
int oldState, periodTime, startTime, elapsedTime;

#define numOfLastValues 10
int numOfValues;
int values[numOfLastValues];
int numOfErrors;

void brojevi(int id, void * tptr)
{
    // promenljiva za preskakanje prvog intervala, koji nije potpun :)
    static int first = true;
    int newState = digitalRead(myPIN);
	if (oldState == 1  && newState == 0) {
        elapsedTime = millis()-startTime;
	} else if (oldState == 0 && newState ==1) {
        int time = millis();
        periodTime = time-startTime;
        startTime = time;
        if (!first) {
           Serial.print(elapsedTime);
           Serial.print(' ');
           Serial.println(periodTime);
           values[numOfValues%numOfLastValues] = elapsedTime;
           if (numOfValues>=3) {
               int prev1= (numOfValues-1)%numOfLastValues;
               int prev2= (numOfValues-2)%numOfLastValues;
               if ((elapsedTime<values[prev1]*0.9 || elapsedTime>values[prev1]*1.1) &&
                   (elapsedTime<values[prev2]*0.9 || elapsedTime>values[prev2]*1.1)){
                    numOfErrors++;
                    Serial.print("Greska broj: ");
                    Serial.println(numOfErrors);
                    Serial.print("Procenat greske: ");
                    Serial.println(numOfErrors*100/numOfValues);
               }
           }
           numOfValues++;
        }
        first = false;
	}
	oldState = newState;
}

void setup()
{
  Serial.begin(9600);
  pwm(myPIN, 2000, 750, 0.2);
  oldState = digitalRead(myPIN);
  startTime = millis();
  elapsedTime = 0;
  periodTime = 0;
  numOfValues = 0;
  numOfErrors = 0;
  createTask(brojevi, 1, TASK_ENABLE, NULL);
}

void loop()
{

}
