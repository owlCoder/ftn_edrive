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

#define SERVER_PORT 19010
#define BUFFER_SIZE 256

// TCP server koji koristi neblokirajuce socket-e
int main()
{
	SOCKET listener = INVALID_SOCKET;
	SOCKET klijenti[2];

	klijenti[0] = INVALID_SOCKET;
	klijenti[1] = INVALID_SOCKET;

	int iResult, brojPovezanihKlijenata = 0;
	char baferZaPodatke[BUFFER_SIZE];
	WSADATA wsaData;

	// inicijalizacija wsa
	if (WSAStartup(MAKEWORD(2, 2), &wsaData) != 0)
	{
		printf("Neuspesno pokretanje WSA (%d)!\n", WSAGetLastError());
		return 1;
	}

	// adresna struktura serverske adrese
	sockaddr_in adresaServera;

	memset((char *) &adresaServera, 0, sizeof(adresaServera));
	adresaServera.sin_family = AF_INET;
	adresaServera.sin_addr.s_addr = INADDR_ANY;
	adresaServera.sin_port = htons(SERVER_PORT);

	// kreiranje socket-a za konekciju ka serveru
	listener = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);

	if (listener == INVALID_SOCKET)
	{
		printf("Kreiranje serverskog socket-a nije uspelo (%d)!\n", WSAGetLastError());
		WSACleanup();
		return 2;
	}

	// povezivanje socket-a i adresne strukture
	iResult = bind(listener, (struct sockaddr *) &adresaServera, sizeof(adresaServera));

	if (iResult == SOCKET_ERROR)
	{
		printf("Bind serverskog socket-a neuspesan (%d)!\n", WSAGetLastError());
		closesocket(listener);
		WSACleanup();
		return 3;
	}

	// prebacivanje socket-a u mod za osluskivanje klijenata na odredjenom portu
	iResult = listen(listener, SOMAXCONN);

	if (iResult == SOCKET_ERROR)
	{
		printf("Prebacivanje serverskog socket-a u listen rezim neuspesno (%d)!\n", WSAGetLastError());
		closesocket(listener);
		WSACleanup();
		return 4;
	}

	printf("TCP Server je pokrenut i ceka na prijem poruka od klijenta...\n");

	do
	{
		// struktura gde ce se cuvati podaci o povezanom klijentu
		sockaddr_in klijentskaAdresa;
		int velicinaklijentskeAdrese = sizeof(struct sockaddr_in);

		// prihvat veze sa prvim klijentom
		klijenti[brojPovezanihKlijenata] = accept(listener, (struct sockaddr *) &klijentskaAdresa, &velicinaklijentskeAdrese);
	
		if (klijenti[brojPovezanihKlijenata] != INVALID_SOCKET)
		{
			printf("\nKlijent [%d] uspesno povezan na server!", brojPovezanihKlijenata);
			printf("\nAdresa klijenta: %s", inet_ntoa(klijentskaAdresa.sin_addr));
			printf("\nPort   klijenta: %d\n\n", ntohs(klijentskaAdresa.sin_port));


			unsigned long mode = 1; // ne blokirajuci rezim

			if (ioctlsocket(klijenti[brojPovezanihKlijenata], FIONBIO, &mode) != NO_ERROR)
			{
				printf("ioctlsocket neuspesan (%d)!\n", WSAGetLastError());
			}

			brojPovezanihKlijenata++; // povezao se novi klijent
		}
		else
		{
			if (WSAGetLastError() == WSAEWOULDBLOCK)
			{
				Sleep(2000);
			}
			else
			{
				printf("Prihvat klijenta %d neuspesan (%d)!\n", brojPovezanihKlijenata, WSAGetLastError());
				closesocket(listener);
				WSACleanup();
				return 5;
			}
		}

		// sve dok se ne povezu 2 klijenta - server ne obradjuje podatke
		if (brojPovezanihKlijenata < 2)
		{
			continue;
		}

		// promenljive za smestanje podataka od klijenata
		int *primljeniNiz;
		int maks = 0;

		do
		{
			for (int i = 0; i < 2; i++)
			{
				// PRVI KLIJENT
				iResult = recv(klijenti[i], baferZaPodatke, BUFFER_SIZE, 0);

				if (iResult > 0)
				{
					// klijent je poslao neke podatke - obraditi
					primljeniNiz = (int*)baferZaPodatke;
					int broj[3] = { 0 };

					broj[0] = ntohl(primljeniNiz[0]);
					broj[1] = ntohl(primljeniNiz[1]);
					broj[2] = ntohl(primljeniNiz[2]);

					maks = broj[0];

					if (broj[1] > maks)
						maks = broj[1];

					if (broj[2] > maks)
						maks = broj[2];

					printf("\nKlijent 1 je poslao: [%d, %d, %d].\n", broj[0], broj[1], broj[2]);

					// priprema za slanje na mrezu
					maks = ntohl(maks);

					// slanje sume klijentu 1
					iResult = send(klijenti[i], (char*)&maks, sizeof(int), 0);

					if (iResult == SOCKET_ERROR)
					{
						printf("slanje podataka klijentu 1 neuspesno (%d)!\n", WSAGetLastError());
						closesocket(klijenti[i]);

						// jedan od klijenata je prekinuo konekciju sa serverom
						brojPovezanihKlijenata--;

						break;
					}
				}
				else if (iResult == 0)
				{
					printf("Veza sa klijentom 1 je zatvorena.\n");
					closesocket(klijenti[i]);

					// jedan od klijenata je prekinuo konekciju sa serverom
					brojPovezanihKlijenata--;

					break;
				}
				else
				{
					// u neblokirajucem rezimu funkcija se cesto neuspesno
					// izvrsi jer socket nije spreman, pa tezi ka tome da
					// blokira program
					if (WSAGetLastError() == WSAEWOULDBLOCK)
					{
						// u pitanju je neblokirajuca operacija -> poruka jos nije stigla
					}
					else
					{
						printf("Prijem podataka neuspesan (%d)!\n", WSAGetLastError());
						closesocket(klijenti[i]);

						// jedan od klijenata je prekinuo konekciju sa serverom
						brojPovezanihKlijenata--;

						break;
					}
				}
			}
			// kada smo proverili na obe uticnice do naredne 
			// iteracije pauziramo 1s
			Sleep(1000);
			
			// ako se desila greska i jedna ili obe uticnice  
			// su zatvorene prekidamo petlju prijema poruka 
			if (brojPovezanihKlijenata < 2)
			{
				break;
			}
		} while (true);

		// resetovanje broja konektovanih klijenata
		brojPovezanihKlijenata = 0;
	} while (true);

	// zatvaranje socket-a
	iResult = closesocket(listener);

	if (iResult == SOCKET_ERROR)
	{
		printf("Zatvaranje socket-a neuspesno (%d)!\n", WSAGetLastError());
		WSACleanup();
		return 7;
	}

	iResult = closesocket(klijenti[0]);

	// zatvaranje socket-a
	if (iResult == SOCKET_ERROR)
	{
		printf("Zatvaranje socket-a neuspesno (%d)!\n", WSAGetLastError());
		WSACleanup();
	}

	// zatvaranje socket-a
	iResult = closesocket(klijenti[1]);

	if (iResult == SOCKET_ERROR)
	{
		printf("Zatvaranje socket-a neuspesno (%d)!\n", WSAGetLastError());
		WSACleanup();
	}

	printf("Server ugasen...\n");

	WSACleanup();

	return 0;
}
