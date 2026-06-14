using System.Collections.Generic;

namespace Common
{
    public interface IConfiguration
	{
		int TcpPort { get; }
		byte UnitAddress { get; }
		int DelayBetweenCommands { get; }
		ushort GetTransactionId();
		List<IConfigItem> GetConfigurationItems();
		int GetAcquisitionInterval(string pointDescription);
		ushort GetStartAddress(string pointDescription);
        ushort GetNumberOfRegisters(string pointDescription);
	}
}
