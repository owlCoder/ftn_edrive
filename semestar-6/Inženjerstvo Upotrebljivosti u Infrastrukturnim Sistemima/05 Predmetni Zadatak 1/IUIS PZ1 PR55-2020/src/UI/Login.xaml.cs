using Common;
using Common.API.Authentication;
using Common.API.Users.AuthService;
using Common.Constants;
using System;
using System.IO;
using System.Windows;
using UI.WPF_Dialogs.msgBox;

namespace UI
{
    public partial class Login : Window
    {
        public Login()
        {
            InitializeComponent();

            // video bg
            mediaElement.Play();

            Title = ProgramInformation.BussinessName + " " + ProgramInformation.EngineVersion + " | Login";
            labelelaCopy.Content = ProgramInformation.BussinessName + " v" + ProgramInformation.EngineVersion
                + " " + ProgramInformation.Copyright;


            // if paths doenst exist - create them
            if (!Directory.Exists(Paths.RtfPath))
            {
                Directory.CreateDirectory(Paths.RtfPath);
            }

            if (!Directory.Exists(Paths.DbsPath))
            {
                Directory.CreateDirectory(Paths.DbsPath);
            }

            if (!Directory.Exists(Paths.ImgPath))
            {
                Directory.CreateDirectory(Paths.ImgPath);
            }

            try
            {
                AuthService.LoadFromDiskJson();
            }
            catch (Exception)
            {
                MsgBox.Show("Greška prilikom čitanja iz baze podataka!", "Baza podataka nije operativna", MsgBoxIcon.Error, MsgBoxIconColor.Error);
            }
        }

        private void LoginBtn_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (username.Text.Trim().Equals("") || username.Text.Trim().Equals(string.Empty))
                {
                    MsgBox.Show("Pogrešno popunjena forma!",
                       "Korisničko ime nije popunjeno!\nPokuštajte ponovo!",
                       MsgBoxIcon.Warning,
                       MsgBoxIconColor.Warning);
                }
                else if (password.Password.Trim().Equals("") || password.Password.Trim().Equals(string.Empty))
                {
                    MsgBox.Show("Pogrešno popunjena forma!",
                       "Korisnička šifra nije popunjena!\nPokuštajte ponovo!",
                       MsgBoxIcon.Warning,
                       MsgBoxIconColor.Warning);
                }
                else
                {
                    // nor username and password are filled with values
                    string user_name = username.Text.Trim();
                    string pass_word = password.Password.Trim();

                    bool loginOk = new UserAuthentication().CheckLogin(user_name, pass_word);

                    if (loginOk)
                    {
                        // open new window
                        Dashboard dashboard = new Dashboard();

                        // dismiss login window
                        Close();

                        dashboard.ShowDialog();
                    }
                    else
                    {
                        MsgBox.Show("Autentifikacija na sistem",
                        "Podaci koje ste uneli nisu validni!\nZa pristup aplikaciji neophodno je da imate aktivan nalog.",
                        MsgBoxIcon.Warning,
                        MsgBoxIconColor.Warning);
                        return;
                    }
                }
            }
            catch (Exception exp)
            {
                MsgBox.Show("Interna programska greška!", exp.Message, MsgBoxIcon.Error, MsgBoxIconColor.Error);
                return;
            }
        }

        private void ExitBtn_Click(object sender, RoutedEventArgs e)
        {
            MsgBox.Show("Izlazak iz programa?",
                        "Da li želite da izađete iz programa?\nZa pristup aplikaciji neophodno je ponovo pokrenuti aplikaciju.",
                        MsgBoxIcon.Question,
                        MsgBoxIconColor.Question);

            var result = MsgBox.DaPritisnuto;

            if (result)
            {
                Close();
            }
        }

        private void mediaElement_MediaEnded(object sender, RoutedEventArgs e)
        {
            mediaElement.Position = new TimeSpan(0, 0, 1);
            mediaElement.Play();
        }
    }
}
