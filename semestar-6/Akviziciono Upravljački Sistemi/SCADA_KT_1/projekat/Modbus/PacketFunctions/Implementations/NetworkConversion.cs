using Modbus.PacketFunctions.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace Modbus.PacketFunctions.Implementations
{
    public class NetworkConversion : INetworkConversion
    {
        public byte ByteParser(byte raw_data)
        {
            return raw_data;
        }

        public byte[] ByteParser(ushort raw_data)
        {
            byte[] data = new byte[2];

            Buffer.BlockCopy(BitConverter.GetBytes(IPAddress.HostToNetworkOrder((short)raw_data)), 0, data, 0, 2);

            return data;
        }
    }
}
