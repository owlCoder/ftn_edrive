#define _WINSOCK_DEPRECATED_NO_WARNINGS
#define WIN32_LEAN_AND_MEAN

#include <windows.h>
#include <winsock2.h>
#include <ws2tcpip.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include "conio.h"

#pragma comment (lib, "Ws2_32.lib")
#pragma comment (lib, "Mswsock.lib")
#pragma comment (lib, "AdvApi32.lib")

#define BUFFER_SIZE 512
#define SERVER_ADDRESS "127.0.0.1"

struct Merenje
{
	char nazivGrada[20];
	short indeksKvalitetaVazduha;
};

int main()
{
	int iResult;
	short port;
	char bafer[BUFFER_SIZE];
	WSADATA wsaData;

	if (WSAStartup(MAKEWORD(2, 2), &wsaData) != 0)
	{
		printf("Error starting WSA (%d)!\n", WSAGetLastError());
		return 1;
	}

	SOCKET serverSocket = INVALID_SOCKET;

	serverSocket = socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP);

	if (serverSocket == INVALID_SOCKET)
	{
		printf("Error creating socket (%d)!\n", WSAGetLastError());
		WSACleanup();
		return 1;
	}

	sockaddr_in serverAdress;
	int serverAddrLen = sizeof(serverAdress);

	memset(&serverAdress, 0, sizeof(serverAdress));
	serverAdress.sin_family = AF_INET;
	serverAdress.sin_addr.s_addr = inet_addr(SERVER_ADDRESS);

	printf("Unesite port (19000 ili 19001): ");
	gets_s(bafer, BUFFER_SIZE);

	port = atoi(bafer);

	serverAdress.sin_port = htons(port);

	strcpy_s(bafer, "Prijava");
	iResult = sendto(serverSocket, bafer, strlen(bafer), 0, (SOCKADDR*)&serverAdress, sizeof(serverAdress));

	if (iResult == SOCKET_ERROR)
	{
		printf("Error sending data to socket (%d)!\n", WSAGetLastError());
		closesocket(serverSocket);
		WSACleanup();
		return 1;
	}

	// povratna poruka da je prijava uspesna
	iResult = recvfrom(serverSocket, bafer, BUFFER_SIZE, 0, (SOCKADDR*)&serverAdress, &serverAddrLen);

	if (iResult == SOCKET_ERROR)
	{
		printf("Error receiving data from socket (%d)!\n", WSAGetLastError());
		closesocket(serverSocket);
		WSACleanup();
		return 1;
	}

	bafer[iResult] = '\0';

	printf("Server: %s\n", bafer);

	while (true)
	{
		Merenje m;

		printf("\nUnesite grad: ");
		gets_s(bafer, BUFFER_SIZE);

		strcpy_s(m.nazivGrada, bafer);

		printf("Unesite indeks zagadjenosti: ");
		gets_s(bafer, BUFFER_SIZE);

		short zagadjen = atoi(bafer);
		m.indeksKvalitetaVazduha = htons(zagadjen); // priprema za slanje na mrezu

		iResult = sendto(serverSocket, (char*)&m, sizeof(Merenje), 0, (SOCKADDR*)&serverAdress, sizeof(serverAdress));

		if (iResult == SOCKET_ERROR)
		{
			printf("Error sending data to socket (%d)!\n", WSAGetLastError());
			closesocket(serverSocket);
			WSACleanup();
			return 1;
		}

		// prijem poruke od servera o uneto ili odbaceno
		iResult = recvfrom(serverSocket, bafer, BUFFER_SIZE, 0, (SOCKADDR*)&serverAdress, &serverAddrLen);

		if (iResult == SOCKET_ERROR)
		{
			printf("Error receiving data from socket (%d)!\n", WSAGetLastError());
			closesocket(serverSocket);
			WSACleanup();
			return 1;
		}

		bafer[iResult] = '\0';

		// ispis poruke
		printf("Merenje je: %s!\n", bafer);

		printf("Unesite 'Kraj' ili pritisnite bilo koji taster za nastavak: ");
		gets_s(bafer, BUFFER_SIZE);

		if (strcmp(bafer, "Kraj") == 0)
		{
			printf("Closing connection...");
			break;
		}
	}

	iResult = closesocket(serverSocket);

	if (iResult == SOCKET_ERROR)
	{
		printf("Error closing socket (%d)!\n", WSAGetLastError());
		WSACleanup();
		return 1;
	}

	WSACleanup();

	return 0;
}