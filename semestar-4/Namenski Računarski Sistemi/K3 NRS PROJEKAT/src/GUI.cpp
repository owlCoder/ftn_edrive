#include "GUI.h"
#include "arduinoPlatform.h"
#include "serial.h"
#include "math.h"
//#include <cstdlib>

char* itoa3(int n, char *c, int b){
   char s[33];
   s[32] = 0;
   int i = 31;
   do {
     s[i] = n%b+'0';
     i--;
     n = n/b;
   } while (n!=0);
   memcpy(c, &s[i+1], 32-i);
   return c;
}

GUI *me;
extern serial Serial;

GUI::GUI()
{
  me = this;
}

GUI::~GUI()
{
    //dtor
}

void GUI::startGUI(){
   WinMain(NULL, NULL, NULL, 1);
}

const int GUI::buttonPins[4] = {37, 36, 34, 4};
const int GUI::switchPins[4] = {35, 8, 7, 2};
const int GUI::ledPins[8] = {33, 32, 31, 30, 29, 28, 27, 26};

void GUI::LoadImages()
{
   switchOnImg = (HBITMAP) LoadImageW(NULL, L"Images\\switchOn.bmp", IMAGE_BITMAP, 0, 0, LR_LOADFROMFILE);
   switchOffImg = (HBITMAP) LoadImageW(NULL, L"Images\\switchOff.bmp", IMAGE_BITMAP, 0, 0, LR_LOADFROMFILE);
   ledOnImg = (HBITMAP) LoadImageW(NULL, L"Images\\ledOn.bmp", IMAGE_BITMAP, 0, 0, LR_LOADFROMFILE);
   ledOffImg = (HBITMAP) LoadImageW(NULL, L"Images\\ledOff.bmp", IMAGE_BITMAP, 0, 0, LR_LOADFROMFILE);
   buttonOnImg = (HBITMAP) LoadImageW(NULL, L"Images\\buttonOn.bmp", IMAGE_BITMAP, 0, 0, LR_LOADFROMFILE);
   buttonOffImg = (HBITMAP) LoadImageW(NULL, L"Images\\buttonOff.bmp", IMAGE_BITMAP, 0, 0, LR_LOADFROMFILE);
}

void GUI::CreateGUI(HWND hwnd){
        char buf[3];
        LoadImages();
        for(int i=0; i<4; i++){
            hwndButton[i] = CreateWindow(TEXT("button"), NULL, WS_VISIBLE | WS_CHILD | BS_BITMAP | BS_OWNERDRAW,
                                         22+35*i, 200, 25, 25, hwnd, (HMENU) i+100, NULL, NULL);
        }
        for(int i=0; i<4; i++) {
            hwndSwitch[i] = CreateWindow(TEXT("static"), NULL, WS_VISIBLE | WS_CHILD | SS_BITMAP | SS_NOTIFY,
                                         20+35*i, 100, 30, 60, hwnd, (HMENU) i+110, NULL, NULL);
            SendMessageW(hwndSwitch[i], STM_SETIMAGE, IMAGE_BITMAP, (LPARAM) switchOffImg);
        }
        CreateWindow(TEXT("static"), TEXT(" 37     36     34      4"), WS_VISIBLE | WS_CHILD,
                                         20, 230, 135, 25, hwnd, (HMENU) 200, NULL, NULL);

        CreateWindow(TEXT("static"), TEXT("  35     8       7       2"), WS_VISIBLE | WS_CHILD,
                                         20, 170, 135, 25, hwnd, (HMENU) 201, NULL, NULL);
        for(int i=0; i<8; i++) {
            hwndLED[i] = CreateWindow(TEXT("static"), NULL, WS_VISIBLE | WS_CHILD | SS_BITMAP | SS_NOTIFY,
                                         350-25*i, 200, 25, 25, hwnd, (HMENU) i+120, NULL, NULL);
            CreateWindow(TEXT("static"), TEXT(itoa3(33-i, buf, 10)), WS_VISIBLE | WS_CHILD,
                                         180+25*i, 230, 25, 25, hwnd, (HMENU) 202, NULL, NULL);
            SendMessageW(hwndLED[i], STM_SETIMAGE, IMAGE_BITMAP, (LPARAM) ledOffImg);
        }
        hwndSerial = CreateWindow(TEXT("button"), TEXT("Show / hide serial"), WS_VISIBLE | WS_CHILD | BS_DEFPUSHBUTTON |WS_TABSTOP ,
                                         330, 5, 150, 25, hwnd, (HMENU) 501, NULL, NULL);

        CreateWindow(TEXT("static"), "A0", WS_VISIBLE | WS_CHILD, 423, 230, 25, 25, hwnd, (HMENU) 202, NULL, NULL);
        CreateWindow(TEXT("static"), "0", WS_VISIBLE | WS_CHILD, 427, 153, 15, 15, hwnd, (HMENU) 202, NULL, NULL);
}

void GUI::GUIPressed(WPARAM wParam, LPARAM lParam)
{
    int switchNum = LOWORD(wParam)-440;
    int switchPinNum = switchPins[LOWORD(wParam)-440];
    if (digitalRead(switchPinNum)==HIGH)
    {
        digitalWrite(switchPinNum, LOW);
        SendMessageW(hwndSwitch[switchNum], STM_SETIMAGE, IMAGE_BITMAP, (LPARAM) switchOffImg);
    }
    else
    {
        digitalWrite(switchPinNum, HIGH);
        SendMessageW(hwndSwitch[switchNum], STM_SETIMAGE, IMAGE_BITMAP, (LPARAM) switchOnImg);
    }
}

void GUI::GUIButton(WPARAM wParam, LPARAM lParam){
     int buttonPinNum = buttonPins[LOWORD(wParam)-400];
     if (digitalRead(buttonPinNum)==HIGH) {
         digitalWrite(buttonPinNum, LOW);
     } else {
         digitalWrite(buttonPinNum, HIGH);
     }
     GUIDrawButton(wParam, lParam);
}

void GUI::GUIDrawButton(WPARAM wParam, LPARAM lParam){
     BITMAP bm;
     DRAWITEMSTRUCT *dis = (DRAWITEMSTRUCT*) lParam;
     HDC src = CreateCompatibleDC(dis->hDC);
     if (digitalRead(buttonPins[wParam-400])==LOW) {
        SelectObject(src, buttonOffImg);
        GetObject(buttonOffImg,sizeof(bm),&bm);
     } else {
        SelectObject(src, buttonOnImg);
        GetObject(buttonOnImg,sizeof(bm),&bm);
     }
     StretchBlt(dis->hDC, 0, 0, 25, 25, src, 0, 0, 25, 25,SRCCOPY);
     DeleteDC(src);
}

int GUI::isButton(HWND b){
   for (int i=0; i<4; i++){
      if (b==hwndButton[i])
           return true;
   }
   return false;
}

int GUI::isSlider(HWND b){
   return b==hwndSlider;
}

void GUI::GUIDrawSlider(WPARAM wParam, LPARAM lParam){
    HWND W = FindWindowA("ArduinoWindowClass", NULL);
    HDC H = GetDC(W);
    SelectObject(H, GetStockObject(BLACK_BRUSH));
    Ellipse(H, 403, 170, 457, 224);
    int centerX = 430, centerY = 197, lineLen = 26;
    int endX, endY;
    endX = centerX+cos(2*3.1428*analogRead(A0)/1024+1.5*3.1428)*lineLen;
    endY = centerY+sin(2*3.1428*analogRead(A0)/1024+1.5*3.1428)*lineLen;
    SelectObject(H, GetStockObject(WHITE_PEN));
    MoveToEx(H, centerX, centerY, NULL);
    LineTo(H, endX, endY);
    ReleaseDC(W, H);
};

void GUI::GUImousePressed(WPARAM wParam, LPARAM lParam){
    int x = LOWORD(lParam)-403;
    int y = HIWORD(lParam)-170;
    double angle;
    int value;
    if (x>27)
       angle = 1.57-atan((27.0-y)/(x-27));
    else
       angle = 4.71-atan((27.0-y)/(x-27));
    value = angle*1024/(2*3.14);
    analogWrite(A0, value);
};

void GUI::setLED(){
  for (int i=26; i<=33; i++) {
      if (digitalRead(i) == HIGH){
          SendMessageW(hwndLED[i-26], STM_SETIMAGE, IMAGE_BITMAP, (LPARAM) ledOnImg);
      }
      else {
          SendMessageW(hwndLED[i-26], STM_SETIMAGE, IMAGE_BITMAP, (LPARAM) ledOffImg);
      }
  }
};


LRESULT CALLBACK WndProc(HWND hwnd, UINT msg, WPARAM wParam, LPARAM lParam)
{
    HWND W = FindWindowA("SerialWindowClass", NULL);
    DRAWITEMSTRUCT *dis;
    switch(msg)
    {
    case WM_CREATE:
        me->CreateGUI(hwnd);
        break;
    case WM_CLOSE:
        if (W!=NULL)
           DestroyWindow(W);
        DestroyWindow(hwnd);
        break;
    case WM_DESTROY:
        PostQuitMessage(0);
        break;
    case WM_PAINT:
        me->GUIDrawSlider(wParam, lParam);
        break;
    case WM_DRAWITEM:
        dis = (DRAWITEMSTRUCT*) lParam;
        if (me->isButton(dis->hwndItem)) {
           if (dis->itemAction == ODA_SELECT) {
              me->GUIButton(wParam, lParam);
           } else {
              me->GUIDrawButton(wParam, lParam);
           }
        } else {
            DefWindowProc(hwnd, msg, wParam, lParam);
        }
        break;
    case WM_LBUTTONDOWN:
        if (LOWORD(lParam)>=403 && LOWORD(lParam)<=457&&HIWORD(lParam)>=170 && HIWORD(lParam)<=224){
            me->GUImousePressed(wParam, lParam);
        } else {
            DefWindowProc(hwnd, msg, wParam, lParam);
        }
        break;
    case WM_COMMAND:
      {
        switch(HIWORD(wParam)){
         case BN_CLICKED:
             if (wParam==501) {
                if (Serial.isVisible())
                    Serial.hideGUI();
                else
                    Serial.showGUI();
             }
             else if (wParam<400 || wParam>403)
                 me->GUIPressed(wParam, lParam);
             break;
         default:
             return DefWindowProc(hwnd, msg, wParam, lParam);
         }
        break;
      }
    default:
        return DefWindowProc(hwnd, msg, wParam, lParam);
    }
    return 0;
}



int WINAPI GUI::WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance,
                   LPSTR lpCmdLine, int nCmdShow)
{
    WNDCLASSEX wc;
    HWND hwnd;
    MSG Msg;
   //Step 1: Registering the Window Class
    wc.cbSize        = sizeof(WNDCLASSEX);
    wc.style         = 0;
    wc.lpfnWndProc   = WndProc;
    wc.cbClsExtra    = 0;
    wc.cbWndExtra    = 0;
    wc.hInstance     = hInstance;
    wc.hIcon         = LoadIcon(NULL, IDI_APPLICATION);
    wc.hCursor       = LoadCursor(NULL, IDC_ARROW);
    wc.hbrBackground = (HBRUSH)(COLOR_WINDOW);
    wc.lpszMenuName  = NULL;
    wc.lpszClassName = "ArduinoWindowClass";
    wc.hIconSm       = LoadIcon(NULL, IDI_APPLICATION);

    if(!RegisterClassEx(&wc))
    {
        MessageBox(NULL, "Window Registration Failed! in GUI", "Error!",
                   MB_ICONEXCLAMATION | MB_OK);
        return 0;
    }

    // Step 2: Creating the Window
    hwnd = CreateWindowEx(
               WS_EX_CLIENTEDGE,
               "ArduinoWindowClass",
               "Arduino simulator",
               (WS_OVERLAPPEDWINDOW ^ WS_THICKFRAME) | WS_EX_CONTROLPARENT,
               CW_USEDEFAULT, CW_USEDEFAULT, 500, 300,
               NULL, NULL, hInstance, NULL);
    if(hwnd == NULL)
    {
        MessageBox(NULL, "Window Creation Failed!", "Error!",
                   MB_ICONEXCLAMATION | MB_OK);
        return 0;
    }
    ShowWindow(hwnd, nCmdShow);
    UpdateWindow(hwnd);

//     Step 3: The Message Loop
    while(GetMessage(&Msg, NULL, 0, 0) > 0)
    {
        TranslateMessage(&Msg);
        DispatchMessage(&Msg);
        setLED();
    }
    return Msg.wParam;
}
