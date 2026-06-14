#include "arduinoSimulator.h"
#include "arduinoPlatform.h"
#include "tasks.h"
#include "interrupts.h"
#include "serial.h"
#include "GUI.h"
#include "demo.h"

extern digitalPinsType digitalPins;
extern analogPinsType analogPins;
extern void loop();
extern void setup();
extern serial Serial;

void hideConsoleWindow(){
    AllocConsole();
    HWND konzola = FindWindowA("ConsoleWindowClass", NULL);
    ShowWindow(konzola, 0);
}

void closeConsole(){
    AllocConsole();
    HWND konzola = FindWindowA("ConsoleWindowClass", NULL);
    SendMessageW(konzola, WM_CLOSE, 0, 0);
}

void startArduinoSimulator(int showGUI, int hideConsole, int startTasks, int startInterrupts, int startSerial)
{
    HANDLE mainThread;
    DWORD mainThreadId;
    GUI *basicIOShield;

    for (int i = 0; i<DIGITAL_NUM_PINS; i++) {
        digitalPins.mode[i] = INPUT;
        digitalPins.state[i] = LOW;
    }
    for (int i = 0; i<ANALOG_NUM_PINS; i++) {
        analogPins.mode[i] = INPUT;
        analogPins.state[i] = LOW;
    }

    if (hideConsole)
        hideConsoleWindow();
    if (startTasks)
        startTaskManager();
    if (startInterrupts)
        startInterruptManager();
    Serial.startGUI();
    if (startSerial) {
        Serial.showGUI();
    }
    mainThread = CreateThread(NULL, 0, &mainLoop, NULL, 0, &mainThreadId);
    if (showGUI) {
        basicIOShield = new GUI();
        basicIOShield->startGUI();
    }
    if (startTasks)
        endTaskManager();
    if (startInterrupts)
        endInterruptManager();
    CloseHandle(mainThread);
    closeConsole();
}
