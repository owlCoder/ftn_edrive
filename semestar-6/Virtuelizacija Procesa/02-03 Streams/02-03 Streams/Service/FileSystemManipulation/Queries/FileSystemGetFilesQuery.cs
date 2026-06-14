using Application.Queries;
using System;
using System.IO;
using Common.Params;

namespace FileSystemManipulation.Queries
{
    public class FileSystemGetFilesQuery : IQuery
    {
        private readonly FileManipulationOptions options;
        private readonly string path;

        public FileSystemGetFilesQuery(FileManipulationOptions options, string path)
        {
            this.options = options;
            this.path = path;
        }

        public FileManipulationResults GetResults()
        {
            var results = new FileManipulationResults();
            string[] files = Directory.GetFiles(path);
            foreach (string filePath in files)
            {
                AddMemoryStream(filePath, results);
            }
            return results;
        }

        /// <summary>
        /// Ukoliko ime fajla počinje sa imenom datoteke iz opcija, metod treba da
        /// pročita datoteku, izdvoji memory stream i doda ga u rezultate.
        /// </summary>
        /// <param name="filePath"></param>
        /// <param name="results"></param>
        private void AddMemoryStream(string filePath, FileManipulationResults results)
        {
            //IMPLEMENTIRATI
            var fileName = Path.GetFileName(filePath);
            if (Path.GetFileName(fileName).StartsWith(options.FileName, StringComparison.CurrentCultureIgnoreCase))
            {
                using (FileStream fileStream = new FileStream(filePath, FileMode.Open, FileAccess.Read))
                {
                    MemoryStream ms = new MemoryStream();
                    fileStream.CopyTo(ms);
                    results.MSs.Add(fileName, ms);
                }
            }
        }

    }
}
