using Common.InMemoryDatabase;
using Common.Models;

namespace Common.API.Users.UserDeletion
{
    public class DeleteUser : IDeleteUser
    {
        public bool DeleteUserAccount(string username)
        {
            foreach (User u in Database.Users)
            {
                if (u.Username.Equals(username))
                {
                    Database.Users.Remove(u);
                    return true;
                }
            }

            return false;
        }
    }
}
