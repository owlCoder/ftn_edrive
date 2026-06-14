#include<arduinoSimulator.h>

int main(){
  // int startSimulator(int showGUI, int hideConsole, int startTasks, int startInterrupts, int startSerial);
  startArduinoSimulator(true, true, true, true, true);
  return 0;
}

