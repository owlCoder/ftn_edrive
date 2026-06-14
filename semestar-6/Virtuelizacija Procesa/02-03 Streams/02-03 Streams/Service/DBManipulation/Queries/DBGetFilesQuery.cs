using Application.Queries;
using DBManipulation.Interfaces;
using System.Collections.Generic;
using System.IO;
using Common.Params;

namespace DBManipulation.Queries
{
    public class DBGetFilesQuery : IQuery
    {
        private readonly IDataBase dataBase;
        private readonly FileManipulationOptions options;
        public DBGetFilesQuery(IDataBase dataBase, FileManipulationOptions options)
        {
            this.dataBase = dataBase;
            this.options = options;
        }

        public FileManipulationResults GetResults()
        {
            FileManipulationResults results = new FileManipulationResults();
            var fileData = dataBase.GetFileData(options.FileName);
            AddMemoryStreams(fileData, results);
            return results;
        }

        private void AddMemoryStreams(Dictionary<string, byte[]> fileData, FileManipulationResults results)
        {            
            foreach (KeyValuePair<string, byte[]> kvp in fileData)
            {
                var stream = GetMemoryStream(kvp.Value);
                results.MSs.Add(kvp.Key, stream);
            }
        }

        /// <summary>
        /// Metod treba da kreira i vrati memory stream od prosledjenog niza bajtova
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        private MemoryStream GetMemoryStream(byte[] data)
        {
            // IMPLEMENTIRATI
            return new MemoryStream(data);
        }
    }
}
