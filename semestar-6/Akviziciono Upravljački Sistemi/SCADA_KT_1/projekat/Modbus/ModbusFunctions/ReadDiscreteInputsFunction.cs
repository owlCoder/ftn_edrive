using Common;
using Modbus.FunctionParameters;
using Modbus.PacketFunctions.Implementations;
using System;
using System.Collections.Generic;
using System.Net;
using System.Net.Http.Headers;
using System.Reflection;
using System.Runtime.InteropServices;

namespace Modbus.ModbusFunctions
{
    public class ReadDiscreteInputsFunction : ModbusFunction
    {
        public ReadDiscreteInputsFunction(ModbusCommandParameters commandParameters) : base(commandParameters)
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
            return request.ParsePacket(response, (ModbusReadCommandParameters)CommandParameters, PointType.DIGITAL_INPUT);
        }
    }
}