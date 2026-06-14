namespace Modbus.FunctionParameters
{
    public class ModbusReadCommandParameters : ModbusCommandParameters
	{
		private ushort startAddress;
		private ushort quantity;
		public ModbusReadCommandParameters(ushort length, byte functionCode, ushort startAddress, ushort quantity, ushort transactionId, byte unitId)
				: base(length, functionCode, transactionId, unitId)
		{
			StartAddress = startAddress;
			Quantity = quantity;
		}
		public ushort StartAddress
		{
			get
			{
				return startAddress;
			}

			private set
			{
				startAddress = value;
			}
		}
		public ushort Quantity
		{
			get
			{
				return quantity;
			}

			private set
			{
				quantity = value;
			}
		}
	}
}