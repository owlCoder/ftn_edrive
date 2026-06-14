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

namespace Biblioteka.Korisnici
{
    public partial class KorisnikInfo : Window
    {
        private static string trenutnaPutanja = string.Empty;
		
        public KorisnikInfo()
        {
            InitializeComponent();

            #region INICIJALIZACIJA PODATAKA O KORISNIKU
            if (App.SelektovaniKorisnik != null)
            {
                imeKorisnika.Text = App.SelektovaniKorisnik.Ime;
                prezimeKorisnika.Text = App.SelektovaniKorisnik.Prezime;
                datumUclanjenjaKorisnika.Text = App.SelektovaniKorisnik.DatumUclanjenja;
                jmbgKorisnika.Text = App.SelektovaniKorisnik.Jmbg;
                trenutnaPutanja = App.SelektovaniKorisnik.ProfilnaSlika;
                slika.Source = new BitmapImage(new Uri(trenutnaPutanja, UriKind.Absolute));

                // Ako do sad nije učlanjen, ne sme se menjati datum učlanjenja
                if (App.SelektovaniKorisnik.IdBiblioteke == -1)
                {
                    datumUclanjenjaKorisnika.IsEnabled = false;
                }
                else
                {
                    datumUclanjenjaKorisnika.IsEnabled = true;
                }
            }
            #endregion
        }

        private void slikaKorisnika_Click(object sender, RoutedEventArgs e)
        {
            Program.OdabirPutanjeDatoteke odabir = new Program.OdabirPutanjeDatoteke();
            trenutnaPutanja = odabir.Odabir_Putanje("korisnika", slika);
        }

        private void izmeniKorisnikaBtn_Click(object sender, RoutedEventArgs e)
        {
            // datumUclanjenjaKorisnika sme da bude prazan string, ostali ne smeju
            if (imeKorisnika.Text.Equals("") || prezimeKorisnika.Text.Equals("") || jmbgKorisnika.Text.Equals("") || trenutnaPutanja.Equals(""))
            {
                MessageBox.Show("Niste popunili sva polja!", "Greška!", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            else
            {
                if (App.SelektovaniKorisnik != null)
                {
                    // Zaštita za JMBG (long može više od 10 cifara)
                    long broj = 0;

                    try
                    {
                        broj = long.Parse(jmbgKorisnika.Text);
                    }
                    catch
                    {
                        MessageBox.Show("Niste uneli broj!", "Greška!", MessageBoxButton.OK, MessageBoxImage.Error);
                        return;
                    }

                    // Zaštita za datum
                    DateTime datum = DateTime.Today;

                    try
                    {
                        datum = DateTime.Parse(datumUclanjenjaKorisnika.Text);
                    }
                    catch
                    {
                        MessageBox.Show("Niste uneli dobar format datuma!", "Greška!", MessageBoxButton.OK, MessageBoxImage.Error);
                        return;
                    }

                    App.SelektovaniKorisnik.Ime = imeKorisnika.Text;
                    App.SelektovaniKorisnik.Prezime = prezimeKorisnika.Text;
                    App.SelektovaniKorisnik.Jmbg = broj.ToString();
                    App.SelektovaniKorisnik.DatumUclanjenja = datum.ToString("d");
                    App.SelektovaniKorisnik.ProfilnaSlika = trenutnaPutanja;
                    slika.Source = new BitmapImage(new Uri(trenutnaPutanja, UriKind.Absolute));

                    MessageBox.Show("Korisnik uspešno ažuriran!", "Informacija!", MessageBoxButton.OK, MessageBoxImage.Information);

                    // Resetovanje svih polja
                    imeKorisnika.Clear();
                    prezimeKorisnika.Clear();
                    jmbgKorisnika.Clear();
                    datumUclanjenjaKorisnika.Clear();
                    trenutnaPutanja = string.Empty;

                    // Vraćanje svih podataka kako bi se korisnik mogao odmah ponovo menjati
                    if (App.SelektovaniKorisnik != null)
                    {
                        imeKorisnika.Text = App.SelektovaniKorisnik.Ime;
                        prezimeKorisnika.Text = App.SelektovaniKorisnik.Prezime;
                        jmbgKorisnika.Text = App.SelektovaniKorisnik.Jmbg;
                        datumUclanjenjaKorisnika.Text = App.SelektovaniKorisnik.DatumUclanjenja;
                        trenutnaPutanja = App.SelektovaniKorisnik.ProfilnaSlika;
                    }
                }
                else
                {
                    MessageBox.Show("Nije moguće ažurirati korisnika u kolekciji!", "Greška!", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }
    }
}
