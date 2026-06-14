#include "interrupts.h"
#include "arduinoPlatform.h"
#include "windows.h"
#include "stdio.h"

using namespace std;

interruptHeadersType interruptHeaders;

HANDLE iScheduler;
DWORD iSchedulerID;

int pinOldState[9];

int digitalPinToInterrupt(int pin){
  return pinToInterrupt[pin];
};

int digitalInterruptToPin(int i){
  return interruptToPin[i];
};

void attachInterrupt(int i, interruptFunc fun, int mode){
    interruptHeaders.interruptH[i].interruptMode = mode;
    interruptHeaders.interruptH[i].interruptFunction = fun;
};

void detachInterrupt(int i){
   interruptHeaders.interruptH[i].interruptFunction = 0;
};

interruptFunc getIntVector(int i){
   return interruptHeaders.interruptH[i].interruptFunction;
};
int getIntMode(int i){
   return interruptHeaders.interruptH[i].interruptMode;
};

void initInterrupts(){
   interruptHeaders.numberOfInterrupts = 9;
   for(int i=0; i<9; i++){
      interruptHeaders.interruptH[i].interruptFunction = 0;
      interruptHeaders.interruptH[i].interruptMode = UNKNOWN;
      pinOldState[i] = digitalRead(interruptToPin[i]);
   }
};

void startInterrupts(){
   int newState, pin;
   for(int i=0; i<9; i++){
        pin = interruptToPin[i];
        newState = digitalRead(pin);
        if (interruptHeaders.interruptH[i].interruptFunction!=NULL) {
            if (pinOldState[i]==LOW && newState==HIGH &&
                interruptHeaders.interruptH[i].interruptMode == RISING)
                    interruptHeaders.interruptH[i].interruptFunction();
            else if (pinOldState[i]==HIGH && newState==LOW &&
                interruptHeaders.interruptH[i].interruptMode == FALLING)
                    interruptHeaders.interruptH[i].interruptFunction();
        }
        pinOldState[i] = newState;
   }
}

DWORD WINAPI interruptScheduler(LPVOID lpParam)
{
    while (true){
        startInterrupts();
        delay(1);
    }
}

void startInterruptManager(){
   initInterrupts();
   iScheduler = CreateThread(NULL, 0, &interruptScheduler, NULL, 0, &iSchedulerID);
}

void endInterruptManager(){
    CloseHandle(iScheduler);
};

