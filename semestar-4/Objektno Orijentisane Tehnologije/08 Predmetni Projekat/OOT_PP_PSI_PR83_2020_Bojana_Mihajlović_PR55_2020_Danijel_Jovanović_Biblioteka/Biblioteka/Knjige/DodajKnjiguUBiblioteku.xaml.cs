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

namespace Biblioteka.Knjige
{
    public partial class DodajKnjiguUBiblioteku : Page
    {
        public DodajKnjiguUBiblioteku()
        {
            InitializeComponent();

            #region INICIJALIZACIJA DATACONTEXT
            DataContext = this;
            dataGridSveKnjige.ItemsSource = App.SveKnjige;
            dataGridBiblioteke.ItemsSource = App.Biblioteke;
            #endregion
        }
		
        private void izborKnjigeBtn_Click(object sender, RoutedEventArgs e)
        {
            var odabranaKnjiga = dataGridSveKnjige.SelectedItem as Knjiga;

            if (odabranaKnjiga == null)
            {
                MessageBox.Show("Niste odabrali knjigu!", "Greška", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            dodajUBibliotekuBtn.IsEnabled = true;
        }

        private void dodajUBibliotekuBtn_Click(object sender, RoutedEventArgs e)
        {
            // Ako smo došli do ovog dela koda, znamo da je sigurno izabrana neka knjiga
            var odabranaKnjiga = dataGridSveKnjige.SelectedItem as Knjiga;

            var odabranaBiblioteka = dataGridBiblioteke.SelectedItem as Biblioteke.Biblioteka;

            if (odabranaBiblioteka == null)
            {
                MessageBox.Show("Niste odabrali biblioteku!", "Greška", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }
            else
            {
                // Odabrane su i knjiga i biblioteka
                Knjiga dodaj = new Knjiga(odabranaKnjiga.Naziv, odabranaKnjiga.Autor, odabranaKnjiga.GodinaIzdanja);

                dodaj.IdBiblioteke = odabranaBiblioteka.IdBiblioteke;
                dodaj.IdKnjige = odabranaKnjiga.IdKnjige;
                dodaj.IdKorisnika = odabranaKnjiga.IdKorisnika;
                dodaj.NijeDodata = odabranaBiblioteka.Naziv;
                odabranaKnjiga.NijeDodata = odabranaBiblioteka.Naziv;
                odabranaKnjiga.IdBiblioteke = dodaj.IdBiblioteke;

                odabranaBiblioteka.Knjige.Add(dodaj);
                // NE UKLANJA SE NA KONTU TOGA DA SE U LISTI SVIH KNJIGA PRIKAZUJE 
                // U KOJOJ JE BIBLIOTECI DODATA
                // App.SveKnjige.Remove(odabranaKnjiga);

                MessageBox.Show("Odabrana knjiga dodata u biblioteku!", "Informacija", MessageBoxButton.OK, MessageBoxImage.Information);

                // Cleanup
                dataGridSveKnjige.SelectedItem = null;
                dataGridBiblioteke.SelectedItem = null;

                dodajUBibliotekuBtn.IsEnabled = false;
            }
        }
    }
}
