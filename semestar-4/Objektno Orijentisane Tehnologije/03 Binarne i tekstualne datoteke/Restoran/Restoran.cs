using System;
using System.Collections.Generic;
using System.IO;

namespace Restoran
{
    class Restoran
    {
        private string naziv;
        private string adresa;
        private List<Stavka> jelovnik;

        public Restoran(string naziv, string adresa)
        {
            Naziv = naziv;
            Adresa = adresa;
            jelovnik = new List<Stavka>();
        }

        public string Naziv { get => naziv; set => naziv = value; }
        public string Adresa { get => adresa; set => adresa = value; }
        public List<Stavka> Stavke { get => jelovnik; set => jelovnik = value; }

        public override string ToString()
        {
            string str = "Restoran \"" + naziv + "\"\nAdresa: " + adresa + "\n";
            str += "\nJelovnik\n***********************\n";
            foreach (Stavka s in jelovnik)
            {
                str += s.Naziv + " " + s.Cena + "\n";
            }
            str += "***********************\n";

            return str;
        }

        public void Import(string putanja)
        {
            TextReader txtReader = null;

            try
            {
                txtReader = new StreamReader(File.Open(putanja, FileMode.Open));

                if (File.Exists(putanja))
                {
                    while (true)
                    {
                        string str = txtReader.ReadLine();
                        if (str == null)
                        {
                            break;
                        }

                        string[] splitovano = str.Split('|');
                        foreach (Stavka s in jelovnik)
                        {
                            if (s.Naziv.Equals(splitovano[0]))
                            {
                                break; // vec postoji ne dodajemo isti naziv
                            }
                        }
                        Stavka tmp = new Stavka(splitovano[0], double.Parse(splitovano[1]));
                        jelovnik.Add(tmp);
                    }
                }
            }
            catch
            {
                Console.WriteLine("Greska prilikom otvaranja datoteke!\n");
            }
            finally
            {
                if (txtReader != null)
                    txtReader.Close();
            }

        }

        public void Sortiraj()
        {
            /* II NACIN 
            jelovnik.Sort((s1, s2) => s1.Cena.CompareTo(s2.Cena));
            jelovnik.Reverse();
            */
            Stavka s1, s2;

            for (int i = 0; i < jelovnik.Count - 1; i++)
                for (int j = i + 1; j < jelovnik.Count; j++)
                    if (jelovnik[i].Cena < jelovnik[j].Cena)
                    {
                        s1 = jelovnik[i];
                        s2 = jelovnik[j];

                        jelovnik.RemoveAt(j);
                        jelovnik.Insert(j, s1);
                        jelovnik.RemoveAt(i);
                        jelovnik.Insert(i, s2);
                    }
        }

        public void Export(string putanja)
        {
            TextWriter txtWriter = null;

            try
            {
                txtWriter = new StreamWriter(File.Open(putanja, FileMode.Create));

                txtWriter.WriteLine("Restoran \"" + naziv + "\"");
                txtWriter.WriteLine("Adresa: " + adresa);
                txtWriter.WriteLine("Jelovnik\n");
                txtWriter.WriteLine("******************");

                foreach (Stavka s in jelovnik)
                {
                    txtWriter.WriteLine(s.Naziv + " " + s.Cena);
                }
                txtWriter.WriteLine("******************");
            }
            catch
            {
                Console.WriteLine("Greska prilikom pisanja u datoteku!\n");
            }
            finally
            {
                if (txtWriter != null)
                    txtWriter.Close();
            }
        }
    }
}
