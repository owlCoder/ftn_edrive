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

namespace Biblioteka.Knjige
{
    public partial class KnjigaInfo : Window
    {
        public KnjigaInfo()
        {
            InitializeComponent();

            #region INICIJALIZA PODATAKA
            if (App.SelektovanaKnjiga != null)
            {
                nazivKnjige.Text = App.SelektovanaKnjiga.Naziv;
                autorKnjige.Text = App.SelektovanaKnjiga.Autor;
                godinaIzdanjaKnjige.Text = App.SelektovanaKnjiga.GodinaIzdanja.ToString();
            }
            #endregion
        }
		
        private void izmeniKnjiguBtn_Click(object sender, RoutedEventArgs e)
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
                    if (App.SelektovanaKnjiga != null)
                    {
                        App.SelektovanaKnjiga.Naziv = nazivKnjige.Text;
                        App.SelektovanaKnjiga.Autor = autorKnjige.Text;
                        App.SelektovanaKnjiga.GodinaIzdanja = broj;

                        MessageBox.Show("Knjiga uspešno ažurirana!", "Informacija!", MessageBoxButton.OK, MessageBoxImage.Information);

                        nazivKnjige.Clear();
                        autorKnjige.Clear();
                        godinaIzdanjaKnjige.Clear();

                        nazivKnjige.Text = App.SelektovanaKnjiga.Naziv;
                        autorKnjige.Text = App.SelektovanaKnjiga.Autor;
                        godinaIzdanjaKnjige.Text = App.SelektovanaKnjiga.GodinaIzdanja.ToString();
                    }
                }
                else
                {
                    MessageBox.Show("Nije moguće ažurirati knjigu u kolekciji!", "Greška!", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }
    }
}
