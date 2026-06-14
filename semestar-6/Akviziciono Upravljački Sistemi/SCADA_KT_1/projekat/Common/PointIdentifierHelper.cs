namespace Common
{
    public static class PointIdentifierHelper
	{
		public static int GetNewPointId(PointIdentifier pointIdentifier)
		{
			return (ushort)pointIdentifier.PointType << 16 ^ pointIdentifier.Address;
		}
	}
}
