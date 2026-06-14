using Common;

namespace ProcessingModule
{
    public class AlarmProcessor
	{
		public AlarmType GetAlarmForAnalogPoint(double eguValue, IConfigItem configItem)
		{
			return AlarmType.NO_ALARM;
		}
		public AlarmType GetAlarmForDigitalPoint(ushort state, IConfigItem configItem)
		{
            return AlarmType.NO_ALARM;
        }
	}
}
