using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Globalization;
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

namespace Zadatak_02_Stavka
{
    public partial class MainWindow : Window
    {
        ObservableCollection<Stavka> jelovnik = new ObservableCollection<Stavka>();
        public MainWindow()
        {
            InitializeComponent();

            jelovnik.Add(new Stavka(1, "Giros", 279.55, VRSTA.HRANA, "Svinjski giros"));
            jelovnik.Add(new Stavka(2, "Palačinka", 150.45, VRSTA.HRANA, "EuroKrem-Plazma"));
            jelovnik.Add(new Stavka(3, "Crveno Vino", 173.55, VRSTA.PICE, "Suvo crveno vino"));
            jelovnik.Add(new Stavka(4, "Bombone", 79.55, VRSTA.OSTALO, "Karamel"));

            lista.ItemsSource = jelovnik;
            listaDodatih.ItemsSource = podaci.ItemsSource = jelovnik;
            novaVrsta.ItemsSource = vrsta.ItemsSource = new List<VRSTA>() { VRSTA.HRANA, VRSTA.PICE, VRSTA.OSTALO };
        }

        private Stavka ValidacijaPodataka(string id, string naziv, string cena, ComboBox vrsta, string opis)
        {
            if (id.Equals("") || naziv.Equals("") || cena.Equals("")) return null;
            if (!int.TryParse(id, out int idParsiran)) return null;

            double cenaParsirana = 0.0;
            try
            {
                cenaParsirana = double.Parse(cena, CultureInfo.InvariantCulture);
            }
            catch (Exception) 
            { 
                return null; 
            }

            if (!Enum.TryParse(vrsta.SelectedValue.ToString(), out VRSTA vrstaParsirana)) return null;
            if (idParsiran <= 0 || cenaParsirana <= 0) return null;

            return new Stavka(idParsiran, naziv, cenaParsirana, vrstaParsirana, opis);
        }

        private bool DodajStavku(Stavka nova)
        {
            if (nova == null) 
                return false;
            else
            {
                foreach (Stavka s in jelovnik)
                    if (s.Id == nova.Id || s.Naziv.Equals(nova.Naziv))
                        return false;

                jelovnik.Add(nova);
                return true;
            }
        }

        private void dodajBtn_Click(object sender, RoutedEventArgs e)
        {
            if(vrsta.SelectedItem != null)
            {
                Stavka nova = ValidacijaPodataka(id.Text, naziv.Text, cena.Text, vrsta, opis.Text);

                if(DodajStavku(nova))
                {
                    MessageBox.Show("Stavka uspešno dodata u jelovnik!", "Informacija", MessageBoxButton.OK, MessageBoxImage.Information);
                    podaci.ItemsSource = jelovnik;
                }
                else
                    MessageBox.Show("Stavka NIJE dodata u jelovnik!", "Greška", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            else
                MessageBox.Show("Stavka NIJE dodata u jelovnik!", "Greška", MessageBoxButton.OK, MessageBoxImage.Error);

            id.Clear();
            naziv.Clear();
            cena.Clear();
            vrsta.SelectedItem = null;
            opis.Clear();
        }

        private void izmeniBtn_Click(object sender, RoutedEventArgs e)
        {
            if( (lista.SelectedItem as Stavka) != null)
            {
                Stavka nova = ValidacijaPodataka(readOnlyId.Text, noviNaziv.Text, novaCena.Text, novaVrsta, noviOpis.Text);

                if(nova == null)
                    MessageBox.Show("Uneti podaci nisu validni!", "Greška", MessageBoxButton.OK, MessageBoxImage.Error);
                else
                {
                    int indeks = lista.SelectedIndex;
                    jelovnik.RemoveAt(indeks);
                    jelovnik.Insert(indeks, nova);
                    MessageBox.Show("Stavka uspešno izmenjena u jelovniku!", "Informacija", MessageBoxButton.OK, MessageBoxImage.Information);
                }
            }
            else
                MessageBox.Show("Stavka nije odabrana!", "Greška", MessageBoxButton.OK, MessageBoxImage.Error);
        }

        private void obrisiBtn_Click(object sender, RoutedEventArgs e)
        {
            if ((lista.SelectedItem as Stavka) != null)
            {
                if (MessageBox.Show("Da li zaista želite da obrišete stavku?", "Potvdra o brisanju", MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
                {
                    int indeks = lista.SelectedIndex;
                    jelovnik.RemoveAt(indeks);
                    MessageBox.Show("Stavka uspešno obrisana iz jelovnika!", "Informacija", MessageBoxButton.OK, MessageBoxImage.Information);
                }
            }
            else
                MessageBox.Show("Stavka nije odabrana!", "Greška", MessageBoxButton.OK, MessageBoxImage.Error);
        }

        private void pretraziBtn_Click(object sender, RoutedEventArgs e)
        {
            Pretraga("Contains");
        }

        private void trazeniPojam_TextChanged(object sender, TextChangedEventArgs e)
        {
            Pretraga("StartsWith");
        }

        private void Pretraga(string prop)
        {
            List<Stavka> pretrazeneStavke = new List<Stavka>();

            if (trazeniPojam.Text.Equals(""))
                pretrazeneStavke.AddRange(jelovnik);
            else
            {
                foreach (Stavka s in jelovnik)
                {
                    if(prop == "StartsWith")
                        if (s.Naziv.ToLower().StartsWith(trazeniPojam.Text.ToLower()) || s.Opis.ToLower().StartsWith(trazeniPojam.Text.ToLower()))
                            pretrazeneStavke.Add(s);
                    else
                        if (s.Naziv.ToLower().Contains(trazeniPojam.Text.ToLower()) || s.Opis.ToLower().Contains(trazeniPojam.Text.ToLower()))
                            pretrazeneStavke.Add(s);
                }
            }

            podaci.ItemsSource = pretrazeneStavke.ToList();
        }

        private void lista_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            DataContext = lista.SelectedItem as Stavka;
            izmeniBtn.IsEnabled = true;
            obrisiBtn.IsEnabled = true;
        }
    }
}
