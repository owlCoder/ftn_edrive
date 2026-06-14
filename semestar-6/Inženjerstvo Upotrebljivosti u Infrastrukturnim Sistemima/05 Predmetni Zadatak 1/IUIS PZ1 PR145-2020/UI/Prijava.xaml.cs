using Common;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Windows;

namespace UI
{
    public partial class Prijava : Window
    {
        public static List<Korisnik> Korisnici = new List<Korisnik>();
        public static Korisnik UlogovanKorisnik = null;
        public static BindingList<Brabus> Automobili = new BindingList<Brabus>();
        public Prijava()
        {
            InitializeComponent();

            Korisnici.Add(new Korisnik("andrea", "123", true));
            Korisnici.Add(new Korisnik("user", "user", false));

            //Automobili.Add(new Brabus("www.google.com", "D:\\FTN\\IUIS\\IUIS PZ1 PR145-2020\\UI\\resursi\\main.png", "GTS 43", "Ide", 2019));
            Automobili = Sacuvaj.UcitajPodatke();
        }

        private void LoginBtn_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (username.Text.Trim().Equals("") || username.Text.Trim().Equals(string.Empty))
                {
                    MessageBox.Show("Korisničko ime nije popunjeno!\nPokuštajte ponovo!", "Pogrešno popunjena forma!",
                       MessageBoxButton.OK,
                       MessageBoxImage.Error);
                }
                else if (password.Password.Trim().Equals("") || password.Password.Trim().Equals(string.Empty))
                {
                    MessageBox.Show("Korisnička šifra nije popunjena!\nPokuštajte ponovo!", "Pogrešno popunjena forma!",
                       MessageBoxButton.OK,
                       MessageBoxImage.Error);
                }
                else
                {
                    string user_name = username.Text.Trim();
                    string pass_word = password.Password.Trim();
                    bool loginOk = false;

                    foreach (Korisnik k in Korisnici)
                    {
                        if (k.KorisnickoIme.Equals(user_name))
                        {
                            if (k.Lozinka.Equals(pass_word))
                            {
                                UlogovanKorisnik = new Korisnik(k.KorisnickoIme, k.Lozinka, k.Admin);
                                loginOk = true;
                                break;
                            }
                        }
                    }

                    if (loginOk)
                    {
                        PocetnaStranica ps = new PocetnaStranica();
                        Close();
                        ps.ShowDialog();
                    }
                    else
                    {
                        MessageBox.Show("Podaci koje ste uneli nisu validni!\nZa pristup aplikaciji neophodno je da imate aktivan nalog.", "Prijava na sistem",
                        MessageBoxButton.OK,
                        MessageBoxImage.Error);
                        return;
                    }
                }
            }
            catch (Exception)
            { }
        }

        private void ExitBtn_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }
    }
}
