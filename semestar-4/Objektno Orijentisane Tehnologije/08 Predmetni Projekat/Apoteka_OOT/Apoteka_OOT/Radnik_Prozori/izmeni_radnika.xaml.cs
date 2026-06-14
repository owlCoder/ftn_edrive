using System;
using System.Windows;
using System.Windows.Media.Imaging;

namespace Apoteka_OOT.Radnik_Prozori
{
    public partial class izmeni_radnika : Window
    {
        string path_slika = "";
        public izmeni_radnika()
        {
            InitializeComponent();

            Radnik temp = MainWindow.Referenca_na_odabranog_radnika;

            if (temp != null)
            {
                ime.Text = temp.Ime;
                prezime.Text = temp.Prezime;
                jmbg.Text = temp.Jmbg;
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

        private void izmena_podataka_radnika_Click(object sender, RoutedEventArgs e)
        {
            if (ime.Text.Equals("") || prezime.Text.Equals("") || jmbg.Text.Equals("") || path_slika.Equals(""))
                MessageBox.Show("Popunite sva polja!", "Greska", MessageBoxButton.OK, MessageBoxImage.Error);
            else
            {
                try
                {
                    Radnik izmena = MainWindow.Referenca_na_odabranog_radnika;

                    izmena.Ime = ime.Text;
                    izmena.Prezime = prezime.Text;
                    izmena.Jmbg = jmbg.Text;
                    izmena.Slika = path_slika;
                }
                catch (Exception)
                {
                    MessageBox.Show("Desila se greska prilikom izmene podataka o radniku!", "Greska", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }

                MessageBox.Show("Podaci o radniku uspesno izmenjeni!", "Informacija", MessageBoxButton.OK, MessageBoxImage.Information);
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
                MessageBox.Show("Niste odabrali sliku " + "radnika" + "!", "Greška!", MessageBoxButton.OK, MessageBoxImage.Error);
                trenutnaPutanja = string.Empty;
                profilna_slika.Source = new BitmapImage(new Uri("/Img/placeholder.png", UriKind.Relative));
            }

            return trenutnaPutanja;
        }
    }
}
