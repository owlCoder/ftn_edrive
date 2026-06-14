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

namespace Zadatak4
{
    /// <summary>
    /// Interaction logic for DodavanjeKategorije.xaml
    /// </summary>
    public partial class DodavanjeKategorije : Window
    {
        public Supermarket supermarket;

        public DodavanjeKategorije(Supermarket s)
        {
            supermarket = s;
            InitializeComponent();
        }

        private void Dodaj_Click(object sender, RoutedEventArgs e)
        {
            if (supermarket.Dodaj(new Kategorija()
            {
                Naziv = txtNaziv.Text,
            }))
                MessageBox.Show("Uspešno dodavanje!", "Obaveštenje", MessageBoxButton.OK, MessageBoxImage.Information);
            else
                MessageBox.Show("Neuspešno dodavanje!", "Greška", MessageBoxButton.OK, MessageBoxImage.Error);

            this.Close();
        }
    
    }
}
