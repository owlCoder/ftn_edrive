using System;
using System.Windows;

namespace Biblioteka
{
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();

            Program.PilotData pd = new Program.PilotData();
            pd.Pivot_Data_Generate();
            pd.Pivot_Data_Load();
        }

        #region MENI BIBLIOTEKA
        private void dodajBibliotekuStrana_Click(object sender, RoutedEventArgs e)
        {
            aktivnost.Source = new Uri("/Biblioteke/DodavanjeBiblioteke.xaml", UriKind.Relative);
        }

        private void pregledSvihBiblioteki_Click(object sender, RoutedEventArgs e)
        {
            aktivnost.Source = new Uri("/Biblioteke/PregledSvihBiblioteka.xaml", UriKind.Relative);
        }

        private void brisanjeBiblioteke_Click(object sender, RoutedEventArgs e)
        {
            aktivnost.Source = new Uri("/Biblioteke/BrisanjeBiblioteke.xaml", UriKind.Relative);
        }

        private void izmenaBiblioteke_Click(object sender, RoutedEventArgs e)
        {
            aktivnost.Source = new Uri("/Biblioteke/IzmenaBiblioteke.xaml", UriKind.Relative);
        }
		
        private void pregledKorinsikaPoBiblioteci_Click(object sender, RoutedEventArgs e)
        {
            aktivnost.Source = new Uri("/Biblioteke/SpisakBibliotekaPoKorisniku.xaml", UriKind.Relative);
        }
        #endregion

        #region MENI KNJIGE
        private void dodajKnjigu_Click(object sender, RoutedEventArgs e)
        {
            aktivnost.Source = new Uri("/Knjige/DodajKnjigu.xaml", UriKind.Relative);
        }

        private void izmeniKnjigu_Click(object sender, RoutedEventArgs e)
        {
            aktivnost.Source = new Uri("/Knjige/IzmeniKnjigu.xaml", UriKind.Relative);
        }

        private void brisanjeKnjige_Click(object sender, RoutedEventArgs e)
        {
            aktivnost.Source = new Uri("/Knjige/ObrisiKnjigu.xaml", UriKind.Relative);
        }

        private void pregledSvihKnjiga_Click(object sender, RoutedEventArgs e)
        {
            aktivnost.Source = new Uri("/Knjige/PrikazSvihKnjiga.xaml", UriKind.Relative);
        }
        #endregion

        #region MENI KORISNIK
        private void dodajKorisnika_Click(object sender, RoutedEventArgs e)
        {
            aktivnost.Source = new Uri("/Korisnici/DodajKorisnika.xaml", UriKind.Relative);
        }

        private void izmeniKorisnika_Click(object sender, RoutedEventArgs e)
        {
            aktivnost.Source = new Uri("/Korisnici/IzmeniKorisnika.xaml", UriKind.Relative);
        }

        private void brisanjeKorisnika_Click(object sender, RoutedEventArgs e)
        {
            aktivnost.Source = new Uri("/Korisnici/BrisanjeKorisnika.xaml", UriKind.Relative);
        }

        private void pregledSvihKorinsika_Click(object sender, RoutedEventArgs e)
        {
            aktivnost.Source = new Uri("/Korisnici/PrikazSvihKorisnika.xaml", UriKind.Relative);
        }

        private void uclaniKorisnika_Click(object sender, RoutedEventArgs e)
        {
            aktivnost.Source = new Uri("/Korisnici/UclaniKorisnikaUBiblioteku.xaml", UriKind.Relative);
        }

        private void pozajmiKnjigu_Click(object sender, RoutedEventArgs e)
        {
            aktivnost.Source = new Uri("/Korisnici/PozajmiKnjigu.xaml", UriKind.Relative);
        }

        private void dodajKnjiguUBiblioteku_Click(object sender, RoutedEventArgs e)
        {
            aktivnost.Source = new Uri("/Knjige/DodajKnjiguUBiblioteku.xaml", UriKind.Relative);
        }
        #endregion

        #region O PROGRAMU
        private void oprogramu_Click(object sender, RoutedEventArgs e)
        {
            aktivnost.Source = new Uri("Program/OProgramu.xaml", UriKind.Relative);
        }
        #endregion
    }
}
