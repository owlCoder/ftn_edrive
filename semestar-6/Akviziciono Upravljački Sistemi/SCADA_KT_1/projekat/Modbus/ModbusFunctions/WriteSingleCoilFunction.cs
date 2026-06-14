using Common;
using Modbus.FunctionParameters;
using Modbus.PacketFunctions.Implementations;
using System;
using System.Collections.Generic;
using System.Net;
using System.Reflection;

namespace Modbus.ModbusFunctions
{
    public class WriteSingleCoilFunction : ModbusFunction
    {
        public WriteSingleCoilFunction(ModbusCommandParameters commandParameters) : base(commandParameters)
        {
            CheckArguments(MethodBase.GetCurrentMethod(), typeof(ModbusWriteCommandParameters));
        }
        public override byte[] PackRequest()
        {
            PreparePacketRequest request = new PreparePacketRequest();
            return request.PreparePacket((ModbusWriteCommandParameters)CommandParameters);
        }
        public override Dictionary<Tuple<PointType, ushort>, ushort> ParseResponse(byte[] response)
        {
            ParsePacketRequest request = new ParsePacketRequest();
            return request.ParsePacket(response, (ModbusWriteCommandParameters)CommandParameters, PointType.DIGITAL_OUTPUT);
        }
    }
}