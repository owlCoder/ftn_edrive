#ifndef INTERRUPTS_H
#define INTERRUPTS_H

#define RISING 0
#define FALLING 1
#define UNKNOWN -1

const int interruptToPin[9] = {38, 2, 7, 8, 35, 4, 34, 36, 37};
const int pinToInterrupt[70] = {-1, -1,  1, -1,  5, -1, -1,  2,  3, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
                          -1, -1,- 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,  6,  4,  7,  8,  0, -1,
                          -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
                          -1, -1, -1, -1, -1, -1, -1, -1, -1, -1};

typedef void (*interruptFunc) ();

typedef struct {
    interruptFunc interruptFunction;
    int interruptMode;
} interruptHeaderType;


typedef struct {
  int numberOfInterrupts;
  interruptHeaderType interruptH[9];
} interruptHeadersType;

int digitalPinToInterrupt(int);
int digitalInterruptToPin(int);

void attachInterrupt(int, interruptFunc, int);

void detachInterrupt(int);

interruptFunc getIntVector(int);

int getIntMode(int);

void startInterruptManager();

void endInterruptManager();

#endif // INTERRUPTS_H
