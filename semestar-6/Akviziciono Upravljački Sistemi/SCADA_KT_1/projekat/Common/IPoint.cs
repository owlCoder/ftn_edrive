using System;

namespace Common
{
    public interface IPoint
	{
		int PointId { get; }
		ushort RawValue { get; set; }
        AlarmType Alarm { get; set; }
        IConfigItem ConfigItem { get; }
        DateTime Timestamp { get; set; }
    }
}
