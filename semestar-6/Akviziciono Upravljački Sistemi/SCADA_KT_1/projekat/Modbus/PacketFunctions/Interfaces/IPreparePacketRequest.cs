using Modbus.FunctionParameters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modbus.PacketFunctions.Interfaces
{
    public interface IPreparePacketRequest
    {
        byte[] PreparePacket(ModbusReadCommandParameters command);
        byte[] PreparePacket(ModbusWriteCommandParameters command);
    }
}
