#define _WINSOCK_DEPRECATED_NO_WARNINGS
#define WIN32_LEAN_AND_MEAN

#include <windows.h>
#include <winsock2.h>
#include <ws2tcpip.h>
#include <stdio.h>
#include <stdlib.h>
#include "conio.h"

#pragma comment (lib, "Ws2_32.lib")
#pragma comment (lib, "Mswsock.lib")
#pragma comment (lib, "AdvApi32.lib")

#define SERVER_IP_ADRESS "127.0.0.1"
#define SERVER_PORT 27016
#define BUFFER_SIZE 256

// TCP klijent koji koristi blokiranje socket-a
int main()
{
	SOCKET socketZaKonekciju = INVALID_SOCKET;
	int iResult;
	char baferZaPodatke[BUFFER_SIZE];
	WSADATA wsaData;

	// pokretanje WSA
	if (WSAStartup(MAKEWORD(2, 2), &wsaData) != 0)
	{
		printf("Nije moguce pokrenuti WSA.\nGreska: %d\n", WSAGetLastError());
		return 1;
	}

	// kreiraanje soketa za konekciju
	socketZaKonekciju = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);

	if (socketZaKonekciju == INVALID_SOCKET)
	{
		printf("Socket za konekciju neuspesno inicijalizovan!\nGreska: %d\n", WSAGetLastError());
		WSACleanup();
		return 2;
	}

	// kreiranje adresne strukture
	sockaddr_in adresaServera;
	adresaServera.sin_family = AF_INET;
	adresaServera.sin_addr.s_addr = inet_addr(SERVER_IP_ADRESS);
	adresaServera.sin_port = htons(SERVER_PORT);

	// povezivanje sa serverom
	if (connect(socketZaKonekciju, (SOCKADDR*)&adresaServera, sizeof(adresaServera)) == SOCKET_ERROR)
	{
		printf("Neuspesno povezivanje na server!\n");
		closesocket(socketZaKonekciju);
		WSACleanup();
		return 3;
	}

	bool kraj = false;

	do
	{
		iResult = recv(socketZaKonekciju, baferZaPodatke, BUFFER_SIZE, 0);

		if (iResult > 0)
		{
			baferZaPodatke[iResult] = '\0';
			printf("SERVER: %s\n", baferZaPodatke);

			if (strstr(baferZaPodatke, "POBEDILI") || strstr(baferZaPodatke, "IZGUBILI"))
			{
				kraj = true;
			}
		}
		else if (iResult == 0)
		{
			printf("Konekcija sa serverom je zatvorena.\n");
			closesocket(socketZaKonekciju);
			WSACleanup();
			return 0;
		}
		else
		{
			printf("Prijem podataka sa servera neuspesan!\nGreska: %d", WSAGetLastError());
			closesocket(socketZaKonekciju);
			WSACleanup();
			return 4;
		}

		if (kraj) // kraj igre je prekid rada klijenta
		{
			break;
		}

		// unos podataka od strane klijenta i slanje na server
		printf("Unesite rec koja pocinje zadatim slovom: ");
		gets_s(baferZaPodatke, BUFFER_SIZE);

		iResult = send(socketZaKonekciju, baferZaPodatke, (int)strlen(baferZaPodatke), 0);

		if (iResult == SOCKET_ERROR)
		{
			printf("Slanje podataka na server nije uspelo!\nGreska: %d\n", WSAGetLastError());
			closesocket(socketZaKonekciju);
			WSACleanup();
			return 5;
		}
	} while (true);

	// gasenje konekcije nakon zavrsetka rada
	iResult = shutdown(socketZaKonekciju, SD_BOTH);

	if (iResult == SOCKET_ERROR)
	{
		printf("Gasenje konekcije neuspesno!\nGreska: %d\n", WSAGetLastError());
		closesocket(socketZaKonekciju);
		WSACleanup();
		return 6;
	}

	printf("\nPritisnite bilo koji taster za izlaz...\n");
	_getch();

	// zatvarenje socket-a i WSA
	closesocket(socketZaKonekciju);
	WSACleanup();

	return 0;
}
