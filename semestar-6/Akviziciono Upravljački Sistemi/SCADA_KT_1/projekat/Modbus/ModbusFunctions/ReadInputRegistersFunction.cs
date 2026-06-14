using Common;
using Modbus.Connection;
using Modbus.FunctionParameters;
using Modbus.PacketFunctions.Implementations;
using System;
using System.Collections.Generic;
using System.Net;
using System.Reflection;

namespace Modbus.ModbusFunctions
{
    public class ReadInputRegistersFunction : ModbusFunction
    {
        public ReadInputRegistersFunction(ModbusCommandParameters commandParameters) : base(commandParameters)
        {
            CheckArguments(MethodBase.GetCurrentMethod(), typeof(ModbusReadCommandParameters));
        }
        public override byte[] PackRequest()
        {
            PreparePacketRequest request = new PreparePacketRequest();
            return request.PreparePacket((ModbusReadCommandParameters)CommandParameters);
        }
        public override Dictionary<Tuple<PointType, ushort>, ushort> ParseResponse(byte[] response)
        {
            ParsePacketRequest request = new ParsePacketRequest();
            return request.ParsePacket(response, (ModbusReadCommandParameters)CommandParameters, PointType.ANALOG_INPUT, true);
        }
    }
}