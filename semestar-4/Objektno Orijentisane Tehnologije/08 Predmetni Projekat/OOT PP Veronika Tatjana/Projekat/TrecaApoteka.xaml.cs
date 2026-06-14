using System;
using System.Collections.ObjectModel;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media.Imaging;

namespace Projekat
{

    public partial class TrecaApoteka : Window
    {
        public TrecaApoteka()
        {
            InitializeComponent();
            DataContext = this;
            listaRadnika.ItemsSource = App.Treca_apoteka.Radnici;

            DataContext = this;
            listaLekova.ItemsSource = App.Treca_apoteka.Lekovi;
        }

        private void pretragaRadnika_TextChanged(object sender, TextChangedEventArgs e)
        {
            // pretraga
            ObservableCollection<Radnik> pronadjeni = new ObservableCollection<Radnik>();

            foreach (Radnik radnik in App.Treca_apoteka.Radnici)
            {
                if (radnik.Ime.ToLower().Contains(pretragaRadnika.Text.ToLower()) ||
                    radnik.Prezime.ToLower().Contains(pretragaRadnika.Text.ToLower()))
                {
                    pronadjeni.Add(radnik);
                }
            }

            listaRadnika.ItemsSource = pronadjeni.ToList();
        }

        private void listaRadnika_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (listaRadnika.SelectedItem != null)
            {
                Radnik r = listaRadnika.SelectedItem as Radnik;

                ime.Text = r.Ime;
                prezime.Text = r.Prezime;
                jmbg.Text = r.Jmbg;
                datum.Text = r.DatumPocetkaRada;
                slika.Source = new BitmapImage(new Uri(r.Slika, UriKind.Relative));

                izmeniRadnikaUApoteci.Visibility = Visibility.Visible;
                dodajUApotekuRadnika.Visibility = Visibility.Hidden;
                forma.Visibility = Visibility.Visible;

                obrisiRadnika.IsEnabled = true;
            }
            else
            {
                obrisiRadnika.IsEnabled = false;
                ime.Clear();
                prezime.Clear();
                jmbg.Clear();
                datum.Clear();

                forma.Visibility = Visibility.Hidden;
                izmeniRadnikaUApoteci.Visibility = Visibility.Hidden;
                dodajUApotekuRadnika.Visibility = Visibility.Hidden;
                obrisiRadnika.IsEnabled = false;
            }
        }

        private void dodajRadnika_Click(object sender, RoutedEventArgs e)
        {
            forma.Visibility = Visibility.Visible;
            dodajUApotekuRadnika.Visibility = Visibility.Visible;
            izmeniRadnikaUApoteci.Visibility = Visibility.Hidden;

            listaRadnika.SelectedItem = null;
            ime.Clear();
            prezime.Clear();
            jmbg.Clear();
            datum.Clear();
        }

        private void obrisiRadnika_Click(object sender, RoutedEventArgs e)
        {
            forma.Visibility = Visibility.Hidden;
            dodajUApotekuRadnika.Visibility = Visibility.Hidden;

            if (listaRadnika.SelectedItem != null)
            {
                Radnik r = listaRadnika.SelectedItem as Radnik;

                // poruka o potvrdi
                var daNe = MessageBox.Show("Brisanje radnika je NEPOVRATNA OPERACIJA!\n" +
                "\n\n" +
                "Da li ste sigurni?", "Upozorenje o brisanju!", MessageBoxButton.YesNo, MessageBoxImage.Warning);

                if (daNe == MessageBoxResult.Yes)
                {
                    App.Treca_apoteka.Radnici.Remove(r);
                    MessageBox.Show("Radnik izbrisan iz apoteke Stanković!", "Informacjia", MessageBoxButton.OK, MessageBoxImage.Information);
                }
            }
        }

        private void dodajUApotekuRadnika_Click(object sender, RoutedEventArgs e)
        {
            if (ime.Text.Equals("") || prezime.Text.Equals("") || jmbg.Text.Equals("") || datum.Text.Equals(""))
            {
                MessageBox.Show("Niste popunili sva polja!", "Greška!", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            else
            {
                Radnik novi = new Radnik(ime.Text, prezime.Text, jmbg.Text, "/Images/placeholder.png", datum.Text);
                App.Treca_apoteka.Radnici.Add(novi);
                ime.Clear();
                prezime.Clear();
                jmbg.Clear();
                datum.Clear();
                listaRadnika.SelectedItem = null;
                obrisiRadnika.IsEnabled = false;
                MessageBox.Show("Novi radnik dodat u apoteku Stanković!", "Informacjia", MessageBoxButton.OK, MessageBoxImage.Information);
            }
        }

        private void izmeniRadnikaUApoteci_Click(object sender, RoutedEventArgs e)
        {
            if (ime.Text.Equals("") || prezime.Text.Equals("") || jmbg.Text.Equals("") || datum.Text.Equals(""))
            {
                MessageBox.Show("Niste popunili sva polja!", "Greška!", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            else
            {
                Radnik r = listaRadnika.SelectedItem as Radnik;
                if (r != null)
                {
                    r.Ime = ime.Text;
                    r.Prezime = prezime.Text;
                    r.Jmbg = jmbg.Text;
                    r.DatumPocetkaRada = datum.Text;

                    ime.Clear();
                    prezime.Clear();
                    jmbg.Clear();
                    datum.Clear();
                    forma.Visibility = Visibility.Hidden;
                    listaRadnika.SelectedItem = null;

                    MessageBox.Show("Radnik uspešno izmenjen u apoteci Stanković!", "Informacjia", MessageBoxButton.OK, MessageBoxImage.Information);
                }
            }
        }
        /// LEKOVI
        private void dodajLek_Click(object sender, RoutedEventArgs e)
        {
            forma_lekovi.Visibility = Visibility.Visible;
            dodajLekUApoteku.Visibility = Visibility.Visible;
            izmeniLekIzApoteke.Visibility = Visibility.Hidden;

            listaLekova.SelectedItem = null;
            naziv.Clear();
            datumProizvodnje.Clear();
            datumVazenja.Clear();
            kolicina.Clear();
        }

        private void obrisiLek_Click(object sender, RoutedEventArgs e)
        {
            forma_lekovi.Visibility = Visibility.Hidden;
            dodajLekUApoteku.Visibility = Visibility.Hidden;

            if (listaLekova.SelectedItem != null)
            {
                Lek l = listaLekova.SelectedItem as Lek;

                // poruka o potvrdi
                var daNe = MessageBox.Show("Brisanje leka je NEPOVRATNA OPERACIJA!\n" +
                "\n\n" +
                "Da li ste sigurni?", "Upozorenje o brisanju!", MessageBoxButton.YesNo, MessageBoxImage.Warning);

                if (daNe == MessageBoxResult.Yes)
                {
                    App.Treca_apoteka.Lekovi.Remove(l);
                    MessageBox.Show("Lek izbrisan iz apoteke Stanković!", "Informacjia", MessageBoxButton.OK, MessageBoxImage.Information);
                }
            }
        }
        private void dodajLekUApoteku_Click(object sender, RoutedEventArgs e)
        {
            if (naziv.Text.Equals("") || datumProizvodnje.Text.Equals("") || datumVazenja.Text.Equals("") || kolicina.Equals(""))
            {
                MessageBox.Show("Niste popunili sva polja!", "Greška!", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            else
            {
                int kol;
                try
                {
                    kol = int.Parse(kolicina.Text);

                    if (kol < 0)
                        kol = 0;
                }
                catch (Exception)
                {
                    MessageBox.Show("Niste uneli broj!", "Nije unet broj!", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }

                Lek novi = new Lek(naziv.Text, datumProizvodnje.Text, datumVazenja.Text, kol);
                App.Treca_apoteka.Lekovi.Add(novi);
                naziv.Clear();
                datumProizvodnje.Clear();
                datumVazenja.Clear();
                kolicina.Clear();
                listaLekova.SelectedItem = null;
                obrisiLek.IsEnabled = false;
                MessageBox.Show("Novi lek dodat u apoteku Stanković!", "Informacjia", MessageBoxButton.OK, MessageBoxImage.Information);
            }
        }

        private void izmeniLekIzApoteke_Click(object sender, RoutedEventArgs e)
        {
            if (naziv.Text.Equals("") || datumProizvodnje.Text.Equals("") || datumVazenja.Text.Equals("") || kolicina.Equals(""))
            {
                MessageBox.Show("Niste popunili sva polja!", "Greška!", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            else
            {
                int kol;
                try
                {
                    kol = int.Parse(kolicina.Text);

                    if (kol < 0)
                        kol = 0;
                }
                catch (Exception)
                {
                    MessageBox.Show("Niste uneli broj!", "Nije unet broj!", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }

                Lek l = listaLekova.SelectedItem as Lek;

                if (l != null)
                {
                    naziv.Text = l.Naziv;
                    datumProizvodnje.Text = l.DatumProizvodnje;
                    datumVazenja.Text = l.DatumVazenja;
                    kolicina.Text = l.Kolicina.ToString();

                    naziv.Clear();
                    datumProizvodnje.Clear();
                    datumVazenja.Clear();
                    kolicina.Clear();
                    listaLekova.SelectedItem = null;
                    obrisiLek.IsEnabled = false;
                    forma_lekovi.Visibility = Visibility.Hidden;

                    MessageBox.Show("Lek uspešno izmenjen u apoteci Stanković!", "Informacjia", MessageBoxButton.OK, MessageBoxImage.Information);
                }
            }
        }

        private void listaLekova_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (listaLekova.SelectedItem != null)
            {
                Lek l = listaLekova.SelectedItem as Lek;

                naziv.Text = l.Naziv;
                datumProizvodnje.Text = l.DatumProizvodnje;
                datumVazenja.Text = l.DatumVazenja;
                kolicina.Text = l.Kolicina.ToString();

                izmeniLekIzApoteke.Visibility = Visibility.Visible;
                dodajLekUApoteku.Visibility = Visibility.Hidden;
                forma_lekovi.Visibility = Visibility.Visible;

                obrisiLek.IsEnabled = true;
            }
            else
            {
                obrisiLek.IsEnabled = false;
                naziv.Clear();
                kolicina.Clear();
                datumVazenja.Clear();
                datumProizvodnje.Clear();

                forma_lekovi.Visibility = Visibility.Hidden;
                izmeniLekIzApoteke.Visibility = Visibility.Hidden;
                dodajLekUApoteku.Visibility = Visibility.Hidden;
                obrisiLek.IsEnabled = false;
            }
        }

        private void pretragaLekova_TextChanged(object sender, TextChangedEventArgs e)
        {
            ObservableCollection<Lek> pronadjeni = new ObservableCollection<Lek>();

            foreach (Lek lek in App.Treca_apoteka.Lekovi)
            {
                if (lek.Naziv.ToLower().Contains(pretragaLekova.Text.ToLower()))
                {
                    pronadjeni.Add(lek);
                }
            }

            listaLekova.ItemsSource = pronadjeni.ToList();
        }
    }
}
