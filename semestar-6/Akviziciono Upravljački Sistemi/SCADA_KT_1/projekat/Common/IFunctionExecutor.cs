namespace Common
{
    public delegate void UpdatePointDelegate(PointType type, ushort pointAddres, ushort newValue);
	public interface IFunctionExecutor
	{
		void EnqueueCommand(IModbusFunction send);
		event UpdatePointDelegate UpdatePointEvent;
	}
}
