using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace Apoteka_OOT.Apoteka_Prozori
{
    public partial class radnici_lekovi_u_apoteci : Window
    {
        public radnici_lekovi_u_apoteci()
        {
            InitializeComponent();

            if(MainWindow.Referenca_na_odabranu_apoteku != null)
            {
                DataContext = this;
                svi_radnici.ItemsSource = MainWindow.Referenca_na_odabranu_apoteku.Radnici;
            }
            
            if(MainWindow.Referenca_na_odabranu_apoteku != null)
            {
                DataContext = this;
                svi_lekovi.ItemsSource = MainWindow.Referenca_na_odabranu_apoteku.Lekovi;
            }
        }

        private void svi_radnici_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Radnik odabran = svi_radnici.SelectedItem as Radnik;

            if (odabran != null)
                MainWindow.Referenca_na_odabranog_radnika = odabran;
            else
                MainWindow.Referenca_na_odabranog_radnika = null;
        }

        private void svi_lekovi_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Lek odabran = svi_lekovi.SelectedItem as Lek;

            if (odabran != null)
                MainWindow.Referenca_na_odabrani_lek = odabran;
            else
                MainWindow.Referenca_na_odabrani_lek = null;
        }
        private void operacije_sa_radnikom_Click(object sender, RoutedEventArgs e)
        {
            if(odabrani_radnik.SelectedItem != null)
            {
                if(odabrani_radnik.SelectedIndex == 0)
                {
                    if(svi_radnici.SelectedItem != null)
                    {
                        MainWindow.Referenca_na_odabranog_radnika = svi_radnici.SelectedItem as Radnik;
                        Radnik_Prozori.izmeni_radnika ir = new Radnik_Prozori.izmeni_radnika();
                        ir.ShowDialog();
                        MainWindow.Referenca_na_odabranog_radnika = null;
                    }
                    else
                    {
                        MessageBox.Show("Odaberite radnika iz liste kako bi pristupili izmeni!", "Upozorenje", MessageBoxButton.OK, MessageBoxImage.Warning);
                    }
                }
                else if(odabrani_radnik.SelectedIndex == 1)
                {
                    if (svi_radnici.SelectedItem == null)
                        MessageBox.Show("Odaberite radnika iz liste kako bi pristupili brisanju!", "Upozorenje", MessageBoxButton.OK, MessageBoxImage.Warning);
                    else
                    {
                        var daNe = MessageBox.Show("Brisanje radnika je NEPOVRATNA OPERACIJA!\n\n" + "Da li ste sigurni?", "Upozorenje o brisanju!", MessageBoxButton.YesNo, MessageBoxImage.Warning);

                        if (daNe == MessageBoxResult.Yes)
                        {
                            try
                            {
                                MainWindow.Referenca_na_odabranu_apoteku.Radnici.Remove(svi_radnici.SelectedItem as Radnik);
                                MessageBox.Show("Radnik uspesno obrisan!", "Informacija", MessageBoxButton.OK, MessageBoxImage.Information);
                            }
                            catch (Exception)
                            {
                                MessageBox.Show("Greska prilikom brisanja radnika!", "Greska", MessageBoxButton.OK, MessageBoxImage.Error);
                            }
                        }
                    }
                }
            }
            svi_radnici.SelectedItem = null;
        }
        private void operacije_sa_lekom_Click(object sender, RoutedEventArgs e)
        {
            if (odabrani_lek.SelectedItem != null)
            {
                if (odabrani_lek.SelectedIndex == 0)
                {
                    if (svi_lekovi.SelectedItem != null)
                    {
                        MainWindow.Referenca_na_odabrani_lek = svi_lekovi.SelectedItem as Lek;
                        Lek_Prozori.izmeni_lek il = new Lek_Prozori.izmeni_lek();
                        il.ShowDialog();
                        MainWindow.Referenca_na_odabrani_lek = null;
                    }
                    else
                    {
                        MessageBox.Show("Odaberite lek iz liste kako bi pristupili izmeni!", "Upozorenje", MessageBoxButton.OK, MessageBoxImage.Warning);
                        return;
                    }
                }
                else if (odabrani_lek.SelectedIndex == 1)
                {
                    if (svi_lekovi.SelectedItem == null)
                        MessageBox.Show("Odaberite lek iz liste kako bi pristupili brisanju!", "Upozorenje", MessageBoxButton.OK, MessageBoxImage.Warning);
                    else
                    {
                        var daNe = MessageBox.Show("Brisanje leka je NEPOVRATNA OPERACIJA!\n\n" + "Da li ste sigurni?", "Upozorenje o brisanju!", MessageBoxButton.YesNo, MessageBoxImage.Warning);

                        if (daNe == MessageBoxResult.Yes)
                        {
                            try
                            {
                                MainWindow.Referenca_na_odabranu_apoteku.Lekovi.Remove(svi_lekovi.SelectedItem as Lek);
                                MessageBox.Show("Lek uspesno obrisan!", "Informacija", MessageBoxButton.OK, MessageBoxImage.Information);
                            }
                            catch (Exception)
                            {
                                MessageBox.Show("Greska prilikom brisanja leka!", "Greska", MessageBoxButton.OK, MessageBoxImage.Error);
                            }
                        }
                    }
                }
            }
            svi_lekovi.SelectedItem = null;
        }

        private void pretraga_radnika_TextChanged(object sender, TextChangedEventArgs e)
        {
            ObservableCollection<Radnik> pronadjeni = new ObservableCollection<Radnik>();

            foreach (Radnik radnik in MainWindow.Referenca_na_odabranu_apoteku.Radnici)
            {
                if (radnik.Ime.ToLower().Contains(pretraga_radnika.Text.ToLower()) ||
                    radnik.Prezime.ToLower().Contains(pretraga_radnika.Text.ToLower()))
                {
                    pronadjeni.Add(radnik);
                }
            }

            svi_radnici.ItemsSource = pronadjeni.ToList();
        }

        private void pretraga_lekova_TextChanged(object sender, TextChangedEventArgs e)
        {
            ObservableCollection<Lek> pronadjeni = new ObservableCollection<Lek>();

            foreach (Lek lek in MainWindow.Referenca_na_odabranu_apoteku.Lekovi)
            {
                if (lek.Naziv.ToLower().Contains(pretraga_lekova.Text.ToLower()) ||
                    lek.Kolicina.ToString().ToLower().Contains(pretraga_lekova.Text.ToLower()))
                {
                    pronadjeni.Add(lek);
                }
            }

            svi_lekovi.ItemsSource = pronadjeni.ToList();
        }
    }
}
