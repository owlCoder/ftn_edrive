////////////////////////////////////////////////////////////
// Content Managment System Open-Source API v2023.03.23  ///
// Author: owlCoder (https://github.com/owlCoder)        ///
////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////
///////////////////// AUTHENTICATION ///////////////////////
////////////////////////////////////////////////////////////

// Common/API/Authentication/IUserAuthentication.cs
namespace Common.API.Authentication
{
    public interface IUserAuthentication
    {
        bool CheckLogin(string username, string password);
    }
}

// Common/API/Authentication/UserAuthentication.cs
using Common.InMemoryDatabase;
using Common.Models;

namespace Common.API.Authentication
{
    public class UserAuthentication : IUserAuthentication
    {
        public bool CheckLogin(string username, string password)
        {
            bool result = false;

            foreach (User u in Database.Users)
            {
                if (u.Username.Equals(username))
                {
                    // user exist check entered password for match
                    if (u.Password == password)
                    {
                        result = true;
                        Database.AuthenticatedUser = new User(u.Username, u.Password, u.IsAdmin);
                        break;
                    }
                    else
                    {
                        result = false;
                    }
                }
            }

            return result;
        }
    }
}
////////////////////////////////////////////////////////////
/////////////////// END OF AUTHENTICATION //////////////////
////////////////////////////////////////////////////////////
