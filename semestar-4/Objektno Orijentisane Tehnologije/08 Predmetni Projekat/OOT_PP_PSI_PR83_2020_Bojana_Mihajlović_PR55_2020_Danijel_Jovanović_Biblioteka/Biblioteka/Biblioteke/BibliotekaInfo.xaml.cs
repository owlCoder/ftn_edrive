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

namespace Biblioteka.Biblioteke
{
    public partial class BibliotekaInfo : Window
    {
        private static string trenutnaPutanja = string.Empty;
		
        public BibliotekaInfo()
        {
            InitializeComponent();

            #region INICIJALNO PODEŠAVANJE SADRŽAJA POLJA FORME
            if (App.SelektovanaBiblioteka != null)
            {
                nazivBiblioteke.Text = App.SelektovanaBiblioteka.Naziv;
                adresaBiblioteke.Text = App.SelektovanaBiblioteka.Adresa;
                godinaOsnivanjaBiblioteke.Text = App.SelektovanaBiblioteka.GodinaOsnivanja.ToString();
                trenutnaPutanja = App.SelektovanaBiblioteka.LogoBiblioteke;
                logo.Source = new BitmapImage(new Uri(trenutnaPutanja, UriKind.Absolute));
            }
            #endregion
        }

        private void logoBiblioteke_Click(object sender, RoutedEventArgs e)
        {
            Program.OdabirPutanjeDatoteke odabir = new Program.OdabirPutanjeDatoteke();
            trenutnaPutanja = odabir.Odabir_Putanje("biblioteke", logo);
        }

        private void Button_Click(object sender, RoutedEventArgs e)
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
                    // Ažuriraj
                    if (App.SelektovanaBiblioteka != null)
                    {
                        App.SelektovanaBiblioteka.Naziv = nazivBiblioteke.Text;
                        App.SelektovanaBiblioteka.Adresa = adresaBiblioteke.Text;
                        App.SelektovanaBiblioteka.GodinaOsnivanja = broj;
                        App.SelektovanaBiblioteka.LogoBiblioteke = trenutnaPutanja;
                        logo.Source = new BitmapImage(new Uri(trenutnaPutanja, UriKind.Absolute));

                        MessageBox.Show("Biblioteka uspešno izmenjena!", "Informacija!", MessageBoxButton.OK, MessageBoxImage.Information);

                        nazivBiblioteke.Clear();
                        adresaBiblioteke.Clear();
                        godinaOsnivanjaBiblioteke.Clear();
                        trenutnaPutanja = string.Empty;

                        if (App.SelektovanaBiblioteka != null)
                        {
                            nazivBiblioteke.Text = App.SelektovanaBiblioteka.Naziv;
                            adresaBiblioteke.Text = App.SelektovanaBiblioteka.Adresa;
                            godinaOsnivanjaBiblioteke.Text = App.SelektovanaBiblioteka.GodinaOsnivanja.ToString();
                            trenutnaPutanja = App.SelektovanaBiblioteka.LogoBiblioteke;
                        }
                    }
                }
                else
                {
                    MessageBox.Show("Nije moguće izmeniti biblioteku!", "Greška!", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }
    }
}
