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
    /// <summary>
    /// Interaction logic for SpisakBibliotekaPoKorisniku.xaml
    /// </summary>
    public partial class SpisakBibliotekaPoKorisniku : Page
    {
        public SpisakBibliotekaPoKorisniku()
        {
            InitializeComponent();

            #region INICIJALIZACIJA PODATAKA
            DataContext = this;
            dataGridSveBiblioteke.ItemsSource = App.Biblioteke;
            #endregion
        }
		
        private void DataGridRow_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            var row = ItemsControl.ContainerFromElement((DataGrid)sender, e.OriginalSource as DependencyObject) as DataGridRow;

            if (row == null)
                return;

            if (dataGridSveBiblioteke.SelectedItem == null)
                return;

            var biblioteka = dataGridSveBiblioteke.SelectedItem as Biblioteka;

            // Prikaz liste svih korisnika
            if (biblioteka.Korisnici.Count == 0)
            {
                MessageBox.Show("Biblioteka nema učlanjenih korinsika!", "Informacija!", MessageBoxButton.OK, MessageBoxImage.Information);
            }
            else
            {
                App.SelektovanaBiblioteka = biblioteka;

                // Otvaranje prozora za prikaz i pretragu svih korinsika u biblioteci
                KorisniciBiblioteka sk = new KorisniciBiblioteka(biblioteka.Naziv);
                sk.ShowDialog();
                App.SelektovanaBiblioteka = null;
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
