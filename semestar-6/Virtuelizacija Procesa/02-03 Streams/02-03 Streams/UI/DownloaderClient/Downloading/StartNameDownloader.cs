using Common.Enum;
using Common.Interfaces;
using Common.Params;
using System;
using System.Collections.Generic;
using System.IO;

namespace DownloaderClient.Downloading
{
    public class StartNameDownloader: IDownloader
    {
        private readonly IFileHandling proxy;
        private readonly StorageTypes storageType;
        private readonly string path;
        public StartNameDownloader(IFileHandling proxy, string path, StorageTypes storageType)
        {
            this.proxy = proxy;
            this.storageType = storageType;
            this.path = path;
        }

        public void Download(string fileNameTemplate)
        {
            var fileResults = proxy.GetFiles(new FileManipulationOptions(null, fileNameTemplate, storageType));
            ResultTypes resultType = fileResults.ResultType;
            switch (resultType)
            {
                case ResultTypes.Failed:
                    Console.WriteLine($"Error: {fileResults.ResultMessage}");
                    break;
                case ResultTypes.Warning:
                    Console.WriteLine($"Warning: {fileResults.ResultMessage}");
                    break;
                default:
                    Console.WriteLine(fileResults.ResultMessage);
                    DownloadFiles(fileResults.MSs);
                    break;
            }
            fileResults.Dispose();
        }

        private void DownloadFiles(Dictionary<string, MemoryStream> MSs)
        {
            foreach (KeyValuePair<string, MemoryStream> stream in MSs)
            {
                DownloadFile(stream.Key, stream.Value);
            }
        }

        /// <summary>
        /// Metod treba da kreira datoteku od memory stream-a i 
        /// sacuva je na prosledjenoj putanji.
        /// </summary>
        /// <param name="fileName"></param>
        /// <param name="stream"></param>
        private void DownloadFile(string fileName, MemoryStream stream)
        {
            // IMPLEMENTIRATI
            var fs = new FileStream($"{ path }\\{fileName}", FileMode.Create, FileAccess.Write);
            stream.WriteTo(fs);
            fs.Close();
            fs.Dispose();
            stream.Dispose();
            Console.WriteLine($"Downloaded file {fileName}");
        }
    }
}
