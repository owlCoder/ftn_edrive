using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
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

namespace _06_WPF_Primeri
{
    public partial class MainWindow : Window
    {
        // PRIMER 5
        private ObservableCollection<Student> studenti =
            new ObservableCollection<Student>();

        public MainWindow()
        {
            InitializeComponent();

            Resources["ButtonDynamicBackgroundColor"] = new SolidColorBrush(Colors.LightGoldenrodYellow);
            DataContext = this;

            // PRIMER 5: Data Binding i Korisničke Klase
            studenti.Add(new Student("PR 55/2020"));
            studenti.Add(new Student("PR 59/2020"));
            studenti.Add(new Student("PR 83/2020"));

            lbStudenti.ItemsSource = studenti;
        }

        // PRIMER 4: Data Binding
        private void btnPromeni_Click(object sender, RoutedEventArgs e)
        {
            BindingExpression binding = txtNaslov.GetBindingExpression(TextBox.TextProperty);
            binding.UpdateSource();
        }

        // PRIMER 5: Data Binding i Korisničke Klase
        private void btnDodaj_Click(object sender, RoutedEventArgs e)
        {
            if (txtStudenti.Text != "")
            {
                studenti.Add(new Student(txtStudenti.Text.Trim()));
                txtStudenti.Text = "";
            }

        }

        private void btnIzmeni_Click(object sender, RoutedEventArgs e)
        {
            if (lbStudenti.SelectedItem != null && txtStudenti.Text != "")
            {
                (lbStudenti.SelectedItem as Student).BrojIndeksa = txtStudenti.Text.Trim();
                txtStudenti.Text = "";
            }

        }

        private void btnObrisi_Click(object sender, RoutedEventArgs e)
        {
            if (lbStudenti.SelectedItem != null)
            {
                studenti.Remove(lbStudenti.SelectedItem as Student);
                txtStudenti.Text = "";
            }
        }

        private void lbStudenti_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            txtStudenti.Text = (lbStudenti.SelectedItem as Student).BrojIndeksa;
        }

        // PRIMER 6: Tabovi
        private void btnPrethodni_Click(object sender, RoutedEventArgs e)
        {
            int newIndex = tabC.SelectedIndex - 1;
            if (newIndex < 0)
                newIndex = tabC.Items.Count - 1;
            tabC.SelectedIndex = newIndex;
        }

        private void btnSledeci_Click(object sender, RoutedEventArgs e)
        {
            int newIndex = tabC.SelectedIndex + 1;
            if (newIndex >= tabC.Items.Count)
                newIndex = 0;
            tabC.SelectedIndex = newIndex;

        }
    }
}
