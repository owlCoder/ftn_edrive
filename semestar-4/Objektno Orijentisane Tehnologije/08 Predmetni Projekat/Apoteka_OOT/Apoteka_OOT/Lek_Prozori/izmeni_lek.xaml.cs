using System;
using System.Windows;

namespace Apoteka_OOT.Lek_Prozori
{
    public partial class izmeni_lek : Window
    {
        public izmeni_lek()
        {
            InitializeComponent();

            Lek temp = MainWindow.Referenca_na_odabrani_lek;

            if(temp != null)
            {
                naziv.Text = temp.Naziv;
                datum_proizvodnje.Text = temp.DatumProizvodnje;
                datum_vazenja.Text = temp.DatumVazenja;
                kolicina.Text = temp.Kolicina.ToString();
            }
        }

        private void izmena_podataka_o_leku_Click(object sender, RoutedEventArgs e)
        {
            if (naziv.Text.Equals("") || datum_proizvodnje.Text.Equals("") || datum_vazenja.Text.Equals("") || kolicina.Text.Equals(""))
                MessageBox.Show("Popunite sva polja!", "Greska", MessageBoxButton.OK, MessageBoxImage.Error);
            else
            {
                int k = 0;
                try
                {
                    k = int.Parse(kolicina.Text);
                }
                catch (Exception)
                {
                    MessageBox.Show("Kolicina nije broj!", "Greska", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }

                try
                {
                    Lek izmena = MainWindow.Referenca_na_odabrani_lek;

                    izmena.Naziv = naziv.Text;
                    izmena.DatumVazenja = datum_vazenja.Text;
                    izmena.DatumProizvodnje = datum_proizvodnje.Text;
                    izmena.Kolicina = k;
                }
                catch (Exception)
                {
                    MessageBox.Show("Desila se greska prilikom izmene podataka o leku!", "Greska", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }

                MessageBox.Show("Lek uspesno izmenjen!", "Informacija", MessageBoxButton.OK, MessageBoxImage.Information);
            }
        }
    }
}
