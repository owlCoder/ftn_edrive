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

#define SERVER_IP_ADDRESS "127.0.0.1"
#define BUFFER_SIZE 512

int main()
{
    sockaddr_in serverAddress;
    int sockAddrLen = sizeof(serverAddress);
    int iResult;
    char bafer[BUFFER_SIZE];
    WSADATA wsaData;

    if (WSAStartup(MAKEWORD(2, 2), &wsaData) != 0)
    {
        printf("WSA Startup greska (%d)!", WSAGetLastError());
        return 1;
    }

    memset((char*) &serverAddress, 0, sizeof(serverAddress));

    printf("Unesite port (15011 ili 15012): ");
    gets_s(bafer, BUFFER_SIZE);

    unsigned long port = atoi(bafer);
    serverAddress.sin_family = AF_INET;
    serverAddress.sin_addr.s_addr = inet_addr(SERVER_IP_ADDRESS);
    serverAddress.sin_port = htons(port);

    SOCKET klijent = socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP);

    if (klijent == INVALID_SOCKET)
    {
        printf("Greska prilikom kreiranja uticnice (%d)!\n", WSAGetLastError());
        WSACleanup();
        return 3;
    }

    while (true)
    {
        printf("Unesite poruku za slanje: ");
        gets_s(bafer, BUFFER_SIZE);

        if (strcmp(bafer, "end") == 0)
        {
            printf("\nKlijent prekida konekciju...\n");
            closesocket(klijent);
            WSACleanup();
            return 4;
        }

        iResult = sendto(klijent, bafer, strlen(bafer), 0, (SOCKADDR *) &serverAddress, sizeof(serverAddress));

        if (iResult == SOCKET_ERROR)
        {
            printf("Greska prilikom slanja podataka (%d)!\n", WSAGetLastError());
            closesocket(klijent);
            WSACleanup();
            return 5;
        }
    }

    printf("\nPritisnite bilo koji taster za izlaz...");
    _getch();

    iResult = closesocket(klijent);

    if (iResult == SOCKET_ERROR)
    {
        printf("Greska prilikom zatvaranja uticnice (%d)!\n", WSAGetLastError());
        WSACleanup();
        return 6;
    }

    WSACleanup();

    return 0;
}
