using Application.Commands;
using Application.FileHandlers.Impl;
using Application.Queries;
using DBManipulation.Commands;
using DBManipulation.Queries;
using FileSystemManipulation.Commands;
using FileSystemManipulation.Queries;
using System;
using System.ServiceModel;
using Common.Params;
using Common.Interfaces;
using Common.Enum;
using InMemoryDB.Implementation;
using System.Configuration;
using Common.Util;

namespace Service
{
    class FileHandlingService : IFileHandling
    {
        private string path;
        public FileHandlingService()
        {
            this.path = ConfigurationManager.AppSettings["path"];
            FileDirUtil.CheckCreatePath(path);
        }
        
        [OperationBehavior(AutoDisposeParameters = true)]
        public FileManipulationResults GetFiles(FileManipulationOptions options)
        {
            Console.WriteLine($"Geting files starting with: \"{ options.FileName}\"");
            return new GetFilesHandler(GetFilesQuery(options)).GetFiles();
        }

        [OperationBehavior(AutoDisposeParameters = true)]
        public FileManipulationResults SendFile(FileManipulationOptions options)
        {
            Console.WriteLine($"Receiving file with name: \"{ options.FileName}\"");
            return new InsertFileHandler(GetInsertFileCommand(options)).InsertFile();
        }

        private IQuery GetFilesQuery(FileManipulationOptions options)
        {
            if (options.StorageType == StorageTypes.FileSystem)
            {
                return new FileSystemGetFilesQuery(options, path);
            }
            return new DBGetFilesQuery(InMemoryDataBase.Instance, options);
        }

        private ICommand GetInsertFileCommand(FileManipulationOptions options)
        {
            if (options.StorageType == StorageTypes.FileSystem)
            {
                return new FileSystemInsertFileCommand(options, path);
            }
            return new DBInsertFileCommand(InMemoryDataBase.Instance, options);
        }
    }
}
