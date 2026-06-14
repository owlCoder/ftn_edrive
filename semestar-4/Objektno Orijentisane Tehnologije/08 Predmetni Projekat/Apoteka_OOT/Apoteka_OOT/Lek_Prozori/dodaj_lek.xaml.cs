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

namespace Apoteka_OOT.Lek_Prozori
{
    public partial class dodaj_lek : Window
    {
        public dodaj_lek()
        {
            InitializeComponent();
        }

        private void dodavanje_leka_Click(object sender, RoutedEventArgs e)
        {
            if(naziv.Text.Equals("") || datum_proizvodnje.Text.Equals("") || datum_vazenja.Text.Equals("") || kolicina.Text.Equals(""))
                MessageBox.Show("Popunite sva polja!", "Greska", MessageBoxButton.OK, MessageBoxImage.Error);
            else
            {
                int k = 0;
                try
                {
                    k = int.Parse(kolicina.Text);
                }
                catch (Exception)
                {
                    MessageBox.Show("Kolicina nije broj!", "Greska", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }

                Lek add = new Lek(naziv.Text, datum_proizvodnje.Text, datum_vazenja.Text, k);
                MainWindow.Lekovi.Add(add);

                naziv.Clear();
                datum_proizvodnje.Clear();
                datum_vazenja.Clear();
                kolicina.Clear();

                MessageBox.Show("Lek uspesno dodat!", "Informacija", MessageBoxButton.OK, MessageBoxImage.Information);
            }
        }
    }
}
