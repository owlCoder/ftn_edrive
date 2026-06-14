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

namespace Zadatak3
{
    /// <summary>
    /// Interaction logic for DodavanjeKnjige.xaml
    /// </summary>
    public partial class DodavanjeKnjige : Window
    {
        public Zanr zanr;

        public DodavanjeKnjige(Zanr z)
        {
            zanr = z;
            InitializeComponent();
        }

        private void Dodaj_Click(object sender, RoutedEventArgs e)
        {
            if (!Int32.TryParse(txtGodina.Text, out int godina))
            {
                MessageBox.Show("Godina mora biti broj!", "Greška", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }
            else if (zanr.Dodaj(new Knjiga()
            {
                Naslov = txtNaslov.Text,
                ImeAutora = txtIme.Text,
                PrezimeAutora = txtPrezime.Text,
                GodinaIzdanja = godina
            }))
                MessageBox.Show("Uspešno dodavanje!", "Obaveštenje", MessageBoxButton.OK, MessageBoxImage.Information);
            else
                MessageBox.Show("Neuspešno dodavanje!", "Greška", MessageBoxButton.OK, MessageBoxImage.Error);

            this.Close();
        }
    
    }
}
