#include<arduinoPlatform.h>
#include<tasks.h>
#include<interrupts.h>
#include<stdio.h>
#include<serial.h>
#include <pwm.h>
#include<data.h>

extern serial Serial;

int maxBr = -1;

void brojevi(int id, void *tptr)
{
    if(available())
    {
        char *buffer = readAll();
        int velicina = *((int *) buffer);
        for(int i=0; i<velicina; i++)
        {
            char datum[15], vreme[15];
            strcpy(datum, buffer + sizeof(int) + i * slogSize() + 0);
            strcpy(vreme, buffer + sizeof(int) + i * slogSize() + 15);
            int broj = *(int*)(buffer + sizeof(int) + i * slogSize() + 32);
            // 32, a ne 30, je zbog pack(4)
            Serial.print("Vrednost: ");
            Serial.println(broj);
            if (broj>maxBr){
                maxBr = broj;

                int dan = (datum[0]-'0')*10+datum[1]-'0';
                int mesec = (datum[3]-'0')*10+datum[4]-'0';
                char godinaStr[5];
                strncpy(godinaStr, datum+6, 4);
                godinaStr[4] = '\0';
                int godina = atoi(godinaStr);
                Serial.print("Dan: ");
                Serial.print(dan);
                Serial.print(" Mesec: ");
                Serial.print(mesec);
                Serial.print(" Godina: ");
                Serial.println(godina);

                int sat = (vreme[0]-'0')*10+vreme[1]-'0';
                int minut = (vreme[3]-'0')*10+vreme[4]-'0';
                int sekunda = (vreme[6]-'0')*10+vreme[7]-'0';
                Serial.print("Sat: ");
                Serial.print(sat);
                Serial.print(" Minut: ");
                Serial.print(minut);
                Serial.print(" Sekunde ");
                Serial.println(sekunda);
            }
        }
        delete[] buffer;
    }
}

void setup()
{
    Serial.begin(9600);

    startStopDataGeneration(START_GENERATION, RANDOM, 0, 100, 0.0, 400);

    createTask(brojevi, 1000, TASK_ENABLE,  NULL);
}

void loop()
{

}
