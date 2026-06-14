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

namespace Ucionica
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        Dictionary<int, Student> ucionica = new Dictionary<int, Student>();
        private int ajdi = 0;
        public MainWindow()
        {
            InitializeComponent();
        }

        private void aktivacija_Click(object sender, RoutedEventArgs e)
        {
            if(sender != null)
            {
                var dugme = sender as Button;
                id.Content = "ID MESTA:       " + dugme.Content.ToString();
                ajdi = Int32.Parse(dugme.Content.ToString());

                // MESTO NIJE ZAUZETO JER SE U RECNIKU NE NALAZI DATI KLJUC
                if(!ucionica.ContainsKey(Int32.Parse(dugme.Content.ToString())))
                {
                    // OTKLJUCAJ POLJA I DUGME ZAUZMI
                    sacuvajBtn.IsEnabled = true;
                    imeUnos.IsEnabled = true;
                    prezimeUnos.IsEnabled = true;
                    brojIndeksaUnos.IsEnabled = true;
                    OslobodiBtn.IsEnabled = false;

                    imeUnos.Clear();
                    prezimeUnos.Clear();
                    brojIndeksaUnos.Clear();
                }
                else // MESTO NIJE ZAUZETO, MOGUCE JE SAMO OSLOBODITI MESTO
                {
                    sacuvajBtn.IsEnabled = false;
                    OslobodiBtn.IsEnabled = true;
                    
                    foreach(Student s in ucionica.Values)
                    {
                        if(s.Id == ajdi)
                        {
                            imeUnos.Text = s.Ime;
                            prezimeUnos.Text = s.Prezime;
                            brojIndeksaUnos.Text = s.BrojIndeksa;
                            break;
                        }
                    }
                }
            }
        }

        private void sacuvajBtn_Click(object sender, RoutedEventArgs e)
        {
            Student novi = new Student(ajdi, imeUnos.Text, prezimeUnos.Text, brojIndeksaUnos.Text);
            ucionica.Add(ajdi, novi);
            MessageBox.Show("Mesto zauzeto!", "Informacija", MessageBoxButton.OK, MessageBoxImage.Information);
        }

        private void OslobodiBtn_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                ucionica.Remove(ajdi);
                sacuvajBtn.IsEnabled = false;
                imeUnos.IsEnabled = false;
                prezimeUnos.IsEnabled = false;
                brojIndeksaUnos.IsEnabled = false;
                OslobodiBtn.IsEnabled = false;

                imeUnos.Clear();
                prezimeUnos.Clear();
                brojIndeksaUnos.Clear();
                id.Content = "ID MESTA:       /";

            }
            catch(Exception)
            {
                MessageBox.Show("Greška prilikom oslobađanja mesta!", "Greška", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
    }
}
