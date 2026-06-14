using Common;
using Modbus.FunctionParameters;
using Modbus.PacketFunctions.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace Modbus.PacketFunctions.Implementations
{
    public class ParsePacketRequest : IParsePacketRequest
    {
        public Dictionary<Tuple<PointType, ushort>, ushort> ParsePacket(byte[] data, ModbusReadCommandParameters command, PointType type)
        {
            Dictionary<Tuple<PointType, ushort>, ushort> parsed_data = new Dictionary<Tuple<PointType, ushort>, ushort>();
            int quantity = command.Quantity;
            ushort address = command.StartAddress;

            for (int i = 0; i < data[8] || (--quantity < 0); i++)
            {
                byte mask = 1;
                byte tempByte = data[9 + i];
                for (int j = 0; j < 8; j++)
                {
                    ushort val = (ushort)(tempByte & mask);
                    parsed_data.Add(new Tuple<PointType, ushort>(type, address++), val);
                    tempByte >>= 1;
                }

            }

            return parsed_data;
        }

        public Dictionary<Tuple<PointType, ushort>, ushort> ParsePacket(byte[] data, ModbusReadCommandParameters command, PointType type, bool IsRegister)
        {
            Dictionary<Tuple<PointType, ushort>, ushort> parsed_data = new Dictionary<Tuple<PointType, ushort>, ushort>();

            ushort address = command.StartAddress;
            ushort tmp = BitConverter.ToUInt16(data, 9);
            parsed_data.Add(new Tuple<PointType, ushort>(type, address), (ushort)IPAddress.HostToNetworkOrder((short)tmp));

            return parsed_data;
        }

        public Dictionary<Tuple<PointType, ushort>, ushort> ParsePacket(byte[] data, ModbusWriteCommandParameters command, PointType type)
        {
            Dictionary<Tuple<PointType, ushort>, ushort> parsed_data = new Dictionary<Tuple<PointType, ushort>, ushort>();

            ushort address = command.OutputAddress;
            ushort tmp = BitConverter.ToUInt16(data, 9);
            parsed_data.Add(new Tuple<PointType, ushort>(type, address), (ushort)(IPAddress.HostToNetworkOrder((short)tmp)));

            return parsed_data;
        }
    }
}
