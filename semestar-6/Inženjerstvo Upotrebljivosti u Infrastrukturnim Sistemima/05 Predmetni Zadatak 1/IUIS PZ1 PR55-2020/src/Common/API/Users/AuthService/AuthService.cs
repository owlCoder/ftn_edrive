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
