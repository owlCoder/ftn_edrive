namespace UploaderClient.FileInUseCheck
{
    public interface IFileInUseChecker
    {
        bool IsFileInUse(string filePath);
    }
}
