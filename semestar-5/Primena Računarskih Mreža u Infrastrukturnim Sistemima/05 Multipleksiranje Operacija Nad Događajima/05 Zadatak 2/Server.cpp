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

#define SERVER_IP_ADRESS "127.0.0.1"
#define SERVER_PORT 27016
#define BUFFER_SIZE 512
#define MAX_CLIENTS 3

struct studentInfo 
{
	char ime[15];
	char prezime[20];
	short poeni;
};

int main()
{
	SOCKET listenSocket = INVALID_SOCKET;
	SOCKET clientSockets[MAX_CLIENTS];
	short lastIndex = 0;
	int iResult;
	char bafer[BUFFER_SIZE];
	WSADATA wsaData;

	if (WSAStartup(MAKEWORD(2, 2), &wsaData) != 0)
	{
		printf("WSA Startup neuspesan (%d)!\n", WSAGetLastError());
		return 1;
	}

	sockaddr_in serverAddress;

	memset((char *) &serverAddress, 0, sizeof(serverAddress));
	serverAddress.sin_family = AF_INET;
	serverAddress.sin_addr.s_addr = INADDR_ANY;
	serverAddress.sin_port = htons(SERVER_PORT);

	memset(clientSockets, 0, MAX_CLIENTS * sizeof(SOCKET));

	listenSocket = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);

	if (listenSocket == INVALID_SOCKET)
	{
		printf("Neuspesno kreiranje socketa (%d)!\n", WSAGetLastError());
		WSACleanup();
		return 2;
	}

	iResult = bind(listenSocket, (SOCKADDR *) &serverAddress, sizeof(serverAddress));

	if (iResult == SOCKET_ERROR)
	{
		printf("Nemoguce bindovanje adrese (%d)!\n", WSAGetLastError());
		closesocket(listenSocket);
		WSACleanup();
		return 3;
	}

	// dodatni deo zadatka
	bool optVal = true;
	int optLen = sizeof(bool);

	iResult = setsockopt(listenSocket, SOL_SOCKET, SO_CONDITIONAL_ACCEPT, (char *) &optVal, optLen);

	if (iResult == SOCKET_ERROR)
	{
		printf("setsockopt za uslovno prihvatanje neuspesno (%d)!\n", WSAGetLastError());
	}

	unsigned long mode = 1;

	if (ioctlsocket(listenSocket, FIONBIO, &mode) != 0)
	{
		printf("ioctlsocket neuspesan (%d)!\n", WSAGetLastError());
	}

	iResult = listen(listenSocket, SOMAXCONN);

	if (iResult == SOCKET_ERROR)
	{
		printf("listen neuspesan (%d)!\n", WSAGetLastError());
		closesocket(listenSocket);
		WSACleanup();
		return 4;
	}

	printf("Server je u modu za osluskivanje zahteva...\n");

	fd_set readfds;
	timeval timeVal;

	timeVal.tv_sec = 1;
	timeVal.tv_usec = 0;

	studentInfo *student;
	
	while (true)
	{
		FD_ZERO(&readfds);

		if (lastIndex != MAX_CLIENTS)
		{
			FD_SET(listenSocket, &readfds);
		}

		for (int i = 0; i < lastIndex; i++)
		{
			FD_SET(clientSockets[i], &readfds);
		}

		int selectResult = select(0, &readfds, NULL, NULL, &timeVal);

		if (selectResult == SOCKET_ERROR)
		{
			printf("select neuspesan (%d)!\n", WSAGetLastError());
			closesocket(listenSocket);
			WSACleanup();
			return 5;
		}
		else if (selectResult == 0)
		{
			if (_kbhit())
			{
				_getch();
				printf("PRMuIS 2021/2022\n");
			}

			continue;
		}
		else if(FD_ISSET(listenSocket, &readfds))
		{
			sockaddr_in clientAddr;
			int clientAddrSize = sizeof(clientAddr);

			clientSockets[lastIndex] = accept(listenSocket, (struct sockaddr *) &clientAddr, &clientAddrSize);
			
			if (clientSockets[lastIndex] == INVALID_SOCKET)
			{
				if (WSAGetLastError() == WSAECONNRESET)
				{
					printf("accept neuspesan - client timeout request expired.\n");
				}
				else
				{
					printf("accept neuspesan (%d)!\n", WSAGetLastError());
				}
			}
			else
			{
				if (ioctlsocket(clientSockets[lastIndex], FIONBIO, &mode) != 0)
				{
					printf("ioctlsocket neuspesan (%d)!\n", WSAGetLastError());
					continue;
				}

				lastIndex++;
				printf("Novi klijent povezan (%d). Adresa klijenta: %s:%d", lastIndex, inet_ntoa(clientAddr.sin_addr), ntohs(clientAddr.sin_port));
			}
		}
		else
		{
			for (int i = 0; i < lastIndex; i++)
			{
				if (FD_ISSET(clientSockets[i], &readfds))
				{
					iResult = recv(clientSockets[i], bafer, BUFFER_SIZE, 0);

					if (iResult > 0)
					{
						bafer[iResult] = '\0';

						printf("Primeljena je poruka od klijenta %d:\n", i + 1);

						student = (studentInfo *) bafer;

						printf("Ime i prezime: %s %s\n", student->ime, student->prezime);
						printf("Poeni studenta: %d\n", ntohs(student->poeni));
						printf("-------------------------------------\n\n");
					}
					else if (iResult == 0)
					{
						printf("Konekcija sa klijentom %d zatvorena.\n", i + 1);
						closesocket(clientSockets[i]);

						for (int j = i; j < lastIndex - 1; j++)
						{
							clientSockets[j] = clientSockets[j + 1];
						}

						clientSockets[lastIndex - 1] = 0;
						lastIndex--;
					}
					else
					{
						printf("recv neuspesan (%d)!\n", WSAGetLastError());
						closesocket(clientSockets[i]);

						for (int j = i; j < lastIndex - 1; j++)
						{
							clientSockets[j] = clientSockets[j + 1];
						}

						clientSockets[lastIndex - 1] = 0;
						lastIndex--;
					}
				}
			}
		}
	}

	closesocket(listenSocket);
	WSACleanup();

	return 0;
}