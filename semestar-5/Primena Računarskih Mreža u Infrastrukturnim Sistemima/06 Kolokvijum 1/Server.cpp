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

#define BUFFER_SIZE 512

struct Merenje
{
	char nazivGrada[20];
	short indeksKvalitetaVazduha;
};

#define PORT1 19000
#define PORT2 19001
#define MAX_CLIENTS 2

int main()
{
	int iResult;
	char bafer[BUFFER_SIZE], bafer1[BUFFER_SIZE], bafer2[BUFFER_SIZE];
	int connectedClients = 0;
	int lastIndex = 0;
	WSADATA wsaData;

	Merenje spisak[10];

	// reset strutkrue
	for (int i = 0; i < 10; i++)
	{
		memset(spisak[i].nazivGrada, 0, 20);
		spisak[i].indeksKvalitetaVazduha = 0;
	}

	if (WSAStartup(MAKEWORD(2, 2), &wsaData) != 0)
	{
		printf("Error starting WSA (%d)!\n", WSAGetLastError());
		return 1;
	}

	sockaddr_in serverAddress[2];

	memset(serverAddress, 0, sizeof(serverAddress));
	memset(bafer, 0, BUFFER_SIZE);
	memset(bafer2, 0, BUFFER_SIZE);

	//prva merna stanica
	serverAddress[0].sin_family = AF_INET;
	serverAddress[0].sin_addr.s_addr = INADDR_ANY;
	serverAddress[0].sin_port = htons(PORT1);

	// druga merna stanica
	serverAddress[1].sin_family = AF_INET;
	serverAddress[1].sin_addr.s_addr = INADDR_ANY;
	serverAddress[1].sin_port = htons(PORT2);

	// kreiranje uticnica
	SOCKET serverSocket[2];
	serverSocket[0] = INVALID_SOCKET;
	serverSocket[0] = socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP);

	if (serverSocket[0] == INVALID_SOCKET)
	{
		printf("Error creating socket (%d)!\n", WSAGetLastError());
		WSACleanup();
		return 1;
	}

	// bind serverskih uticnica
	iResult = bind(serverSocket[0], (SOCKADDR*)&serverAddress[0], sizeof(serverAddress[0]));

	if (iResult == SOCKET_ERROR)
	{
		printf("Error binding socket 1 (%d)!\n", WSAGetLastError());
		closesocket(serverSocket[0]);
		WSACleanup();
		return 1;
	}

	// druga uticnica
	serverSocket[1] = INVALID_SOCKET;
	serverSocket[1] = socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP);

	if (serverSocket[1] == INVALID_SOCKET)
	{
		printf("Error creating socket 2 (%d)!\n", WSAGetLastError());
		WSACleanup();
		return 1;
	}

	iResult = bind(serverSocket[1], (SOCKADDR*)&serverAddress[1], sizeof(serverAddress[1]));

	if (iResult == SOCKET_ERROR)
	{
		printf("Error binding socket 2 (%d)!\n", WSAGetLastError());
		closesocket(serverSocket[0]);
		closesocket(serverSocket[1]);
		WSACleanup();
		return 1;
	}

	printf("\nUDP Server started...\n\n");

	// klijenti
	sockaddr_in clients[2];
	int clientsSize = sizeof(struct sockaddr_in);

	memset(clients, 0, 2 * sizeof(sockaddr_in));

	int connected = 0;

	// KLIJENTI
	sockaddr_in clientAddr[2];
	int clientAddrSize[2] = { sizeof(struct sockaddr_in),  sizeof(struct sockaddr_in) };

	memset(&clientAddr, 0, sizeof(sockaddr_in));
	memset(bafer, 0, BUFFER_SIZE);

	// polling model
	do
	{
		iResult = recvfrom(serverSocket[connected], bafer, BUFFER_SIZE, 0, (SOCKADDR*)&clientAddr[connected], &clientAddrSize[connected]);

		if (iResult != SOCKET_ERROR)
		{
			printf("\nNovi klijent: %s : %d\n", inet_ntoa(clientAddr[connected].sin_addr), ntohs(clientAddr[connected].sin_port));

			unsigned long mode = 1;
			iResult = ioctlsocket(serverSocket[connected], FIONBIO, &mode);
			if (iResult != NO_ERROR)
				printf("ioctlsocket failed with error: %ld\n", iResult);

			connected++;
		}
		else
		{
			if (WSAGetLastError() == WSAEWOULDBLOCK) {
				Sleep(2000);
			}
			else
			{
				printf("error connection with client error: %d\n", WSAGetLastError());
				closesocket(serverSocket[connected]);
				WSACleanup();
				return 1;
			}

		}

		if (connected < 2)
		{
			continue;
		}

		// poruka uspesna prijava
		strcpy_s(bafer, "Uspesna prijava");

		iResult = sendto(serverSocket[0], bafer, strlen(bafer), 0, (SOCKADDR*)&clientAddr[0], clientAddrSize[0]);
		if (iResult == SOCKET_ERROR)
		{
			printf("Error sending success message to socket 1 (%d)!\n", WSAGetLastError());
			closesocket(serverSocket[0]);
			WSACleanup();
			return 1;
		}

		iResult = sendto(serverSocket[1], bafer, strlen(bafer), 0, (SOCKADDR*)&clientAddr[1], clientAddrSize[1]);
		if (iResult == SOCKET_ERROR)
		{
			printf("Error sending success message to socket 2 (%d)!\n", WSAGetLastError());
			closesocket(serverSocket[0]);
			closesocket(serverSocket[1]);
			WSACleanup();
			return 1;
		}

		do
		{
			bool azurirao = false, dodao = false;

			// prijem mernih podataka
			iResult = recvfrom(serverSocket[0], bafer, BUFFER_SIZE, 0, (SOCKADDR*)&clientAddr[0], &clientAddrSize[0]);

			if (iResult == SOCKET_ERROR)
			{
				continue;
			}

			// podaci sa prve merne stanice
			Merenje* tmp = (Merenje*)bafer;

			Merenje noviZapis;
			strcpy_s(noviZapis.nazivGrada, tmp->nazivGrada);
			noviZapis.indeksKvalitetaVazduha = ntohs(tmp->indeksKvalitetaVazduha); // mora iz mreze u host

			// provera meranja
			int i = 0;
			for (i = 0; i < lastIndex; i++)
			{
				if (strcmp(spisak[i].nazivGrada, noviZapis.nazivGrada) == 0)
				{
					// azurira se postojeci grad

					if (noviZapis.indeksKvalitetaVazduha == -1)
					{
						Sleep(3000); // greska ceka se 3 sekunde
						break;
					}
					else
					{
						// azurira se grad
						spisak[i].indeksKvalitetaVazduha = noviZapis.indeksKvalitetaVazduha; // upis novog indeksa
						azurirao = true;
						dodao = false;
						break;
					}
				}
			}

			// ako grad ne postoji u spisku i nije preko 10, dodati ga
			if (lastIndex < 10 && !azurirao)
			{
				strcpy_s(spisak[lastIndex].nazivGrada, noviZapis.nazivGrada);
				spisak[lastIndex].indeksKvalitetaVazduha = noviZapis.indeksKvalitetaVazduha;
				lastIndex++;
				azurirao = false;
				dodao = true;
			}
			else
			{
				lastIndex = 10;
			}

			// poruka uneto ili nije
			// poruka klijentu
			if (dodao || azurirao)
			{
				strcpy_s(bafer, "UNETO");
				iResult = sendto(serverSocket[0], bafer, strlen(bafer), 0, (SOCKADDR*)&clientAddr[0], sizeof(clientAddr[0]));

				if (iResult == SOCKET_ERROR)
				{
					printf("Error sending message to socket 1 (%d)!\n", WSAGetLastError());
					closesocket(serverSocket[0]);
					WSACleanup();
					return 1;
				}
			}
			else
			{
				strcpy_s(bafer, "ODBACENO");
				iResult = sendto(serverSocket[0], bafer, strlen(bafer), 0, (SOCKADDR*)&clientAddr[0], sizeof(clientAddr[0]));

				if (iResult == SOCKET_ERROR)
				{
					printf("Error sending message to socket 1 (%d)!\n", WSAGetLastError());
					closesocket(serverSocket[0]);
					WSACleanup();
					return 1;
				}
			}

			// druga merna stanica
			iResult = recvfrom(serverSocket[1], bafer, BUFFER_SIZE, 0, (SOCKADDR*)&clientAddr[1], &clientAddrSize[1]);

			if (iResult == SOCKET_ERROR)
			{
				continue;
			}

			// podaci sa druge merne stanice
			strcpy_s(noviZapis.nazivGrada, tmp->nazivGrada);
			noviZapis.indeksKvalitetaVazduha = ntohs(tmp->indeksKvalitetaVazduha); // mora iz mreze u host

			azurirao = false;
			dodao = false;

			// provera meranja
			i = 0;
			for (i = 0; i < lastIndex; i++)
			{
				if (strcmp(spisak[i].nazivGrada, noviZapis.nazivGrada) == 0)
				{
					// azurira se postojeci grad

					if (noviZapis.indeksKvalitetaVazduha == -1)
					{
						Sleep(3000); // greska ceka se 3 sekunde
						break;
					}
					else
					{
						// azurira se grad
						spisak[i].indeksKvalitetaVazduha = noviZapis.indeksKvalitetaVazduha; // upis novog indeksa
						azurirao = true;
						dodao = false;
						break;
					}
				}
			}

			// ako grad ne postoji u spisku i nije preko 10, dodati ga
			if (lastIndex < 10 && !azurirao)
			{
				strcpy_s(spisak[lastIndex].nazivGrada, noviZapis.nazivGrada);
				spisak[lastIndex].indeksKvalitetaVazduha = noviZapis.indeksKvalitetaVazduha;
				lastIndex++;
				dodao = true;
				azurirao = false;
			}
			else
			{
				lastIndex = 10;
			}

			// poruka klijentu
			if (dodao || azurirao)
			{
				strcpy_s(bafer, "UNETO");
				iResult = sendto(serverSocket[1], bafer, strlen(bafer), 0, (SOCKADDR*)&clientAddr[1], sizeof(clientAddr[1]));

				if (iResult == SOCKET_ERROR)
				{
					printf("Error sending message to socket 2 (%d)!\n", WSAGetLastError());
					closesocket(serverSocket[1]);
					WSACleanup();
					return 1;
				}
			}
			else
			{
				strcpy_s(bafer, "ODBACENO");
				iResult = sendto(serverSocket[1], bafer, strlen(bafer), 0, (SOCKADDR*)&clientAddr[1], sizeof(clientAddr[1]));

				if (iResult == SOCKET_ERROR)
				{
					printf("Error sending message to socket 2 (%d)!\n", WSAGetLastError());
					closesocket(serverSocket[1]);
					WSACleanup();
					return 1;
				}
			}

			// ispis svih merenja
			printf("\n---------------------------------------------------");
			for (int j = 0; j < lastIndex; j++)
			{
				if (spisak[j].indeksKvalitetaVazduha == 0)
					break;

				printf("\n%d. grad : ", j + 1);
				printf("[%s, %hd]", spisak[j].nazivGrada, spisak[j].indeksKvalitetaVazduha);
			}
			printf("\n---------------------------------------------------\n");
		} while(true);
		connected = 0;
	} while (true);

	// clean up
	iResult = closesocket(serverSocket[0]);

	if (iResult == SOCKET_ERROR)
	{
		printf("Error closing socket 1 (%d)!\n", WSAGetLastError());
		WSACleanup();
		return 1;
	}

	iResult = closesocket(serverSocket[1]);

	if (iResult == SOCKET_ERROR)
	{
		printf("Error closing socket 2 (%d)!\n", WSAGetLastError());
		WSACleanup();
		return 1;
	}

	WSACleanup();

	return 0;
}