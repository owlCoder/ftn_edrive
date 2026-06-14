using System;
using System.Globalization;
using System.Linq;
using System.Windows;
using System.Windows.Controls;

namespace Zadatak_01_Kalkulator
{
    public partial class MainWindow : Window
    { 
        public enum Operator { SABIRANJE, ODUZIMANJE, MNOZENJE, DELJENJE, PROCENAT };
        private Operator trenutniOperator;

        public MainWindow()
        {
            InitializeComponent();
        }
        private void plusMinus_Click(object sender, RoutedEventArgs e)
        {
            string broj = ekran.Text;
            double brojDouble = 0.0;

            try
            {
                brojDouble = double.Parse(broj, CultureInfo.InvariantCulture);
            }
            catch
            {
                MessageBox.Show("Greška u unosu!");
            }
            
            if(brojDouble < 0)
            {
                brojDouble = Math.Abs(brojDouble);
            }    
            else
            {
                brojDouble = 0 - brojDouble;
            }

            ekran.Text = brojDouble.ToString();
            
        }
        private void tacka_Click(object sender, RoutedEventArgs e)
        {
            ekran.Text += ".";
        }

        private void broj_Click(object sender, RoutedEventArgs e)
        {
            ekran.Text += (sender as Button).Content.ToString();
        }

        private void procenat_Click(object sender, RoutedEventArgs e)
        {
            ekran.Text += "%";
            trenutniOperator = Operator.PROCENAT;
        }

        private void ocisti_Click(object sender, RoutedEventArgs e)
        {
            ekran.Text = "";
        }

        private void puta_Click(object sender, RoutedEventArgs e)
        {
            ekran.Text += "*";
            trenutniOperator = Operator.MNOZENJE;
        }

        private void podeljeno_Click(object sender, RoutedEventArgs e)
        {
            ekran.Text += "/";
            trenutniOperator = Operator.DELJENJE;
        }

        private void plus_Click(object sender, RoutedEventArgs e)
        {
            ekran.Text += "+";
            trenutniOperator = Operator.SABIRANJE;
        }

        private void minus_Click(object sender, RoutedEventArgs e)
        {
            ekran.Text += "-";
            trenutniOperator = Operator.ODUZIMANJE;
        }

        private void jednako_Click(object sender, RoutedEventArgs e)
        {
            // ZAMENJUJEMO ZAREZE KOD BROJEVA SA DECIMALNIM TACKA DA SE PARSE NE BI "ZABUNIO"
            string unos = ekran.Text.Replace(',', '.');
            string[] brojevi = { };

            if(unos.Contains("+"))
            {
                brojevi = unos.Split('+');
                
            }
            else if (unos.Contains("-"))
            {
                brojevi = unos.Split('-');
            }
            else if (unos.Contains("*"))
            {
                brojevi = unos.Split('*');
            }
            else if(unos.Contains('%'))
            {
                brojevi = unos.Split('%');
            }
            else if(unos.Contains('/'))
            {
                brojevi = unos.Split('/');
            }

            double broj1 = 0.0, broj2 = 0.0;

            try
            {
                broj1 = double.Parse(brojevi[0], CultureInfo.InvariantCulture);
                broj2 = double.Parse(brojevi[1], CultureInfo.InvariantCulture);
            }
            catch(Exception ex)
            {
                MessageBox.Show("Nisu uneti brojevi!" + ex.Message);
            }

            double rezultat = 0.0;

            if (trenutniOperator == Operator.SABIRANJE)
                rezultat = broj1 + broj2;
            else if (trenutniOperator == Operator.ODUZIMANJE)
                rezultat = broj1 - broj2;
            else if (trenutniOperator == Operator.MNOZENJE)
                rezultat = broj1 * broj2;
            else if (trenutniOperator == Operator.DELJENJE)
                rezultat = broj1 / broj2;
            else if(trenutniOperator == Operator.PROCENAT)
                rezultat = broj1 * (broj2 / 100);

            ekran.Text = Math.Round(rezultat, 5).ToString();
        }
    }
}
