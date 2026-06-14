#ifndef SIMULATOR_H
#define SIMULATOR_H
#include <windows.h>
#include <arduinoPlatform.h>

/*
Use showGui = true to show GUI for BasicIOShield board
Use hideConsole = true to hide console window
Use startTasks = true to enable tasks
Use startInterrupts = true to enable interrupts
Use startSerial = true to enable show GUI for Serial monitor
*/

void startArduinoSimulator(int showGUI, int hideConsole, int startTasks, int startInterrupts, int startSerial);

#endif // SIMULATOR_H
