using Common.Enum;
using Common.Interfaces;
using Common.Util;
using DownloaderClient.Downloading;
using System;
using System.Configuration;
using System.ServiceModel;

namespace DownloaderClient
{
    class Program
    {
        static void Main()
        {
            string downloadPath = ConfigurationManager.AppSettings["downloadPath"];
            FileDirUtil.CheckCreatePath(downloadPath);
            string sStorageType = ConfigurationManager.AppSettings["storageType"];
            if (!Enum.TryParse<StorageTypes>(sStorageType, out StorageTypes storageType))
            {
                Environment.Exit(0);
            }
            ChannelFactory<IFileHandling> factory = new ChannelFactory<IFileHandling>("FileHandlingService");
            IFileHandling proxy = factory.CreateChannel();            
            string s;
            IDownloader downloader = GetDownloader(proxy, downloadPath, storageType);
            do
            {
                Console.WriteLine("Type file name template and Enter to download. Press only Enter for exit");
                s = Console.ReadLine();
                if (s != null && !string.IsNullOrEmpty(s))
                {
                    downloader.Download(s);
                }
            } while (s != null && !string.IsNullOrEmpty(s));
        }

        private static IDownloader GetDownloader(IFileHandling proxy, string path, StorageTypes storageType)
        {
            return new StartNameDownloader(proxy, path, storageType);
        }
    }
}
