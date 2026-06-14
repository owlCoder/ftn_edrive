using System;
using System.Collections.Generic;
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

namespace Apoteka_OOT.Radnik_Prozori
{
    public partial class dodaj_radnika : Window
    {
        string path_slika = "";
        public dodaj_radnika()
        {
            InitializeComponent();
        }

        private void dodavanje_radnika_Click(object sender, RoutedEventArgs e)
        {
            if (ime.Text.Equals("") || prezime.Text.Equals("") || jmbg.Text.Equals("") || path_slika.Equals(""))
                MessageBox.Show("Popunite sva polja!", "Greska", MessageBoxButton.OK, MessageBoxImage.Error);
            else
            {
                // NE MOZE SE DODATI RADNIK KOJI JE POSTOJECI JMBG
                foreach (Radnik r in MainWindow.Radnici)
                    if (r.Jmbg.Equals(jmbg.Text))
                    {
                        MessageBox.Show("JMBG nije unikatan!", "Upozorenje!", MessageBoxButton.OK, MessageBoxImage.Warning);
                        return;
                    }

                Radnik novi = new Radnik(ime.Text, prezime.Text, jmbg.Text, path_slika);
                MainWindow.Radnici.Add(novi);

                ime.Clear();
                prezime.Clear();
                jmbg.Clear();
                path_slika = "";

                MessageBox.Show("Radnik uspesno dodat!", "Greska", MessageBoxButton.OK, MessageBoxImage.Information);
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
                MessageBox.Show("Niste odabrali sliku " + "radnika" + "!", "Greška!", MessageBoxButton.OK, MessageBoxImage.Error);
                trenutnaPutanja = string.Empty;
            }

            return trenutnaPutanja;
        }
    }
}
