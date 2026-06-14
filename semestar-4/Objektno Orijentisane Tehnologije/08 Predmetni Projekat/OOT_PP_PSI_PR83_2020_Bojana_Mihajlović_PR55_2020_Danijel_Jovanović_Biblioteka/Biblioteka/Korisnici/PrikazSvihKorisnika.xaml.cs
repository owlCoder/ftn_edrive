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
    public partial class PrikazSvihKorisnika : Page
    {
        public PrikazSvihKorisnika()
        {
            InitializeComponent();

            #region INICIJALIZACIJA DATACONTEXT
            DataContext = this;
            dataGridSviKorisnici.ItemsSource = App.SviKorisnici;
            #endregion
        }
		
        private void pretraga_TextChanged(object sender, TextChangedEventArgs e)
        {
            List<Korisnik> pretrazeno = new List<Korisnik>();
            string unos = (sender as TextBox).Text;
            unos = Regex.Replace(unos, @"\s+", " ");

            foreach (Korisnik k in App.SviKorisnici)
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
