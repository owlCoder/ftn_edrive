namespace Common
{
    public interface IProcessingManager
    {
        void InitializePoint(PointType type, ushort pointAddress, ushort defaultValue);
        void ExecuteWriteCommand(IConfigItem configItem, ushort transactionId, byte remoteUnitAddress, ushort pointAddress, int value);
        void ExecuteReadCommand(IConfigItem configItem, ushort transactionId, byte remoteUnitAddress, ushort startAddress, ushort numberOfPoints);
    }
}
