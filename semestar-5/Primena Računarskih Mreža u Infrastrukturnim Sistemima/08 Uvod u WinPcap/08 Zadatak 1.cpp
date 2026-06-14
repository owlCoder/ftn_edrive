// We do not want the warnings about the old deprecated and unsecure CRT functions since these 
examples can be compiled under *nix as well
#ifdef _MSC_VER
	#define _CRT_SECURE_NO_WARNINGS
#endif

#include <stdlib.h>
#include <stdio.h>
#include <winsock2.h>
#include <windows.h>
#include <ws2tcpip.h>
#include "pcap.h"
#include "conio.h"


// Function declarations
void print_interface(pcap_if_t* dev);
char* convert_sockaddr_to_string(struct sockaddr* addr);


int main()
{
	pcap_if_t *devices;					// List of network interface controllers
	pcap_if_t *device;					// Network interface controller
	char errorMsg[PCAP_ERRBUF_SIZE+1];	// Error buffer

	/* Retrieve the device list */
	if(pcap_findalldevs(&devices, errorMsg) == -1)
	{
		printf("Error in pcap_findalldevs: %s\n", errorMsg);
		return -1;
	}

	/* Print all available network interfaces */
	for(device=devices; device; device=device->next)
	{
		/* Print all the available information on the given interface */
		print_interface(device);
	}

	/* Free the device list */
	pcap_freealldevs(devices);


	// For demonstration purpose
	printf("\nPress any key to exit: ");
	_getch();

	return 0;
}


void print_interface(pcap_if_t *dev)
{
	pcap_addr_t *addr;

	printf("\n\t ============================= Interface ====================================\n\n");

	/* Name */
	printf("\t Name: \t\t %s\n",dev->name);

	/* Description */
	if (dev->description)
		printf("\t Description: \t %s\n",dev->description);

	/* Loopback Address*/
	printf("\t Loopback: \t %s\n",(dev->flags & PCAP_IF_LOOPBACK)?"yes":"no");

	/* IP addresses */
	for(addr = dev->addresses; addr; addr = addr->next)
	{
		printf("\n\t ADDRESS\n");

		switch(addr->addr->sa_family)
		{
			case AF_INET:

				printf("\t # Address Type: \t IPv4\n");

				if (addr->addr)
					printf("\t # Address: \t\t %s\n", convert_sockaddr_to_string(addr->addr));

				if (addr->netmask)
					printf("\t # Subnet mask: \t %s\n", convert_sockaddr_to_string(addr->netmask));

				if (addr->broadaddr)
					printf("\t # Broadcast Address: \t %s\n", convert_sockaddr_to_string(addr->broadaddr));

				break;

			case AF_INET6:
				printf("\t # Address Type: \t IPv6\n");
				break;

			default:
				printf("\t # Address Type: \t Other\n");
				break;
		}
	}
}

char* convert_sockaddr_to_string(struct sockaddr* address)
{
	return inet_ntoa(((struct sockaddr_in *) address)->sin_addr);
}