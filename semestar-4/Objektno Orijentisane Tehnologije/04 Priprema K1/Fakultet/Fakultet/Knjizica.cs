using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Fakultet
{
    class Knjizica : Prosek
    {
        private string ucenik;
        private List<Predmet> predmeti;

        public string Ucenik { get => ucenik; set => ucenik = value; }

        public Knjizica()
        {
            ucenik = "/";
            predmeti = new List<Predmet>();
        }

        public Knjizica(string ucenik)
        {
            this.ucenik = ucenik;
            predmeti = new List<Predmet>();
        }
        
        // dodavanje
        public void Dodaj(Predmet p)
        {
            foreach(Predmet p1 in predmeti)
                if(p.Sifra.Equals(p1.Sifra))
                {
                    return;
                }
            try { predmeti.Add(p); } 
            catch (Exception e) { Console.WriteLine(e.Message); }
        }

        // brisanje
        public void Brisanje(int indeks)
        {
            for(int i = 0; i < predmeti.Count; i++)
                if(i == indeks)
                    try { predmeti.RemoveAt(i); }
                    catch(Exception e) { Console.WriteLine(e.Message); }
        }

        public void Brisanje(string sifraPredmeta)
        {
            for (int i = 0; i < predmeti.Count; i++)
                if(predmeti[i].Sifra.Equals(sifraPredmeta))
                {
                    try { predmeti.RemoveAt(i); }
                    catch (Exception e) { Console.WriteLine(e.Message); }
                    break; // nema potrebe ici dalje ako je predmet obrisan
                }

        }

        // sortiranje po Ocenama npr
        public void Sortiraj()
        {
            Predmet p1, p2;

            for(int i = 0; i < predmeti.Count - 1; i++)
                for(int j = i + 1; j < predmeti.Count; j++)
                    if(predmeti[i].Ocena < predmeti[j].Ocena)
                    {
                        p1 = predmeti[i];
                        p2 = predmeti[j];

                        predmeti.RemoveAt(i);
                        predmeti.Insert(i, p2);

                        predmeti.RemoveAt(j);
                        predmeti.Insert(j, p1);
                    }
        }
        public override double RacunajProsek()
        {
            double average = 0.0;

            foreach (Predmet predmet in predmeti)
                average += predmet.Ocena;

            average /= predmeti.Count;

            return average;
        }

        public void SaveToFile(string file)
        {
            TextWriter tw = null;

            try
            {
                tw = new StreamWriter(file);

                foreach(Predmet predmet in predmeti)
                    tw.WriteLine(predmet.ToString());
            }
            catch (Exception e)
            {
                Console.WriteLine("\n" + e.Message);
            }
            finally
            {
                if (tw != null) 
                    tw.Close();
            }
        }

        public void LoadFromFile(string file)
        {
            TextReader tr = null;

            try
            {
                tr = new StreamReader(file);

                while (true)
                {
                    string linija = tr.ReadLine();
                    if (tr == null)
                        break;

                    string[] delovi = linija.Split('-');

                    int ocena = 0;
                    try { ocena = Int32.Parse(delovi[2]); }
                    catch (Exception e) { Console.WriteLine("\n" + e.Message); }

                    Predmet tmp = new Predmet(delovi[0], delovi[1], ocena);

                    Dodaj(tmp);
                }
            }
            catch (Exception e)
            {
                Console.WriteLine("\n" + e.Message);
            }
            finally
            {
                if (tr != null)
                    tr.Close();
            }
        }

        public override string ToString()
        {
            string str = "";

            str += "\n-------- KNJIZICA -------\n";
            if (predmeti == null)
                str += "\nNema predmeta!\n";
            else
                foreach(Predmet predmet in predmeti)
                    str += predmet.ToString() + "\n";

            str += "\n-------------------------\n";

            return str;
        }
    }
}
