// UDP server
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

#define SERVER_PORT 15001
#define BUFFER_SIZE 512		


int main()
{
	// Server address
	sockaddr_in serverAddress;

	// Size of sockaddr_in structure
	int sockAddrSize = sizeof(serverAddress);

	// Buffer we will use to receive client message
	char dataBuffer[BUFFER_SIZE];

	// Variable used to store function return value
	int iResult;

	// WSADATA data structure that is to receive details of the Windows Sockets implementation
	WSADATA wsaData;

	// Initialize windows sockets library for this process
	if (WSAStartup(MAKEWORD(2, 2), &wsaData) != 0)
	{
		printf("WSAStartup failed with error: %d\n", WSAGetLastError());
		return 1;
	}

	// Initialize serverAddress structure used by bind function
	memset((char*)&serverAddress, 0, sockAddrSize);
	serverAddress.sin_family = AF_INET;			// Set server address protocol family
	serverAddress.sin_addr.s_addr = INADDR_ANY; // Use all available addresses of server
	serverAddress.sin_port = htons(SERVER_PORT);

	// Create a socket
	SOCKET serverSocket = socket(AF_INET,      // IPv4 address famly
		SOCK_DGRAM,   // Datagram socket type
		IPPROTO_UDP); // UDP

// Check if socket creation succeeded
	if (serverSocket == INVALID_SOCKET)
	{
		printf("Creating socket failed with error: %d\n", WSAGetLastError());
		WSACleanup();
		return 1;
	}

	// Bind port number and local address to socket
	iResult = bind(serverSocket, (SOCKADDR*)&serverAddress, sockAddrSize);

	if (iResult == SOCKET_ERROR)
	{
		printf("Socket bind failed with error: %d\n", WSAGetLastError());
		closesocket(serverSocket);
		WSACleanup();
		return 1;
	}

	printf("Simple UDP server started and waiting client messages.\n");

	int big_letters, small_letters, other_chars;
	char previous[BUFFER_SIZE];


	// Main server loop
	while (1)
	{
		// ClientAddress will be set from recvfrom
		sockaddr_in clientAddress;
		memset(&clientAddress, 0, sockAddrSize);

		// Set whole buffer to zero
		memset(dataBuffer, 0, BUFFER_SIZE);

		// Receive client message
		iResult = recvfrom(serverSocket,
			dataBuffer,
			BUFFER_SIZE,
			0,
			(SOCKADDR*)&clientAddress,
			&sockAddrSize);

		if (iResult == SOCKET_ERROR)
		{
			printf("recvfrom failed with error: %d\n", WSAGetLastError());
			continue;
		}

		// Set end of string
		dataBuffer[iResult] = '\0';

		char ipAddress[16]; // 15 spaces for decimal notation (for example: "192.168.100.200") + '\0'

		// Copy client ip to local char[]
		strcpy_s(ipAddress, sizeof(ipAddress), inet_ntoa(clientAddress.sin_addr));

		// Convert port number from network byte order to host byte order
		unsigned short clientPort = ntohs(clientAddress.sin_port);


		// Check big, small letters and other characters in message
		big_letters = small_letters = other_chars = 0;
		for (int i = 0; i < strlen(dataBuffer); i++)
		{

			// 65 = A, 90 = Z
			if (65 <= dataBuffer[i] && dataBuffer[i] <= 90)
			{
				++big_letters;
			}
			// 97 = a, 122 = z
			else if (97 <= dataBuffer[i] && dataBuffer[i] <= 122)
			{
				++small_letters;
			}
			else
				++other_chars;
		}

		// Log client ip address, port and message text
		printf("Client connected from ip: %s, port: %d, sent: %s.\n", ipAddress, clientPort, dataBuffer);

		//Log number of big, small letters and other characters in message
		printf("Message has %d characters. Big letters: %d, small letters: %d and other characters: %d.\n", iResult, big_letters, small_letters, other_chars);


		// Check if client sent two identical messages consecutively
		//compare current and previous message
		if (!strcmp(previous, dataBuffer))
		{
			printf("Client sent two identical messages consecutively. Server is closing.\n");
			break;
		}
		//store current message for next comparison
		strcpy(previous, dataBuffer);



		// Send message to client
		iResult = sendto(serverSocket,
			dataBuffer,
			strlen(dataBuffer),
			0,
			(SOCKADDR*)&clientAddress,
			sockAddrSize);

		if (iResult == SOCKET_ERROR)
		{
			printf("sendto failed with error: %d\n", WSAGetLastError());
			continue;
		}
	}

	// Close server application
	iResult = closesocket(serverSocket);
	if (iResult == SOCKET_ERROR)
	{
		printf("closesocket failed with error: %ld\n", WSAGetLastError());
		WSACleanup();
		return 1;
	}

	printf("Server successfully shut down.\n");

	WSACleanup();
	return 0;
}
