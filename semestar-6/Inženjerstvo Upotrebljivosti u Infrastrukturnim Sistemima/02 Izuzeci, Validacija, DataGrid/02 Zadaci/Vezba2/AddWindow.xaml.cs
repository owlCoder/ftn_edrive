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

namespace Vezba2
{
    /// <summary>
    /// Interaction logic for AddWindow.xaml
    /// </summary>
    public partial class AddWindow : Window
    {
        public AddWindow()
        {
            InitializeComponent();

            textBoxIme.Text = "unesite ime";
            textBoxIme.Foreground = Brushes.LightSlateGray;

            textBoxPrezime.Text = "unesite prezime";
            textBoxPrezime.Foreground = Brushes.LightSlateGray;

            comboBoxSmer.ItemsSource = Classes.Constants.smerovi;
        }

        private void buttonDodaj_Click(object sender, RoutedEventArgs e)
        {
            if (validate())
            {
                if (radioButtonM.IsChecked == true)
                {
                    MainWindow.Studenti.Add(new Classes.Student(textBoxIme.Text, textBoxPrezime.Text, 'M', comboBoxSmer.SelectedValue.ToString()));
                }
                else
                {
                    MainWindow.Studenti.Add(new Classes.Student(textBoxIme.Text, textBoxPrezime.Text, 'Z', comboBoxSmer.SelectedValue.ToString()));
                }
                this.Close();
            }
            else
            {
                MessageBox.Show("Polja nisu dobro popunjena!", "Greska!", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void buttonIzadji_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private bool validate()
        {
            bool result = true;

            if(textBoxIme.Text.Trim().Equals("") || textBoxIme.Text.Trim().Equals("unesite ime"))
            {
                result = false;
                labelImeGreska.Content = "Polje ne sme biti prazno!";
                textBoxIme.BorderBrush = Brushes.Red;
            }
            else
            {
                labelImeGreska.Content = "";
                textBoxIme.BorderBrush = Brushes.Gray;
            }

            if (textBoxPrezime.Text.Trim().Equals("") || textBoxPrezime.Text.Trim().Equals("unesite prezime"))
            {
                result = false;
                labelPrezimeGreska.Content = "Polje ne sme biti prazno!";
                textBoxPrezime.BorderBrush = Brushes.Red;
            }
            else
            {
                labelPrezimeGreska.Content = "";
                textBoxPrezime.BorderBrush = Brushes.Gray;
            }

            if (radioButtonM.IsChecked == false && radioButtonZ.IsChecked == false)
            {
                result = false;
                labelPolGreska.Content = "Mora biti odabrana opcija!";
            }
            else
            {
                labelPolGreska.Content = string.Empty;
            }

            if (comboBoxSmer.SelectedItem == null)
            {
                result = false;
                labelSmerGreska.Content = "Mora biti odabrana opcija!";
                comboBoxBorder.BorderThickness = new Thickness(1);
                comboBoxBorder.BorderBrush = Brushes.Red;
            }
            else
            {
                labelSmerGreska.Content = "";
                comboBoxBorder.BorderBrush = Brushes.Gray;
            }

            return result;
        }

        private void textBoxIme_GotFocus(object sender, RoutedEventArgs e)
        {
            if (textBoxIme.Text.Trim().Equals("unesite ime"))
            {
                textBoxIme.Text = "";
                textBoxIme.Foreground = Brushes.Black;
            }
        }

        private void textBoxIme_LostFocus(object sender, RoutedEventArgs e)
        {
            if (textBoxIme.Text.Trim().Equals(string.Empty))
            {
                textBoxIme.Text = "unesite ime";
                textBoxIme.Foreground = Brushes.LightSlateGray;
            }
        }

        private void textBoxPrezime_GotFocus(object sender, RoutedEventArgs e)
        {
            if (textBoxPrezime.Text.Trim().Equals("unesite prezime"))
            {
                textBoxPrezime.Text = "";
                textBoxPrezime.Foreground = Brushes.Black;
            }
        }

        private void textBoxPrezime_LostFocus(object sender, RoutedEventArgs e)
        {
            if (textBoxPrezime.Text.Trim().Equals(string.Empty))
            {
                textBoxPrezime.Text = "unesite prezime";
                textBoxPrezime.Foreground = Brushes.LightSlateGray;
            }
        }
    }
}
