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
    public partial class PozajmiKnjigu : Page
    {
        public PozajmiKnjigu()
        {
            InitializeComponent();

            #region INICIJALIZACIJA DATACONTEXT
            DataContext = this;
            dataGridSviKorisnici.ItemsSource = App.SviKorisnici;
            #endregion
        }
		
        private void izborKorisnikaBtn_Click(object sender, RoutedEventArgs e)
        {
            App.SelektovaniKorisnik = dataGridSviKorisnici.SelectedItem as Korisnik; 

            if (App.SelektovaniKorisnik == null)
            {
                MessageBox.Show("Niste izabrali korisnika!", "Upozorenje!", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            // Tražimo u kojoj biblioteci je izabrani korisnik i prikazujemo knjige koje su u njoj dostupne
            int brojacProlaza = 0;
            if (App.SelektovaniKorisnik != null)
            {
                // Tek kada se selektuje korisnik se omogućava izbor biblioteke
                pozajmiKnjiguBtn.IsEnabled = true;

                foreach (Biblioteke.Biblioteka b in App.Biblioteke)
                {
                    if (App.SelektovaniKorisnik.IdBiblioteke == b.IdBiblioteke)
                    {
                        dataGridDostupneKnjige.ItemsSource = b.Knjige;
                        break;
                    }
                    brojacProlaza++;
                }
            }

            if (brojacProlaza == App.Biblioteke.Count)
            {
                MessageBox.Show("Odabrana biblioteka nema dostupnih knjiga!", "Upozorenje", MessageBoxButton.OK, MessageBoxImage.Warning);
                pozajmiKnjiguBtn.IsEnabled = false;
                return;
            }
        }

        private void pozajmiKnjiguBtn_Click(object sender, RoutedEventArgs e)
        {
            App.SelektovanaKnjiga = dataGridDostupneKnjige.SelectedItem as Knjige.Knjiga;

            // Odnosi se na korisnika - u kojoj je biblioteci učlanjen
            Biblioteke.Biblioteka clanstvo = null;

            if (App.Biblioteke == null || App.SelektovaniKorisnik == null)
            {
                return;
            }

            if (App.SelektovanaKnjiga == null)
            {
                MessageBox.Show("Niste izabrali ni jednu knjigu!", "Upozorenje!", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }

            // Pronalazimo u kojoj je biblioteci korisnik
            foreach (Biblioteke.Biblioteka b in App.Biblioteke)
            {
                if (b.IdBiblioteke == App.SelektovaniKorisnik.IdBiblioteke)
                {
                    clanstvo = b;
                    break;
                }
            }

            if (clanstvo == null)
                return;

            int idSelektovane = App.SelektovanaKnjiga.IdKnjige;

            // Knjiga se brise kada se uzme
            foreach (Knjige.Knjiga k in clanstvo.Knjige)
            {
                if (k.IdKnjige == idSelektovane)
                {
                    k.NijeDodata = clanstvo.Naziv;
                    clanstvo.Knjige.Remove(k);
                    break;
                }
            }

            MessageBox.Show("Korisnik je pozajmio knjigu.", "Obaveštenje", MessageBoxButton.OK, MessageBoxImage.Information);

            // Cleanup
            dataGridSviKorisnici.SelectedItem = null;
            dataGridDostupneKnjige.SelectedItem = null;
            App.SelektovaniKorisnik = null;
            App.SelektovanaKnjiga = null;
            dataGridDostupneKnjige.ItemsSource = null;

            pozajmiKnjiguBtn.IsEnabled = false;
        }
    }
}
