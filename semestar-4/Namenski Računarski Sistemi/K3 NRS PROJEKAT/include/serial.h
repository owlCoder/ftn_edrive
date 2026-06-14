#ifndef SERIALGUI_H
#define SERIALGUI_H
#include "Windows.h"
#include "stdlib.h"

class serial
{
    public:
        serial();
        virtual ~serial();
        int CreateSerialWindow(HINSTANCE, HINSTANCE, LPSTR, int);
        void CreateSerialGUI(HWND);
        void startGUI();
        void showGUI();
        void hideGUI();
        int isVisible();
        void begin(int);
        void write(char c);
        void write(const char *c);
        void writeln(char c);
        void writeln(const char *c);
        void print(char c);
        void print(short s);
        void print(int i);
        void print(long l);
        void print(const char *c);
        void println(char c);
        void println(short s);
        void println(int i);
        void println(long l);
        void println(const char *c);
        int available();
        char read();
        char* readString();
        void buttonPressed();
        void ChangeSize(int, int);
    private:
        int serialVisible;
        HWND hwndWindow;
        HWND hwndInput;
        HWND hwndButton;
        HWND hwndOutput;
        char buffer[1000];
        int charCount;
        int baudRate;
};

#endif // SERIALGUI_H
