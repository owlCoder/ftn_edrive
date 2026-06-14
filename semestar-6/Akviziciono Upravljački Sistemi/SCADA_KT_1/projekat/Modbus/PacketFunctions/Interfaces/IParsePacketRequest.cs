using Common;
using Modbus.FunctionParameters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modbus.PacketFunctions.Interfaces
{
    public interface IParsePacketRequest
    {
        Dictionary<Tuple<PointType, ushort>, ushort> ParsePacket(byte[] data, ModbusReadCommandParameters command, PointType type);
        Dictionary<Tuple<PointType, ushort>, ushort> ParsePacket(byte[] data, ModbusReadCommandParameters command, PointType type, bool IsRegister);
        Dictionary<Tuple<PointType, ushort>, ushort> ParsePacket(byte[] data, ModbusWriteCommandParameters command, PointType type);
    }
}
