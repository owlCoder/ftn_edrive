// We do not want the warnings about the old deprecated and unsecure CRT functions since these examples can be compiled under *nix as well
#ifdef _MSC_VER
#define _CRT_SECURE_NO_WARNINGS
#endif

// Include libraries
#include <stdlib.h>
#include <stdio.h>
#include <winsock2.h>
#include <windows.h>
#include <ws2tcpip.h>
#include "conio.h"
#include "pcap.h"
#include "protocol_headers.h"


int main();

// Function declarations
pcap_if_t* select_device(pcap_if_t* devices);
void print_raw_data(unsigned char* data, int data_length);

// Print packet headers
void print_winpcap_header(const struct pcap_pkthdr* packet_header, int packet_counter);
void print_ethernet_header(ethernet_header* eh);
void print_ip_header(ip_header* ih);
void print_icmp_header(icmp_header* icmph);
void print_udp_header(udp_header* uh);
void print_application_data(unsigned char* data, long data_length);


int main()
{
	pcap_if_t* devices;
	pcap_if_t* device;
	pcap_t* device_handle;
	char error_buffer[PCAP_ERRBUF_SIZE];

	/* Retrieve the device list on the local machine */
	if (pcap_findalldevs(&devices, error_buffer) == -1)
	{
		printf("Error in pcap_findalldevs: %s\n", error_buffer);
		return -1;
	}

	// Chose one device from the list
	device = select_device(devices);

	// Check if device is valid
	if (device == NULL)
	{
		pcap_freealldevs(devices);
		return -1;
	}

	// Open the capture device
	if ((device_handle = pcap_open_live(device->name,		// name of the device
		65536,						// portion of the packet to capture (65536 guarantees that the whole packet will be captured on all the link layers)
		1,							// promiscuous mode
		500,							// read timeout
		error_buffer					// buffer where error message is stored
	)) == NULL)
	{
		printf("\nUnable to open the adapter. %s is not supported by WinPcap\n", device->name);
		pcap_freealldevs(devices);
		return -1;
	}

	// Check the link layer. We support only Ethernet for simplicity.
	if (pcap_datalink(device_handle) != DLT_EN10MB)
	{
		printf("\nThis program works only on Ethernet networks.\n");
		return -1;
	}

	unsigned int netmask;
	char filter_exp[] = "(udp or icmp) and ip";
	struct bpf_program fcode;

	if (device->addresses != NULL)
		// Retrieve the mask of the first address of the interface 
		netmask = ((struct sockaddr_in*)(device->addresses->netmask))->sin_addr.s_addr;
	else
		// If the interface is without an address, we suppose to be in a C class network 
		netmask = 0xffffff;

	// Compile the filter
	if (pcap_compile(device_handle, &fcode, filter_exp, 1, netmask) < 0)
	{
		printf("\n Unable to compile the packet filter. Check the syntax.\n");
		return -1;
	}

	// Set the filter
	if (pcap_setfilter(device_handle, &fcode) < 0)
	{
		printf("\n Error setting the filter.\n");
		return -1;
	}

	printf("\nListening on %s...\n", device->description);

	// At this point, we don't need any more the device list. Free it
	pcap_freealldevs(devices);

	int result;							// result of pcap_next_ex function
	int packet_counter = 0;				// counts packets in oreder to have numerated packets
	struct pcap_pkthdr* packet_header;	// header of packet (timestamp and length)
	const unsigned char* packet_data;	// packet content

	// Retrieve the packets
	while ((result = pcap_next_ex(device_handle, &packet_header, &packet_data)) >= 0) {

		// Check if timeout has elapsed
		if (result == 0)
			continue;


		// WINPCAP

		// Print winpcap pseudo header
		print_winpcap_header(packet_header, ++packet_counter);


		/* DATA LINK LAYER - Ethernet */

		// Retrive the position of the ethernet header
		ethernet_header* eh = (ethernet_header*)packet_data;

		// Print ethernet header
		print_ethernet_header(eh);


		/* NETWORK LAYER - IPv4 */

		// Retrieve the position of the ip header
		ip_header* ih = (ip_header*)(packet_data + sizeof(ethernet_header));

		// Print ip header
		print_ip_header(ih);


		/* TRANSPORT LAYER - UDP */

		// Retrieve the position of the udp header
		int ip_len = ih->header_length * 4; // header length is calculated using words (1 word = 4 bytes)
		udp_header* uh = (udp_header*)((unsigned char*)ih + ip_len);
		icmp_header* icmph = (icmp_header*)((unsigned char*)ih + ip_len);

		// Print UDP header or ICMP header
		if (ih->next_protocol == 17)
		{
			print_udp_header(uh);
			/* APPLICATION LAYER */
			// Retrieve the position of application data
			unsigned char* application_data = ((unsigned char*)uh + sizeof(udp_header));

			// Total length of application header and data
			unsigned data_len = ntohs(uh->datagram_length) - sizeof(udp_header);

			// Print application header and data
			print_application_data(application_data, data_len);
		}
		else if (ih->next_protocol == 1)
		{
			print_icmp_header(icmph);
		}
		else
			return 0;



		// For demonstration purpose
		printf("\n\nPress enter to receive new packet\n");
		getchar();

	}

	if (result == -1) {
		printf("Error reading the packets: %s\n", pcap_geterr(device_handle));
		return -1;
	}

	return 0;
}

// This function provide possibility to choose device from the list of available devices
pcap_if_t* select_device(pcap_if_t* devices)
{
	int i = 0;			// Count devices and provide jumping to the selected device 
	pcap_if_t* device;	// Iterator for device list

	// Print the list
	for (device = devices; device; device = device->next)
	{
		printf("%d. %s", ++i, device->name);
		if (device->description)
			printf(" (%s)\n", device->description);
		else
			printf(" (No description available)\n");
	}

	// Check if list is empty
	if (i == 0)
	{
		printf("\nNo interfaces found! Make sure WinPcap is installed.\n");
		return NULL;
	}

	// Pick one device from the list
	int device_number;
	printf("Enter the interface number (1-%d):", i);
	scanf_s("%d", &device_number);

	if (device_number < 1 || device_number > i)
	{
		printf("\nInterface number out of range.\n");
		return NULL;
	}

	// Jump to the selected device
	for (device = devices, i = 0; i < device_number - 1; device = device->next, i++);

	return device;
}

// Print raw data of headers and applications
void print_raw_data(unsigned char* data, int data_length)
{
	printf("\n-------------------------------------------------------------\n\t");
	for (int i = 0; i < data_length; i = i + 1)
	{
		printf("%.2x ", ((unsigned char*)data)[i]);

		// 16 bytes per line
		if ((i + 1) % 16 == 0)
			printf("\n\t");
	}
	printf("\n-------------------------------------------------------------");
}

// Print pseudo header which is generated by WinPcap driver
void print_winpcap_header(const struct pcap_pkthdr* packet_header, int packet_counter)
{
	printf("\n\n=============================================================");
	printf("\n\tWINPCAP PSEUDO LAYER");
	printf("\n-------------------------------------------------------------");

	time_t timestamp;			// Raw time (bits) when packet is received 
	struct tm* local_time;		// Local time when packet is received
	char time_string[16];		// Local time converted to string

	// Convert the timestamp to readable format
	timestamp = packet_header->ts.tv_sec;
	local_time = localtime(&timestamp);
	strftime(time_string, sizeof time_string, "%H:%M:%S", local_time);

	// Print timestamp and length of the packet
	printf("\n\tPacket number:\t\t%u", packet_counter);
	printf("\n\tTimestamp:\t\t%s.", time_string);
	printf("\n\tPacket length:\t\t%u ", packet_header->len);
	printf("\n=============================================================");
	return;
}

// Print content of ethernet header
void print_ethernet_header(ethernet_header* eh)
{
	printf("\n=============================================================");
	printf("\n\tDATA LINK LAYER  -  Ethernet");

	print_raw_data((unsigned char*)eh, sizeof(ethernet_header));

	printf("\n\tDestination address:\t%.2x:%.2x:%.2x:%.2x:%.2x:%.2x", eh->dest_address[0], eh->dest_address[1], eh->dest_address[2], eh->dest_address[3], eh->dest_address[4], eh->dest_address[5]);
	printf("\n\tSource address:\t\t%.2x:%.2x:%.2x:%.2x:%.2x:%.2x", eh->src_address[0], eh->src_address[1], eh->src_address[2], eh->src_address[3], eh->src_address[4], eh->src_address[5]);
	printf("\n\tNext protocol:\t\t0x%.4x", ntohs(eh->type));

	printf("\n=============================================================");

	return;
}

// Print content of ip header
void print_ip_header(ip_header* ih)
{
	printf("\n=============================================================");
	printf("\n\tNETWORK LAYER  -  Internet Protocol (IP)");

	print_raw_data((unsigned char*)ih, ih->header_length * 4);		// header length calculated in 4 bytes units

	printf("\n\tVersion:\t\t%u", ih->version);
	printf("\n\tHeader Length:\t\t%u", ih->header_length * 4);
	printf("\n\tType of Service:\t%u", ih->tos);
	printf("\n\tTotal length:\t\t%u", ntohs(ih->length));
	printf("\n\tIdentification:\t\t%u", ntohs(ih->identification));
	printf("\n\tFragments:\t\t%u", ntohs(ih->fragm_fo));
	printf("\n\tTime-To-Live:\t\t%u", ih->ttl);
	printf("\n\tNext protocol:\t\t%u", ih->next_protocol);
	printf("\n\tHeader checkSum:\t%u", ntohs(ih->checksum));
	printf("\n\tSource:\t\t\t%u.%u.%u.%u", ih->src_addr[0], ih->src_addr[1], ih->src_addr[2], ih->src_addr[3]);
	printf("\n\tDestination:\t\t%u.%u.%u.%u", ih->dst_addr[0], ih->dst_addr[1], ih->dst_addr[2], ih->dst_addr[3]);

	printf("\n=============================================================");

	return;
}

void print_icmp_header(icmp_header* icmph)
{
	/*
		unsigned char type;
		unsigned char code;
		unsigned short checksum;
		unsigned char data[4];
	*/
	printf("\n\n\n=============================================================");
	printf("\n\tNETWORK LAYER  -  Internet Control Protocol (ICMP)");

	//print_raw_data((unsigned char*)uh, uh->datagram_length * 4);		// header length calculated in 4 bytes units

	printf("\n\tType:\t\t\t%u", ntohs(icmph->type));
	printf("\n\tCode:\t\t\t%u", ntohs(icmph->code));
	printf("\n\tChecksum:\t\t%u", ntohs(icmph->checksum));
	printf("\n\tData:\t\t\t%u %u %u %u", ntohs(icmph->data[0]), ntohs(icmph->data[1]), ntohs(icmph->data[2]), ntohs(icmph->data[3]));


	printf("\n=============================================================");
}

void print_udp_header(udp_header* uh)
{
	/*
		unsigned short src_port;		// Source port
		unsigned short dest_port;		// Destination port
		unsigned short datagram_length;	// Length of datagram including UDP header and data
		unsigned short checksum;		// Header checksum
	*/
	printf("\n\n\n=============================================================");
	printf("\n\tTRANSPORT LAYER  -  User DataGram Protocol (UDP)");

	//print_raw_data((unsigned char*)uh, uh->datagram_length * 4);		// header length calculated in 4 bytes units

	printf("\n\tSource Port:\t\t%u", ntohs(uh->src_port));
	printf("\n\tDestination Port:\t%u", ntohs(uh->dest_port));
	printf("\n\tDataGram Length:\t%u", ntohs(uh->datagram_length));
	printf("\n\tCheckSum:\t\t%u", ntohs(uh->checksum));

	printf("\n=============================================================");
}

void print_application_data(unsigned char* data, long data_length)
{
	printf("\n-------------------------------------------------------------\n\t");
	for (int i = 0; i < data_length; i = i + 1)
	{
		printf("%.2x ", ((unsigned char*)data)[i]);

		// 16 bytes per line
		if ((i + 1) % 16 == 0)
			printf("\n\t");
	}
	printf("\n-------------------------------------------------------------");
}
