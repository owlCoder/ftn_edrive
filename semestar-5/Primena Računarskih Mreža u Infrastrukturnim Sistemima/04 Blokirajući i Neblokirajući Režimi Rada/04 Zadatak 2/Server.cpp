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

#define LOCAL_SERVER_ADDRESS "127.0.0.1"
#define BUFFER_SIZE 512

int main()
{
	sockaddr_in adresaServera, adresaServera2;
	WSADATA wsaData;

	int duzinaAdreseServera = sizeof(sockaddr_in);
	char baferZaPodatke[BUFFER_SIZE], baferZaPodatkeDrugogKlijenta[BUFFER_SIZE];

	// inicijalizacija WSA
	int iResult = WSAStartup(MAKEWORD(2, 2), &wsaData);

	if (iResult != 0)
	{
		printf("Neuspesno pokretanje WSA (%d)!\n", WSAGetLastError());
		return 1;
	}

	// podesavanje portova za obe utiticnice
	unsigned short serverPort1 = 17010, serverPort2 = 17011;

	// podesavanje adresne strukture servera za prvu uticnicu
	memset((char*)&adresaServera, 0, sizeof(adresaServera));
	adresaServera.sin_family = AF_INET;
	adresaServera.sin_addr.s_addr = inet_addr(LOCAL_SERVER_ADDRESS);
	adresaServera.sin_port = htons(serverPort1);

	// kreiranje socket-a
	SOCKET server = socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP);

	if (server == INVALID_SOCKET)
	{
		printf("Kreiranje prvog serverskog socket-a nije uspelo (%d)!\n", WSAGetLastError());
		WSACleanup();
		return 2;
	}

	// bind socket-a i serverske adresne strukture
	iResult = bind(server, (SOCKADDR *) &adresaServera, sizeof(adresaServera));

	if (iResult == SOCKET_ERROR)
	{
		printf("Bind prvog serverskog socket-a neuspesan (%d)!\n", WSAGetLastError());
		closesocket(server);
		WSACleanup();
		return 3;
	}

	// priprema za drugi serverski socket
	// podesavanje adresne strukture servera za prvu uticnicu
	memset((char*)&adresaServera2, 0, sizeof(adresaServera2));
	adresaServera2.sin_family = AF_INET;
	adresaServera2.sin_addr.s_addr = INADDR_ANY;
	adresaServera2.sin_port = htons(serverPort2);

	// kreiranje socket-a
	SOCKET drugiServer = socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP);

	if (drugiServer == INVALID_SOCKET)
	{
		printf("Kreiranje drugog serverskog socket-a nije uspelo (%d)!\n", WSAGetLastError());
		WSACleanup();
		return 2;
	}

	// bind socket-a i serverske adresne strukture
	iResult = bind(drugiServer, (SOCKADDR*)&adresaServera2, sizeof(adresaServera2));

	if (iResult == SOCKET_ERROR)
	{
		printf("Bind drugog serverskog socket-a neuspesan (%d)!\n", WSAGetLastError());
		closesocket(drugiServer);
		WSACleanup();
		return 3;
	}

	printf("UDP Server je pokrenut i ceka na prijem poruka od klijenta...\n");

	// kreiranje adrese klijenta od koga se prihvataju poruke
	sockaddr_in adresaKlijenta, adresaDrugogKlijenta;

	// praznjenje adresne strukture i bafera za podatke
	memset(&adresaKlijenta, 0, sizeof(adresaKlijenta));
	memset(baferZaPodatke, 0, BUFFER_SIZE);

	// praznjenje adresne strukture i bafera za podatke
	memset(&adresaDrugogKlijenta, 0, sizeof(adresaDrugogKlijenta));
	memset(baferZaPodatkeDrugogKlijenta, 0, BUFFER_SIZE);

	int duzinaAdreseKlijenta = sizeof(adresaKlijenta);
	
	// kreiranje promenljive za rezim rada (blokirajuci/neblokirajuci)
	unsigned long rezimRada = 1;

	// promena rezima rada prvog serverskog socket-a na neblokirajuci
	iResult = ioctlsocket(server, FIONBIO, &rezimRada);

	if (iResult != 0)
	{
		printf("Promena rezima rada prvog serverskog socket-a neuspesno (%d)!\n", WSAGetLastError());
		WSACleanup();
		return 4;
	}

	// promena rezima rada drugog serverskog socket-a na neblokirajuci
	iResult = ioctlsocket(drugiServer, FIONBIO, &rezimRada);

	if (iResult != 0)
	{
		printf("Promena rezima rada drugog serverskog socket-a neuspesno (%d)!\n", WSAGetLastError());
		WSACleanup();
		return 4;
	}

	// ogranicavanje servera na npr. 30 pokusaja
	// ako nakon 30 pokusaja ne pristigne nista (neaktivnost, stanje idle)
	// server ce se ugasiti
	int brojPokusaja = 30;

	// ko je prvi poslao poruku serveru
	int prviPoslao = -1;

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
				if (prviPoslao == -1) // ako niko jos nije prvi poslao, a na redu je tekuci klijent, onda ce on ostati prvi do kraja rada programa
					prviPoslao = 1;

				baferZaPodatke[iResult] = '\0';
				char ipAdresa[16];
				unsigned short klijentskiPort;

				strcpy_s(ipAdresa, sizeof(ipAdresa), inet_ntoa(adresaKlijenta.sin_addr));
				klijentskiPort = ntohs(adresaKlijenta.sin_port);

				printf("Klijent (IP: %s, PORT: %d, PORUKA: %s, PRVI POSLAO: %s)\n\n", ipAdresa, klijentskiPort, baferZaPodatke, (prviPoslao == 1 ? "Da" : "Ne"));
				break;
			}
			else
			{
				if (WSAGetLastError() == WSAEWOULDBLOCK)
				{
					Sleep(750); // cekanje na sledecu prozivku
				}
				else
				{
					printf("Prijem podataka od klijenta neuspesan (%d)!\n", WSAGetLastError());
					iResult = closesocket(server);

					if (iResult == SOCKET_ERROR)
					{
						printf("Zatvaranje prvog socket-a neuspesno (%d)!\n", WSAGetLastError());
						WSACleanup();
						return 5;
					}

					WSACleanup();
					return 6;
				}
			}

			// slicno i za drugi socket
			// pokusaj prihvata poruke od klijenta
			iResult = recvfrom(drugiServer, baferZaPodatkeDrugogKlijenta, BUFFER_SIZE, 0, (SOCKADDR*)&adresaDrugogKlijenta, &duzinaAdreseKlijenta);

			// ako je klijent poslao poruku, ispisujemo ip adresu klijenta, port i poruku koja je poslata
			if (iResult != SOCKET_ERROR)
			{
				if (prviPoslao == -1) // ako niko jos nije prvi poslao, a na redu je tekuci klijent, onda ce on ostati prvi do kraja rada programa
					prviPoslao = 2;

				baferZaPodatkeDrugogKlijenta[iResult] = '\0';
				char ipAdresa[16];
				unsigned short klijentskiPort;

				strcpy_s(ipAdresa, sizeof(ipAdresa), inet_ntoa(adresaDrugogKlijenta.sin_addr));
				klijentskiPort = ntohs(adresaDrugogKlijenta.sin_port);

				printf("Klijent (IP: %s, PORT: %d, PORUKA: %s, PRVI POSLAO: %s)\n\n", ipAdresa, klijentskiPort, baferZaPodatkeDrugogKlijenta, (prviPoslao == 2 ? "Da" : "Ne"));
				break;
			}
			else
			{
				if (WSAGetLastError() == WSAEWOULDBLOCK)
				{
					Sleep(750); // cekanje na sledecu prozivku
				}
				else
				{
					printf("Prijem podataka od klijenta neuspesan (%d)!\n", WSAGetLastError());
					iResult = closesocket(server);

					if (iResult == SOCKET_ERROR)
					{
						printf("Zatvaranje drugog socket-a neuspesno (%d)!\n", WSAGetLastError());
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
