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

#define SERVER_PORT_1 15011
#define SERVER_PORT_2 15012
#define BUFFER_SIZE   512

int main()
{
	sockaddr_in serverAdress[2];
	int iResult;
	char bafer[BUFFER_SIZE];
	WSAData wsaData;

	if (WSAStartup(MAKEWORD(2, 2), &wsaData) != 0)
	{
		printf("WSA Startup neuspesan (%d)!\n", WSAGetLastError());
		return 1;
	}

	memset((char *) &serverAdress[0], 0, sizeof(serverAdress[0]));
	serverAdress[0].sin_family = AF_INET;
	serverAdress[0].sin_addr.s_addr = INADDR_ANY;
	serverAdress[0].sin_port = htons(SERVER_PORT_1);

	memset((char *) &serverAdress[1], 0, sizeof(serverAdress[1]));
	serverAdress[1].sin_family = AF_INET;
	serverAdress[1].sin_addr.s_addr = inet_addr("127.0.0.1");
	serverAdress[1].sin_port = htons(SERVER_PORT_2);

	SOCKET socket1 = socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP);

	if (socket1 == INVALID_SOCKET)
	{
		printf("Kreiranje socketa 1 neuspesno (%d)!\n", WSAGetLastError());
		WSACleanup();
		return 2;
	}

	SOCKET socket2 = socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP);

	if (socket2 == INVALID_SOCKET)
	{
		printf("Kreiranje socketa 2 neuspesno (%d)!\n", WSAGetLastError());
		closesocket(socket1);
		WSACleanup();
		return 3;
	}

	iResult = bind(socket1, (SOCKADDR *) &serverAdress[0], sizeof(serverAdress[0]));

	if (iResult == SOCKET_ERROR)
	{
		printf("Povezivanje socketa 1 neuspesno (%d)!\n", WSAGetLastError());
		closesocket(socket1);
		WSACleanup();
		return 4;
	}

	iResult = bind(socket2, (SOCKADDR*)&serverAdress[1], sizeof(serverAdress[1]));

	if (iResult == SOCKET_ERROR)
	{
		printf("Povezivanje socketa 2 neuspesno (%d)!\n", WSAGetLastError());
		closesocket(socket2);
		WSACleanup();
		return 4;
	}

	// promena rezima u neblokirajuci rezim
	unsigned long mode = 1;

	if (ioctlsocket(socket1, FIONBIO, &mode) != 0)
	{
		printf("ioctlsocket 1 neuspesan (%d)!\n", WSAGetLastError());
		closesocket(socket1);
		WSACleanup();
		return 5;
	}

	if (ioctlsocket(socket2, FIONBIO, &mode) != 0)
	{
		printf("ioctlsocket 2 neuspesan (%d)!\n", WSAGetLastError());
		closesocket(socket2);
		WSACleanup();
		return 6;
	}

	printf("UDP Server operativan...\n");

	while (true)
	{
		sockaddr_in klijentskaAdresa;
		int sockAddrLen = sizeof(klijentskaAdresa);

		memset(&klijentskaAdresa, 0, sizeof(klijentskaAdresa));
		memset(bafer, 0, BUFFER_SIZE);

		// fd set struktura
		fd_set readfds;
		fd_set exceptfds;

		FD_ZERO(&readfds);
		FD_ZERO(&exceptfds);

		FD_SET(socket1, &readfds);
		FD_SET(socket2, &readfds);
		FD_SET(socket1, &exceptfds);
		FD_SET(socket2, &exceptfds);

		int sResult = select(0, &readfds, NULL, &exceptfds, NULL);

		if (sResult == SOCKET_ERROR)
		{
			printf("select neuspesan (%d)!\n", WSAGetLastError());
			break;
		}
		else if (sResult > 0)
		{
			unsigned long portNumber = 0;

			if (FD_ISSET(socket1, &readfds))
			{
				iResult = recvfrom(socket1, bafer, BUFFER_SIZE, 0, (SOCKADDR*)&klijentskaAdresa, &sockAddrLen);
				portNumber = SERVER_PORT_1;

				if (iResult != SOCKET_ERROR)
				{
					bafer[iResult] = '\0';

					printf("Server je primio poruku na portu %d. Klijent je poslao %s.\n", portNumber, bafer);
				}
				else
				{
					printf("recvfrom neuspesan (%d)!\n", WSAGetLastError());
					continue;
				}
			}

			if (FD_ISSET(socket2, &readfds))
			{
				iResult = recvfrom(socket2, bafer, BUFFER_SIZE, 0, (SOCKADDR*)&klijentskaAdresa, &sockAddrLen);
				portNumber = SERVER_PORT_1;

				if (iResult != SOCKET_ERROR)
				{
					bafer[iResult] = '\0';

					printf("Server je primio poruku na portu %d. Klijent je poslao %s.\n", portNumber, bafer);
				}
				else
				{
					printf("recvfrom neuspesan (%d)!\n", WSAGetLastError());
					continue;
				}
			}

			if (FD_ISSET(socket1, &exceptfds))
			{
				break;
			}

			if (FD_ISSET(socket2, &exceptfds))
			{
				break;
			}
			else
			{
				continue;
			}
		}
	}

	if (closesocket(socket1) == SOCKET_ERROR || closesocket(socket2) == SOCKET_ERROR)
	{
		printf("Zatvaranje uticnice neuspesno (%d)!\n", WSAGetLastError());
		WSACleanup();
		return 7;
	}

	printf("Server uspesno ugasen...");

	WSACleanup();

	return 0;
}