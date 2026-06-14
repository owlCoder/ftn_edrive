#ifndef GUI_H
#define GUI_H
#include<arduinoPlatform.h>
#include<windows.h>

class GUI
{
    public:
        GUI();
        virtual ~GUI();
        void myDigitalWrite(int, int);
        void pinMode(int, int);
        void CreateGUI(HWND);
        void GUIPressed(WPARAM, LPARAM);
        void GUIButton(WPARAM, LPARAM);
        void GUIDrawButton(WPARAM, LPARAM);
        void GUIDrawSlider(WPARAM, LPARAM);
        void GUImousePressed(WPARAM, LPARAM);
        int isButton(HWND);
        int isSlider(HWND);
        int WINAPI WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nCmdShow);
        void setLED();
        void startGUI();
    protected:

    private:
       static const int buttonPins[4];
       static const int switchPins[4];
       static const int ledPins[8];
       HBITMAP switchOnImg, switchOffImg;
       HBITMAP ledOnImg, ledOffImg;
       HBITMAP buttonOnImg, buttonOffImg;
       HWND hwndButton[4];
       HWND hwndLED[8];
       HWND hwndSwitch[4];
       HWND hwndSlider;
       HWND hwndSerial;
       void LoadImages();
};

#endif // GUI_H
