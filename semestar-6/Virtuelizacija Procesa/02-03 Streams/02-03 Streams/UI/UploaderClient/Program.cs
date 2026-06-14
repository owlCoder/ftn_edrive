using Common.Enum;
using Common.Interfaces;
using Common.Util;
using System;
using System.Configuration;
using System.ServiceModel;
using UploaderClient.Enums;
using UploaderClient.FileInUseCheck;
using UploaderClient.FileSending;
using UploaderClient.Uploader;

namespace UploaderClient
{
    class Program
    {
        static void Main()
        {
            var uploadPath = ConfigurationManager.AppSettings["uploadPath"];
            FileDirUtil.CheckCreatePath(uploadPath);
            ChannelFactory<IFileHandling> factory = new ChannelFactory<IFileHandling>("FileHandlingService");
            IFileHandling proxy = factory.CreateChannel();
            string sStorageType = ConfigurationManager.AppSettings["storageType"];
            if (!Enum.TryParse(sStorageType, out StorageTypes storageType))
                storageType = StorageTypes.FileSystem;
            Console.WriteLine($"{storageType} is being used.");
            string sUploaderType = ConfigurationManager.AppSettings["uploaderType"];
            if (!Enum.TryParse(sUploaderType, out UploaderTypes uploaderType))
                uploaderType = UploaderTypes.Event;            
            Console.WriteLine($"Upload path: {uploadPath}");
            IUploader uploader = GetUploader(uploaderType, GetFileSender(proxy, GetFileInUseChecker(), storageType, uploadPath), uploadPath);
            uploader.Start();
            Console.WriteLine("Uploader Client is running. Press any key to exit.");
            Console.ReadLine();
            Environment.Exit(0);
        }

        private static IFileInUseChecker GetFileInUseChecker()
        {
            return new FileInUseCommonChecker();
        }

        private static IFileSender GetFileSender(IFileHandling proxy, IFileInUseChecker fileInUseChecker, StorageTypes storageType, string uploadPath)
        {
            return new FileSender(proxy, fileInUseChecker, storageType, uploadPath);
        }

        private static IUploader GetUploader(UploaderTypes uploaderType, IFileSender fileSender, string uploadPath)
        {
            if (uploaderType == UploaderTypes.Background) {
                Console.WriteLine("Background Uploader is being used.");
                return new BackgroundUploader(fileSender);
            }
            Console.WriteLine("Event Uploader is being used.");
            return new EventUploader(fileSender, uploadPath);
        }

        
    }
}
