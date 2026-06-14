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
    public partial class SpisakKnjiga : Window
    {
        public SpisakKnjiga(string naziv)
        {
            InitializeComponent();

            #region INICIJALIZACIJA PODATAKA
            if (App.ReferencaNaKnjigePoBiblioteci != null)
            {
                DataContext = this;
                knjigePoBiblioteci.ItemsSource = App.ReferencaNaKnjigePoBiblioteci;

                Title = "Spisak Knjiga | Biblioteka \"" + naziv.ToUpper() + "\"";
                naslov.Content = "SPISAK KNJIGA | BIBLIOTEKA \"" + naziv.ToUpper() + "\"";
            }
            #endregion
        }
		
        private void pretraga_TextChanged(object sender, TextChangedEventArgs e)
        {
            List<Knjige.Knjiga> pretrazeno = new List<Knjige.Knjiga>();
            string unos = (sender as TextBox).Text;
            unos = Regex.Replace(unos, @"\s+", " ");

            foreach (Knjige.Knjiga k in App.ReferencaNaKnjigePoBiblioteci)
            {
                if (k.Naziv.ToLower().Contains(unos.ToLower()) || k.Autor.ToLower().Contains(unos.ToLower()))
                {
                    pretrazeno.Add(k);
                }
            }

            knjigePoBiblioteci.ItemsSource = pretrazeno.ToList();
        }
    }
}
