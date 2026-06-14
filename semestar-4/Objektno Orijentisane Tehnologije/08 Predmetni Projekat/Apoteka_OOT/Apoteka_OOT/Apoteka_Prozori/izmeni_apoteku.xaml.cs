using System;
using System.Windows;
using System.Windows.Media.Imaging;

namespace Apoteka_OOT.Apoteka_Prozori
{
    public partial class izmeni_apoteku : Window
    {
        string path_slika = "";
        public izmeni_apoteku()
        {
            InitializeComponent();
            Apoteka temp = MainWindow.Referenca_na_odabranu_apoteku;

            if (temp != null)
            {
                naziv.Text = temp.Naziv;
                adresa.Text = temp.Adresa;
                godina.Text = temp.Godina.ToString();
                path_slika = temp.Slika;

                if (path_slika.Contains("C:") || path_slika.Contains("D:"))
                {
                    profilna_slika.Source = new BitmapImage(new Uri(path_slika, UriKind.Absolute));
                }
                else
                {
                    profilna_slika.Source = new BitmapImage(new Uri(path_slika, UriKind.Relative));
                }
            }
        }

        private void izmena_podataka_o_apoteci_Click(object sender, RoutedEventArgs e)
        {
            if (naziv.Text.Equals("") || adresa.Text.Equals("") || godina.Text.Equals("") || path_slika.Equals(""))
                MessageBox.Show("Popunite sva polja!", "Greska", MessageBoxButton.OK, MessageBoxImage.Error);
            else
            {
                int g = 0;
                try
                {
                    g = int.Parse(godina.Text);
                }
                catch (Exception)
                {
                    MessageBox.Show("Godina nije broj!", "Greska", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }

                try
                {
                    Apoteka izmena = MainWindow.Referenca_na_odabranu_apoteku;

                    izmena.Naziv = naziv.Text;
                    izmena.Adresa = adresa.Text;
                    izmena.Godina = g;
                    izmena.Slika = path_slika;
                }
                catch(Exception)
                {
                    MessageBox.Show("Desila se greska prilikom izmene podataka o apoteci!", "Greska", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }

                MessageBox.Show("Apoteka uspesno izmenjena!", "Informacija", MessageBoxButton.OK, MessageBoxImage.Information);
            }
        }

        private void slika_Click(object sender, RoutedEventArgs e)
        {
            path_slika = Odabir_Putanje();
        }

        public string Odabir_Putanje()
        {
            string trenutnaPutanja = "";
            var dialog = new Microsoft.Win32.OpenFileDialog();
            dialog.FileName = "";
            dialog.DefaultExt = ".png";
            dialog.Filter = "SLIKA (.png)|*.png";

            bool? result = dialog.ShowDialog();

            if (result == true)
            {
                trenutnaPutanja = dialog.FileName;
                profilna_slika.Source = new BitmapImage(new Uri(trenutnaPutanja, UriKind.Absolute));
            }
            else
            {
                MessageBox.Show("Niste odabrali sliku " + "apoteke" + "!", "Greška!", MessageBoxButton.OK, MessageBoxImage.Error);
                trenutnaPutanja = string.Empty;
                profilna_slika.Source = new BitmapImage(new Uri("/Img/placeholder.png", UriKind.Relative));
            }

            return trenutnaPutanja;
        }
    }
}
