using System;
using System.IO;
using System.Windows;

namespace Biblioteka.Program
{
    internal class PilotData : IPilotData
    {
        InputDataSamples samples = new InputDataSamples();
        string projectDirectory = Directory.GetParent(Environment.CurrentDirectory).Parent.FullName;
        string zaUpis = string.Empty;
        string linija = string.Empty;
        TextWriter fs = null;
        TextReader tr = null;

        #region GENERISANJE PIVOT PODATAKA ZA RAD PROGRAMA
        public void Pivot_Data_Generate()
        {
            // GENERISANJE PODATAKA ZA BIBLIOTEKE
            gen(100, "biblioteke.db", "BIBLIOTEKA");

            // GENERISANJE PODATAKA ZA KNJIGE
            gen(100, "knjige.db", "KNJIGA");

            // GENERISANJE PODATAKA ZA KORISNIKE
            gen(100, "korisnici.db", "KORISNIK");
        }
        #endregion

        #region UČITAVANJE PRETHODNO GENERISANIH PIVOT PODATAKA
        public void Pivot_Data_Load()
        {
            load(projectDirectory + "/Baza Podataka/biblioteke.db", "BIBLIOTEKA");
            load(projectDirectory + "/Baza Podataka/knjige.db", "KNJIGA");
            load(projectDirectory + "/Baza Podataka/korisnici.db", "KORISNIK");
        }
        #endregion

        #region FUNKCIJA ZA PARAMETARSKO GENERISANJE PODATAKA
        public void gen(int komada, string izlazni_fajl, string opcija_generisanja)
        {
            zaUpis = string.Empty;

            for (int i = 0; i < komada; i++)
            {
                if (opcija_generisanja.Equals("BIBLIOTEKA"))
                {
                    zaUpis += samples.NaziviBiblioteka[samples.Nasumican.Next(0, samples.NaziviBiblioteka.Length)] 
                           + "|" + samples.NaziviUlica[samples.Nasumican.Next(0, samples.NaziviUlica.Length)] + samples.Nasumican.Next(1, 100) 
                           + "|" + samples.Nasumican.Next(1950, 2022).ToString() + "|" 
                           + projectDirectory + "/Slike/placeholder.png" + "\n";
                }
                else if (opcija_generisanja.Equals("KNJIGA"))
                {
                    int randNazivIdx = samples.Nasumican.Next(0, samples.NaziviKnjiga.Length);
                    int randAutorIdx = samples.Nasumican.Next(0, samples.AutoriKnjiga.Length);

                    zaUpis += samples.NaziviKnjiga[randNazivIdx] + "|" + samples.AutoriKnjiga[randAutorIdx] + "|" + samples.Nasumican.Next(1950, 2022).ToString() + "\n";
                }
                else if (opcija_generisanja.Equals("KORISNIK"))
                {
                    zaUpis += samples.Imena[samples.Nasumican.Next(0, samples.Imena.Length)] + "|" + samples.Prezimena[samples.Nasumican.Next(0, samples.Prezimena.Length)] + "|" + ((samples.Jmbg[samples.Nasumican.Next(0, samples.Jmbg.Length)] + samples.Nasumican.Next(100000000, 999999999)).ToString() + samples.Nasumican.Next(100, 10000).ToString()).Substring(0, 13) + "|" + projectDirectory + "/Slike/placeholder.png" + "|" + "\n";
                }
            }

            // zameni \ sa /
            zaUpis = zaUpis.Replace('\\', '/');

            try
            {
                fs = new StreamWriter(File.Open(projectDirectory + "/Baza Podataka/" + izlazni_fajl, FileMode.Create));
                fs.Write(zaUpis);
            }
            catch (Exception)
            {
                MessageBox.Show("Greška prilikom otvaranja fajla!", "Greška!", MessageBoxButton.OK, MessageBoxImage.Error);
            }

            if (fs != null)
            {
                fs.Close();
            }
        }
        #endregion

        #region FUNKCIJA ZA PARAMETARSKO UČITAVANJE PODATAKA
        public void load(string putanja, string opcija_ucitavanja)
        { 
            try
            {
                tr = new StreamReader(File.Open(putanja, FileMode.Open));

                while ((linija = tr.ReadLine()) != null)
                {
                    string[] delovi = linija.Split('|');

                    try
                    {
                        if (opcija_ucitavanja.Equals("BIBLIOTEKA"))
                        {
                            int godina = int.Parse(delovi[2]);

                            Biblioteke.Biblioteka nova = new Biblioteke.Biblioteka(delovi[0], delovi[1], godina, delovi[3]);
                            App.Biblioteke.Add(nova);
                        }
                        else if (opcija_ucitavanja.Equals("KNJIGA"))
                        {
                            int godina = int.Parse(delovi[2]);

                            Knjige.Knjiga nova = new Knjige.Knjiga(delovi[0], delovi[1], godina);

                            if (samples.Nasumican.Next(1, 3) == 2)
                            {
                                App.SveKnjige.Add(nova);
                            }
                            else // nasumicno dodavanje u random biblioteku
                            {
                                int randomId = samples.Nasumican.Next(1, App.Biblioteke.Count);
                                nova.IdBiblioteke = randomId;
                                nova.NijeDodata = App.Biblioteke[randomId].Naziv;
                                App.Biblioteke[randomId].Knjige.Add(nova);
                                App.SveKnjige.Add(nova);
                            }
                        }
                        else if (opcija_ucitavanja.Equals("KORISNIK"))
                        {
                            Korisnici.Korisnik novi = new Korisnici.Korisnik(delovi[0], delovi[1], delovi[2], delovi[3], delovi[4]);

                            if (samples.Nasumican.Next(1, 3) == 2)
                            {
                                App.SviKorisnici.Add(novi);
                            }
                            else // nasumicno dodavanje u random biblioteku
                            {
                                int randomId = samples.Nasumican.Next(1, App.Biblioteke.Count);
                                novi.IdBiblioteke = randomId;
                                novi.DatumUclanjenja = DateTime.Today.ToString("d");
                                novi.Uclanjen = App.Biblioteke[randomId].Naziv;
                                App.Biblioteke[randomId].Korisnici.Add(novi);
                                App.SviKorisnici.Add(novi);
                            }
                        }
                    }
                    catch (Exception)
                    {
                        MessageBox.Show("Greška prilikom parsiranja broja!", "Greška!", MessageBoxButton.OK, MessageBoxImage.Error);
                    }
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
        #endregion
    }
}
