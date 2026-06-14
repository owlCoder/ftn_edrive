using System;
using System.Windows;
using System.Windows.Media;

namespace Zadatak_03_Generisanje_Username_i_Password
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
            if (ime.Text.Equals("") && prezime.Text.Equals(""))
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
            if (izgenerisano.Text.Equals(""))
            {
                MessageBox.Show("Izgenerišite korisničko ime kako bi čuvanje bilo moguće!", "Greška!", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            else
            {
                sacuvanoKorisnickoIme.Text = izgenerisano.Text;
                sacuvanihKorisnickihImena += 1;
                brojSacuvanihKorisnika.Text = sacuvanihKorisnickihImena.ToString();
                korisnickaLozinka.IsEnabled = true;
                korisnickaLozinka.Background = Brushes.White;
                MessageBox.Show("Možete uneti lozinku za sačuvano korisničko ime!", "Informacija!", MessageBoxButton.OK, MessageBoxImage.Information);
            }
        }

        private void resetujSve_Click(object sender, RoutedEventArgs e)
        {
            korisnickaLozinka.IsEnabled = true; // UNOS LOZINKE NIJE MOGUĆ KADA SE RESETUJE CELA FORMA
            korisnickaLozinka.Background = Brushes.White;
            korisnickaLozinka.Clear();
            ime.Clear();
            prezime.Clear();
            izgenerisano.Clear();
            sacuvanoKorisnickoIme.Clear();

            MessageBox.Show("Sva polja su resetovana!", "Informacija!", MessageBoxButton.OK, MessageBoxImage.Information);
        }

        private void korisnickaLozinka_LostFocus(object sender, RoutedEventArgs e)
        {
            if(korisnickaLozinka.Text.Equals(""))
            {
                MessageBox.Show("Niste uneli lozinku za sačuvano korisničko ime!", "Greška!", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            else if(korisnickaLozinka.Text.Equals(izgenerisano.Text))
            {
                MessageBox.Show("Korisničko ime i lozinka NE MOGU BITI ISTI!", "Greška!", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            else
            {
                korisnickaLozinka.IsEnabled = false;
                korisnickaLozinka.Background = (Brush) new BrushConverter().ConvertFrom("#D3D3D3");
                MessageBox.Show("Lozinka uspešno sačuvana!", "Informacija!", MessageBoxButton.OK, MessageBoxImage.Information);
            }
        }
    }
}
