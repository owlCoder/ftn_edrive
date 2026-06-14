////////////////////////////////////////////////////////////
// Content Managment System Open-Source API v2023.03.23  ///
// Author: owlCoder (https://github.com/owlCoder)        ///
////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////
////////////////////////// USERS ///////////////////////////
////////////////////////////////////////////////////////////

// Common/API/Users/AuthService/IAuthService.cs
namespace Common.API.Users.AuthService
{
    public interface AuthClientService
    {
        // EMPTY
    }
}

// Common/API/Users/AuthService/AuthService.cs
using Common.API.Users.UserCreation;
using Common.API.Users.UserDeletion;
using Common.API.Users.UserUpdate;
using Common.Constants;
using Common.InMemoryDatabase;
using Common.Models;
using Newtonsoft.Json;
using System.ComponentModel;
using System.IO;

namespace Common.API.Users.AuthService
{
    public static class AuthService
    {
        public static readonly IRegister Register = new Register();
        public static readonly IDeleteUser RemoveUser = new DeleteUser();
        public static readonly IUpdateUser UpdateUser = new UpdateUser();

        public static void SaveToDiskJson()
        {
            using (StreamWriter writer = new StreamWriter(Paths.UsersPath))
            {
                string json = JsonConvert.SerializeObject(Database.Users);
                writer.Write(json);
                writer.Flush();
            }
        }

        public static void LoadFromDiskJson()
        {
            if (File.Exists(Paths.UsersPath))
            {
                string jsonFromFile = File.ReadAllText(Paths.UsersPath);
                Database.Users = JsonConvert.DeserializeObject<BindingList<User>>(jsonFromFile);
            }
        }
    }
}

// Common/API/Users/UserCreation/IRegister.cs
namespace Common.API.Users.UserCreation
{
    public interface IRegister
    {
        bool AddUser(string username, string password, bool admin);
    }
}

// Common/API/Users/UserCreation/Register.cs
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

// Common/API/Users/UserDeletion/IDeleteUser.cs
namespace Common.API.Users.UserDeletion
{
    public interface IDeleteUser
    {
        bool DeleteUserAccount(string username);
    }
}

// Common/API/Users/UserDeletion/DeleteUser.cs
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

// Common/API/Users/UserUpdate/IUpdateUser.cs
using Common.Models;

namespace Common.API.Users.UserUpdate
{
    public interface IUpdateUser
    {
        bool UpdateUserAccount(string uid, User new_user);
    }
}

// Common/API/Users/UserUpdate/UpdateUser.cs
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

////////////////////////////////////////////////////////////
////////////////////// END OF USERS ////////////////////////
////////////////////////////////////////////////////////////

// END OF API EXPOSED METHODS