using Common.Models;

namespace Common.API.Users.UserUpdate
{
    public interface IUpdateUser
    {
        bool UpdateUserAccount(string uid, User new_user);
    }
}
