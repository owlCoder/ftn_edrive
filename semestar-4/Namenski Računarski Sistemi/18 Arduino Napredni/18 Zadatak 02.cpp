#include<arduinoPlatform.h>
#include<tasks.h>
#include<interrupts.h>
#include<stdio.h>
#include<serial.h>
#include<data.h>

extern serial Serial;

int suma;
int br = 0;
#define numOfLastValues 10
int numOfValues;
int values[numOfLastValues];
int numOfErrors;

void broj(int id, void *tptr)
{
    if(available())
    {
        char *r = read();
        numOfValues++;
        // Broj pocinje od 21. karaktera
        int br = atoi(r+21);
        values[numOfValues%numOfLastValues] = br;
        Serial.println(br);
        if (numOfValues>=2) {
            int prev1= (numOfValues-1)%numOfLastValues;
            int prev2= (numOfValues-2)%numOfLastValues;
            if ((br<values[prev1]*0.9 || br>values[prev1]*1.1) &&
                (br<values[prev2]*0.9 || br>values[prev2]*1.1)){
                    numOfErrors++;
                    Serial.print("Greska broj: ");
                    Serial.println(numOfErrors);
                    char datum[12];
                    strncpy(datum, r, 11);
                    datum[11] = '\0';
                    Serial.print("Datum greske: ");
                    Serial.println(datum);
                    char vreme[9];
                    vreme[8] = '\0';
                    strncpy(vreme, r+12, 8);
                    Serial.print("Vreme greske: ");
                    Serial.println(vreme);
                    Serial.print("Procenat greske: ");
                    Serial.println(numOfErrors*100/numOfValues);
               }
        }
        delete[] r;
    }
}

void setup()
{
    Serial.begin(9600);

    startStopDataGeneration(START_GENERATION, SAME, 0, 10, 0.1, 500);

    numOfValues = -1;
    numOfErrors = 0;

    createTask(broj, 50, TASK_ENABLE, NULL);
}

void loop()
{

}
