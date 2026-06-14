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

namespace Zadatak_01_Studenti
{
    public partial class MainWindow : Window
    {
        private ObservableCollection<Student> studenti = new ObservableCollection<Student>();

        public MainWindow()
        {
            InitializeComponent();

            studenti.Add(new Student("Danijel", "Jovanović",   "PR55/2020"));
            studenti.Add(new Student("Sara",    "Stamenković", "PR59/2020"));
            studenti.Add(new Student("Bojana",  "Mihajlović",  "PR83/2020"));
            lbStudenti.ItemsSource = listaStudenata.ItemsSource = studenti;
        }
        private void dodavanjeNovog_Click(object sender, RoutedEventArgs e)
        {
            if (Dodaj(new Student(ime.Text, prezime.Text, indeks.Text)))
            {
                MessageBox.Show("Uspešno dodavanje studenta!", "Informacija", MessageBoxButton.OK, MessageBoxImage.Information);

            }
            else
            {
                MessageBox.Show("Student nije dodat!\n\nMoguće je da student sa unetim podacima već postoji!", "Greška", MessageBoxButton.OK, MessageBoxImage.Error);
            }

            ime.Clear();
            prezime.Clear();
            indeks.Clear();
        }
        private void btnIzmeni_Click(object sender, RoutedEventArgs e)
        {
            if ((lbStudenti.SelectedItem as Student) != null)
            {
                Student noviStudent = new Student(novoIme.Text, novoPrezime.Text, noviIndeks.Text);
                int index = lbStudenti.SelectedIndex;
                studenti.RemoveAt(index);
                studenti.Insert(index, noviStudent);
                MessageBox.Show("Uspešna izmena!", "Informacija", MessageBoxButton.OK, MessageBoxImage.Information);
            }
            else
            {
                MessageBox.Show("Student nije selektovan!", "Greška", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void btnObrisi_Click(object sender, RoutedEventArgs e)
        {
            if ((lbStudenti.SelectedItem as Student) != null)
            {
                if (MessageBox.Show("Da li zaista želite da obrišete studenta ?", "Potvdra o brisanju", MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
                {

                    studenti.RemoveAt(lbStudenti.SelectedIndex);
                    MessageBox.Show("Uspešno brisanje!", "Informacija", MessageBoxButton.OK, MessageBoxImage.Information);
                }
            }
            else
            {
                MessageBox.Show("Student nije odabran!", "Greška", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void lbStudenti_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

            DataContext = lbStudenti.SelectedItem as Student;
            btnIzmeni.IsEnabled = btnObrisi.IsEnabled = true;

        }

        private bool Dodaj(Student s)
        {
            if (s == null || s.Ime.Equals("") || s.Prezime.Equals("") || s.Indeks.Equals(""))
            {
                return false;
            }
            else
            {
                foreach (Student st in studenti)
                    if (st.Indeks == s.Indeks)
                        return false;

                studenti.Add(s);

                return true;
            }
        }

        private void ocistiPolja_Click(object sender, RoutedEventArgs e)
        {
            ime.Clear();
            prezime.Clear();
            indeks.Clear();
        }
    }
}
