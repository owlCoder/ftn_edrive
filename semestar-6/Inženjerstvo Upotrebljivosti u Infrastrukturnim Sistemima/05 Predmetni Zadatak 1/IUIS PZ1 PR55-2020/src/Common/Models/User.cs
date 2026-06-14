namespace Common.Models
{
    public class User
    {
        public string Username { get; set; }
        public string Password { get; set; }
        public bool IsAdmin { get; set; }
        public string Admin { get; set; }

        public User(string username = "user", string password = "user", bool isAdmin = false)
        {
            Username = username;
            Password = password;
            IsAdmin = isAdmin;

            if (IsAdmin)
            {
                Admin = "Ima editorska prava";
            }
            else
            {
                Admin = "Nema editorska prava";
            }
        }
    }
}
