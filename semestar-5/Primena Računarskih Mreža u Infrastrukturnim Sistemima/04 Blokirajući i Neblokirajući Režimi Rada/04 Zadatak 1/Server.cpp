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
	memset((char*)&adresaServera, 0, sizeof(adresaServera));
	adresaServera.sin_family = AF_INET;
	adresaServera.sin_addr.s_addr = INADDR_ANY;
	adresaServera.sin_port = htons(SERVER_PORT);

	// kreiranje socket-a
	SOCKET server = socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP);

	if (server == INVALID_SOCKET)
	{
		printf("Kreiranje socket-a nije uspelo (%d)!\n", WSAGetLastError());
		WSACleanup();
		return 2;
	}

	// bind socket-a i serverske adresne strukture
	iResult = bind(server, (SOCKADDR *) &adresaServera, sizeof(adresaServera));

	if (iResult == SOCKET_ERROR)
	{
		printf("Bind socket-a neuspesan (%d)!\n", WSAGetLastError());
		closesocket(server);
		WSACleanup();
		return 3;
	}

	printf("UDP Server je pokrenut i ceka na prijem poruka od klijenta...\n");

	// kreiranje adrese klijenta od koga se prihvataju poruke
	sockaddr_in adresaKlijenta;

	// praznjenje adresne strukture i bafera za podatke
	memset(&adresaKlijenta, 0, sizeof(adresaKlijenta));
	memset(baferZaPodatke, 0, BUFFER_SIZE);

	int duzinaAdreseKlijenta = sizeof(adresaKlijenta);
	
	// kreiranje promenljive za rezim rada (blokirajuci/neblokirajuci)
	unsigned long rezimRada = 1;

	// promena rezima rada serverskog socket-a na neblokirajuci
	iResult = ioctlsocket(server, FIONBIO, &rezimRada);

	if (iResult != 0)
	{
		printf("Promena rezima rada serverskog socket-a neuspesno (%d)!\n", WSAGetLastError());
		WSACleanup();
		return 4;
	}

	// ogranicavanje servera na npr. 30 pokusaja
	// ako nakon 30 pokusaja ne pristigne nista (neaktivnost, stanje idle)
	// server ce se ugasiti
	int brojPokusaja = 30;

	while (true)
	{
		int  i;

		printf("UDP Server ceka na nove poruke...\n\n");

		for (i = 0; i < brojPokusaja; i++)
		{
			printf("Pokusaj #%d\n", i + 1);

			// pokusaj prihvata poruke od klijenta
			iResult = recvfrom(server, baferZaPodatke, BUFFER_SIZE, 0, (SOCKADDR *) &adresaKlijenta, &duzinaAdreseKlijenta);
			
			// ako je klijent poslao poruku, ispisujemo ip adresu klijenta, port i poruku koja je poslata
			if (iResult != SOCKET_ERROR)
			{
				baferZaPodatke[iResult] = '\0';
				char ipAdresa[16];
				unsigned short klijentskiPort;

				strcpy_s(ipAdresa, sizeof(ipAdresa), inet_ntoa(adresaKlijenta.sin_addr));
				klijentskiPort = ntohs(adresaKlijenta.sin_port);

				printf("Klijent (IP: %s, PORT: %d, PORUKA: %s)\n\n", ipAdresa, klijentskiPort, baferZaPodatke);
				break;
			}
			else
			{
				if (WSAGetLastError() == WSAEWOULDBLOCK)
				{
					Sleep(1000); // cekanje na sledecu prozivku
				}
				else
				{
					printf("Prijem podataka od klijenta neuspesan (%d)!\n", WSAGetLastError());
					iResult = closesocket(server);

					if (iResult == SOCKET_ERROR)
					{
						printf("Zatvaranje socket-a neuspesno (%d)!\n", WSAGetLastError());
						WSACleanup();
						return 5;
					}

					WSACleanup();
					return 6;
				}
			}
		}
		if (i == brojPokusaja)
		{
			break;
		}
	}

	// zatvaranje serverskog socket-a
	iResult = closesocket(server);

	if (iResult == SOCKET_ERROR)
	{
		printf("Zatvaranje socket-a neuspesno (%d)!\n", WSAGetLastError());
		WSACleanup();
		return 7;
	}

	printf("Server ugasen...\n");

	WSACleanup();

	return 0;
}
