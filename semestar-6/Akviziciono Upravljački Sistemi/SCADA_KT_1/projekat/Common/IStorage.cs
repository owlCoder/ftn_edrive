using System;
using System.Collections.Generic;

namespace Common
{
    public struct PointIdentifier
    {
        public PointType PointType;
        public ushort Address;

        public PointIdentifier(PointType pointType, ushort address)
        {
            this.PointType = pointType;
            this.Address = address;
        }
    }
    public interface IStorage
	{
		List<IPoint> GetPoints(List<PointIdentifier> pointIds);
	}
}
