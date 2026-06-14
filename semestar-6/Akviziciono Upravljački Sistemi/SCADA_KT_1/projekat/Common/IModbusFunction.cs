using System;
using System.Collections.Generic;

namespace Common
{
    public interface IModbusFunction
	{
		Dictionary<Tuple<PointType, ushort>, ushort> ParseResponse(byte[] receivedBytes);
		byte[] PackRequest();
	}
}
