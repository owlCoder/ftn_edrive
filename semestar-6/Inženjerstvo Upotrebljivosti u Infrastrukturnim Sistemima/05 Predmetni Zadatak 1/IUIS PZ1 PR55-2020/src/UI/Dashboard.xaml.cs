using Common;
using Common.API.Prototypes.PrototypeService;
using Common.Constants;
using Common.InMemoryDatabase;
using Common.Models;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Windows;
using UI.WPF_Dialogs.add;
using UI.WPF_Dialogs.administration;
using UI.WPF_Dialogs.msgBox;

namespace UI
{
    public partial class Dashboard : Window
    {
        public Dashboard()
        {
            InitializeComponent();

            mediaElement.Play();

            Title = Title = ProgramInformation.BussinessName + " " + ProgramInformation.EngineVersion + " | Dashboard";
            welcomeMessage.Content = WelcomeMessages.Message() + Database.AuthenticatedUser.Username + "!";

            // hide add new article and user administration for non auth admin user
            if (Database.AuthenticatedUser == null || !Database.AuthenticatedUser.IsAdmin)
            {
                DodajBtn.Visibility = Visibility.Hidden;
                BrisanjeBtn.Visibility = Visibility.Hidden;
                KorisniciBtn.Visibility = Visibility.Hidden;
            }

            // connect datagrid with binding list
            PrototypeService.LoadFromDiskJson();
            MobilePhones.ItemsSource = Database.Devices;
            MobilePhones.Items.Refresh();
            DataContext = this;
        }

        private void LogOutBtn_Click(object sender, RoutedEventArgs e)
        {
            MsgBox.Show("Izlazak iz CMS?",
                        "Da li želite da izađete iz CMS?\nPotrebno je da se ponovo prijavite na sistem kako bi pristupili sadržaju.",
                        MsgBoxIcon.Question,
                        MsgBoxIconColor.Question);

            var result = MsgBox.DaPritisnuto;

            if (result)
            {
                Login login = new Login();
                Close();
                login.ShowDialog();
            }
        }

        private void MediaElement_MediaEnded(object sender, RoutedEventArgs e)
        {
            mediaElement.Position = new TimeSpan(0, 0, 1);
            mediaElement.Play();
        }

        private void OnHyperlinkClick(object sender, RoutedEventArgs e)
        {
            Process.Start(Database.Devices[MobilePhones.SelectedIndex].ExternalSource);
        }

        private void DodajBtn_Click(object sender, RoutedEventArgs e)
        {
            RtfEdit aw = new RtfEdit(EditModes.Add);
            aw.ShowDialog();
        }

        private void PregledBtn_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                MobileDevice selected = Database.Devices[MobilePhones.SelectedIndex];

                // admin users can edit articles
                if (Database.AuthenticatedUser != null && Database.AuthenticatedUser.IsAdmin)
                {
                    RtfEdit aw = new RtfEdit(EditModes.Edit, selected);
                    aw.ShowDialog();
                }
                else
                {
                    // another ones can just read it
                    RtfEdit aw = new RtfEdit(EditModes.Preview, selected);
                    aw.ShowDialog();
                }
            }
            catch (Exception exp)
            {
                MsgBox.Show("Interna programska greška!", exp.Message, MsgBoxIcon.Error, MsgBoxIconColor.Error);
            }
        }

        private void BrisanjeBtn_Click(object sender, RoutedEventArgs e)
        {
            MsgBox.Show("Brisanje članaka?",
                        "Da li želite da obrišete odabrane članke?\nOva operacija je trajna!",
                        MsgBoxIcon.Question,
                        MsgBoxIconColor.Question);

            var result = MsgBox.DaPritisnuto;

            if (result)
            {
                var zaBrisanje = new List<int>();
                var dcs = Database.Devices;
                for (int i = 0; i < Database.Devices.Count; i++)
                {
                    if (dcs[i].Delete)
                    {
                        zaBrisanje.Add(i);
                    }
                }

                if (zaBrisanje != null && zaBrisanje.Count == 0)
                {
                    MsgBox.Show("Brisanje članaka",
                       "Nije obrisan nijedan prototip iz baze podataka.",
                       MsgBoxIcon.Information,
                       MsgBoxIconColor.Information);
                    return;
                }

                List<MobileDevice> devices = new List<MobileDevice>();
                foreach (int i in zaBrisanje)
                {
                    devices.Add(Database.Devices[i]);
                }

                foreach (MobileDevice device in devices)
                {
                    if (device != null)
                    {
                        PrototypeService.RemovePrototype.RemovePrototype(device.IMEI);
                    }
                }

                MsgBox.Show("Brisanje članaka",
                        "Uspešno ste obrisali " + zaBrisanje.Count + " članaka iz baze podataka!",
                        MsgBoxIcon.Information,
                        MsgBoxIconColor.Information);
            }
        }

        private void KorisniciBtn_Click(object sender, RoutedEventArgs e)
        {
            Users u = new Users();
            u.ShowDialog();
        }
    }
}
