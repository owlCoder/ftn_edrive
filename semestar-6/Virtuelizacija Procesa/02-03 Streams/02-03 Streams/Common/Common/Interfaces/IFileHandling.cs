using Common.Params;
using System.ServiceModel;

namespace Common.Interfaces
{
    [ServiceContract]
    public interface IFileHandling
    {

        [OperationContract]        
        FileManipulationResults SendFile(FileManipulationOptions options);

        [OperationContract]
        FileManipulationResults GetFiles(FileManipulationOptions options);

        
    }
}
