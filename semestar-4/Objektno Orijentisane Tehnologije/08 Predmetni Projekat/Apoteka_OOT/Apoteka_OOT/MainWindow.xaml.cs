using System;
using System.Collections.ObjectModel;
using System.IO;
using System.Linq;
using System.Windows;
using System.Windows.Controls;

namespace Apoteka_OOT
{
    public partial class MainWindow : Window
    {
        private static ObservableCollection<Apoteka> apoteke = new ObservableCollection<Apoteka>();
        private static ObservableCollection<Radnik> radnici = new ObservableCollection<Radnik>();
        private static ObservableCollection<Lek> lekovi = new ObservableCollection<Lek>();

        private static Apoteka referenca_na_odabranu_apoteku = null;
        private static Radnik referenca_na_odabranog_radnika = null;
        private static Lek referenca_na_odabrani_lek = null;

        public MainWindow()
        {
            InitializeComponent();
            Ucita_Podatke();

            DataContext = this;
            sve_apoteke.ItemsSource = Apoteke;

            DataContext = this;
            svi_radnici.ItemsSource = Radnici;

            DataContext = this;
            svi_lekovi.ItemsSource = Lekovi;

            
        }
        void Ucita_Podatke()
        {
            // UCITAVANJE IZ DATOTEKE (APOTEKA, RADNIKA, LEKOVA)   
            StreamReader tr = null;
            string linija;
            Random rand = new Random();

            try
            {
                tr = new StreamReader(File.Open(Directory.GetParent(Environment.CurrentDirectory).Parent.FullName + "/Podaci/apoteke.txt", FileMode.Open));

                while ((linija = tr.ReadLine()) != null)
                {
                    string[] delovi = linija.Split('|');

                    int god = 0;
                    try
                    {
                        god = int.Parse(delovi[2]);
                    }
                    catch (Exception)
                    {
                        MessageBox.Show("Godina nije broj!");
                    }

                    Apoteka nova = new Apoteka(delovi[0], delovi[1], god, delovi[3]);
                    apoteke.Add(nova);
                }
            }
            catch (Exception)
            {
                MessageBox.Show("Greska prilikom otvaranja fajla apoteka!");
            }

            // LEKOVI
            try
            {
                tr = new StreamReader(File.Open(Directory.GetParent(Environment.CurrentDirectory).Parent.FullName + "/Podaci/lekovi.txt", FileMode.Open));

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
                    Lek n = new Lek(delovi[0], delovi[1], delovi[2], kol);

                    int nasumican = rand.Next(1, apoteke.Count);

                    apoteke[nasumican].Lekovi.Add(novi);
                    lekovi.Add(n);
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
                tr = new StreamReader(File.Open(Directory.GetParent(Environment.CurrentDirectory).Parent.FullName + "/Podaci/radnici.txt", FileMode.Open));

                while ((linija = tr.ReadLine()) != null)
                {
                    string[] delovi = linija.Split('|');

                    Radnik novi = new Radnik(delovi[0], delovi[1], delovi[2], delovi[3]);
                    Radnik n = new Radnik(delovi[0], delovi[1], delovi[2], delovi[3]);

                    int nasumican = rand.Next(1, 4);

                    
                    radnici.Add(novi);
                    n.DatumPocetkaRada = DateTime.Now.ToString("d");
                    apoteke[nasumican].Radnici.Add(n);
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
        private void sve_apoteke_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Apoteka odabrana = sve_apoteke.SelectedItem as Apoteka;

            if(odabrana != null)
                referenca_na_odabranu_apoteku = odabrana;
            else
                referenca_na_odabranu_apoteku = null;
        }

        private void svi_radnici_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Radnik odabran = svi_radnici.SelectedItem as Radnik;

            if (odabran != null)
                referenca_na_odabranog_radnika = odabran;
            else
                referenca_na_odabranog_radnika= null;
        }

        private void svi_lekovi_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Lek odabran = svi_lekovi.SelectedItem as Lek;

            if (odabran != null)
                referenca_na_odabrani_lek = odabran;
            else
                referenca_na_odabrani_lek = null;
        }

        private void operacije_sa_apotekom_Click(object sender, RoutedEventArgs e)
        {
            if(odabrana_apoteka.SelectedItem != null)
            {
                if(odabrana_apoteka.SelectedIndex == 0)
                {
                    Apoteka_Prozori.dodaj_apoteku da = new Apoteka_Prozori.dodaj_apoteku();
                    da.ShowDialog();
                }
                else if(odabrana_apoteka.SelectedIndex == 1)
                {
                    if(Referenca_na_odabranu_apoteku == null)
                        MessageBox.Show("Odaberite apoteku iz liste kako bi pristupili izmeni!", "Upozorenje", MessageBoxButton.OK, MessageBoxImage.Warning);
                    else
                    {
                        Apoteka_Prozori.izmeni_apoteku ia = new Apoteka_Prozori.izmeni_apoteku();
                        ia.ShowDialog();
                    }
                }
                else if(odabrana_apoteka.SelectedIndex == 2)
                {
                    if (Referenca_na_odabranu_apoteku == null)
                        MessageBox.Show("Odaberite apoteku iz liste kako bi pristupili brisanju!", "Upozorenje", MessageBoxButton.OK, MessageBoxImage.Warning);
                    else
                    {
                        var daNe = MessageBox.Show("Brisanje apoteke je NEPOVRATNA OPERACIJA!\n\n" + "Da li ste sigurni?", "Upozorenje o brisanju!", MessageBoxButton.YesNo, MessageBoxImage.Warning);

                        if (daNe == MessageBoxResult.Yes)
                        {
                            try
                            {
                                referenca_na_odabranu_apoteku.Radnici.Clear();
                                referenca_na_odabranu_apoteku.Lekovi.Clear();

                                apoteke.Remove(Referenca_na_odabranu_apoteku);
                                MessageBox.Show("Apoteka uspesno obrisana!", "Informacija", MessageBoxButton.OK, MessageBoxImage.Information);
                            }
                            catch(Exception)
                            {
                                MessageBox.Show("Greska prilikom brisanja apoteke!", "Greska", MessageBoxButton.OK, MessageBoxImage.Error);
                            }
                        }
                    }
                }
                else if(odabrana_apoteka.SelectedIndex == 3)
                {
                    if (Referenca_na_odabranu_apoteku != null)
                    {
                        Apoteka_Prozori.radnici_lekovi_u_apoteci rlu = new Apoteka_Prozori.radnici_lekovi_u_apoteci();
                        rlu.ShowDialog();
                    }
                    else
                        MessageBox.Show("Niste odabrali apoteku!", "Upozorenje!", MessageBoxButton.OK, MessageBoxImage.Warning);                    
                }
            }
            sve_apoteke.SelectedItem = null;
        }

        private void operacije_sa_radnikom_Click(object sender, RoutedEventArgs e)
        {
            if (odabrani_radnik.SelectedItem != null)
            {
                if (odabrani_radnik.SelectedIndex == 0)
                {
                    Radnik_Prozori.dodaj_radnika dr = new Radnik_Prozori.dodaj_radnika();
                    dr.ShowDialog();
                }
                else if (odabrani_radnik.SelectedIndex == 1)
                {
                    if (Referenca_na_odabranog_radnika == null)
                        MessageBox.Show("Odaberite radnika iz liste kako bi pristupili izmeni!", "Upozorenje", MessageBoxButton.OK, MessageBoxImage.Warning);
                    else
                    {
                        Radnik_Prozori.izmeni_radnika ir = new Radnik_Prozori.izmeni_radnika();
                        ir.ShowDialog();
                    }
                }
                else if (odabrani_radnik.SelectedIndex == 2)
                {
                    if (Referenca_na_odabranog_radnika == null)
                        MessageBox.Show("Odaberite radnika iz liste kako bi pristupili brisanju!", "Upozorenje", MessageBoxButton.OK, MessageBoxImage.Warning);
                    else
                    {
                        var daNe = MessageBox.Show("Brisanje radnika je NEPOVRATNA OPERACIJA!\n\n" + "Da li ste sigurni?", "Upozorenje o brisanju!", MessageBoxButton.YesNo, MessageBoxImage.Warning);

                        if (daNe == MessageBoxResult.Yes)
                        {
                            try
                            {
                                Radnici.Remove(Referenca_na_odabranog_radnika);
                                referenca_na_odabranog_radnika = null;

                                MessageBox.Show("Radnik uspesno obrisan!", "Informacija", MessageBoxButton.OK, MessageBoxImage.Information);
                            }
                            catch (Exception)
                            {
                                MessageBox.Show("Greska prilikom brisanja radnika!", "Greska", MessageBoxButton.OK, MessageBoxImage.Error);
                            }
                        }
                    }
                }
                else if (odabrani_radnik.SelectedIndex == 3)
                {
                    if (Referenca_na_odabranog_radnika == null)
                    {
                        MessageBox.Show("Odaberite radnika iz liste kako bi ga zaposlili u apoteku!", "Upozorenje", MessageBoxButton.OK, MessageBoxImage.Warning);
                        return;
                    }
                    else
                    {
                        if (Referenca_na_odabranu_apoteku == null)
                        {
                            MessageBox.Show("Odaberite apoteku iz liste kako bi mogli da zaposlite radnika!", "Upozorenje", MessageBoxButton.OK, MessageBoxImage.Warning);
                            return;
                        }

                        var daNe = MessageBox.Show("Zaposliti radnika u datu apoteku?\n\n" + "Da li ste sigurni?", "Upozorenje o brisanju!", MessageBoxButton.YesNo, MessageBoxImage.Question);

                        if (daNe == MessageBoxResult.Yes)
                        {
                            try
                            {
                                Radnik zaposljen = new Radnik(Referenca_na_odabranog_radnika.Ime, Referenca_na_odabranog_radnika.Prezime, Referenca_na_odabranog_radnika.Jmbg, Referenca_na_odabranog_radnika.Slika);
                                zaposljen.DatumPocetkaRada = DateTime.Now.ToString("d");
                                Radnici.Remove(Referenca_na_odabranog_radnika);
                                referenca_na_odabranu_apoteku.Radnici.Add(zaposljen);
                                referenca_na_odabranog_radnika = null;

                                MessageBox.Show("Radnik uspesno zaposljen!", "Informacija", MessageBoxButton.OK, MessageBoxImage.Information);
                            }
                            catch (Exception)
                            {
                                MessageBox.Show("Greska prilikom zaposljavanja radnika!", "Greska", MessageBoxButton.OK, MessageBoxImage.Error);
                            }
                        }
                    }
                }
            }
            svi_radnici.SelectedItem = null;
        }

        private void operacije_sa_lekom_Click(object sender, RoutedEventArgs e)
        {
            if (odabrani_lek.SelectedItem != null)
            {
                if (odabrani_lek.SelectedIndex == 0)
                {
                    Lek_Prozori.dodaj_lek dl = new Lek_Prozori.dodaj_lek();
                    dl.ShowDialog();
                }
                else if (odabrani_lek.SelectedIndex == 1)
                {
                    if (Referenca_na_odabrani_lek == null)
                        MessageBox.Show("Odaberite lek iz liste kako bi pristupili izmeni!", "Upozorenje", MessageBoxButton.OK, MessageBoxImage.Warning);
                    else
                    {
                        Lek_Prozori.izmeni_lek il = new Lek_Prozori.izmeni_lek();
                        il.ShowDialog();
                    }
                }
                else if (odabrani_lek.SelectedIndex == 2)
                {
                    if (Referenca_na_odabrani_lek == null)
                        MessageBox.Show("Odaberite lek iz liste kako bi pristupili brisanju!", "Upozorenje", MessageBoxButton.OK, MessageBoxImage.Warning);
                    else
                    {
                        var daNe = MessageBox.Show("Brisanje leka je NEPOVRATNA OPERACIJA!\n\n" + "Da li ste sigurni?", "Upozorenje o brisanju!", MessageBoxButton.YesNo, MessageBoxImage.Warning);

                        if (daNe == MessageBoxResult.Yes)
                        {
                            try
                            {
                                Lekovi.Remove(Referenca_na_odabrani_lek);
                                referenca_na_odabrani_lek = null;

                                MessageBox.Show("Lek uspesno obrisan!", "Informacija", MessageBoxButton.OK, MessageBoxImage.Information);
                            }
                            catch (Exception)
                            {
                                MessageBox.Show("Greska prilikom brisanja leka!", "Greska", MessageBoxButton.OK, MessageBoxImage.Error);
                            }
                        }
                    }
                }
                else if(odabrani_lek.SelectedIndex == 3)
                {
                    if (Referenca_na_odabrani_lek == null)
                    {
                        MessageBox.Show("Odaberite lek iz liste kako bi ga dodali u apoteku!", "Upozorenje", MessageBoxButton.OK, MessageBoxImage.Warning);
                        return;
                    }
                    else
                    {
                        if (Referenca_na_odabranu_apoteku == null)
                        {
                            MessageBox.Show("Odaberite apoteku iz liste kako bi mogli da dodate lek u nju!", "Upozorenje", MessageBoxButton.OK, MessageBoxImage.Warning);
                            return;
                        }

                        var daNe = MessageBox.Show("Dodati lek u odabranu apoteku?\n\n" + "Da li ste sigurni?", "Upozorenje o dodavanju leka!", MessageBoxButton.YesNo, MessageBoxImage.Question);

                        if (daNe == MessageBoxResult.Yes)
                        {
                            try
                            {
                                Lek dodaj = new Lek(referenca_na_odabrani_lek.Naziv, referenca_na_odabrani_lek.DatumProizvodnje, referenca_na_odabrani_lek.DatumVazenja, Referenca_na_odabrani_lek.Kolicina);
                                Lekovi.Remove(referenca_na_odabrani_lek);
                                referenca_na_odabranu_apoteku.Lekovi.Add(dodaj);
                                referenca_na_odabrani_lek = null;

                                MessageBox.Show("Lek uspesno dodat!", "Informacija", MessageBoxButton.OK, MessageBoxImage.Information);
                            }
                            catch (Exception)
                            {
                                MessageBox.Show("Greska prilikom dodavanja leka!", "Greska", MessageBoxButton.OK, MessageBoxImage.Error);
                            }
                        }
                    }
                }
            }
            svi_lekovi.SelectedItem = null;
        }

        private void pretraga_apoteka_TextChanged(object sender, TextChangedEventArgs e)
        {
            ObservableCollection<Apoteka> pronadjeni = new ObservableCollection<Apoteka>();

            foreach (Apoteka apoteka in Apoteke)
            {
                if (apoteka.Naziv.ToLower().Contains(pretraga_apoteka.Text.ToLower()) ||
                    apoteka.Godina.ToString().ToLower().Contains(pretraga_apoteka.Text.ToLower()))
                {
                    pronadjeni.Add(apoteka);
                }
            }

            sve_apoteke.ItemsSource = pronadjeni.ToList();
        }

        private void pretraga_radnika_TextChanged(object sender, TextChangedEventArgs e)
        {
            ObservableCollection<Radnik> pronadjeni = new ObservableCollection<Radnik>();

            foreach (Radnik radnik in Radnici)
            {
                if (radnik.Ime.ToLower().Contains(pretraga_radnika.Text.ToLower()) ||
                    radnik.Prezime.ToLower().Contains(pretraga_radnika.Text.ToLower()))
                {
                    pronadjeni.Add(radnik);
                }
            }

            svi_radnici.ItemsSource = pronadjeni.ToList();
        }

        private void pretraga_lekova_TextChanged(object sender, TextChangedEventArgs e)
        {
            ObservableCollection<Lek> pronadjeni = new ObservableCollection<Lek>();

            foreach (Lek lek in Lekovi)
            {
                if (lek.Naziv.ToLower().Contains(pretraga_lekova.Text.ToLower()) ||
                    lek.Kolicina.ToString().ToLower().Contains(pretraga_lekova.Text.ToLower()))
                {
                    pronadjeni.Add(lek);
                }
            }

            svi_lekovi.ItemsSource = pronadjeni.ToList();
        }

        // PROPERTY
        internal static ObservableCollection<Apoteka> Apoteke { get => apoteke; set => apoteke = value; }
        internal static ObservableCollection<Radnik> Radnici { get => radnici; set => radnici = value; }
        internal static ObservableCollection<Lek> Lekovi { get => lekovi; set => lekovi = value; }
        internal static Apoteka Referenca_na_odabranu_apoteku { get => referenca_na_odabranu_apoteku; set => referenca_na_odabranu_apoteku = value; }
        internal static Radnik Referenca_na_odabranog_radnika { get => referenca_na_odabranog_radnika; set => referenca_na_odabranog_radnika = value; }
        internal static Lek Referenca_na_odabrani_lek { get => referenca_na_odabrani_lek; set => referenca_na_odabrani_lek = value; }
    }
}
