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

#define SERVER_IP_ADDRESS "127.0.0.1"
#define SERVER_PORT 15001
#define BUFFER_SIZE 512

int main()
{
	sockaddr_in adresaServera;
	WSADATA wsaData;

	int duzinaAdreseServera = sizeof(sockaddr_in);
	char baferZaPodatke[BUFFER_SIZE];

	// inicijalizacija WSA
	int iResult = WSAStartup(MAKEWORD(2, 2), &wsaData);

	if (iResult != 0)
	{
		printf("Neuspesno pokretanje WSA (%d)!\n", WSAGetLastError());
		return 1;
	}

	// podesavanje adresne strukture servera
	memset((char* ) &adresaServera, 0, sizeof(adresaServera));
	adresaServera.sin_family = AF_INET;
	adresaServera.sin_addr.s_addr = inet_addr(SERVER_IP_ADDRESS);

	// kreiranje socket-a
	SOCKET klijent = socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP);

	if (klijent == INVALID_SOCKET)
	{
		printf("Kreiranje socket-a nije uspelo (%d)!\n", WSAGetLastError());
		WSACleanup();
		return 2;
	}

	// ako korisnik unese kraj prekida se slanje poruka
	bool kraj = false;

	do
	{
		// korisnik unosi na koji port bi da posalje poruku serveru
		short port;

		printf("\nUnesite port: ");
		scanf_s("%hd", &port);

		adresaServera.sin_port = htons(port);
		
		// ciscenje bafera tastature
		char cls;
		scanf_s("%c", &cls);

		// prikupljanje podataka za slanje serveru od klijenta
		printf("Unesite poruku: ");
		gets_s(baferZaPodatke, BUFFER_SIZE);

		if (strcmp(baferZaPodatke, "kraj") == 0)
		{
			printf("\nZatvaranje konekcije i prekid rada klijenta...\n");
			kraj = true;
		}
		else
		{
			// slanje poruke serveru
			iResult = sendto(klijent, baferZaPodatke, strlen(baferZaPodatke), 0, (SOCKADDR*)&adresaServera, sizeof(adresaServera));

			if (iResult == SOCKET_ERROR)
			{
				printf("Slanje podataka neuspesno (%d)!\n", WSAGetLastError());
				closesocket(klijent);
				WSACleanup();
				return 3;
			}
		}
	} while (!kraj);

	printf("Pritisnite bilo koji taster za izlaz iz programa....\n");
	_getch();

	iResult = closesocket(klijent);

	if (iResult == SOCKET_ERROR)
	{
		printf("Zatvaranje socket-a neuspesno (%d)!\n", WSAGetLastError());
		WSACleanup();
		return 4;
	}

	WSACleanup();

	return 0;
}