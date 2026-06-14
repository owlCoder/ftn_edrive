#ifndef PWM_H_INCLUDED
#define PWM_H_INCLUDED

// Modul implementirao Kristian Tojzan

void pwm(int pin, int period, int duzina, double greska);

void pwmRandom(int pin, int period);

void pwmSin(int pin, int period, double greska);

#endif // PWM_H_INCLUDED
