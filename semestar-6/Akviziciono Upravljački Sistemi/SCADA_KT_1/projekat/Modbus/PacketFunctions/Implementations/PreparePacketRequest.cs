using Modbus.FunctionParameters;
using Modbus.PacketFunctions.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modbus.PacketFunctions.Implementations
{
    public class PreparePacketRequest : IPreparePacketRequest
    {
        NetworkConversion conversion = new NetworkConversion();
        public byte[] PreparePacket(ModbusReadCommandParameters command)
        {
            byte[] data = new List<byte>(12)
            {
                conversion.ByteParser(command.TransactionId)[0],
                conversion.ByteParser(command.TransactionId)[1],
                conversion.ByteParser(command.ProtocolId)[0],
                conversion.ByteParser(command.ProtocolId)[1],
                conversion.ByteParser(command.Length)[0],
                conversion.ByteParser(command.Length)[1],
                conversion.ByteParser(command.UnitId),
                conversion.ByteParser(command.FunctionCode),
                conversion.ByteParser(command.StartAddress)[0],
                conversion.ByteParser(command.StartAddress)[1],
                conversion.ByteParser(command.Quantity)[0],
                conversion.ByteParser(command.Quantity)[1]
            }.ToArray();

            return data;
        }

        public byte[] PreparePacket(ModbusWriteCommandParameters command)
        {
            byte[] data = new List<byte>(12)
            {
                conversion.ByteParser(command.TransactionId)[0],
                conversion.ByteParser(command.TransactionId)[1],
                conversion.ByteParser(command.ProtocolId)[0],
                conversion.ByteParser(command.ProtocolId)[1],
                conversion.ByteParser(command.Length)[0],
                conversion.ByteParser(command.Length)[1],
                conversion.ByteParser(command.UnitId),
                conversion.ByteParser(command.FunctionCode),
                conversion.ByteParser(command.OutputAddress)[0],
                conversion.ByteParser(command.OutputAddress)[1],
                conversion.ByteParser(command.Value)[0],
                conversion.ByteParser(command.Value)[1]
            }.ToArray();

            return data;
        }
    }
}
