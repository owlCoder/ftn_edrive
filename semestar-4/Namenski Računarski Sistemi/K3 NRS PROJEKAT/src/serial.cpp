#include "serial.h"
#include "windowsx.h"

void itoa2(int n, char *c, int b){
   char s[33];
   s[32] = 0;
   int i = 31;
   do {
     s[i] = n%b+'0';
     i--;
     n = n/b;
   } while (n!=0);
   memcpy(c, &s[i+1], 32-i);
}

serial Serial;

serial::serial()
{
   charCount = 0;
   buffer[charCount] = '\0';
   serialVisible = 0;
   baudRate = 0;
}

serial::~serial()
{
    //dtor
}

void serial::startGUI(){
   CreateSerialWindow(NULL, NULL, NULL, 1);
};

void serial::showGUI(){
    ShowWindow(hwndWindow, 1);
    serialVisible = 1;
    UpdateWindow(hwndWindow);
};

void serial::hideGUI(){
    ShowWindow(hwndWindow, 0);
    serialVisible = 0;
};

int serial::isVisible(){
   return serialVisible == 1;
}

void serial::begin(int rate){
   baudRate = rate;
}

void serial::write(char c){
     char buff[10000];
     Edit_GetText(hwndOutput, buff, 10000);
     int len = strlen(buff);
     buff[len++] = c;
     buff[len] = '\0';
     Edit_SetText(hwndOutput, buff);
     UpdateWindow(hwndOutput);
}

void serial::writeln(char c){
     char buff[10000];
     Edit_GetText(hwndOutput, buff, 10000);
     int len = strlen(buff);
     buff[len] = c;
     buff[len+1] = '\r';
     buff[len+2] = '\n';
     buff[len+3] = '\0';
     Edit_SetText(hwndOutput, buff);
}

void serial::write(const char *c){
     char buff[10000];
     Edit_GetText(hwndOutput, buff, 10000);
     int len = strlen(buff);
     int lenC = 0;
     while (c[lenC]!=0)
        buff[len++] = c[lenC++];
     buff[len] = '\0';
     Edit_SetText(hwndOutput, buff);
}

void serial::writeln(const char *c){
     char buff[10000];
     Edit_GetText(hwndOutput, buff, 10000);
     int len = strlen(buff);
     int lenC = 0;
     while (c[lenC]!=0)
        buff[len++] = c[lenC++];
     buff[len] = '\r';
     buff[len+1] = '\n';
     buff[len+2] = '\0';
     Edit_SetText(hwndOutput, buff);
     UpdateWindow(hwndOutput);
     int line = Edit_GetLineCount(hwndOutput);
     Edit_Scroll(hwndOutput, line, 0);
}

void serial::print(char c){
   write(c);
}

void serial::print(short s){
   char buffer[10];
   itoa2(s, buffer, 10);
   write(buffer);
}

void serial::print(int i){
   char buffer[10];
   itoa2(i, buffer, 10);
   write(buffer);
}

void serial::print(long l){
   char buffer[10];
   itoa2(l, buffer, 10);
   write(buffer);
}

void serial::print(const char *c){
   write(c);
}

void serial::println(char c){
   writeln(c);
}

void serial::println(short s){
   char buffer[10];
   itoa2(s, buffer, 10);
   writeln(buffer);
}

void serial::println(int i){
   char buffer[10];
   itoa2(i, buffer, 10);
   writeln(buffer);
}

void serial::println(long l){
   char buffer[10];
   itoa2(l, buffer, 10);
   writeln(buffer);
}

void serial::println(const char *c){
   writeln(c);
}

int serial::available(){
    return charCount>0;
}

char serial::read(){
    if (charCount==0)
        return '\0';
    else {
        char result = buffer[0];
        strcpy(buffer, buffer+1);
        charCount--;
        while (charCount>1 && buffer[0]<' '){
            strcpy(buffer, buffer+1);
            charCount--;
        }
        return result;
    }
};

char* serial::readString(){
    if (charCount==0)
        return NULL;
    else {
        int len = strlen(buffer);
        char* result = (char*) malloc(len+1);
        strcpy(result, buffer);
        strcpy(buffer, buffer+len);
        charCount-=len;
        return result;
    }
};

void serial::CreateSerialGUI(HWND hwnd){
        CreateWindow(TEXT("static"), TEXT("INPUT: "), WS_VISIBLE | WS_CHILD,
                                         5, 5, 70, 20, hwnd, (HMENU) 100, NULL, NULL);

        hwndButton = CreateWindow(TEXT("button"), TEXT("Send"), WS_VISIBLE | WS_CHILD | BS_DEFPUSHBUTTON |WS_TABSTOP ,
                                         320, 5, 55, 20, hwnd, (HMENU) 104, NULL, NULL);

        CreateWindow(TEXT("static"), TEXT("OUTPUT: "), WS_VISIBLE | WS_CHILD,
                                         5, 30, 65, 20, hwnd, (HMENU) 101, NULL, NULL);

        hwndInput = CreateWindow(TEXT("edit"), TEXT(""), WS_VISIBLE | WS_CHILD,
                                         75, 5, 240, 20, hwnd, (HMENU) 102, NULL, NULL);

        hwndOutput = CreateWindow(TEXT("edit"), TEXT(""),
                                  WS_CHILD | WS_VISIBLE | WS_VSCROLL | ES_LEFT | ES_MULTILINE | ES_AUTOVSCROLL,
                                  5, 55, 375, 105, hwnd, (HMENU) 103, NULL, NULL);

        Edit_SetReadOnly(hwndOutput, true);
}

void serial::ChangeSize(int width, int height){
    MoveWindow(hwndButton, width-60, 5, 55, 20, TRUE);
    MoveWindow(hwndInput, 75, 5, width-140, 20, TRUE);
    MoveWindow(hwndOutput, 5, 55, width-10, height-40, TRUE);
    UpdateWindow(hwndWindow);
}

void serial::buttonPressed(){
    char tmp[1000];
    Edit_GetText(hwndInput, tmp, 1000);
    Edit_SetText(hwndInput, "");
    strcat(buffer, tmp);
    charCount+=strlen(tmp);
    UpdateWindow(hwndInput);
}

LRESULT CALLBACK SerialWndProc(HWND hwnd, UINT msg, WPARAM wParam, LPARAM lParam)
{
    switch(msg)
    {
    case WM_CREATE:
        Serial.CreateSerialGUI(hwnd);
        break;
    case WM_CLOSE:
        //DestroyWindow(hwnd);
        Serial.hideGUI();
        break;
    case WM_DESTROY:
        break;
    case WM_PAINT:
        break;
    case WM_DRAWITEM:
        break;
    case WM_LBUTTONDOWN:
        break;
    case WM_SIZE:
        Serial.ChangeSize(LOWORD(lParam), HIWORD(lParam));
    case WM_COMMAND:
      {
        switch(HIWORD(wParam)){
         case BN_CLICKED:
             if (LOWORD(wParam)==104){
                Serial.buttonPressed();
             }
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

int serial::CreateSerialWindow(HINSTANCE hInstance, HINSTANCE hPrevInstance,
                   LPSTR lpCmdLine, int nCmdShow)
{
    WNDCLASSEX wc;
    MSG Msg;
   //Step 1: Registering the Window Class
    wc.cbSize        = sizeof(WNDCLASSEX);
    wc.style         = 0;
    wc.lpfnWndProc   = SerialWndProc;
    wc.cbClsExtra    = 0;
    wc.cbWndExtra    = 0;
    wc.hInstance     = hInstance;
    wc.hIcon         = LoadIcon(NULL, IDI_APPLICATION);
    wc.hCursor       = LoadCursor(NULL, IDC_ARROW);
    wc.hbrBackground = (HBRUSH)(COLOR_WINDOW);
    wc.lpszMenuName  = NULL;
    wc.lpszClassName = "SerialWindowClass";
    wc.hIconSm       = LoadIcon(NULL, IDI_APPLICATION);

    if(!RegisterClassEx(&wc))
    {
        MessageBox(NULL, "Window Registration Failed!", "Error!",
                   MB_ICONEXCLAMATION | MB_OK);
        return 0;
    }

    // Step 2: Creating the Window
    hwndWindow = CreateWindowEx(
               WS_EX_CLIENTEDGE,
               "SerialWindowClass",
               "Arduino simulator serial port",
               WS_OVERLAPPEDWINDOW ,
               CW_USEDEFAULT, CW_USEDEFAULT, 400, 200,
               NULL, NULL, hInstance, NULL);

    if(hwndWindow == NULL)
    {
        MessageBox(NULL, "Window Creation Failed!", "Error!",
                   MB_ICONEXCLAMATION | MB_OK);
        return 0;
    }
    //ShowWindow(hwndWindow, nCmdShow);
    UpdateWindow(hwndWindow);
    return Msg.wParam;
}
