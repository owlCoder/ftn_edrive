using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
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
    public partial class BrisanjeKorisnika : Page
    {
        public BrisanjeKorisnika()
        {
            InitializeComponent();

            #region INICIJALIZACIJA DATACONTEXT
            DataContext = this;
            dataGridSviKorisnici.ItemsSource = App.SviKorisnici;
            #endregion
        }
		
        private void dataGridSviKorisnici_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            var row = ItemsControl.ContainerFromElement((DataGrid)sender, e.OriginalSource as DependencyObject) as DataGridRow;

            if (row == null)
                return;

            if (dataGridSviKorisnici.SelectedItem == null)
                return;

            var korisnik = dataGridSviKorisnici.SelectedItem as Korisnik;

            var daNe = MessageBox.Show("Brisanje korisnika je NEPOVRATNA OPERACIJA!\nBrisanjem korisnika brišu se svi podaci o njemu!\n\nDa li ste sigurni?", "Upozorenje o brisanju!", MessageBoxButton.YesNo, MessageBoxImage.Warning);

            if (daNe == MessageBoxResult.Yes)
            {
                // Pošto su sve knjige koje je korisnik pozajmio već obrisane, nema potrebe da išta dodatno radimo sa njiga (tj. ne možemo svakako)
                // Stoga samo uklanjamo izabranog korisnika iz liste svih korisnika

                App.SviKorisnici.Remove(korisnik);
                MessageBox.Show("Korisnik je obrisan iz kolekcije!", "Informacija", MessageBoxButton.OK, MessageBoxImage.Information);
            }

            // Ažuriranje prikaza liste posle brisanja
            dataGridSviKorisnici.ItemsSource = App.SviKorisnici;
        }

        private void pretraga_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (App.SviKorisnici == null)
                return;

            List<Korisnici.Korisnik> pretrazeno = new List<Korisnici.Korisnik>();
            string unos = (sender as TextBox).Text;
            unos = Regex.Replace(unos, @"\s+", " ");

            foreach (Korisnici.Korisnik k in App.SviKorisnici)
            {
                string imeprezime = k.Ime.ToLower() + " " + k.Prezime.ToLower();
                string prezimeime = k.Prezime.ToLower() + " " + k.Ime.ToLower();

                if (imeprezime.Contains(unos.ToLower()) || prezimeime.Contains(unos.ToLower()))
                {
                    pretrazeno.Add(k);
                }
            }

            dataGridSviKorisnici.ItemsSource = pretrazeno.ToList();
        }
    }
}
