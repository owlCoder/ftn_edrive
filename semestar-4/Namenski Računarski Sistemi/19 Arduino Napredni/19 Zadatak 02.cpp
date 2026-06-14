#include<arduinoPlatform.h>
#include<tasks.h>
#include<interrupts.h>
#include<stdio.h>
#include<serial.h>
#include <pwm.h>
#include<data.h>

extern serial Serial;

#define maxBrVrednosti 30
int brojVrednosti = 0;
int temperatura[maxBrVrednosti];
short UV[maxBrVrednosti], pritisak[maxBrVrednosti];

void brojevi(int id, void *tptr)
{
    if(available())
    {
        char *buffer = readAll();
        int velicina = *((int *) buffer);
        for(int i=0; i<velicina; i++)
        {
            temperatura[brojVrednosti] = *(int*)(buffer + sizeof(int) + i * slogSize() + 32);
            UV[brojVrednosti]= *(short*)(buffer + sizeof(int) + i * slogSize() + 36);
            pritisak[brojVrednosti] = *(short*)(buffer + sizeof(int) + i * slogSize() + 38);
            brojVrednosti++;
            if (brojVrednosti==maxBrVrednosti) {
                brojVrednosti = 0;
                int maxUV = UV[0];
                int sumaTemp = 0;
                int sumaPrit = 0;
                for(int j = 0; j<maxBrVrednosti; j++) {
                    sumaTemp += temperatura[j];
                    sumaPrit += pritisak[j];
                    if (maxUV<UV[j])
                        maxUV = UV[j];
                }
                Serial.print("Prosecna temperatura je: ");
                Serial.println(sumaTemp/maxBrVrednosti);
                Serial.print("Prosecan pritisak je: ");
                Serial.println(sumaPrit/maxBrVrednosti);
                Serial.print("Najveci koeficijent UV zracenja je: ");
                Serial.println(maxUV);
            }
        }
        delete[] buffer;
    }
}

void setup()
{
    Serial.begin(9600);

    startStopDataGeneration(START_GENERATION, SIN, 15, 40, 0.0, 200);

    createTask(brojevi, 1000, TASK_ENABLE,  NULL);
}

void loop()
{

}
