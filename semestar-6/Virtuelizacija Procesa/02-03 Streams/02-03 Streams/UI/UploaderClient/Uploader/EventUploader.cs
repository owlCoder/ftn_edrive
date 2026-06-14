using System;
using System.IO;
using UploaderClient.FileSending;

namespace UploaderClient.Uploader
{
    public class EventUploader: IUploader
    {
        private FileSystemWatcher inputFileWatcher;
        private readonly IFileSender fileSender;
        public EventUploader(IFileSender fileSender, string path)
        {
            CreateFileSystemWatcher(path);
            this.fileSender = fileSender;
        }

        private void FileCreated(object sender, FileSystemEventArgs e)
        {
            var filePath = e.FullPath;
            try
            {
                fileSender.SendFile(filePath);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }

        /// <summary>
        /// Metod treba da kreira i parametrizuje objekat inputFileWatcher
        /// inputFileWatcher treba da osluskuje file system na prosledjenoj lokaciji
        /// Ukoliko je na prosledjenu lokaciju dodata nova datoteka, metod FileCreated treba da bude pozvan.
        /// </summary>
        /// <param name="path"></param>
        private void CreateFileSystemWatcher(string path)
        {
            //IMPLEMENTIRATI
            inputFileWatcher = new FileSystemWatcher(path)
            {
                IncludeSubdirectories = false,
                InternalBufferSize = 32768, // 32 KB
                Filter = "*.*", // this is the default            
                NotifyFilter = NotifyFilters.FileName
            };
            inputFileWatcher.Created += FileCreated;
        }

        public void Start()
        {
            fileSender.SendFiles();
            inputFileWatcher.EnableRaisingEvents = true;
        }
    }
}
