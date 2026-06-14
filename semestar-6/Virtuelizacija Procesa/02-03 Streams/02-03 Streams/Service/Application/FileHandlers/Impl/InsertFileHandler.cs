using Application.Commands;
using Common.Enum;
using Common.Params;
using System;

namespace Application.FileHandlers.Impl
{
    public class InsertFileHandler : IInsertFileHandler
    {
        private readonly ICommand insertFileCommand;


        public InsertFileHandler(ICommand insertFileCommand)
        {
            this.insertFileCommand = insertFileCommand;
        }

        public FileManipulationResults InsertFile()
        {
            FileManipulationResults results = new FileManipulationResults();
            try
            {
                insertFileCommand.Execute();
            }
            catch(Exception ex)
            {
                results.ResultType = ResultTypes.Failed;
                results.ResultMessage = ex.Message;
            }
            return results;
        }
    }
}
