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

namespace Biblioteka.Korisnici
{
    public partial class UclaniKorisnikaUBiblioteku : Page
    {
        public UclaniKorisnikaUBiblioteku()
        {
            InitializeComponent();

            #region INICIJALIZACIJA DATACONTEXT
            DataContext = this;
            dataGridSviKorisnici.ItemsSource = App.SviKorisnici;
            dataGridSveBiblioteke.ItemsSource = App.Biblioteke;
            #endregion
        }
		
        private void izborKorisnikaBtn_Click(object sender, RoutedEventArgs e)
        {
            App.SelektovaniKorisnik = dataGridSviKorisnici.SelectedItem as Korisnik;

            // Provera da li je izabran neki korisnik
            if (App.SelektovaniKorisnik == null)
            {
                MessageBox.Show("Niste izabrali korisnika!", "Upozorenje!", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            // Omogućavamao korisniku izbor biblioteke
            uclaniKorisnikaBtn.IsEnabled = true;
        }

        private void uclaniKorisnikaBtn_Click(object sender, RoutedEventArgs e)
        {
            App.SelektovanaBiblioteka = dataGridSveBiblioteke.SelectedItem as Biblioteke.Biblioteka;

            // Provera da li je izabrana neka biblioteka
            if (App.SelektovanaBiblioteka == null)
            {
                MessageBox.Show("Niste izabrali biblioteku!", "Upozorenje!", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            int idSelektovane = App.SelektovanaBiblioteka.IdBiblioteke;
            int idSelektovanog = App.SelektovaniKorisnik.IdKorisnika;

            // Promena idBiblioteke za izabranog korisnika, kao i dodavanje datuma učlanjenja
            // Ne prikazuje odmah u listi promenu idBiblioteke
            App.SelektovaniKorisnik.IdBiblioteke = idSelektovane;
            App.SelektovaniKorisnik.DatumUclanjenja = DateTime.Today.ToString("d");

            // Dodavanje izabranog korisnika u listu svih korisnika izabrane biblioteke
            App.SelektovanaBiblioteka.Korisnici.Add(App.SelektovaniKorisnik);

            // Prikazi gde je uclanjen
            App.SelektovaniKorisnik.Uclanjen = App.SelektovanaBiblioteka.Naziv;

            MessageBox.Show("Korisnik je učlanjen u biblioteku.", "Obaveštenje", MessageBoxButton.OK, MessageBoxImage.Information);

            // Cleanup
            dataGridSveBiblioteke.SelectedItem = null;
            dataGridSviKorisnici.SelectedItem = null;
            App.SelektovaniKorisnik = null;
            App.SelektovanaBiblioteka = null;

            uclaniKorisnikaBtn.IsEnabled = false;
        }
    }
}
