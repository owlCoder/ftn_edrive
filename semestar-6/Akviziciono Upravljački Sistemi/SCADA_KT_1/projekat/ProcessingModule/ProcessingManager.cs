using Common;
using Modbus;
using Modbus.FunctionParameters;
using System;
using System.Collections.Generic;
using System.Linq;

namespace ProcessingModule
{
    public class ProcessingManager : IProcessingManager
    {
        private IFunctionExecutor functionExecutor;
        private IStorage storage;
        private AlarmProcessor alarmProcessor;
        private EGUConverter eguConverter;
        public ProcessingManager(IStorage storage, IFunctionExecutor functionExecutor)
        {
            this.storage = storage;
            this.functionExecutor = functionExecutor;
            this.alarmProcessor = new AlarmProcessor();
            this.eguConverter = new EGUConverter();
            this.functionExecutor.UpdatePointEvent += CommandExecutor_UpdatePointEvent;
        }
        public void ExecuteReadCommand(IConfigItem configItem, ushort transactionId, byte remoteUnitAddress, ushort startAddress, ushort numberOfPoints)
        {
            ModbusReadCommandParameters p = new ModbusReadCommandParameters(6, (byte)GetReadFunctionCode(configItem.RegistryType), startAddress, numberOfPoints, transactionId, remoteUnitAddress);
            IModbusFunction fn = FunctionFactory.CreateModbusFunction(p);
            this.functionExecutor.EnqueueCommand(fn);
        }
        public void ExecuteWriteCommand(IConfigItem configItem, ushort transactionId, byte remoteUnitAddress, ushort pointAddress, int value)
        {
            if (configItem.RegistryType == PointType.ANALOG_OUTPUT)
            {
                ExecuteAnalogCommand(configItem, transactionId, remoteUnitAddress, pointAddress, value);
            }
            else
            {
                ExecuteDigitalCommand(configItem, transactionId, remoteUnitAddress, pointAddress, value);
            }
        }
        private void ExecuteDigitalCommand(IConfigItem configItem, ushort transactionId, byte remoteUnitAddress, ushort pointAddress, int value)
        {
            ModbusWriteCommandParameters p = new ModbusWriteCommandParameters(6, (byte)ModbusFunctionCode.WRITE_SINGLE_COIL, pointAddress, (ushort)value, transactionId, remoteUnitAddress);
            IModbusFunction fn = FunctionFactory.CreateModbusFunction(p);
            this.functionExecutor.EnqueueCommand(fn);
        }
        private void ExecuteAnalogCommand(IConfigItem configItem, ushort transactionId, byte remoteUnitAddress, ushort pointAddress, int value)
        {
            ModbusWriteCommandParameters p = new ModbusWriteCommandParameters(6, (byte)ModbusFunctionCode.WRITE_SINGLE_REGISTER, pointAddress, (ushort)value, transactionId, remoteUnitAddress);
            IModbusFunction fn = FunctionFactory.CreateModbusFunction(p);
            this.functionExecutor.EnqueueCommand(fn);
        }
        private ModbusFunctionCode? GetReadFunctionCode(PointType registryType)
        {
            switch (registryType)
            {
                case PointType.DIGITAL_OUTPUT: return ModbusFunctionCode.READ_COILS;
                case PointType.DIGITAL_INPUT: return ModbusFunctionCode.READ_DISCRETE_INPUTS;
                case PointType.ANALOG_INPUT: return ModbusFunctionCode.READ_INPUT_REGISTERS;
                case PointType.ANALOG_OUTPUT: return ModbusFunctionCode.READ_HOLDING_REGISTERS;
                case PointType.HR_LONG: return ModbusFunctionCode.READ_HOLDING_REGISTERS;
                default: return null;
            }
        }
        private void CommandExecutor_UpdatePointEvent(PointType type, ushort pointAddress, ushort newValue)
        {
            List<IPoint> points = storage.GetPoints(new List<PointIdentifier>(1) { new PointIdentifier(type, pointAddress) });
            
            if (type == PointType.ANALOG_INPUT || type == PointType.ANALOG_OUTPUT)
            {
                ProcessAnalogPoint(points.First() as IAnalogPoint, newValue);
            }
            else
            {
                ProcessDigitalPoint(points.First() as IDigitalPoint, newValue);
            }
        }
        private void ProcessDigitalPoint(IDigitalPoint point, ushort newValue)
        {
            point.RawValue = newValue;
            point.Timestamp = DateTime.Now;
            point.State = (DState)newValue;

        }
        private void ProcessAnalogPoint(IAnalogPoint point, ushort newValue)
        {
            point.RawValue = newValue;
            point.Timestamp = DateTime.Now;
        }
        public void InitializePoint(PointType type, ushort pointAddress, ushort defaultValue)
        {
            List<IPoint> points = storage.GetPoints(new List<PointIdentifier>(1) { new PointIdentifier(type, pointAddress) });

            if (type == PointType.ANALOG_INPUT || type == PointType.ANALOG_OUTPUT)
            {
                ProcessAnalogPoint(points.First() as IAnalogPoint, defaultValue);
            }
            else
            {
                ProcessDigitalPoint(points.First() as IDigitalPoint, defaultValue);
            }
        }
    }
}
