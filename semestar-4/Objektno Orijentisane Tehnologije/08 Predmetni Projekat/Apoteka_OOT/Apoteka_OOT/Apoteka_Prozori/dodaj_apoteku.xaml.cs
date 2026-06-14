using System;
using System.Windows;

namespace Apoteka_OOT.Apoteka_Prozori
{
    public partial class dodaj_apoteku : Window
    {
        string path_slika = "";
        public dodaj_apoteku()
        {
            InitializeComponent();
        }

        private void dodavanje_apoteke_Click(object sender, RoutedEventArgs e)
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
                catch(Exception)
                {
                    MessageBox.Show("Godina nije broj!", "Greska", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }

                Apoteka add = new Apoteka(naziv.Text, adresa.Text, g, path_slika);
                MainWindow.Apoteke.Add(add);
                
                path_slika = "";
                naziv.Clear();
                adresa.Clear();
                godina.Clear();

                MessageBox.Show("Apoteka uspesno dodata!", "Informacija", MessageBoxButton.OK, MessageBoxImage.Information);
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
            }
            else
            {
                MessageBox.Show("Niste odabrali sliku " + "apoteke" + "!", "Greška!", MessageBoxButton.OK, MessageBoxImage.Error);
                trenutnaPutanja = string.Empty;
            }

            return trenutnaPutanja;
        }
    }
}
