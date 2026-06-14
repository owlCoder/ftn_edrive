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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Biblioteka.Biblioteke
{
    public partial class DodavanjeBiblioteke : Page
    {
        private string trenutnaPutanja = string.Empty;
		
        public DodavanjeBiblioteke()
        {
            InitializeComponent();
        }

        private void logoBiblioteke_Click(object sender, RoutedEventArgs e)
        {
            Program.OdabirPutanjeDatoteke odabir = new Program.OdabirPutanjeDatoteke();
            trenutnaPutanja = odabir.Odabir_Putanje("biblioteke", logo);
        }

        private void dodajBtn_Click(object sender, RoutedEventArgs e)
        {
            if (nazivBiblioteke.Text.Equals("") || adresaBiblioteke.Text.Equals("") ||
                godinaOsnivanjaBiblioteke.Text.Equals("") || trenutnaPutanja.Equals(""))
            {
                MessageBox.Show("Niste popunili sva polja!", "Greška!", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            else
            {
                int broj = -1;
                bool uspesno = false;

                try
                {
                    broj = int.Parse(godinaOsnivanjaBiblioteke.Text);
                    uspesno = true;
                }
                catch (Exception)
                {
                    MessageBox.Show("Niste uneli broj!", "Greška!", MessageBoxButton.OK, MessageBoxImage.Error);
                }

                if (uspesno)
                {
                    // Parsiraj ostale podatke
                    Biblioteka nova = new Biblioteka(nazivBiblioteke.Text, adresaBiblioteke.Text, broj, trenutnaPutanja);
                    App.Biblioteke.Add(nova);
                    logo.Source = new BitmapImage(new Uri("/Slike/placeholder.png", UriKind.Relative));

                    MessageBox.Show("Biblioteka uspešno dodata!", "Informacija!", MessageBoxButton.OK, MessageBoxImage.Information);

                    nazivBiblioteke.Clear();
                    adresaBiblioteke.Clear();
                    godinaOsnivanjaBiblioteke.Clear();
                    trenutnaPutanja = string.Empty;
                }
                else
                {
                    MessageBox.Show("Nije moguće dodati biblioteku!", "Greška!", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }
    }
}
