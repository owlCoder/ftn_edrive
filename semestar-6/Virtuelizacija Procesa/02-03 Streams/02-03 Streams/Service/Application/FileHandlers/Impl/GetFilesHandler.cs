using Application.Queries;
using Common.Enum;
using Common.Params;
using System;

namespace Application.FileHandlers.Impl
{
    public class GetFilesHandler: IGetFilesHandler
    {
        private readonly IQuery getFilesquery;
        public GetFilesHandler(IQuery getFilesquery)
        {
            this.getFilesquery = getFilesquery;
        }

        public FileManipulationResults GetFiles()
        {
            FileManipulationResults results;
            try
            {
                results = getFilesquery.GetResults();
                if (results.MSs == null || results.MSs.Count == 0)
                {
                    results.ResultType = ResultTypes.Warning;
                    results.ResultMessage = "The query returned 0 files";
                }
                else
                {
                    results.ResultMessage = $"The query returned {results.MSs.Count} files.";
                }
            }
            catch(Exception ex)
            {
                results = new FileManipulationResults
                {
                    ResultType = ResultTypes.Failed,
                    ResultMessage = ex.Message
                };
            }
            return results;
        }
    }
}
