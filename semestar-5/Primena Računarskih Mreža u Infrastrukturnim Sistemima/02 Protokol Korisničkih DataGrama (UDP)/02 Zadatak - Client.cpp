// UDP client that uses blocking sockets

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
#define SERVER_PORT 15001
#define BUFFER_SIZE 512


int main()
{
	// Server address
	sockaddr_in serverAddress;

	// Size of sockaddr_in structure
	int sockAddrSize = sizeof(serverAddress);

	// Buffer we will use to store message
	char dataBuffer[BUFFER_SIZE];

	// Port on server that will be used for communication with client
	unsigned short serverPort = SERVER_PORT;

	// WSADATA data structure that is to receive details of the Windows Sockets implementation
	WSADATA wsaData;

	// Initialize windows sockets for this process
	int iResult = WSAStartup(MAKEWORD(2, 2), &wsaData);
	if (iResult != 0)
	{
		printf("WSAStartup failed with error: %d\n", iResult);
		return 1;
	}

	// Initialize serverAddress structure
	memset((char*)&serverAddress, 0, sockAddrSize);
	serverAddress.sin_family = AF_INET;
	serverAddress.sin_addr.s_addr = inet_addr(SERVER_IP_ADDRESS);
	serverAddress.sin_port = htons(serverPort);

	// Create a socket
	SOCKET clientSocket = socket(AF_INET,      // IPv4 address famly
		SOCK_DGRAM,   // datagram socket
		IPPROTO_UDP); // UDP

// Check if socket creation succeeded
	if (clientSocket == INVALID_SOCKET)
	{
		printf("Creating socket failed with error: %d\n", WSAGetLastError());
		WSACleanup();
		return 1;
	}

	char previous_message[BUFFER_SIZE];

	while (true)
	{
		// Read string from user into outgoing buffer
		printf("Enter message to send: ");
		gets_s(dataBuffer, BUFFER_SIZE);

		// Check if client closing command is entered
		if (!strcmp(dataBuffer, "stop client"))
		{
			break;
		}

		// Send message to server
		iResult = sendto(clientSocket,
			dataBuffer,
			strlen(dataBuffer),
			0,
			(SOCKADDR*)&serverAddress,
			sockAddrSize);

		// Check result of send function
		if (iResult == SOCKET_ERROR)
		{
			printf("sendto failed with error: %d\n", WSAGetLastError());
			closesocket(clientSocket);
			WSACleanup();
			return 1;
		}


		// Check if 'server close command' is issued. Client is also closing, after server is closed.
		//compare current and previous message	
		if (!strcmp(previous_message, dataBuffer))
		{
			printf("Two identical messages were sent consecutively. Server is being closed.\n");
			break;
		}
		//store current message for next comparison
		strcpy(previous_message, dataBuffer);



		// Receive server message
		iResult = recvfrom(clientSocket,
			dataBuffer,
			BUFFER_SIZE,
			0,
			(SOCKADDR*)&serverAddress,
			&sockAddrSize);

		if (iResult == SOCKET_ERROR)
		{
			printf("recvfrom failed with error: %d\n", WSAGetLastError());
			continue;
		}

		// Set end of string
		dataBuffer[iResult] = '\0';
		// Log message from server
		printf("Message from server: %s.\n\n", dataBuffer);

	}

	// Close application
	iResult = closesocket(clientSocket);
	if (iResult == SOCKET_ERROR)
	{
		printf("closesocket failed with error: %d\n", WSAGetLastError());
		WSACleanup();
		return 1;
	}

	WSACleanup();

	return 0;
}
