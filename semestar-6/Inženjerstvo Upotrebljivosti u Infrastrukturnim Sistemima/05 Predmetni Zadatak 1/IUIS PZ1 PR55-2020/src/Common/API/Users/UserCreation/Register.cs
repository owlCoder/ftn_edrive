using Common.InMemoryDatabase;
using Common.Models;

namespace Common.API.Users.UserCreation
{
    public class Register : IRegister
    {
        public bool AddUser(string username, string password, bool admin)
        {
            foreach (User u in Database.Users)
            {
                if (u.Username.Equals(username))
                {
                    return false;
                }
            }

            Database.Users.Add(new User(username, password, admin));
            AuthService.AuthService.SaveToDiskJson();

            return true;
        }
    }
}
