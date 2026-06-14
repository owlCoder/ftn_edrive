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

#define SERVER_PORT 27016
#define BUFFER_SIZE 256
#define NEUSPESNO   -1
#define USPESNO     0

// funkcije sa rad sa mrezom
int povezivanjeSaKlijentom(int IDKlijenta, SOCKET& klijent, SOCKET socketListener, sockaddr_in* adresaKlijenta, int* velicinaKlijentskeAdrese)
{
	klijent = accept(socketListener, (struct sockaddr*)adresaKlijenta, velicinaKlijentskeAdrese);

	if (klijent == INVALID_SOCKET)
	{
		printf("Prihvatanje konekcije od klijenta neuspesno!\nGreska: %d\n", WSAGetLastError());
		closesocket(socketListener);
		WSACleanup();
		return NEUSPESNO;
	}

	printf("\nPovezan sa Klijentom %d -> (%s:%d)", IDKlijenta, inet_ntoa(adresaKlijenta->sin_addr), ntohs(adresaKlijenta->sin_port));

	return USPESNO;
}

int slanjePodatakaKlijentu(int IDKlijenta, SOCKET klijent1, SOCKET klijent2, char* bafer)
{
	int iResult;
	if (IDKlijenta == 1)
	{
		iResult = send(klijent1, bafer, (int)strlen(bafer), 0);
	}
	else
	{
		iResult = send(klijent2, bafer, (int)strlen(bafer), 0);
	}

	if (iResult == SOCKET_ERROR)
	{
		printf("Slanje podataka klijentu nije uspelo!\nGreska: %d\n", WSAGetLastError());

		shutdown(klijent1, SD_BOTH);
		shutdown(klijent2, SD_BOTH);

		closesocket(klijent1);
		closesocket(klijent2);

		return NEUSPESNO;
	}

	return USPESNO;
}

int prihvatPodatakaOdKlijenta(int IDKlijenta, char slovo, SOCKET klijent1, SOCKET klijent2,
	char* bafer, bool& kraj, bool& naRedu, int& tacnih, int& duzinaReci)
{
	int iResult;
	if (IDKlijenta == 1)
	{
		iResult = recv(klijent1, bafer, BUFFER_SIZE, 0);
	}
	else
	{
		iResult = recv(klijent2, bafer, BUFFER_SIZE, 0);
	}

	if (iResult > 0)
	{
		bafer[iResult] = '\0';

		printf("Klijent %d je poslao -> (%s)\n", IDKlijenta, bafer);

		if (!strcmp(bafer, "kraj"))
		{
			kraj = true;
			naRedu = false;
		}
		else
		{
			if (toupper(bafer[0]) == toupper(slovo))
			{
				printf("Tacna rec!\n");
				naRedu = true;
				tacnih++;
				duzinaReci += strlen(bafer);
			}
			else
			{
				printf("Pogresna rec!\n");
				naRedu = false;
			}
		}
	}
	else if (iResult == 0)
	{
		printf("Konekcija ka Klijentu %d je zatvorena.\n", IDKlijenta);
		if (IDKlijenta == 2)
		{
			shutdown(klijent1, SD_BOTH);
		}
		else
		{
			shutdown(klijent2, SD_BOTH);
		}

		closesocket(klijent1);
		closesocket(klijent2);

		return NEUSPESNO;
	}
	else
	{
		printf("Prijem podataka preko mreze nije uspeo!\nGreska: %d\n", WSAGetLastError());

		shutdown(klijent1, SD_BOTH);
		shutdown(klijent2, SD_BOTH);

		closesocket(klijent1);
		closesocket(klijent2);

		return NEUSPESNO;
	}

	return USPESNO;
}

int zatvaranjeKonekcijaKaKlijentu(int IDKlijenta, SOCKET klijent1, SOCKET klijent2)
{

	int iResult;

	if (IDKlijenta == 1)
	{
		iResult = shutdown(klijent1, SD_BOTH);
	}
	else
	{
		iResult = shutdown(klijent2, SD_BOTH);
	}

	if (iResult == SOCKET_ERROR)
	{
		printf("Gasenje konekcije neuspesno!\nGreska: %d\n", WSAGetLastError());
		closesocket(klijent1);
		closesocket(klijent2);
		WSACleanup();

		return NEUSPESNO;
	}

	return USPESNO;
}

// TCP server koji koristi blokiranje socket-a
int main()
{
	// socket-i za osluskivanje i konekciju klijenata
	SOCKET socketListener = INVALID_SOCKET;
	SOCKET klijent1 = INVALID_SOCKET;
	SOCKET klijent2 = INVALID_SOCKET;

	// promenljive za rezultate i medjurezultate
	int iResult;
	int tacnihReciPrvi, tacnihReciDrugi;
	int duzinaReciPrvogKlijenta, duzinaReciDrugogKlijenta;
	bool prvi, drugi;
	bool krajPrvi, krajDrugi;

	// baferi za skladistanje podataka
	char baferZaPodatkePrviKlijent[BUFFER_SIZE];
	char baferZaPodatkeDrugiKlijent[BUFFER_SIZE];

	WSADATA wsaData;

	// pokretanje WSA
	if (WSAStartup(MAKEWORD(2, 2), &wsaData) != 0)
	{
		printf("Nije moguce pokrenuti WSA.\nGreska: %d\n", WSAGetLastError());
		return 1;
	}

	// kreiranje strukture za cuvanje adrese servera
	sockaddr_in adresaServera;

	memset((char*)&adresaServera, 0, sizeof(adresaServera));
	adresaServera.sin_family = AF_INET;
	adresaServera.sin_addr.s_addr = INADDR_ANY;
	adresaServera.sin_port = htons(SERVER_PORT);

	// kreiranje socket-a za konekcije ka serveru
	socketListener = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);

	if (socketListener == INVALID_SOCKET)
	{
		printf("Socket za konekciju neuspesno inicijalizovan!\nGreska: %d\n", WSAGetLastError());
		WSACleanup();
		return 2;
	}

	// povezivanje socket-a sa serverom
	iResult = bind(socketListener, (struct sockaddr*)&adresaServera, sizeof(adresaServera));

	if (iResult == SOCKET_ERROR)
	{
		printf("Bind nije uspeo!\nGreska: %d\n", WSAGetLastError());
		closesocket(socketListener);
		WSACleanup();
		return 3;
	}

	// postavljenja socket-a u rezim za osluskivanje
	iResult = listen(socketListener, SOMAXCONN);

	if (iResult == SOCKET_ERROR)
	{
		printf("Listen nije uspeo!\nGreska: %d\n", WSAGetLastError());
		closesocket(socketListener);
		WSACleanup();
		return 4;
	}

	printf("Server socket podesen u Listening Rezim. Ceka se na novu klijentsku konekciju...\n");

	do
	{
		sockaddr_in adresaKlijenta;
		int velicinaKlijentskeAdrese = sizeof(struct sockaddr_in);

		// prihvatanje nove klijentske koneckije
		int retVal_1 = povezivanjeSaKlijentom(1, klijent1, socketListener, &adresaKlijenta, &velicinaKlijentskeAdrese);
		int retVal_2 = povezivanjeSaKlijentom(2, klijent2, socketListener, &adresaKlijenta, &velicinaKlijentskeAdrese);

		if (retVal_1 == NEUSPESNO || retVal_2 == NEUSPESNO)
		{
			return 6;
		}

		// unos reci na serveru
		char slovo;

		printf("\n\nUnesite slovo kojom rec treba da pocne: ");
		scanf_s("%c", &slovo);
		getchar();

		// formiranje podataka za bafer za slanje povezanim klijentima
		sprintf_s(baferZaPodatkePrviKlijent, "Pocinje igra na slovo na slovo %c. Posaljite vasu rec!\n", slovo);
		sprintf_s(baferZaPodatkeDrugiKlijent, "Pocinje igra na slovo na slovo %c. Posaljite vasu rec!\n", slovo);

		tacnihReciPrvi = tacnihReciDrugi = duzinaReciPrvogKlijenta = duzinaReciDrugogKlijenta = 0;
		krajPrvi = krajDrugi = false;
		bool kraj = false;

		do
		{
			retVal_1 = slanjePodatakaKlijentu(1, klijent1, klijent2, baferZaPodatkePrviKlijent);
			retVal_2 = slanjePodatakaKlijentu(2, klijent1, klijent2, baferZaPodatkeDrugiKlijent);

			if (retVal_1 == NEUSPESNO || retVal_2 == NEUSPESNO)
			{
				break;
			}

			if (kraj)
			{
				break;
			}

			// prihvat podataka od prvog klijenta
			retVal_1 = prihvatPodatakaOdKlijenta(1, slovo, klijent1, klijent2, baferZaPodatkePrviKlijent, krajPrvi, prvi, tacnihReciPrvi, duzinaReciPrvogKlijenta);
			retVal_2 = prihvatPodatakaOdKlijenta(2, slovo, klijent1, klijent2, baferZaPodatkeDrugiKlijent, krajDrugi, drugi, tacnihReciDrugi, duzinaReciDrugogKlijenta);

			if (retVal_1 == NEUSPESNO || retVal_2 == NEUSPESNO)
			{
				break;
			}

			// igra se nastavlja ako oba klijenta imaju dobru rec ili su oba klijenta pogresila
			if (prvi == drugi)
			{
				strcpy_s(baferZaPodatkePrviKlijent, "Posaljite sledecu rec na zadato slovo.\n");
				strcpy_s(baferZaPodatkeDrugiKlijent, "Posaljite sledecu rec na zadato slovo.\n");
			}
			else
			{
				// pobedjuje prvi klijent
				if (prvi)
				{
					sprintf_s(baferZaPodatkePrviKlijent, "Prvi igrac je poslao %d ispravnih reci, drugi igrac je poslao %d ispravnih reci. Vi ste POBEDILI!\n", tacnihReciPrvi, tacnihReciDrugi);
					sprintf_s(baferZaPodatkeDrugiKlijent, "Prvi igrac je poslao %d ispravnih reci, drugi igrac je poslao %d ispravnih reci. Vi ste IZGUBILI!\n", tacnihReciPrvi, tacnihReciDrugi);
					kraj = true;
				}

				if (drugi)
				{
					sprintf_s(baferZaPodatkePrviKlijent, "Prvi igrac je poslao %d ispravnih reci, drugi igrac je poslao %d ispravnih reci. Vi ste IZGUBILI!\n", tacnihReciPrvi, tacnihReciDrugi);
					sprintf_s(baferZaPodatkeDrugiKlijent, "Prvi igrac je poslao %d ispravnih reci, drugi igrac je poslao %d ispravnih reci. Vi ste POBEDILI!\n", tacnihReciPrvi, tacnihReciDrugi);
					kraj = true;
				}

				// istovremeno su oba klijenta napustila igru
				if (krajPrvi && krajDrugi)
				{
					if (duzinaReciPrvogKlijenta > duzinaReciDrugogKlijenta)
					{
						sprintf_s(baferZaPodatkePrviKlijent, "Prvi igrac je poslao %d ispravnih reci, drugi igrac je poslao %d ispravnih reci. Vi ste POBEDILI!\n", tacnihReciPrvi, tacnihReciDrugi);
						sprintf_s(baferZaPodatkeDrugiKlijent, "Prvi igrac je poslao %d ispravnih reci, drugi igrac je poslao %d ispravnih reci. Vi ste IZGUBILI!\n", tacnihReciPrvi, tacnihReciDrugi);
						kraj = true;
					}
					else
					{
						sprintf_s(baferZaPodatkePrviKlijent, "Prvi igrac je poslao %d ispravnih reci, drugi igrac je poslao %d ispravnih reci. Vi ste IZGUBILI!\n", tacnihReciPrvi, tacnihReciDrugi);
						sprintf_s(baferZaPodatkeDrugiKlijent, "Prvi igrac je poslao %d ispravnih reci, drugi igrac je poslao %d ispravnih reci. Vi ste POBEDILI!\n", tacnihReciPrvi, tacnihReciDrugi);
						kraj = true;
					}
				}
			}

		} while (true);

	} while (true);

	// gasenje konekcije ka klijentu
	int retVal_1 = zatvaranjeKonekcijaKaKlijentu(1, klijent1, klijent2);
	int retVal_2 = zatvaranjeKonekcijaKaKlijentu(2, klijent1, klijent2);

	if (retVal_1 == NEUSPESNO || retVal_2 == NEUSPESNO)
	{
		return 7;
	}

	// zatvaranje socket-a i WSA
	closesocket(klijent1);
	closesocket(klijent2);
	WSACleanup();

	return 0;
}
