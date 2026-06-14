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
    public partial class PregledSvihBiblioteka : Page
    {
        public PregledSvihBiblioteka()
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

            var biblioteka = dataGridSveBiblioteke.SelectedItem as Biblioteka;

            // Prikaz liste svih knjiga
            if (biblioteka.Knjige.Count == 0)
            {
                MessageBox.Show("Biblioteka nema knjiga u inventaru!", "Informacija!", MessageBoxButton.OK, MessageBoxImage.Information);
            }
            else
            {
                App.ReferencaNaKnjigePoBiblioteci = biblioteka.Knjige;

                // Otvaranje prozora za prikaz i pretragu svih knjiga u biblioteci
                SpisakKnjiga sk = new SpisakKnjiga(biblioteka.Naziv);
                sk.ShowDialog();
                App.ReferencaNaKnjigePoBiblioteci = null;
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
