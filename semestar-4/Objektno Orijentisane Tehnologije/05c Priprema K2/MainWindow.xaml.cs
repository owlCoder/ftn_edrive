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

namespace K2_Priprema
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private int counter = 0;
        public MainWindow()
        {
            InitializeComponent();
        }

        private void VrstaKorisnikaCB_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            int id = (sender as ComboBox).SelectedIndex;

            if (id == 0)
                Kategorija.IsEnabled = false;
            else
                Kategorija.IsEnabled = true;
        }

        private void Izgenerisi_Click(object sender, RoutedEventArgs e)
        {
            if (ime.Text.Equals("") && prezime.Text.Equals(""))
                MessageBox.Show("Unesite vrednosti za ime i prezime!");
            else
            {
                Random rand = new Random();

                if (VrstaKorisnikaCB.SelectedIndex == -1)
                    KorisnickoIme.Text = ime.Text + prezime.Text + rand.Next();
                else if (VrstaKorisnikaCB.SelectedIndex == 0)
                    KorisnickoIme.Text = ime.Text + prezime.Text + 'R' + rand.Next();
                else
                    KorisnickoIme.Text = ime.Text + prezime.Text + 'S' + rand.Next();


                if (RB1.IsChecked == true)
                    MessageBox.Show("Kategorija A");
                else if (RB2.IsChecked == true)
                    MessageBox.Show("Kategorija B");
               else if (RB3.IsChecked == true)
                    MessageBox.Show("Kategorija C");

                string ispis = "Osobinu su: ";
                if (CB1.IsChecked == true)
                    ispis += "D ";
                if (CB2.IsChecked == true)
                    ispis += "E ";
                if (CB3.IsChecked == true)
                    ispis += "F ";

                MessageBox.Show(ispis, "Infomracije o osobinama");
            }
        }

        private void Osvezi_Click(object sender, RoutedEventArgs e)
        {
            KorisnickoIme.Text = ime.Text = prezime.Text = "";
            VrstaKorisnikaCB.SelectedIndex = -1;
        }

        private void Sacuvaj_Click(object sender, RoutedEventArgs e)
        {
            if (ime.Text.Equals("") && prezime.Text.Equals(""))
                MessageBox.Show("Unesite vrednosti za ime i prezime!");
            else
                Sacuvano.Text = KorisnickoIme.Text;
        }

        private void Sacuvano_TextChanged(object sender, TextChangedEventArgs e)
        {
            counter++;
            Broj.Text = counter.ToString();
        }

        private void SacuvajLoz_Click(object sender, RoutedEventArgs e)
        {
            if (Lozinka.Password.Contains(KorisnickoIme.Text))
                MessageBox.Show("Lozinka ne sme da sadrzi korisnicko ime!");
            else
            {
                MessageBox.Show("Lozinka je uspesno kreirana!");
                Lozinka.IsEnabled = false;
            }
        }

        private void Resetuj_Click(object sender, RoutedEventArgs e)
        {
            counter = 0;
            ime.Text = prezime.Text = Lozinka.Password = Broj.Text = KorisnickoIme.Text = "";
            Lozinka.IsEnabled = true;
            RB1.IsChecked = CB1.IsChecked = false;
        }
    }
}
