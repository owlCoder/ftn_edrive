namespace Logger.Interfejsi
{
    public interface ILogPoruka
    {
        string GetInfoMessage(); // info poruka
        string GetWarnMessage(); // warn poruka
        string GetErrorMessage(); // error poruka
    }
}
