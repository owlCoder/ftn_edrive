using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Vezbe05.Models
{
    public class User
    {
        public string Username { get; set; }
        public string Password { get; set; }
        public UserType Type { get; set; }

        public bool LoggedIn { get; set; }

        public User()
        {
            Username = "";
            Password = "";
            LoggedIn = false;
        }

        public void Logoff()
        {
            Username = "";
            Password = "";
            LoggedIn = false;
        }

        public User(string username, string password, UserType type)
        {
            Username = username;
            Password = password;
            Type = type;
            LoggedIn = false;
        }

        public bool Login()
        {
            if(Users.users.ContainsKey(Username) && Users.users[Username].Password.Equals(Password))
            {
                LoggedIn = true;
            }
            return LoggedIn;
        }

        public bool Register()
        {
            //LoggedIn = true;
            Users.users.Add(Username, this);

            return true;
        }
        public void Logout()
        {

            LoggedIn = false;

        }
    }
}