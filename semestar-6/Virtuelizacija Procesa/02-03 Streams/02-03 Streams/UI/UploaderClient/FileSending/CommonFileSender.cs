using Common.Enum;
using Common.Interfaces;
using Common.Params;
using Common.Util;
using System;
using System.Collections.Concurrent;
using System.IO;
using System.Linq;
using UploaderClient.FileInUseCheck;

namespace UploaderClient.FileSending
{
    public class FileSender : IFileSender
    {
        private readonly ConcurrentBag<string> importedFiles = new ConcurrentBag<string>();

        private readonly StorageTypes storageType;
        private readonly string path;
        private readonly IFileHandling proxy;
        private readonly IFileInUseChecker fileInUseChecker;
        public FileSender(IFileHandling proxy, IFileInUseChecker fileInUseChecker, StorageTypes storageType, string uploadPath)
        {
            this.storageType = storageType;
            this.path = uploadPath;
            this.proxy = proxy;
            this.fileInUseChecker = fileInUseChecker;
        }

        public void SendFiles()
        {
            string[] files = FileDirUtil.GetAllFiles(path);
            foreach (string filePath in files)
            {
                SendFile(filePath);
            }
        }

        public void SendFile(string filePath)
        {
            if (importedFiles.Contains(filePath))
            {
                Console.WriteLine($"File {Path.GetFileName(filePath)} has already been uploaded.");
                DeleteFile(filePath);
                return;
            }
            var fileName = Path.GetFileName(filePath);
            FileManipulationOptions options = new FileManipulationOptions(GetMemoryStream(filePath), fileName, storageType);
            var res = proxy.SendFile(options);
            options.Dispose();
            if (res.ResultType == ResultTypes.Failed)
            {
                Console.WriteLine($"Upload file {fileName} unsuccesful. Error message: {res.ResultMessage}");
            }
            else
            {
                if (res.ResultType == ResultTypes.Warning)
                {
                    Console.WriteLine($"Upload file {fileName} imported with warning: {res.ResultMessage}");
                }
                else
                {
                    Console.WriteLine($"Upload file {fileName} imported succesfully.");
                }
                importedFiles.Add(filePath);
            }
            DeleteFile(filePath);
        }

        /// <summary>
        /// Metoda treba da procita datoteku sa prosledjenom lokacijom i kreira i vrati memory stream
        /// Mora se voditi racuna o tome da li je datoteka trenutno zauzeta nekim drugim procesom
        /// </summary>
        /// <param name="filePath"></param>
        /// <returns></returns>
        private MemoryStream GetMemoryStream(string filePath)
        {
            // IMPLEMENTIRATI
            MemoryStream ms = new MemoryStream();
            if (fileInUseChecker.IsFileInUse(filePath))
            {
                Console.WriteLine($"Cannot process the file {Path.GetFileName(filePath)}. It's being in use by another process or it has been deleted.");
                return ms;
            }

            using (FileStream fileStream = new FileStream(filePath, FileMode.Open, FileAccess.Read))
            {
                fileStream.CopyTo(ms);
                fileStream.Close();
            }
            return ms;
        }

        /// <summary>
        /// Metod treba da izbrise datoteku sa prosledjenom lokacijom.
        /// Mora se voditi racuna o tome da li je datoteka trenutno zauzeta nekim drugim procesom
        /// </summary>
        /// <param name="filePath"></param>
        private void DeleteFile(string filePath)
        {
            // IMPLEMENTIRATI
            if (fileInUseChecker.IsFileInUse(filePath))
            {
                Console.WriteLine($"Cannot delete the file {Path.GetFileName(filePath)}. It's being in use by another process or it has been already deleted.");
                return;
            }
            File.Delete(filePath);
        }
    }
}
