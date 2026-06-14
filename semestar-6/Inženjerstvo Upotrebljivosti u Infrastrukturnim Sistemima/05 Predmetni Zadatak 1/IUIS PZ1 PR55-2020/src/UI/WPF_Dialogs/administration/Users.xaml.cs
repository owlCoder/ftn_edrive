using Common;
using Common.Constants;
using Common.InMemoryDatabase;
using System;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using UI.WPF_Dialogs.msgBox;

namespace UI.WPF_Dialogs.administration
{
    public partial class Users : Window
    {
        public Users()
        {
            InitializeComponent();

            Title = Title = ProgramInformation.BussinessName + " " + ProgramInformation.EngineVersion + " | Users Managment";

            try
            {
                sviKorisnici.ItemsSource = Database.Users;
                sviKorisnici.Items.Refresh();
            }
            catch (Exception exp)
            {
                MsgBox.Show("Interna greška u programu!\n\nERROR: " + exp.Message, "Greška", MsgBoxIcon.Error, MsgBoxIconColor.Error);
            }
        }

        private void SviKorisnici_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            try
            {
                int index = sviKorisnici.SelectedIndex;

                ManageUsers manageUsers = new ManageUsers(Database.Users[index]);
                manageUsers.ShowDialog();

                sviKorisnici.SelectedIndex = -1;
                sviKorisnici.Items.Refresh();
            }
            catch (Exception exp)
            {
                MsgBox.Show("Interna greška u programu!\n\nERROR: " + exp.Message, "Greška", MsgBoxIcon.Error, MsgBoxIconColor.Error);
            }
        }

        private void SviKorisnici_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            e.Handled = true;
        }
    }
}
