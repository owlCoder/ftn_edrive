namespace Common.API.Users.UserCreation
{
    public interface IRegister
    {
        bool AddUser(string username, string password, bool admin);
    }
}
