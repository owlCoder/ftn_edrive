using Common;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Windows;

namespace UI
{
    public partial class PocetnaStranica : Window
    {
        public PocetnaStranica()
        {
            InitializeComponent();

            Automobili.ItemsSource = Prijava.Automobili;
            Automobili.Items.Refresh();
            DataContext = this;

            if (!Prijava.UlogovanKorisnik.Admin)
            {
                DodajBtn.Visibility = Visibility.Hidden;
                BrisanjeBtn.Visibility = Visibility.Hidden;
            }
        }

        private void PregledBtn_Click(object sender, RoutedEventArgs e)
        {
            if(Prijava.UlogovanKorisnik.Admin)
            {
                // samo izmena
                Izmena izmena = new Izmena(Prijava.Automobili[Automobili.SelectedIndex]);
                izmena.ShowDialog();
                Automobili.Items.Refresh();

            }
            else
            {
                // samo pregled
                Pregled pregled = new Pregled(Prijava.Automobili[Automobili.SelectedIndex]);
                pregled.ShowDialog();
            }
        }

        private void LogOutBtn_Click(object sender, RoutedEventArgs e)
        {
            var result = MessageBox.Show("Da li želite da izađete?\nPotrebno je da se ponovo prijavite na sistem kako bi pristupili sadržaju.", "Izlazak iz programa?",
                        MessageBoxButton.YesNo,
                        MessageBoxImage.Question);

            if (result == MessageBoxResult.Yes)
            {
                Prijava login = new Prijava();
                Close();
                login.ShowDialog();
            }
        }

        private void BrisanjeBtn_Click(object sender, RoutedEventArgs e)
        {
            var result = MessageBox.Show("Da li želite da obrišete odabrane automobile?", "Brisanje automobila?",
                        MessageBoxButton.YesNo,
                        MessageBoxImage.Question);

            if (result == MessageBoxResult.Yes)
            {
                try
                {
                    IReadOnlyList<Brabus> ukloni = Prijava.Automobili.Where(x => (x.ZaBrisanje == true)).
                                              ToList();

                    foreach (Brabus b in ukloni)
                    {
                        Prijava.Automobili.Remove(b);
                    }

                    // cuvanje podataka na disk
                    Sacuvaj.SacuvajPodatke(Prijava.Automobili);
                    Automobili.Items.Refresh();
                    MessageBox.Show("Uspešno se obrisali " + ukloni.Count + " automobila.", "Uspešno brisanje", MessageBoxButton.OK, MessageBoxImage.Information);
                }
                catch(Exception) { }
            }
        }

        private void DodajBtn_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                Dodavanje dodavanje = new Dodavanje();
                dodavanje.ShowDialog();

                Automobili.Items.Refresh();
            }
            catch (Exception) { }
        }

        private void OnHyperlinkClick(object sender, RoutedEventArgs e)
        {
            Process.Start(Prijava.Automobili[Automobili.SelectedIndex].Hiperlink);
        }
    }
}
