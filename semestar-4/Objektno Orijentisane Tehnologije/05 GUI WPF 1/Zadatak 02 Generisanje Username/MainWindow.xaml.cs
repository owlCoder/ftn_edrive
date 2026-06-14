using System;
using System.Windows;

namespace Zadatak_02_Generisanje_Username
{
    public partial class MainWindow : Window
    {
        private static int sacuvanihKorisnickihImena = 0;
        public MainWindow()
        {
            InitializeComponent();
        }

        private void generisanje_Click(object sender, RoutedEventArgs e)
        {
            if(ime.Text.Equals("") && prezime.Text.Equals(""))
            {
                MessageBox.Show("Popunite barem jedno od polja!", "Greška!", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            else
            {
                Random rand = new Random();
                int nasumicanBroj = rand.Next(1, 500);

                izgenerisano.Text = ime.Text + "_" + prezime.Text + nasumicanBroj.ToString();
            }
        }

        private void ciscenje_Click(object sender, RoutedEventArgs e)
        {
            ime.Clear();
            prezime.Clear();
            izgenerisano.Clear();
        }

        private void sacuvaj_Click(object sender, RoutedEventArgs e)
        {
            if(izgenerisano.Text.Equals(""))
            {
                MessageBox.Show("Izgenerišite korisničko ime kako bi čuvanje bilo moguće!", "Greška!", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            else
            {
                sacuvanoKorisnickoIme.Text = izgenerisano.Text;
                sacuvanihKorisnickihImena += 1;
                brojSacuvanihKorisnika.Text = sacuvanihKorisnickihImena.ToString();
            }
        }
    }
}
