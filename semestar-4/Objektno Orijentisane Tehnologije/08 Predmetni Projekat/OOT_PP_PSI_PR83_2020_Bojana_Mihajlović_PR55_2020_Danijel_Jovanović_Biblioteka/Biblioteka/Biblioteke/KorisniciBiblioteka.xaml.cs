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
using System.Windows.Shapes;

namespace Biblioteka.Biblioteke
{
    public partial class KorisniciBiblioteka : Window
    {
        public KorisniciBiblioteka(string naziv)
        {
            InitializeComponent();

            #region INICIJALIZACIJA PODATAKA
            naslov.Content = "LISTA KORISNIKA U \"" + naziv.ToUpper() + "\"";
            DataContext = this;

            if (App.SelektovanaBiblioteka != null)
            {
                dataGridSviKorisnici.ItemsSource = App.SelektovanaBiblioteka.Korisnici;
            }
            #endregion
        }

        private void pretraga_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (App.SelektovanaBiblioteka.Korisnici == null)
                return;

            List<Korisnici.Korisnik> pretrazeno = new List<Korisnici.Korisnik>();
            string unos = (sender as TextBox).Text;
            unos = Regex.Replace(unos, @"\s+", " ");

            foreach (Korisnici.Korisnik k in App.SelektovanaBiblioteka.Korisnici)
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

        private void dataGridSviKorisnici_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            var row = ItemsControl.ContainerFromElement((DataGrid)sender, e.OriginalSource as DependencyObject) as DataGridRow;

            if (row == null)
                return;

            if (dataGridSviKorisnici.SelectedItem == null)
                return;

            App.SelektovaniKorisnik = dataGridSviKorisnici.SelectedItem as Korisnici.Korisnik;

            // Otvaranje prozora za izmenu korisnika
            Korisnici.KorisnikInfo ki = new Korisnici.KorisnikInfo();
            ki.ShowDialog();
            App.SelektovaniKorisnik = null;
        }
    }
}
