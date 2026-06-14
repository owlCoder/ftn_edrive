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
#define SERVER_PORT 18010
#define BUFFER_SIZE 256

int main()
{
	SOCKET serverSocket = INVALID_SOCKET;
	int iResult;
	char baferZaPodatke[BUFFER_SIZE];
	WSADATA wsaData;

	if (WSAStartup(MAKEWORD(2, 2), &wsaData) != 0)
	{
		printf("Neuspesno pokretanje WSA (%d)!\n", WSAGetLastError());
		return 1;
	}

	// kreiranje socket-a
	serverSocket = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);

	if (serverSocket == INVALID_SOCKET)
	{
		printf("Neuspesno kreiranje socket-a (%d)!\n", WSAGetLastError());
		WSACleanup();
		return 2;
	}

	// adresna struktura za serversku adresu
	sockaddr_in adresaServera;
	adresaServera.sin_family = AF_INET;
	adresaServera.sin_addr.s_addr = inet_addr(SERVER_IP_ADDRESS);
	adresaServera.sin_port = htons(SERVER_PORT);

	// povezivanje na server na specificnu IP adresu i port
	iResult = connect(serverSocket, (SOCKADDR *) &adresaServera, sizeof(adresaServera));

	if (iResult == SOCKET_ERROR)
	{
		printf("Neuspesno povezivanje na server (%d)!\n", WSAGetLastError());
		closesocket(serverSocket);
		WSACleanup();
		return 1;
	}

	int nizBrojeva[3];

	while (true)
	{
		// ucitavanje niza od tri broja
		for (int i = 0; i < 3; i++)
		{
			printf("\nUnesite %d. broj za slanje: ", i + 1);
			gets_s(baferZaPodatke, BUFFER_SIZE);

			nizBrojeva[i] = atoi(baferZaPodatke);

			// priprema podataka za slanje na mrezu
			// host ot network long
			nizBrojeva[i] = htonl(nizBrojeva[i]);
		}

		// slanje niza brojeva prosledjujuci adresu
		// i duzinu poruke u bajtima
		iResult = send(serverSocket, (char *) nizBrojeva, sizeof(nizBrojeva), 0);
		
		if (iResult == SOCKET_ERROR)
		{
			printf("Slanje podataka serveru neuspesno (%d)!", WSAGetLastError());
			closesocket(serverSocket);
			WSACleanup();
			return 3;
		}

		printf("Podaci poslati serveru: Ukupno poslato bajtova: %d.\n", iResult);

		// prijem podataka od servera
		iResult = recv(serverSocket, baferZaPodatke, BUFFER_SIZE, 0);

		if (iResult > 0)
		{
			int *primljenaSuma = (int *) baferZaPodatke;
			int zbir = ntohl(*primljenaSuma);

			printf("\nSuma poslatih brojeva je: %d\n", zbir);
		}
		else if (iResult == 0)
		{
			printf("Konekcija sa serverom je zatvorena!\n");
			break;
		}
		else
		{
			printf("Prihvat podataka od servera nije moguc (%d)!\n", WSAGetLastError());
			break;
		}

		printf("\nPritisnite bilo koji taster za nastavak ili 'exit' za kraj: ");
		gets_s(baferZaPodatke, BUFFER_SIZE);

		if (!strcmp(baferZaPodatke, "exit")) 
		{
			break;
		}
	}

	// zatvaranje konekcije
	iResult = shutdown(serverSocket, SD_BOTH);

	if (iResult == SOCKET_ERROR)
	{
		printf("Neuspesno zatvaranje konekcije (%d)!\n", WSAGetLastError());
		closesocket(serverSocket);
		WSACleanup();
		return 4;
	}

	printf("\nPritisnite bilo koji taster za izlaz...");
	_getch();

	closesocket(serverSocket);

	WSACleanup();

	return 0;
}