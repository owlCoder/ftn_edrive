using System;

namespace ProcessingModule
{
    public class EGUConverter
	{
		public double ConvertToEGU(double scalingFactor, double deviation, ushort rawValue)
		{
            return rawValue;
		}
		public ushort ConvertToRaw(double scalingFactor, double deviation, double eguValue)
        {
            return (ushort)eguValue;
		}
	}
}
