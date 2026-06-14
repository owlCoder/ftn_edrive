#define _WINSOCK_DEPRECATED_NO_WARNINGS
#define WIN32_LEAN_AND_MEAN

#ifdef _MSC_VER
#define _CRT_SECURE_NO_WARNINGS
#endif

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// REQUIRED NETWORK HEADERS
#include <Windows.h>
#include <WinSock2.h>
#include <WS2tcpip.h>

// ADDITIONAL LIBRARIES FOR NETWORK
#pragma comment(lib, "Ws2_32.lib")
#pragma comment(lib, "Mswsock.lib")
#pragma comment(lib, "AdvApi32.lib")

int main(void)
{
	WSADATA wsaData;


	if (WSAStartup(MAKEWORD(2, 2), &wsaData) != 0)
	{
		printf("WSAStartip failed with error: %d\n", WSAGetLastError());
	}

	// htonl - Host TO Network Long
	// htons - Host TO Network Short

	// ntohl - Network TO Host Long
	// ntohs - Network TO Host Short

	unsigned long podatak = 10;
	unsigned long mrezniRedosleBajtova;

	mrezniRedosleBajtova = htonl(podatak);
	
	/* PRETVARANJE IZ DECIMALNOG FORMATA U BINARNI FORMAT
	 * 
	 * inet_addr("192.168.10.37");
	 */

	 /* PRETVARANJE IZ BINARNOG FORMATA U DECIMALNU ADRESU (STRING)
	  *
	  * inet_ntoa(01101011001010);
	  */

	SOCKADDR_IN socketAdress;
	short port = 5150;

	socketAdress.sin_family       = AF_INET; // za IPV4 adrese
	socketAdress.sin_addr.s_addr  = inet_addr("192.168.10.37");
	socketAdress.sin_port         = htons(port);


	// KREIRANJE UTICNICE
	SOCKET soc = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);

	// SPAJANJE UTICNICE I ADRESE

	int host_result = bind(soc, (struct sockaddr *) &socketAdress, sizeof(socketAdress));
	
	if (host_result == 0)
	{
		printf("Host socket binded successfully!\n");
	}
	else
	{
		printf("Error binding host socket!\n");
	}

	// KREIRANJE UTICNICE KOJA OSLUSKUJE ODREDJENI PORT/ADRESU
	SOCKADDR_IN    serverAdress;
	SOCKET         socketListener;
	unsigned short serverPort = 20;

	serverAdress.sin_family      = AF_INET; // za IPV4 adrese
	serverAdress.sin_addr.s_addr = INADDR_ANY;
	serverAdress.sin_port        = htons(serverPort);

	socketListener = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
	int result = bind(socketListener, (struct sockaddr *) &serverAdress, sizeof(serverAdress));

	if (result == 0)
	{
		printf("Server socket binded successfully!\n");
	}
	else
	{
		printf("Error binding server socket!\n");
	}

	// ZATVARANJE UTICNICA I OSLOBADJANJE RESURSA
	closesocket(soc);
	closesocket(socketListener);

	WSACleanup();

	return 0;
}