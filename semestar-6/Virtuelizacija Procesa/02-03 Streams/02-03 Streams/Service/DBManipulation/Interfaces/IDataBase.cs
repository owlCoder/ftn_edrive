using System.Collections.Generic;

namespace DBManipulation.Interfaces
{
    public interface IDataBase
    {
        bool InsertFile(string fileName, byte[] fileData);
        Dictionary<string, byte[]> GetFileData(string fileBeginsWith);
    }
}
