// Elektroenergetski softverski inzenjering
// Primenjene racunarske mreze u namenskim sistemima 2
// Vezba 7 - Rad sa datotekama

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

// Function declarations
void packet_handler(unsigned char *param, const struct pcap_pkthdr *packet_header, const unsigned char *packet_data);

pcap_dumper_t* icmp_dumper;
pcap_dumper_t* udp_dumper;
pcap_dumper_t* tcp_dumper;
pcap_dumper_t* arp_dumper;

int main()
{
	pcap_t* device_handle;
	char error_buffer[PCAP_ERRBUF_SIZE];
	
	// Open the capture file 
	if ((device_handle = pcap_open_offline("example.pcap", // Name of the device
								error_buffer	  // Error buffer
							)) == NULL)
	{
		printf("\n Unable to open the file %s.\n", "example.pcap");
		return -1;
	}

	// Open the dump file 
	arp_dumper = pcap_dump_open(device_handle, "arp_packets.pcap");
	icmp_dumper = pcap_dump_open(device_handle, "icmp_packets.pcap");
	udp_dumper = pcap_dump_open(device_handle, "udp_packets.pcap");
	tcp_dumper = pcap_dump_open(device_handle, "tcp_packets.pcap");
	

	if (icmp_dumper == NULL || udp_dumper == NULL || tcp_dumper == NULL || arp_dumper == NULL)
	{
		printf("\n Error opening output file\n");
		return -1;
	}

	// Check the link layer. We support only Ethernet for simplicity.
	if(pcap_datalink(device_handle) != DLT_EN10MB)
	{
		printf("\nThis program works only on Ethernet networks.\n");
		return -1;
	}

	struct bpf_program fcode;

	// Compile the filter
	if (pcap_compile(device_handle, &fcode, "arp or (ip and (icmp or udp or tcp))", 1, 0xffffff) < 0)
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

	// Read and dispatch packets until EOF is reached
	pcap_loop(device_handle, 0, packet_handler, NULL);

	// Close the file associated with device_handle and deallocates resources
	pcap_close(device_handle);

	printf("\nFile: example.pcap is successfully processed.\n");

	return 0;
}

// Callback function invoked by WinPcap for every incoming packet
void packet_handler(unsigned char* user, const struct pcap_pkthdr* packet_header, const unsigned char* packet_data)
{
	/* DATA LINK LAYER - Ethernet */

	// Retrive the position of the ethernet header
	ethernet_header * eh = (ethernet_header *)packet_data;

	// ARP
	if (ntohs(eh->type) == 0x806)
	{
		pcap_dump((unsigned char*) arp_dumper, packet_header, packet_data);
		return;
	}
	
	/* NETWORK LAYER - IPv4 */

	// Retrieve the position of the ip header
	ip_header* ih = (ip_header*) (packet_data + sizeof(ethernet_header));
	
	// TRANSPORT LAYER
	switch(ih->next_protocol)
	{
		// ICMP
		case 1:
			pcap_dump((unsigned char*) icmp_dumper, packet_header, packet_data);
			break;

		// TCP
		case 6:
			pcap_dump((unsigned char*) tcp_dumper, packet_header, packet_data);
			break;

		// UDP
		case 17:
			pcap_dump((unsigned char*) udp_dumper, packet_header, packet_data);
			break;
	}
}