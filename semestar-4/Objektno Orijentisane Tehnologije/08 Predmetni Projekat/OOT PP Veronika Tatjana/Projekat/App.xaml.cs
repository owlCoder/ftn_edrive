using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using System.Windows;

namespace Projekat
{
    public partial class App : Application
    {
        Random rand = new Random();

        private static Apoteka prva_apoteka = new Apoteka("Stanković", "Lasla Gala 20", 1851, "/Images/a1.jpeg");
        private static Apoteka druga_apoteka = new Apoteka("Ivanović", "Miše Dimetrijevića 10", 1950, "/Images/a2.jpeg");
        private static Apoteka treca_apoteka = new Apoteka("Spasić", "Puškinova 141", 1751, "/Images/a3.jpeg");

        internal static Apoteka Prva_apoteka { get => prva_apoteka; set => prva_apoteka = value; }
        internal static Apoteka Druga_apoteka { get => druga_apoteka; set => druga_apoteka = value; }
        internal static Apoteka Treca_apoteka { get => treca_apoteka; set => treca_apoteka = value; }

        public App()
        {
            // UCITAVANJE IZ DATOTEKE
            InitializeComponent();  
            Podaci();
        }

        public void Podaci()
        {
            StreamReader tr = null;
            string linija;
            try
            {
                tr = new StreamReader(File.Open(Directory.GetParent(Environment.CurrentDirectory).Parent.FullName + "/Podaci/Lekovi.tasa", FileMode.Open));

                while ((linija = tr.ReadLine()) != null)
                {
                    string[] delovi = linija.Split('|');

                    int kol;
                    try
                    {
                        kol = int.Parse(delovi[3]);

                        if (kol < 0)
                            kol = 0;
                    }
                    catch (Exception)
                    {
                        MessageBox.Show("Niste uneli broj!", "Nije unet broj!", MessageBoxButton.OK, MessageBoxImage.Error);
                        return;
                    }

                    Lek novi = new Lek(delovi[0], delovi[1], delovi[2], kol);

                    int nasumican = rand.Next(1, 4);

                    if (nasumican == 1)
                        prva_apoteka.Lekovi.Add(novi);
                    else if (nasumican == 2)
                        druga_apoteka.Lekovi.Add(novi);
                    else if (nasumican == 3)
                        treca_apoteka.Lekovi.Add(novi);
                }
            }
            catch (Exception)
            {
                MessageBox.Show("Greška prilikom otvaranja fajla!", "Greška!", MessageBoxButton.OK, MessageBoxImage.Error);
            }

            if (tr != null)
            {
                tr.Close();
            }

            try
            {
                tr = new StreamReader(File.Open(Directory.GetParent(Environment.CurrentDirectory).Parent.FullName + "/Podaci/Radnici.veronika", FileMode.Open));

                while ((linija = tr.ReadLine()) != null)
                {
                    string[] delovi = linija.Split('|');

                    Radnik novi = new Radnik(delovi[0], delovi[1], delovi[2], delovi[3], delovi[4]);

                    int nasumican = rand.Next(1, 4);

                    if (nasumican == 1)
                        prva_apoteka.Radnici.Add(novi);
                    else if (nasumican == 2)
                        druga_apoteka.Radnici.Add(novi);
                    else if (nasumican == 3)
                        treca_apoteka.Radnici.Add(novi);
                }
            }
            catch (Exception)
            {
                MessageBox.Show("Greška prilikom otvaranja fajla!", "Greška!", MessageBoxButton.OK, MessageBoxImage.Error);
            }

            if (tr != null)
            {
                tr.Close();
            }
        }
    }
}
