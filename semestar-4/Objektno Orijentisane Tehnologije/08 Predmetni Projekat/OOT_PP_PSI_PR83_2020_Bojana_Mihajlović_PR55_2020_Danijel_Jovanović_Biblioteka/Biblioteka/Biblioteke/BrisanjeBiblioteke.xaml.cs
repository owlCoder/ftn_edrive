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

namespace Biblioteka.Biblioteke
{ 
    public partial class BrisanjeBiblioteke : Page
    {
        public BrisanjeBiblioteke()
        {
            InitializeComponent();

            #region INICIJALIZACIJA DATACONTEXT I DATAGRID
            DataContext = this;
            dataGridSveBiblioteke.ItemsSource = App.Biblioteke;
            #endregion
        }

        private void dataGridSveBiblioteke_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            var row = ItemsControl.ContainerFromElement((DataGrid)sender, e.OriginalSource as DependencyObject) as DataGridRow;

            if (row == null)
                return;

            if (dataGridSveBiblioteke.SelectedItem == null)
                return;

            var biblioteka = dataGridSveBiblioteke.SelectedItem as Biblioteke.Biblioteka;

            var daNe = MessageBox.Show("Brisanje biblioteke je NEPOVRATNA OPERACIJA!\n" +
                "Brisanjem biblioteke brišu se svi njeni korisnici kao i kompletan INVENTAR!\n\n" +
                "Da li ste sigurni?", "Upozorenje o brisanju!", MessageBoxButton.YesNo, MessageBoxImage.Warning);

            if (daNe == MessageBoxResult.Yes)
            {
                // KNJIGE KOJE SU PRIPADALE BIBLIOTECI VIŠE NEĆE PRIPADATI
                foreach(Knjige.Knjiga k in App.SveKnjige)
                {
                    if (k.IdBiblioteke == biblioteka.IdBiblioteke)
                    {
                        k.IdBiblioteke = -1;
                        k.NijeDodata = "NIJE DODATA";
                        k.IdKorisnika = -1;
                    }
                }

                foreach (Knjige.Knjiga k in biblioteka.Knjige)
                {
                    k.IdBiblioteke = -1;
                    k.NijeDodata = "NIJE DODATA";
                    k.IdKorisnika = -1;
                }

                // OTCLANI KORISNIKE
                foreach (Korisnici.Korisnik k in App.SviKorisnici)
                {
                    if (k.IdBiblioteke == biblioteka.IdBiblioteke)
                    {
                        k.IdBiblioteke = -1;
                        k.DatumUclanjenja = "";
                        k.Uclanjen = "/";
                    }
                }

                foreach (Korisnici.Korisnik k in biblioteka.Korisnici)
                {
                    k.IdBiblioteke = -1;
                    k.DatumUclanjenja = "";
                    k.Uclanjen = "/";
                }

                biblioteka.Knjige.Clear();
                biblioteka.Korisnici.Clear();
                App.Biblioteke.Remove(biblioteka);

                MessageBox.Show("Biblioteka obrisana iz kolekcije!", "Informacija", MessageBoxButton.OK, MessageBoxImage.Information);

                // Ažuriranje prikaza liste posle brisanja
                dataGridSveBiblioteke.ItemsSource = App.Biblioteke;
            }
        }

        private void pretraga_TextChanged(object sender, TextChangedEventArgs e)
        {
            List<Biblioteka> pretrazeno = new List<Biblioteka>();
            string unos = (sender as TextBox).Text;
            unos = Regex.Replace(unos, @"\s+", " ");

            foreach (Biblioteka k in App.Biblioteke)
            {
                if (k.Naziv.ToLower().Contains(unos.ToLower()))
                {
                    pretrazeno.Add(k);
                }
            }

            dataGridSveBiblioteke.ItemsSource = pretrazeno.ToList();
        }
    }
}
