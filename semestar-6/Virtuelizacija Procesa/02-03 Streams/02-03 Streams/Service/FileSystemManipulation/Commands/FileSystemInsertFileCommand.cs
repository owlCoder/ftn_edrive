using Application.Commands;
using Common.Exception;
using System.IO;
using Common.Params;

namespace FileSystemManipulation.Commands
{
    public class FileSystemInsertFileCommand : ICommand
    {
        private readonly FileManipulationOptions options;
        private readonly string path;

        public FileSystemInsertFileCommand(FileManipulationOptions options, string path)
        {
            this.options = options;
            this.path = path;
        }

        public void Execute()
        {
            if (options.MS == null || options.MS.Length == 0)
            {
                throw new IncorrectDataException("Memory stream does not contain data!");
            }
            string filePath = $"{path}\\{options.FileName}";
            InsertFile(filePath,options.MS);
            options.Dispose();
        }

        /// <summary>
        /// Metod treba da kreira datoteku od memory stream-a i da je sacuva
        /// na prosledjenoj lokaciji
        /// </summary>
        /// <param name="fileName"></param>
        /// <param name="ms"></param>
        void InsertFile(string fileName, MemoryStream ms)
        {
            //IMPLEMENTIRATI
            using (FileStream fs = new FileStream(fileName, FileMode.Create, System.IO.FileAccess.Write))
            {
                ms.WriteTo(fs);
                fs.Close();
                fs.Dispose();
                ms.Dispose();
            }
        }
    }
}
