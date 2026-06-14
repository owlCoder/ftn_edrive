#include "pwm.h"
#include <math.h>
#include <tasks.h>
#include <arduinoPlatform.h>

int PIN = 33;
int period = 3000;
int duzina = 1000;
double greska = 0.0;
int upali_pin_id;
int upali_pin_Random_id;
int upali_pin_Sin_id;

void upali_pin(int id, void * tptr)
{
    int vrednost_pina = digitalRead(PIN);
    int procenat = greska * 100;
    int upaljen_pin = duzina;
    int ugasen_pin = period - duzina;
    if(vrednost_pina == 0)
    {
        if(procenat < random(1, 100))
        {
            digitalWrite(PIN, HIGH);
            setTaskPeriod(upali_pin_id, upaljen_pin);
        }
        else
        {
            digitalWrite(PIN, HIGH);
            int random_duzina = random(3, period-2);
            setTaskPeriod(upali_pin_id, random_duzina);
        }
    }
    else
    {
        digitalWrite(PIN, LOW);
        ugasen_pin = period - getTaskPeriod(upali_pin_id);
        setTaskPeriod(upali_pin_id, ugasen_pin);

    }
}

void pwm(int pin, int p, int d, double g)
{
    PIN = pin;
    period = p;
    duzina = d;
    greska = g;
    upali_pin_id = createTask(upali_pin, duzina, TASK_ENABLE, NULL);
}

void upali_pin_Random(int id, void * tptr)
{
    int vrednost_pina = digitalRead(PIN);
    static int upaljen_pin = 0;
    static int ugasen_pin = 0;

    if(vrednost_pina == 0)
    {
        digitalWrite(PIN, HIGH);
        upaljen_pin = random(3, period-2);
        setTaskPeriod(upali_pin_Random_id, upaljen_pin);
    }
    else
    {
        digitalWrite(PIN, LOW);
        ugasen_pin = period - getTaskPeriod(upali_pin_Random_id);
        setTaskPeriod(upali_pin_Random_id, ugasen_pin);
    }
}

void pwmRandom(int pin, int p)
{
    PIN = pin;
    period = p;
    upali_pin_Random_id = createTask(upali_pin_Random, period, TASK_ENABLE, NULL);
}


void upali_pin_Sin(int id, void * tptr)
{
    int vrednost_pina = digitalRead(PIN);
    double x = millis() + 0.0;
    static int upaljen_pin = 0;
    double perioda_sin = 2*3.14159265;
    int procenat = greska * 100;
    int random_duzina = random(3, period-2);

    if(vrednost_pina == 0)
    {
        if(procenat < random(1, 100))
        {
            digitalWrite(PIN, HIGH);
            upaljen_pin =(sin((x * perioda_sin) / (20 * period)) + 1) * period / 2;
            setTaskPeriod(upali_pin_Sin_id, upaljen_pin);
        }
        else
        {
            digitalWrite(PIN, HIGH);
            setTaskPeriod(upali_pin_Sin_id, random_duzina);
        }
    }
    else
    {
        digitalWrite(PIN, LOW);
        int ugasen_pin = period - getTaskPeriod(upali_pin_Sin_id);
        setTaskPeriod(upali_pin_Sin_id, ugasen_pin);
    }
}

void pwmSin(int pin, int p, double g)
{
    PIN = pin;
    period = p;
    greska = g;
    upali_pin_Sin_id = createTask(upali_pin_Sin, period, TASK_ENABLE, NULL);
}
