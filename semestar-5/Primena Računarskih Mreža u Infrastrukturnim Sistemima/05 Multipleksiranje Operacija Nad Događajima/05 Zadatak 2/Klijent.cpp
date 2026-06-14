#define _WINSOCK_DEPRECATED_NO_WARNINGS
#define WIN32_LEAN_AND_MEAN

#include <windows.h>
#include <winsock2.h>
#include <ws2tcpip.h>
#include <stdlib.h>
#include <stdio.h>
#include "conio.h"

#pragma comment (lib, "Ws2_32.lib")
#pragma comment (lib, "Mswsock.lib")
#pragma comment (lib, "AdvApi32.lib")

#pragma pack(1)

#define SERVER_IP_ADDRESS "127.0.0.1"
#define BUFFER_SIZE 512
#define SERVER_PORT 27016

struct studentInfo
{
    char ime[15];
    char prezime[20];
    short poeni;
};

int main()
{
    SOCKET connectSocket = INVALID_SOCKET;
    int iResult;
    char bafer[BUFFER_SIZE];
    WSADATA wsaData;

    if (WSAStartup(MAKEWORD(2, 2), &wsaData) != 0)
    {
        printf("WSA Startup neuspesan (%d)!\n", WSAGetLastError());
        return 1;
    }

    connectSocket = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);

    if (connectSocket == INVALID_SOCKET)
    {
        printf("Neuspesno kreiranje socketa (%d)!\n", WSAGetLastError());
        WSACleanup();
        return 2;
    }

    sockaddr_in serverAddress;
    serverAddress.sin_family = AF_INET;
    serverAddress.sin_addr.s_addr = inet_addr(SERVER_IP_ADDRESS);
    serverAddress.sin_port = htons(SERVER_PORT);

    iResult = connect(connectSocket, (SOCKADDR *) &serverAddress, sizeof(serverAddress));

    if (iResult == SOCKET_ERROR)
    {
        printf("Nije moguca veza ka serveru!\n");
        closesocket(connectSocket);
        WSACleanup();
        return 3;
    }

    studentInfo student;
    short poeni;

    while (true)
    {
        printf("Unesite ime studenta: ");
        gets_s(student.ime, 15);

        printf("Unesite prezime studenta: ");
        gets_s(student.prezime, 15);

        printf("Unesite osvojene poene na testu: ");
        scanf_s("%hd", &poeni);

        student.poeni = htons(poeni);
        getchar();

        iResult = send(connectSocket, (char *) &student, (int) sizeof(studentInfo), 0);
        
        if (iResult == SOCKET_ERROR)
        {
            printf("Slanje podataka neuspesno (%d)!\n", WSAGetLastError());
            closesocket(connectSocket);
            WSACleanup();
            return 4;
        }

        printf("Poruka uspesno poslata. Ukupno poslato: %ld.\n", iResult);

        printf("Pritisnite 'x' za izlaz ili bilo koji drugi taster za nastavak: ");
        
        if (_getch() == 'x')
        {
            break;
        }
    }
    
    iResult = shutdown(connectSocket, SD_BOTH);

    if (iResult == SOCKET_ERROR)
    {
        printf("Shutdown neuspesan (%d)!\n", WSAGetLastError());
        closesocket(connectSocket);
        WSACleanup();
        return 5;
    }

    Sleep(1000);

    iResult = closesocket(connectSocket);

    if (iResult == SOCKET_ERROR)
    {
        printf("Greska prilikom zatvaranja uticnice (%d)!\n", WSAGetLastError());
        WSACleanup();
        return 6;
    }

    WSACleanup();

    return 0;
}
