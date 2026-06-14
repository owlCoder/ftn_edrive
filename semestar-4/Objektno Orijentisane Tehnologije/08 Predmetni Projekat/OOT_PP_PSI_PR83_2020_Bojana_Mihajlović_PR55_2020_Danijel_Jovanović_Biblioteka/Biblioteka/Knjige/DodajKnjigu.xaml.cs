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
    public partial class DodajKnjigu : Page
    {
        public DodajKnjigu()
        {
            InitializeComponent();
        }
		
        private void dodajKnjiguBtn_Click(object sender, RoutedEventArgs e)
        {
            if (nazivKnjige.Text.Equals("") || autorKnjige.Text.Equals("") || godinaIzdanjaKnjige.Text.Equals(""))
            {
                MessageBox.Show("Niste popunili sva polja!", "Greška!", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            else
            {
                int broj = -1;
                bool uspesno = false;

                try
                {
                    broj = int.Parse(godinaIzdanjaKnjige.Text);
                    uspesno = true;
                }
                catch (Exception)
                {
                    MessageBox.Show("Niste uneli broj!", "Greška!", MessageBoxButton.OK, MessageBoxImage.Error);
                }

                if (uspesno)
                {
                    // Parsiraj ostale podatke
                    Knjiga nova = new Knjiga(nazivKnjige.Text, autorKnjige.Text, broj);
                    App.SveKnjige.Add(nova);

                    MessageBox.Show("Knjiga uspešno dodata!", "Informacija!", MessageBoxButton.OK, MessageBoxImage.Information);

                    nazivKnjige.Clear();
                    autorKnjige.Clear();
                    godinaIzdanjaKnjige.Clear();
                }
                else
                {
                    MessageBox.Show("Nije moguće dodati knjigu u kolekciju!", "Greška!", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }
    }
}
