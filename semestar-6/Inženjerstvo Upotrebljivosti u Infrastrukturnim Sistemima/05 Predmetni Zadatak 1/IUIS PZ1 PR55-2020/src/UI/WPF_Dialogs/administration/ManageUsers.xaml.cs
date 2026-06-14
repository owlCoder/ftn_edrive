using Common;
using Common.API.Users.AuthService;
using Common.Constants;
using Common.Models;
using System;
using System.Windows;
using UI.WPF_Dialogs.msgBox;

namespace UI.WPF_Dialogs.administration
{
    public partial class ManageUsers : Window
    {
        string old_username = "";
        bool prviPut = true;

        public ManageUsers(User user)
        {
            InitializeComponent();

            Title = Title = ProgramInformation.BussinessName + " " + ProgramInformation.EngineVersion + " | Manage User";

            try
            {
                if (user != null)
                {
                    korisnickoime.Text = user.Username;
                    sifra.Text = user.Password;

                    old_username = korisnickoime.Text;

                    if (user.IsAdmin)
                    {
                        isadmin.SelectedIndex = 0;
                    }
                    else
                    {
                        isadmin.SelectedIndex = 1;
                    }
                }
            }
            catch (Exception exp)
            {
                MsgBox.Show("Interna greška u programu!\n\nERROR: " + exp.Message, "Greška", MsgBoxIcon.Error, MsgBoxIconColor.Error);
            }
        }

        private void DodajBtn_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (prviPut)
                {
                    IzmenaBtn.IsEnabled = false;
                    BrisanjeBtn.IsEnabled = false;
                    korisnickoime.Clear();
                    sifra.Clear();
                    isadmin.SelectedIndex = 0;
                    prviPut = false;
                }
                else
                {
                    if (korisnickoime.Text.Trim().Equals(""))
                    {
                        MsgBox.Show("Greška u popunjavanju forme!", "Korisničko ime ne sme biti prazno!", MsgBoxIcon.Warning, MsgBoxIconColor.Warning);
                        return;
                    }
                    else if (sifra.Text.Trim().Equals(""))
                    {
                        MsgBox.Show("Greška u popunjavanju forme!", "Šifra ne sme biti prazan!", MsgBoxIcon.Warning, MsgBoxIconColor.Warning);
                        return;
                    }

                    bool result = AuthService.Register.AddUser(korisnickoime.Text, sifra.Text, isadmin.SelectedIndex == 0);

                    if (result)
                    {
                        MsgBox.Show("Uspešno dodavanje korisnika", "Korisnik uspešno dodat!", MsgBoxIcon.Information, MsgBoxIconColor.Information);
                        Close();
                        prviPut = true;
                    }
                    else
                    {
                        MsgBox.Show("Neuspešno dodavanje korisnika", "Korisnik nije uspešno dodat!\n\nKorisnik sa datim korisničkim imenom već postoji!!", MsgBoxIcon.Information, MsgBoxIconColor.Information);
                        return;
                    }
                }
            }
            catch (Exception exp)
            {
                MsgBox.Show("Interna greška u programu!\n\nERROR: " + exp.Message, "Greška", MsgBoxIcon.Error, MsgBoxIconColor.Error);
            }
        }

        private void IzmenaBtn_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (korisnickoime.Text.Trim().Equals(""))
                {
                    MsgBox.Show("Greška u popunjavanju forme!", "Korisničko ime ne sme biti prazno!", MsgBoxIcon.Warning, MsgBoxIconColor.Warning);
                    return;
                }
                else if (sifra.Text.Trim().Equals(""))
                {
                    MsgBox.Show("Greška u popunjavanju forme!", "Šifra ne sme biti prazan!", MsgBoxIcon.Warning, MsgBoxIconColor.Warning);
                    return;
                }

                bool result = AuthService.UpdateUser.UpdateUserAccount(old_username, new User(korisnickoime.Text, sifra.Text, isadmin.SelectedIndex == 0));

                if (result)
                {
                    MsgBox.Show("Uspešna izmena korisnika", "Korisnik uspešno izmenjen!\n\nPotrebno je ponovo pokrenuti program!", MsgBoxIcon.Information, MsgBoxIconColor.Information);
                    Close();
                }
                else
                {
                    MsgBox.Show("Greška prilikom čitanja iz baze podataka!", "Baza podataka nije operativna", MsgBoxIcon.Error, MsgBoxIconColor.Error);
                    return;
                }
            }
            catch (Exception exp)
            {
                MsgBox.Show("Interna greška u programu!\n\nERROR: " + exp.Message, "Greška", MsgBoxIcon.Error, MsgBoxIconColor.Error);
            }
        }

        private void BrisanjeBtn_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                MsgBox.Show("Brisanje korisnika", "Da li ste sigurni da želite da se obrišete odabranog korisnika?", MsgBoxIcon.Question, MsgBoxIconColor.Question);

                if (MsgBox.DaPritisnuto)
                {
                    bool result = AuthService.RemoveUser.DeleteUserAccount(old_username);

                    if (result)
                    {
                        MsgBox.Show("Uspešno brisanje korisnika", "Korisnik uspešno obrisan!\n\nPotrebno je ponovo pokrenuti program!", MsgBoxIcon.Information, MsgBoxIconColor.Information);
                        Close();
                    }
                    else
                    {
                        MsgBox.Show("Greška prilikom čitanja iz baze podataka!", "Baza podataka nije operativna", MsgBoxIcon.Error, MsgBoxIconColor.Error);
                        return;
                    }
                }
            }
            catch (Exception exp)
            {
                MsgBox.Show("Interna greška u programu!\n\nERROR: " + exp.Message, "Greška", MsgBoxIcon.Error, MsgBoxIconColor.Error);
            }
        }
    }
}
