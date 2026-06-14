using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modbus.PacketFunctions.Interfaces
{
    public interface INetworkConversion
    {
        byte ByteParser(byte raw_data);
        byte[] ByteParser(ushort raw_data);
    }
}
