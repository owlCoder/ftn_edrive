using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;

namespace K2_G8
{
    public partial class MainWindow : Window
    {
        private int cena = 0;
        bool zapreminaOk = false;
        bool markaOk = false;
        public MainWindow()
        {
            InitializeComponent();
        }

        private void naruciBtn_Click(object sender, RoutedEventArgs e)
        {
            if (cena != 0 && markaOk && zapreminaOk)
            {
                MessageBox.Show("Narudzbina uspesna!", "Informacija", MessageBoxButton.OK, MessageBoxImage.Information);
                zapreminaOk = markaOk = false;
                limuzina.IsChecked = hedzbek.IsChecked = karavan.IsChecked = false;
                zapreminaMotora.IsEnabled = marka.IsEnabled = false;
                zapreminaMotora.SelectedIndex = marka.SelectedIndex = -1;
                cb1.IsChecked = cb2.IsChecked = cb3.IsChecked = cb4.IsChecked = oblast.IsEnabled = false;
                cena = 0;
                Cena.Content = "0";
                Cena.Background = Brushes.Red;
            }
            else
                MessageBox.Show("Narudzbina neuspesna!", "Greska!", MessageBoxButton.OK, MessageBoxImage.Error);
        }

        private void limuzina_Click(object sender, RoutedEventArgs e)
        {
            cena = 10000;
            AzuriranjeCeneIOmogucavanjeCB();
        }

        private void hedzbek_Click(object sender, RoutedEventArgs e)
        {
            cena = 9000;
            AzuriranjeCeneIOmogucavanjeCB();
        }

        private void karavan_Click(object sender, RoutedEventArgs e)
        {
            cena = 8000;
            AzuriranjeCeneIOmogucavanjeCB();
        }

        private void AzuriranjeCeneIOmogucavanjeCB()
        {
            Cena.Content = cena.ToString();
            Cena.Background = Brushes.Green;
            marka.IsEnabled = true;
            zapreminaMotora.IsEnabled = true;
        }

        private void marka_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            var cb = sender as ComboBox;
            if(cb.SelectedIndex != -1)
            {
                int id = cb.SelectedIndex;

                if (id == 0)
                    cena += 2000;
                else if (id == 1)
                    cena -= 500;
                else if (id == 2)
                    cena += 1000;

                Cena.Content = cena.ToString();

                markaOk = true;
            }

            if (markaOk && zapreminaOk)
                oblast.IsEnabled = true;
        }

        private void zapreminaMotora_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            var cb = sender as ComboBox;
            if (cb.SelectedIndex != -1)
            {
                int id = cb.SelectedIndex;

                if (id == 0)
                    cena += 500;
                else if (id == 1)
                    cena += 1000;
                else if (id == 2)
                    cena += 2000;

                Cena.Content = cena.ToString();
                zapreminaOk = true;
            }

            if (markaOk && zapreminaOk)
                oblast.IsEnabled = true;
        }

        private void cb1_Click(object sender, RoutedEventArgs e)
        {
            cena += 300;
            Cena.Content = cena.ToString();
        }

        private void cb2_Click(object sender, RoutedEventArgs e)
        {
            cena += 300;
            Cena.Content = cena.ToString();
        }

        private void cb3_Click(object sender, RoutedEventArgs e)
        {
            cena += 300;
            Cena.Content = cena.ToString();
        }

        private void cb4_Click(object sender, RoutedEventArgs e)
        {
            cena += 300;
            Cena.Content = cena.ToString();
        }
    }
}
