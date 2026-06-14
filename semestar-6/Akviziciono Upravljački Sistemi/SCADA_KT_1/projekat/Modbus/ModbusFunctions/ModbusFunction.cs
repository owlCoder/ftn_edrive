using Common;
using Modbus.FunctionParameters;
using System;
using System.Collections.Generic;
using System.Reflection;

namespace Modbus.ModbusFunctions
{
    public abstract class ModbusFunction : IModbusFunction
	{
		private ModbusCommandParameters commandParameters;
		public ModbusFunction(ModbusCommandParameters commandParameters)
		{
			this.commandParameters = commandParameters;
		}
		public ModbusCommandParameters CommandParameters
		{
			get
			{
				return commandParameters;
			}

			set
			{
				commandParameters = value;
			}
		}
        public override string ToString()
		{
			return $"Transaction: {commandParameters.TransactionId}, command {commandParameters.FunctionCode}";
		}
		protected void CheckArguments(MethodBase m, Type t)
		{
			if (commandParameters.GetType() != t)
			{
				string message = $"{m.ReflectedType.Name}{m.Name} has invalid argument {nameof(commandParameters)} of type {commandParameters.GetType().Name}.{Environment.NewLine}Argumet type should be {t.Name}";
				throw new ArgumentException(message);
			}
		}
		public abstract byte[] PackRequest();
		public abstract Dictionary<Tuple<PointType, ushort>, ushort> ParseResponse(byte[] response);
		protected void HandeException(byte exceptionCode)
		{
			string message = string.Empty;

			switch (exceptionCode)
			{
				case 1:
					message = "Illegal Function";
					break;
				case 2:
					message = "Illegal Data Address";
					break;
				case 3:
					message = "Illegal Data Value";
					break;
				case 4:
					message = "Slave Device Failure";
					break;
				case 5:
					message = "Acknowledge";
					break;
				case 6:
					message = "Slave Device Busy";
					break;
				case 7:
					message = "Negative Acknowledge";
					break;
				case 8:
					message = "Memory Parity Error";
					break;
				case 10:
					message = "Illegal Function";
					break;
				case 11:
					message = "Gateway Target Device Failed to Respond";
					break;
				default: break;
			}

			throw new Exception(message);
		}
	}
}