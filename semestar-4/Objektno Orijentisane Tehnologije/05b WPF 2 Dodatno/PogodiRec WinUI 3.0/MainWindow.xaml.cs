using System;
using System.Collections.Generic;
using System.IO;
using System.Windows;
using System.Windows.Controls;


namespace PogodiRec
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private static string[] deloviSneska = { "    __\n", "\\ (0.0)\n", "  (     ) \\\n", "  (  :  )" };
        private static char[] slova = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".ToCharArray();
        private static List<char> svaSlova = new List<char>();
        private static string zadataRec;
        private bool prviPut = false;
        private static int brojPromasaja = 0;
        private static string trenutniStatusReci;
        public MainWindow()
        {
            InitializeComponent();

            svaSlova.Clear();
            foreach (char s in slova)
                svaSlova.Add(s);
        }

        private void PokreniIgruBtn_Click(object sender, RoutedEventArgs e)
        {
            PreostalaSlovaCB.IsEnabled = true;
            PreostalaSlovaCB.Items.Clear();
            trenutniStatusReci = "";
            snesko.Text = "";

            svaSlova.Clear();
            foreach (char s in slova)
                svaSlova.Add(s);

            foreach (char s in svaSlova)
                PreostalaSlovaCB.Items.Add(s);

            iskoriscenaSlova.Text = "Нисте одабрали ниједно слово!";
            prviPut = false;

            UcitavanjeReci();

            trenutniStatusReci = "";
            int duzina = zadataRec.Length;
            if (duzina > 5)
                duzina--;
            
            for (int i = 0; i < duzina; i++)
                trenutniStatusReci += "_";
        }

        private void UcitavanjeReci()
        {
            TextReader tr = null;
            try
            {
                tr = new StreamReader("reci.txt");

                string recnik = tr.ReadToEnd().ToUpper();
                string[] reci = recnik.Split('\n');

                Random rand = new Random();
                int uzetaRec = rand.Next(0, reci.Length);

                zamisljenaRec.Text = "\n";
                for (int i = 0; i < reci[uzetaRec].Length; i++)
                    zamisljenaRec.Text += "_ ";

                zadataRec = reci[uzetaRec];

                prviPut = true;

            }
            catch (Exception)
            {
                MessageBox.Show("Датотека са речима није учитана!", "Грешка!", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            finally
            {
                if (tr != null)
                    tr.Close();
            }
        }

        private void PreostalaSlovaCB_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (prviPut)
            {
                iskoriscenaSlova.Text = "";
                prviPut = false;
            }

            if (PreostalaSlovaCB.SelectedItem != null)
            {
                var odabranoSlovo = PreostalaSlovaCB.SelectedItem.ToString();
                PreostalaSlovaCB.Items.Clear();

                svaSlova.Remove(odabranoSlovo[0]);

                foreach (char s in svaSlova)
                    PreostalaSlovaCB.Items.Add(s);

                iskoriscenaSlova.Text += odabranoSlovo + ", ";

                // PROVERI DA LI JE ODABRANO SLOVO NEGDE U RECI
                bool promasenoSlovo = true;

                for(int i = 0; i < zadataRec.Length; i++)
                {
                    if(odabranoSlovo[0] == zadataRec[i])
                    {
                        promasenoSlovo = false;
                        trenutniStatusReci = ReplaceAtIndex(i, odabranoSlovo[0], trenutniStatusReci);
                    }
                }

                // DODAVANJE RAZMAKA IZMEDJU - ESTETIKA :)
                string tmp = "";
                foreach (char s in trenutniStatusReci)
                    tmp += s + " ";

                zamisljenaRec.Text = tmp;

                if (promasenoSlovo)
                {
                    snesko.Text += deloviSneska[brojPromasaja];
                    brojPromasaja++;
                }
                MessageBox.Show(trenutniStatusReci.Replace('\r', '\0'));
                if (brojPromasaja >= deloviSneska.Length)
                {
                    brojPromasaja = 0;

                    MessageBox.Show("Нисте погодили реч!", "Информација!", MessageBoxButton.OK, MessageBoxImage.Information);
                    PreostalaSlovaCB.IsEnabled = false;
                    PreostalaSlovaCB.Items.Clear();

                    zamisljenaRec.Text = "";
                    foreach (char s in zadataRec)
                        zamisljenaRec.Text += s + " ";
                }
                else if (trenutniStatusReci.Replace('\r', '\0').Equals(zadataRec))
                {
                    
                    brojPromasaja = 0;

                    MessageBox.Show("Погодили сте реч!", "Информација!", MessageBoxButton.OK, MessageBoxImage.Information);
                    PreostalaSlovaCB.IsEnabled = false;
                    PreostalaSlovaCB.Items.Clear();
                }
                /// NE RADI POGODIO ZA SVAKU REC
                // MessageBox.Show(trenutniStatusReci + "zr: " + zadataRec);
            }
        }

        static string ReplaceAtIndex(int i, char value, string word)
        {
            char[] letters = word.ToCharArray();
            letters[i] = value;

            return string.Join("", letters);
        }
    }
}
