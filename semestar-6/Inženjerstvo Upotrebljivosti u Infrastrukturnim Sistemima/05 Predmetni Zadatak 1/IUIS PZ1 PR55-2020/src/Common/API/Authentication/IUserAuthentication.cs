namespace Common.API.Authentication
{
    public interface IUserAuthentication
    {
        bool CheckLogin(string username, string password);
    }
}
