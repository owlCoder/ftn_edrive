using Common.InMemoryDatabase;
using Common.Models;

namespace Common.API.Users.UserUpdate
{
    public class UpdateUser : IUpdateUser
    {
        public bool UpdateUserAccount(string uid, User new_user)
        {
            foreach (User u in Database.Users)
            {
                if (u.Username.Equals(uid))
                {
                    User to_update = u;

                    // user exist in database, update it
                    to_update.Username = new_user.Username;
                    to_update.Password = new_user.Password;
                    to_update.IsAdmin = new_user.IsAdmin;
                    AuthService.AuthService.SaveToDiskJson();

                    return true;
                }
            }

            return false;
        }
    }
}
