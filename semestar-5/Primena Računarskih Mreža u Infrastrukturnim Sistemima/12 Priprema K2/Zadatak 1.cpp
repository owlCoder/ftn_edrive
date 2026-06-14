#ifdef _MSC_VER
#define _CRT_SECURE_NO_WARNINGS
#endif

#include <stdlib.h>
#include <stdio.h>
#include <winsock2.h>
#include <windows.h>
#include <ws2tcpip.h>
#include "conio.h"
#include "pcap.h"
#include "protocol_headers.h"

// makroi protokola i portova
#define IPV4      0x0800
#define ICMP      0x0001
#define TCP       0x0006
#define UDP		  0x0011
#define ARP		  0x0806
#define HTTP_PORT 80
#define DNS_PORT  53
#define SMTP_PORT 465
#define POP3_PORT 995
#define IMAP_PORT 993
#define TLS_PORT  443

void packet_handler(unsigned char* param, const struct pcap_pkthdr* packet_header, const unsigned char* packet_data);
unsigned char* encrypt_data(const unsigned char* packet_data, unsigned char* app_data, int app_length);

char* protokol(unsigned char ih_p);

const char* plejfer(char* poruka);
const char* vizner(char* poruka);
const char* homofon(char* poruka);

char kljuc[5][5] = {
	{'M', 'E', 'D', 'V', 'A'},
	{'B', 'C', 'F', 'G', 'H'},
	{'I', 'K', 'L', 'N', 'O'},
	{'P', 'Q', 'R', 'S', 'T'},
	{'U', 'W', 'X', 'Y', 'Z'}
};

int icmpCounter = 0;
int tlsPacketCounter = 0;

long portoviAplikacija[256];
int brojacPortova = 0;

pcap_dumper_t* file_dumper;

int main()
{
	pcap_t* device_handle;
	char error_buffer[PCAP_ERRBUF_SIZE];

	// otvaranje input_packets.pcap
	if ((device_handle = pcap_open_offline("input_packets.pcap", error_buffer)) == NULL)
	{
		printf("Nije moguce otvoriti pcap ulazni fajl!\n");
		return -1;
	}

	// kreiranje izlaznog enkript fajla
	if ((file_dumper = pcap_dump_open(device_handle, "encrypt_packets.pcap")) == NULL)
	{
		printf("Nije moguce kreiranje enkriptovanog pcap fajla!\n");
		return -1;
	}

	// rad samo sa ethernet paketima
	if (pcap_datalink(device_handle) != DLT_EN10MB)
	{
		printf("Moguc je rad samo sa Ethernet mrezama!\n");
		return -1;
	}

	// petlja koja prolazi sve pakete
	// packet_handler ih obradjuje (ispisuje polja, sifruje, ...)
	pcap_loop(device_handle, 0, packet_handler, NULL);

	// ispisati koliko je obradjeno ICMP paketa
	printf("\nBroj ICMP paketa: %d paketa.\n", icmpCounter);

	// ispisati koliko je obradjeno TLS paketa
	printf("Broj TLS paketa: %d paketa.\n", tlsPacketCounter);

	// ispis portova aplikacija koje su slale DNS pakete
	if (brojacPortova == 0)
	{
		printf("\nNijedna aplikacija nije pristupala uslugama DNS!\n");
	}
	else
	{
		printf("\nPortovi\n[");
		for (int i = 0; i < brojacPortova - 1; i++)
			printf("%ld, ", portoviAplikacija[i]);
		printf("%ld]\n", portoviAplikacija[brojacPortova]);
	}

	// oslobadjanje resursa pcap uredjaja
	pcap_close(device_handle);

	char c = getchar();

	return 0;
}

void packet_handler(unsigned char* param, const struct pcap_pkthdr* packet_header, const unsigned char* packet_data)
{
	printf("\n=================================================\n");
	// pravljenje kopije ethernet paketa - kasnije enkripcija paketa nekim od algoritama
	char kopija[2000];
	memset(kopija, 0, packet_header->len * sizeof(char));
	memcpy(kopija, (ethernet_header*)packet_data, sizeof(ethernet_header) * sizeof(char));

	// ispis informacija iz packet_header
	printf("\n-------------- PACKET HEADER ---------------\n");
	printf("P_LEN: %ld\n", packet_header->len);
	printf("TIME:  %ld\n", packet_header->ts.tv_sec);

	// ispis svih informacija o ethernet paketu
	ethernet_header* eh = (ethernet_header*)packet_data;

	printf("\n-------------- ETHERNET SLOJ -------------\n");
	printf("SRC  ADDR: %2x-%2x-%2x-%2x-%2x-%2x\n", eh->src_address[0], eh->src_address[1], eh->src_address[2], eh->src_address[3], eh->src_address[4], eh->src_address[5]);
	printf("DEST ADDR: %2x-%2x-%2x-%2x-%2x-%2x\n", eh->dest_address[0], eh->dest_address[1], eh->dest_address[2], eh->dest_address[3], eh->dest_address[4], eh->dest_address[5]);
	printf("TYPE:      %-12s\n", (eh->type >= 1536 ? "Ethernet II" : "IEEE 802.2"));
	printf("\n");

	// provera ip verzije paketa
	if (ntohs(eh->type) == IPV4)
	{
		// pristup IP header
		ip_header* ih = (ip_header*)((unsigned char*)eh + sizeof(ethernet_header));

		// kopiranje sadrzaja IP header
		memcpy(kopija + sizeof(ethernet_header), ih, (ih->header_length * 4) * sizeof(char));

		// ispis svih podataka iz IP header
		printf("\n---------------- IP SLOJ ---------------\n");
		printf("SRC  ADDR: %d.%d.%d.%d\n", ih->src_addr[0], ih->src_addr[1], ih->src_addr[2], ih->src_addr[3]);
		printf("DST  ADDR: %d.%d.%d.%d\n", ih->dst_addr[0], ih->dst_addr[1], ih->dst_addr[2], ih->dst_addr[3]);
		printf("CEK  SUMA: %hd\n", ih->checksum);
		printf("TTL  VRED: %hd\n", ih->ttl);
		printf("TOS  VRED: %-3s\n", (ih->tos == 32 ? "CS4" : "CS0"));
		printf("VER  V4-6: %-4s\n", (ih->version == 4 ? "IPv4" : "IPv6"));
		printf("TOT  PLEN: %hd\n", ih->length);
		printf("HEADER_LN: %hd\n", ih->header_length * 4);
		printf("NEXT PROT: %-4s\n", protokol(ih->next_protocol));
	
		// ICMP Protokol
		if (ih->next_protocol == ICMP)
		{
			icmpCounter++;

			// ICMP header
			icmp_header* ich = (icmp_header*)((unsigned char*)ih + ih->header_length * 4);

			printf("\n--------------- ICMP PROTOKOL ------------\n");
			printf("TYPE: %c\n", ich->type);
			printf("CODE: %hd\n", ich->code);
			printf("CKSM: %hd\n", ich->checksum);
			printf("DATA: %hd.%hd.%hd.%hd\n", ich->data[0], ich->data[1], ich->data[2], ich->data[3]);
			
		}
		else if (ih->next_protocol == TCP)
		{
			// TCP header
			tcp_header* th = (tcp_header*)((unsigned char*)ih + ih->header_length * 4);

			// aplikativni deo podataka paketa
			char* app_data = (char*)((unsigned char*)th + th->header_length * 4);

			// duzina aplikativnog dela
			int app_length = packet_header->len - (sizeof(ethernet_header) + ih->header_length * 4 + th->header_length * 4);

			// ispis TCP header
			printf("\n---------------- TCP PROTOKOL ------------\n");
			printf("SRC  PORT: %hd\n", th->src_port);
			printf("DEST PORT: %hd\n", th->dest_port);
			printf("SEQ  NUMB: %u\n", th->sequence_num);
			printf("ACK  NUMB: %u\n", th->ack_num);
			printf("HEAD TLEN: %hd\n", th->header_length * 4);
			printf("PAC FLAGS: %d\n", th->flags);
			printf("WIN TSIZE: %hd\n", th->windows_size);
			printf("CHK  SUMA: %u\n", th->checksum);
			
			// prikaz sadrzaj paketa po 4 bajta u heksadecimalnom formatu
			printf("\n------------ TCP HEADER RAW DATA -----------\n");
			for (int i = 0; i < th->header_length * 4; i++)
			{
				printf("%.2x ", th[i]);

				if ((i + 1) % 4 == 0)
					printf("\n");
			}
			printf("-------------------------------------------\n");

			// HTTP
			if (ntohs(th->src_port) == HTTP_PORT || ntohs(th->dest_port) == HTTP_PORT)
			{
				// ISPIS HTTP SADRZAJA U ASCII FORMATU
				printf("\n-------------------- HTTP DATA -------------------\n");
				for (int i = 0; i < 32; i++)
					printf("%c", app_data[i]);
				printf("\n");
			}

			// SMTP
			if (ntohs(th->src_port) == SMTP_PORT || ntohs(th->dest_port) == SMTP_PORT)
			{
				// ISPIS SADRZAJA CELOKUPNE PORUKE U RAW FORMATU (HEXDECIMAL)
				printf("\n------------ SMTP RAW DATA -----------\n");
				for (int i = 0; i < app_length; i++)
				{
					printf("%.2x ", app_data[i]);

					if ((i + 1) % 4 == 0)
						printf("\n");
				}
			}

			// POP3
			if (ntohs(th->src_port) == POP3_PORT || ntohs(th->dest_port) == POP3_PORT)
			{
				// ISPIS POP3 SADRZAJA U ASCII FORMATU
				printf("\n-------------------- POP3 DATA --------------------\n");
				for (int i = 0; i < app_length; i++)
					printf("%.2x", app_data[i]);
				printf("\n");

			}

			// IMAP
			if (ntohs(th->src_port) == IMAP_PORT || ntohs(th->dest_port) == IMAP_PORT)
			{
				// ISPISATI APLIKACIONI SADRZAJ IMAP U RAW HEX FORMATU
				printf("\n-------------------- IMAP DATA --------------------\n");
				for (int i = 0; i < app_length; i++)
					printf("%.2x", app_data[i]);
				printf("\n");
			}

			// TLS
			if (ntohs(th->src_port) == TLS_PORT || ntohs(th->dest_port) == TLS_PORT)
			{
				// PREBROJATI KOLIKO JE TLS PAKETA OBRADJENO
				tlsPacketCounter++;

				// TLS PAKET - ISPISATI CONTECT TYPE POLJE
				printf("\n-------------------- TLS DATA --------------------\n");
				printf("TLS TYPE: %.2x\n", app_data[2]); // 54 bajt je TLS Content Type ?

			}
		}
		else if (ih->next_protocol == UDP)
		{
			printf("\n-------------------- UDP PROTOCOL --------------------\n");

			// UDP Header
			udp_header* uh = (udp_header*)((unsigned char*)ih + ih->header_length * 4);

			// kopiranje UDP Header u kopiju
			memcpy(kopija + sizeof(ethernet_header) + ih->header_length * 4, uh, sizeof(udp_header));

			// aplikativni deo UDP paketa
			char* app_data = (char*)((unsigned char*)uh + sizeof(udp_header));

			// velicina aplikativnog dela UDP paketa
			int app_length = ntohs(uh->datagram_length) - sizeof(udp_header);

			// DNS
			if (ntohs(uh->src_port) == DNS_PORT || ntohs(uh->dest_port) == DNS_PORT)
			{
				// ISPIS SADRZAJA CELOKUPNE PORUKE U RAW FORMATU (HEXDECIMAL)
				printf("\n-------------------- DNS DATA --------------------\n");
				for (int i = 0; i < app_length; i++)
					printf("%.2x", app_data[i]);
				printf("\n");

				// PRONACI PORTOVE APLIKACIJA KOJE KOMUNICIRAJU PREKO DNS PAKETA
				int i;
				for (i = 0; i < brojacPortova; i++)
					if (portoviAplikacija[i] == ntohs(uh->src_port)) // port je vec memorisan u nizu
						break;

				if (i == brojacPortova && brojacPortova < 256)
				{
					portoviAplikacija[brojacPortova] = ntohs(uh->src_port);
					brojacPortova++;
				}
			}

			// ispis aplikativnog dela u hexadecimal formatu
			printf("\n--------------------- UDP APP DATA --------------------\n");
			for (int i = 0; i < app_length; i++)
			{
				printf("%c", app_data[i]);

				if ((i + 1) % 4 == 0)
					printf("\n");
			}
			printf("\n");

			// dodavanje zavrsnog znaka
			app_data[app_length] = '\0';

			// sifrovanje aplikativnog dela paketa
			char sifrovano[256] = "\0";

			// kopiranje sifrovane poruke u string
			strcpy(sifrovano, vizner(app_data));

			// upis sifrovanih podataka u kopiju UDP paketa
			memcpy(kopija + sizeof(ethernet_header) + ih->header_length * 4 + sizeof(udp_header), sifrovano, app_length);
			
			// upis paketa u pcap datoteku
			pcap_dump((unsigned char*)file_dumper, packet_header, (const unsigned char*)kopija);
		}
	}
	else if (ntohs(eh->type) == ARP)
	{
		printf("\n-------------------- ARP PROTOCOL --------------------\n");
	}
	else
	{
		return;
	}
}
char* protokol(unsigned char ih_p)
{
	if (ih_p == IPV4) return "IPv4";
	if (ih_p == UDP	) return "UDP";
	if (ih_p == TCP ) return "TCP";
	if (ih_p == ICMP) return "ICMP";
					  return "NONE";
}

const char* plejfer(char* poruka)
{
	int r1 = -1, r2 = -1, k1 = -1, k2 = -1;
	int duzinaPoruke = strlen(poruka);
	char neutralniKarakter = 'Z';
	char *kriptovanaPoruka = (char *)malloc(256 * sizeof(char));

	if (duzinaPoruke % 2 == 1)
	{
		strncat(poruka, &neutralniKarakter, 1);
		duzinaPoruke += 1;
	}

	for (int i = 0; i < duzinaPoruke; i += 2)
	{
		if (poruka[i] == 'J')
			poruka[i] = 'I';

		for (int j = 0; j < 5; j++)
			for (int k = 0; k < 5; k++)
			{
				if (kljuc[j][k] == poruka[i])
					r1 = j, k1 = k;
				if (kljuc[j][k] == poruka[i + 1])
					r2 = j, k2 = k;
			}

		if (r1 == r2 && k1 == k2)
		{
			kriptovanaPoruka[i] = poruka[i];
			kriptovanaPoruka[i + 1] = 'X';
		}
		else
		{
			if (r1 == r2)
			{
				if (k1 == 4)
					kriptovanaPoruka[i] = kljuc[r1][0];
				else
					kriptovanaPoruka[i] = kljuc[r1][k1 + 1];

				if (k2 == 4)
					kriptovanaPoruka[i + 1] = kljuc[r2][0];
				else
					kriptovanaPoruka[i] = kljuc[r2][k2 + 1];
			}
			else if (k1 == k2)
			{
				if (r1 == 4)
					kriptovanaPoruka[i] = kljuc[0][k1];
				else
					kriptovanaPoruka[i] = kljuc[r1 + 1][k1];

				if (r2 == 4)
					kriptovanaPoruka[i + 1] = kljuc[0][k2];
				else
					kriptovanaPoruka[i + 1] = kljuc[r2 + 1][k2];
			}
			else
			{
				kriptovanaPoruka[i] = kljuc[r1][k2];
				kriptovanaPoruka[i + 1] = kljuc[r2][k2];
			}
		}
	}

	kriptovanaPoruka[duzinaPoruke] = '\0';

	return (const char *)kriptovanaPoruka;
}

const char* vizner(char* poruka)
{
	char kljucVizner[] = "KLJUC";

	int duzinaPoruke = strlen(poruka);
	int i, j;
	int duzinaKljuca = strlen(kljucVizner);
	char *kriptovanaPoruka = (char *)malloc(256 * sizeof(char));
	char *noviKljuc = (char*)malloc(256 * sizeof(char));

	// generisanje novog kljuca
	for (i = 0, j = 0; i < duzinaPoruke; ++i, ++j) {
		if (j == duzinaKljuca)
			j = 0;

		noviKljuc[i] = kljucVizner[j];
	}

	noviKljuc[i] = '\0';

	// sifrovanje poruke
	for (i = 0; i < duzinaPoruke; ++i)
		kriptovanaPoruka[i] = ((poruka[i] + noviKljuc[i]) % 26) + 'A';

	kriptovanaPoruka[duzinaKljuca] = '\0';

	return (const char *)kriptovanaPoruka;
}

const char* homofon(char* poruka)
{
	// A  A  B C  D  E  E  F  G  H  I I J  K L
    // 33 2 55 4 10 58 12 21 99 83 71 1 6 47 91
	// -------------------------------------------
	//  M  N  O  O  P  R  S T  U  U  V  W  X  Y  Z
	// 11 22 14 16 31 56 41 8 77 66 51 39 46 24 29
	char matrica_h[52] = {
		33, 2, 55, -1, 4, -1, 10, -1, 58, 12, 21, -1, 99, -1, 83, -1, 71, 1, 6, -1, 47, -1, 91, -1,
		11, -1, 22, -1, 14, 16, 31, -1, 56, -1, 41, -1, 8, -1, 77, 66, 51, -1, 39, -1, 46, -1, 24, -1, 29, -1
	};

	int duzinaPoruke = strlen(poruka);
	char *kriptovanaPoruka = (char*)malloc(256 * sizeof(char));
	int nasumicnoSlovo = 0;

	for (int i = 0; i < duzinaPoruke; i++)
	{
		int trenutnoSlovoAscii = poruka[i] - 65; // --> 0 do 25

		if (matrica_h[trenutnoSlovoAscii * 2] != -1)
		{
			// prvo slovo sigurno mora biti razlicito od -1
			// te proveravamo drugo slovo
			if (matrica_h[trenutnoSlovoAscii * 2 + 1] != -1) // ako jeste uzimamo nasumicno slovo prvo ili drugo
			{
				kriptovanaPoruka[i] = matrica_h[trenutnoSlovoAscii * 2 + nasumicnoSlovo];
				nasumicnoSlovo = ~nasumicnoSlovo;
			}
			else
			{
				kriptovanaPoruka[i] = matrica_h[trenutnoSlovoAscii * 2];
			}
		}
	}

	kriptovanaPoruka[duzinaPoruke] = '\0';

	return (const char*)kriptovanaPoruka;
}